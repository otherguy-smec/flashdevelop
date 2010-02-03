﻿/*
    Copyright (C) 2009  Robert Nelson

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Windows.Forms;
using Flash.Tools.Debugger;
using FlexDbg.Localization;
using PluginCore;
using PluginCore.Managers;
using ProjectManager.Projects;
using ProjectManager.Projects.AS3;
using ScintillaNet;

namespace FlexDbg
{
    public delegate void StateChangedEventHandler(object sender, DebuggerState state);

	public enum DebuggerState
	{
		Initializing,
		Stopped,
		Starting,
		Running,
		Pausing,
		PauseHalt,
		BreakHalt,
		ExceptionHalt
	}

	public class DebuggerManager
    {
        public event StateChangedEventHandler StateChangedEvent;

        internal Project currentProject;

		private BackgroundWorker bgWorker;
        private FlashInterface m_FlashInterface;

		private int m_CurrentFrame = 0;
		private Location m_CurrentLocation = null;
		private Dictionary<String, String> m_PathMap = new Dictionary<String, String>();
        
		public FlashInterface FlashInterface
        {
            get
			{
				return m_FlashInterface;
			}
        }

		public int CurrentFrame
		{
			get
			{
				return m_CurrentFrame;
			}

			set
			{
				if (m_CurrentFrame != value)
				{
					m_CurrentFrame = value;

					UpdateLocalsUI();
				}
			}
		}

		public Location CurrentLocation
		{
			get
			{
				return m_CurrentLocation;
			}

			set
			{
				if (m_CurrentLocation != value)
				{
					if (m_CurrentLocation != null)
					{
						ResetCurrentLocation();
					}

					m_CurrentLocation = value;

					if (m_CurrentLocation != null)
					{
						GotoCurrentLocation(true);
					}
				}
			}
		}

        public DebuggerManager()
        {
			m_FlashInterface = new FlashInterface();

			m_FlashInterface.m_BreakPointManager = PluginMain.breakPointManager;

			m_FlashInterface.StartedEvent += new DebuggerEventHandler(flashInterface_StartedEvent);
			m_FlashInterface.DisconnectedEvent += new DebuggerEventHandler(flashInterface_DisconnectedEvent);

			m_FlashInterface.BreakpointEvent += new DebuggerEventHandler(flashInterface_BreakpointEvent);
			m_FlashInterface.FaultEvent += new DebuggerEventHandler(flashInterface_FaultEvent);
			m_FlashInterface.PauseEvent += new DebuggerEventHandler(flashInterface_PauseEvent);
			m_FlashInterface.StepEvent += new DebuggerEventHandler(flashInterface_StepEvent);
			m_FlashInterface.ScriptLoadedEvent += new DebuggerEventHandler(flashInterface_ScriptLoadedEvent);
			m_FlashInterface.WatchpointEvent += new DebuggerEventHandler(flashInterface_WatchpointEvent);
			m_FlashInterface.UnknownHaltEvent += new DebuggerEventHandler(flashInterface_UnknownHaltEvent);
        }

        #region Startup

        public void Start()
        {
            try
            {
                FlexDbgTrace.Trace("CheckCurrent()");
				if (!CheckCurrent())
				{
					return;
				}
            }
            catch (Exception ex)
            {
                ErrorManager.ShowError(ex);
                return;
            }

            PluginMain.debugBuildStart = true;

            UpdateMenuState(DebuggerState.Starting);

            if (PluginMain.settingObject.CompileBeforeDebug ||
                !File.Exists(Path.Combine(Path.GetDirectoryName(currentProject.ProjectPath), currentProject.OutputPath)))
            {
                try
                {
                    BuildCurrentProject();
                }
                catch
                {
                    String message = TextHelper.GetString("Info.DebugWithoutCompile");
                    String title = " " + PluginCore.Localization.TextHelper.GetString("FlashDevelop.Title.ConfirmDialog");
                    if (MessageBox.Show(message, title, MessageBoxButtons.OKCancel) == DialogResult.OK)
                    {
                        Start(currentProject.OutputPathAbsolute);
                    }
                }
            }
            else Start(currentProject.OutputPathAbsolute);
        }

        /// <summary>
        /// 
        /// </summary>
        private bool CheckCurrent()
        {
            String errormsg = String.Empty;
            try
            {
				if (PluginBase.CurrentProject != null)
				{
					String filename = PluginBase.CurrentProject.ProjectPath;
					ProjectManager.Projects.ProjectReader reader = new ProjectManager.Projects.ProjectReader(filename, new AS3Project(filename));
					currentProject = reader.ReadProject();
				}
				else
				{
					MessageBox.Show(TextHelper.GetString("Info.ProjectNotOpen"),
									PluginCore.Localization.TextHelper.GetString("FlashDevelop.Title.ConfirmDialog"),
									MessageBoxButtons.OK);
					return false;
				}
            }
            catch (Exception e)
            {
                errormsg = e.Message + System.Environment.NewLine;
            }
#if false
            if (!(currentProject.CompileTargets != null && currentProject.CompileTargets.Count != 0))
            {
                errormsg += TextHelper.GetString("FlexDbg.Info.NoMainClass") + System.Environment.NewLine;
            }
#endif
            if (currentProject.Language != "as3")
            {
                errormsg += TextHelper.GetString("Info.LanguageNotAS3") + System.Environment.NewLine;
            }
#if false
            try
            {
                //$(FlexSDK)\bin\adl.exe;application.xml bin
                if (currentProject.TestMovieCommand != null && currentProject.TestMovieCommand.Contains("adl.exe"))
                {
                    //AIR
                    processname = "adl";
                }
                else
                {
                    String cmd = Util.FindAssociatedExecutableFile(".swf", "open");
                    if (cmd != AssociateExecutableFilePath)
                    {
                        processname = Util.GetAssociateAppFileName(cmd);
                        AssociateExecutableFilePath = cmd;
                    }
                }
            }
            catch (Exception e)
            {
                errormsg += e.Message + System.Environment.NewLine;
            }
#endif
            if (errormsg != String.Empty)
				throw new Exception(errormsg);

			return true;
        }

        private void BuildCurrentProject()
        {
            DataEvent de = new DataEvent(EventType.Command, "ProjectManager.BuildProject", null);
            EventManager.DispatchEvent(this, de);
        }

        /// <summary>
        /// 
        /// </summary>
        internal void Start(String filename)
        {
            PluginMain.debugBuildStart = false;

            FlexDbgTrace.TraceInfo("----Start(string filename)----");
            //FlexDbgTrace.TraceInfo(PluginMain.settingObject.DebugFlashPlayerPath + " " + filename);

			m_FlashInterface.currentProject = currentProject;
			m_FlashInterface.outputFileFullPath = filename;

			PanelsHelper.pluginPanel.Show();
			PanelsHelper.breakPointPanel.Show();
			PanelsHelper.stackframePanel.Show();

            bgWorker = new BackgroundWorker();
            bgWorker.DoWork += bgWorker_DoWork;
            bgWorker.RunWorkerAsync();
        }

        private void bgWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
				m_FlashInterface.Start();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

			m_PathMap.Clear();
        }

        #endregion

		public String GetLocalPath(SourceFile file)
		{
			if (File.Exists(file.FullPath))
			{
				return file.FullPath;
			}

			if (m_PathMap.ContainsKey(file.FullPath))
			{
				return m_PathMap[file.FullPath];
			}

			Char pathSeparator = Path.DirectorySeparatorChar;

			foreach (Folder folder in PluginMain.settingObject.SourcePaths)
			{
				String localPath = folder.Path + pathSeparator + file.getPackageName() + pathSeparator + file.Name;

				if (File.Exists(localPath))
				{
					m_PathMap[file.FullPath] = localPath;

					return localPath;
				}
			}

			return null;
		}

        #region FlashInterface Control

        public void Cleanup()
        {
			m_PathMap.Clear();
			m_FlashInterface.Cleanup();
        }

        private void UpdateMenuState(DebuggerState state)
        {
            if (StateChangedEvent != null)
                StateChangedEvent(this, state);
        }

        #endregion

        #region FlashInterface Events

		void flashInterface_StartedEvent(object sender)
		{
			if ((PluginBase.MainForm as Form).InvokeRequired)
			{
				(PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
				{
					flashInterface_StartedEvent(sender);
				});
				return;
			}

			UpdateMenuState(DebuggerState.Running);
		}

		void flashInterface_DisconnectedEvent(object sender)
		{
			if ((PluginBase.MainForm as Form).InvokeRequired)
			{
				(PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
				{
					flashInterface_DisconnectedEvent(sender);
				});
				return;
			}

			CurrentLocation = null;

			UpdateMenuState(DebuggerState.Stopped);

			PanelsHelper.pluginPanel.Hide();
			PanelsHelper.breakPointPanel.Hide();
			PanelsHelper.stackframePanel.Hide();

			PanelsHelper.pluginUI.TreeControl.Nodes.Clear();
			PanelsHelper.stackframeUI.ClearItem();

			PluginMain.breakPointManager.ResetAll();
		}

		void flashInterface_BreakpointEvent(object sender)
		{
			Location loc = FlashInterface.getCurrentLocation();

			if (PluginMain.breakPointManager.ShouldBreak(loc.File, loc.Line) || File.Exists(loc.File.FullPath))
			{
				UpdateUI(DebuggerState.BreakHalt);
			}
			else
			{
				FlashInterface.StepResume();
			}
		}

		void flashInterface_FaultEvent(object sender)
		{
			UpdateUI(DebuggerState.ExceptionHalt);
		}

		void flashInterface_StepEvent(object sender)
		{
			UpdateUI(DebuggerState.BreakHalt);
		}

		void flashInterface_ScriptLoadedEvent(object sender)
		{
			m_FlashInterface.UpdateBreakpoints(PluginMain.breakPointManager.GetBreakPointUpdates());
			m_FlashInterface.Continue();
		}

		void flashInterface_WatchpointEvent(object sender)
		{
			UpdateUI(DebuggerState.BreakHalt);
		}

		void flashInterface_UnknownHaltEvent(object sender)
		{
			UpdateUI(DebuggerState.ExceptionHalt);
		}

		/// <summary>
		/// 
		/// </summary>
		private void flashInterface_PauseEvent(Object sender)
		{
			UpdateUI(DebuggerState.PauseHalt);
		}

		void UpdateUI(DebuggerState state)
		{
			if ((PluginBase.MainForm as Form).InvokeRequired)
			{
				(PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
				{
					UpdateUI(state);
				});
				return;
			}

			CurrentLocation = FlashInterface.getCurrentLocation();

			UpdateStackUI();
			UpdateLocalsUI();

			UpdateMenuState(state);

			(PluginBase.MainForm as Form).Activate();
		}

		void UpdateStackUI()
		{
			m_CurrentFrame = 0;

			Frame[] frames = m_FlashInterface.GetFrames();

			PanelsHelper.stackframeUI.AddFrames(frames);

		}

		void UpdateLocalsUI()
		{
			if ((PluginBase.MainForm as Form).InvokeRequired)
			{
				(PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
				{
					UpdateLocalsUI();
				});
				return;
			}

			Frame[] frames = m_FlashInterface.GetFrames();

			if (frames != null)
			{
				Variable thisValue = m_FlashInterface.GetThis(m_CurrentFrame);
				Variable[] args = m_FlashInterface.GetArgs(m_CurrentFrame);
				Variable[] locals = m_FlashInterface.GetLocals(m_CurrentFrame);

				PanelsHelper.pluginUI.Clear();

				if (thisValue != null)
				{
					PanelsHelper.pluginUI.SetData(new Variable[] { thisValue });
				}

				if (args != null && args.Length > 0)
				{
					PanelsHelper.pluginUI.SetData(args);
				}

				if (locals != null && locals.Length > 0)
				{
					PanelsHelper.pluginUI.SetData(locals);
				}

				CurrentLocation = frames[m_CurrentFrame].Location;
			}
			else
			{
				CurrentLocation = null;
			}
		}

		void ResetCurrentLocation()
		{
			if ((PluginBase.MainForm as Form).InvokeRequired)
			{
				(PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
				{
					ResetCurrentLocation();
				});
				return;
			}

			if (CurrentLocation.File != null)
			{
				ScintillaControl sci;
				String localPath = GetLocalPath(CurrentLocation.File);

				if (localPath != null)
				{
					sci = ScintillaHelper.GetScintillaControl(localPath);

					if (sci != null)
					{
						Int32 i = ScintillaHelper.GetScintillaControlIndex(sci);

						if (i != -1)
						{
							Int32 line = CurrentLocation.Line - 1;
							sci.MarkerDelete(line, ScintillaHelper.markerCurrentLine);
						}
					}
				}
			}
		}

		void GotoCurrentLocation(bool bSetMarker)
		{
			if ((PluginBase.MainForm as Form).InvokeRequired)
			{
				(PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
				{
					GotoCurrentLocation(bSetMarker);
				});
				return;
			}

			if (CurrentLocation != null && CurrentLocation.File != null)
			{
				ScintillaControl sci;
				String localPath = GetLocalPath(CurrentLocation.File);

				if (localPath != null)
				{
					sci = ScintillaHelper.GetScintillaControl(localPath);

					if (sci == null)
					{
						PluginBase.MainForm.OpenEditableDocument(localPath);
						sci = ScintillaHelper.GetScintillaControl(localPath);
					}

					if (sci != null)
					{
						Int32 i = ScintillaHelper.GetScintillaControlIndex(sci);

						if (i != -1)
						{
							PluginBase.MainForm.Documents[i].Activate();
							Int32 line = CurrentLocation.Line - 1;
							sci.GotoLine(line);

							if (bSetMarker)
							{
								sci.MarkerAdd(line, ScintillaHelper.markerCurrentLine);
							}
						}
					}
				}
			}
		}

		void flashInterface_PauseNotRespondEvent(object sender)
        {
            if ((PluginBase.MainForm as Form).InvokeRequired)
            {
                (PluginBase.MainForm as Form).BeginInvoke((MethodInvoker)delegate()
                {
                    flashInterface_PauseNotRespondEvent(sender);
                });
                return;
            }

            DialogResult res = MessageBox.Show(PluginBase.MainForm, "Close Process?", "Process not responding", MessageBoxButtons.OKCancel);
            if (res == DialogResult.OK)
            {
				m_FlashInterface.Stop();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void flashInterface_TraceEvent(Object sender, String trace)
        {
            TraceManager.AddAsync(trace, 1);
        }

		#endregion

        #region MenuItem Event Handling

        /// <summary>
        /// 
        /// </summary>
        internal void Stop_Click(Object sender, EventArgs e)
        {
            PluginMain.liveDataTip.Hide();
			CurrentLocation = null;
			m_FlashInterface.Stop();
            FlexDbgTrace.TraceInfo("Stop() FlashInterface.Stop; end");
        }

		/// <summary>
		/// 
		/// </summary>
		internal void Current_Click(Object sender, EventArgs e)
		{
			if (m_FlashInterface.isDebuggerStarted && m_FlashInterface.isDebuggerSuspended)
			{
				GotoCurrentLocation(false);
			}
		}

		/// <summary>
        /// 
        /// </summary>
        internal void Next_Click(Object sender, EventArgs e)
        {
			CurrentLocation = null;
			m_FlashInterface.Next();
			UpdateMenuState(DebuggerState.Running);
		}

        /// <summary>
        /// 
        /// </summary>
        internal void Step_Click(Object sender, EventArgs e)
        {
			CurrentLocation = null;
			m_FlashInterface.Step();
			UpdateMenuState(DebuggerState.Running);
        }

        /// <summary>
        /// 
        /// </summary>
        internal void Continue_Click(Object sender, EventArgs e)
        {
            try
            {
				CurrentLocation = null;
				m_FlashInterface.UpdateBreakpoints(PluginMain.breakPointManager.GetBreakPointUpdates());
				m_FlashInterface.Continue();
				UpdateMenuState(DebuggerState.Running);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        internal void Pause_Click(Object sender, EventArgs e)
        {
			CurrentLocation = null;
			FlexDbgTrace.TraceInfo("Pause() FlashInterface.Pause();");
			m_FlashInterface.Pause();
        }

        internal void Finish_Click(Object sender, EventArgs e)
        {
			CurrentLocation = null;
			FlexDbgTrace.TraceInfo("Finish() FlashInterface.Finish();");
			m_FlashInterface.Finish();
			UpdateMenuState(DebuggerState.Running);
		}

        #endregion
    }
}
