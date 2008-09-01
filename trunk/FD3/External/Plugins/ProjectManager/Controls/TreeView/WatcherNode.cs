using System;
using System.IO;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Windows.Forms;
using ProjectManager.Projects;
using PluginCore.Localization;

namespace ProjectManager.Controls.TreeView
{
	/// <summary>
	/// Represents a node that watches for changes to its children using a FileSystemWatcher.
	/// </summary>
    public class WatcherNode : DirectoryNode
	{
		FileSystemWatcher watcher;
        List<String> changedPaths;
		Timer updateTimer;
		bool updateNeeded;

		public WatcherNode(string directory) : base(directory)
		{
			isRefreshable = true;
            changedPaths = new List<String>();
            // Use a timer for FileSystemWatcher updates so they don't do lots of redrawing
            updateTimer = new Timer();
            updateTimer.Interval = 500;
            updateTimer.Tick += updateTimer_Tick;
            setWatcher();
		}

        private void setWatcher()
        {
            try
            {
                if (Directory.Exists(BackingPath))
                {
                    watcher = new FileSystemWatcher(BackingPath);
                    watcher.Created += watcher_Created;
                    watcher.Deleted += watcher_Deleted;
                    watcher.Renamed += watcher_Renamed;
                    watcher.IncludeSubdirectories = true;
                    watcher.EnableRaisingEvents = true;
                }
            }
            catch {}
        }

        public override void Refresh(bool recursive)
        {
            if (watcher == null) setWatcher();
            base.Refresh(recursive);
        }
		
		public override void Dispose()
		{
			base.Dispose();
			if (updateTimer != null)
			{
				updateTimer.Stop();
				updateTimer.Dispose();
			}
			if (watcher != null)
			{
				watcher.EnableRaisingEvents = false;
				watcher.Dispose();
			}
		}

		public void UpdateLater()
		{
			updateNeeded = true;
			updateTimer.Enabled = true;
		}

        private void AppendPath(FileSystemEventArgs e)
        {
            String path = Path.GetDirectoryName(e.FullPath);
            if (Directory.Exists(path))
            {
                this.changedPaths.Add(path);
            }
        }

		private void watcher_Created(object sender, FileSystemEventArgs e) 
        {
            AppendPath(e);
            Changed(); 
        }
		private void watcher_Deleted(object sender, FileSystemEventArgs e) 
        {
            AppendPath(e);
            Changed(); 
        }
		private void watcher_Renamed(object sender, RenamedEventArgs e) 
        {
            AppendPath(e);
            Changed();
        }

		private void Changed()
		{
            // have we been deleted already?
            if (!Directory.Exists(BackingPath)) return;
			if (Tree.InvokeRequired) Tree.BeginInvoke(new MethodInvoker(Changed));
			else
			{
				updateNeeded = true;
				Update();
			}
		}

		private void Update()
		{
			// we're waiting for the next opportunity
            if (updateTimer.Enabled)
            {
                updateTimer.Enabled = false; // reset timer
                updateTimer.Enabled = true;
            }
			if (!updateNeeded) return;
			try
			{
				Tree.BeginUpdate();
                Tree.RefreshTree();
                String[] paths = this.changedPaths.ToArray();
                this.changedPaths.Clear();
                Tree.RefreshTree(paths);
				updateNeeded = false;
			}
			catch {}
			finally
			{
				Tree.EndUpdate();
				// prevent further calls to Update() until after 1 second
				updateTimer.Enabled = true;
            }

            // new folder name edition
            if (Tree.PathToSelect != null && Tree.SelectedNode != null && Tree.SelectedNode is DirectoryNode
                && (Tree.SelectedNode as DirectoryNode).BackingPath == Tree.PathToSelect)
            {
                DirectoryNode node = Tree.SelectedNode as DirectoryNode;
                Tree.PathToSelect = null;
                node.EnsureVisible();

                // if you created a new folder, then label edit it!
                string label = TextHelper.GetString("Label.NewFolder").Replace("&", "").Replace("...", "");
                if (node.Text.StartsWith(label))
                {
                    node.BeginEdit();
                }
            }
		}

		void updateTimer_Tick(object sender, EventArgs e)
		{
			updateTimer.Enabled = false;
			Update();
		}

	}

}
