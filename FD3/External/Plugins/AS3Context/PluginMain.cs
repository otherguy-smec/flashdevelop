using System;
using System.IO;
using System.Text;
using System.ComponentModel;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using PluginCore.Localization;
using PluginCore.Helpers;
using PluginCore.Managers;
using PluginCore.Utilities;
using AS3Context.Compiler;
using PluginCore;
using ASCompletion.Model;
using ASCompletion.Completion;
using ASCompletion.Commands;

namespace AS3Context
{
    public class PluginMain : IPlugin
    {
        private String pluginName = "AS3Context";
        private String pluginGuid = "ccf2c534-db6b-4c58-b90e-cd0b837e61c4";
        private String pluginHelp = "www.flashdevelop.org/community/";
        private String pluginDesc = "ActionScript 3 context for the ASCompletion engine.";
        private String pluginAuth = "FlashDevelop Team";
        static private AS3Settings settingObject;
        private Context contextInstance;
        private String settingFilename;
        private bool inMXML;

        #region Required Properties

        /// <summary>
        /// Name of the plugin
        /// </summary>
        public String Name
        {
            get { return this.pluginName; }
        }

        /// <summary>
        /// GUID of the plugin
        /// </summary>
        public String Guid
        {
            get { return this.pluginGuid; }
        }

        /// <summary>
        /// Author of the plugin
        /// </summary>
        public String Author
        {
            get { return this.pluginAuth; }
        }

        /// <summary>
        /// Description of the plugin
        /// </summary>
        public String Description
        {
            get { return this.pluginDesc; }
        }

        /// <summary>
        /// Web address for help
        /// </summary>
        public String Help
        {
            get { return this.pluginHelp; }
        }

        /// <summary>
        /// Object that contains the settings
        /// </summary>
        [Browsable(false)]
        Object IPlugin.Settings
        {
            get { return settingObject; }
        }

        static public AS3Settings Settings
        {
            get { return settingObject as AS3Settings; }
        }
        #endregion
        
        #region Required Methods

        /// <summary>
        /// Initializes the plugin
        /// </summary>
        public void Initialize()
        {
            this.InitBasics();
            this.LoadSettings();
            this.AddEventHandlers();
        }

        /// <summary>
        /// Disposes the plugin
        /// </summary>
        public void Dispose()
        {
            FlexDebugger.Stop();
            this.SaveSettings();
        }

        /// <summary>
        /// Handles the incoming events
        /// </summary>
        public void HandleEvent(Object sender, NotifyEvent e, HandlingPriority priority)
        {
            if (priority == HandlingPriority.Low)
            {
                if (e.Type == EventType.Command)
                {
                    DataEvent de = e as DataEvent;
                    string action = de.Action;
                    if (action == "ProjectManager.OpenVirtualFile")
                    {
                        e.Handled = OpenVirtualFileModel(de.Data as String);
                    }
                    else if (!(settingObject as AS3Settings).DisableFDB 
                        && action == "AS3Context.StartDebugger")
                    {
                        string workDir = (PluginBase.CurrentProject != null)
                            ? Path.GetDirectoryName(PluginBase.CurrentProject.ProjectPath)
                            : Environment.CurrentDirectory;
                        
                        string flexSdk = (settingObject as AS3Settings).FlexSDK;

                        // if the default sdk is not defined ask for project sdk
                        if (flexSdk == null || flexSdk == String.Empty)
                        {
                            flexSdk = PluginBase.MainForm.ProcessArgString("$(CompilerPath)");
                        }

                        e.Handled = FlexDebugger.Start(workDir, flexSdk, null);
                    }
                }
                else if (e.Type == EventType.Keys)
                {
                    if (inMXML)
                    {
                        KeyEvent ke = e as KeyEvent;
                        if (ke.Value == ASCompletion.Context.ASContext.CommonSettings.GotoDeclaration)
                        {
                            if (MxmlComplete.GotoDeclaration())
                            {
                                ke.Handled = true;
                                ke.ProcessKey = false;
                            }
                        }
                    }
                }
                return;
            }

            else if (priority == HandlingPriority.Normal)
            {
                switch (e.Type)
                {
                    case EventType.ProcessArgs:
                        TextEvent te = e as TextEvent;
                        if (te.Value.IndexOf("$(FlexSDK)") >= 0)
                        {
                            string path = Regex.Replace(settingObject.FlexSDK, @"[\\/]bin[\\/]?$", "");
                            te.Value = te.Value.Replace("$(FlexSDK)", path);
                        }
                        break;

                    case EventType.UIStarted:
                        contextInstance = new Context(settingObject);
                        // Associate this context with AS3 language
                        ASCompletion.Context.ASContext.RegisterLanguage(contextInstance, "as3");
                        ASCompletion.Context.ASContext.RegisterLanguage(contextInstance, "mxml");
                        break;

                    case EventType.FileSave:
                    case EventType.FileSwitch:
                        if (contextInstance != null) contextInstance.OnFileOperation(e);

                        string ext = Path.GetExtension(PluginBase.MainForm.CurrentDocument.FileName);
                        inMXML = (ext.ToLower() == ".mxml");
                        MxmlComplete.IsDirty = true;
                        break;
                }
                return;
            }

            else if (priority == HandlingPriority.High)
            {
                if (e.Type == EventType.Command)
                {
                    string action = (e as DataEvent).Action;
                    if (action == "ProjectManager.Project")
                    {
                        FlexDebugger.Stop();
                    }
                    else if (action.StartsWith("FlashViewer."))
                    {
                        if (action == "FlashViewer.Closed")
                        {
                            FlexDebugger.Stop();
                        }
                        else if (action == "FlashViewer.External" || action == "FlashViewer.Default" 
                            || action == "FlashViewer.Popup" || action == "FlashViewer.Document")
                        {
                            if (PluginBase.CurrentProject != null && PluginBase.CurrentProject.Language == "as3"
                                && PluginBase.CurrentProject.TraceEnabled)
                            {
                                DataEvent de = new DataEvent(EventType.Command, "AS3Context.StartDebugger", null);
                                EventManager.DispatchEvent(this, de);
                            }
                        }
                    }
                    if (inMXML)
                    {
                        DataEvent de = e as DataEvent;
                        if (de.Action == "XMLCompletion.Element")
                        {
                            de.Handled = MxmlComplete.HandleElement(de.Data);
                        }
                        if (de.Action == "XMLCompletion.Namespace")
                        {
                            de.Handled = MxmlComplete.HandleNamespace(de.Data);
                        }
                        else if (de.Action == "XMLCompletion.CloseElement")
                        {
                            de.Handled = MxmlComplete.HandleElementClose(de.Data);
                        }
                        else if (de.Action == "XMLCompletion.Attribute")
                        {
                            de.Handled = MxmlComplete.HandleAttribute(de.Data);
                        }
                    }
                }
            }
        }

        private bool OpenVirtualFileModel(string virtualPath)
        {
            int p = virtualPath.IndexOf("::");
            if (p < 0) return false;

            string container = virtualPath.Substring(0, p);
            string ext = Path.GetExtension(container).ToLower();
            if (ext != ".swc" && ext != ".swf")
                return false;
            if (!File.Exists(container))
                return false;

            string fileName = Path.Combine(container, 
                virtualPath.Substring(p + 2).Replace('.', Path.DirectorySeparatorChar)) + "$.as";
            PathModel path = new PathModel(container, contextInstance);
            SwfOp.ContentParser parser = new SwfOp.ContentParser(path.Path);
            parser.Run();
            AbcConverter.Convert(parser.Abcs, path, contextInstance);
            
            if (path.HasFile(fileName))
            {
                FileModel model = path.GetFile(fileName);
                ASComplete.OpenVirtualFile(model);
            }
            return false;
        }

        #endregion

        #region Custom Methods

        /// <summary>
        /// Initializes important variables
        /// </summary>
        public void InitBasics()
        {
            String dataPath = Path.Combine(PathHelper.DataDir, "AS3Context");
            if (!Directory.Exists(dataPath)) Directory.CreateDirectory(dataPath);
            this.settingFilename = Path.Combine(dataPath, "Settings.fdb");
            this.pluginDesc = TextHelper.GetString("Info.Description");
        }

        /// <summary>
        /// Adds the required event handlers
        /// </summary>
        public void AddEventHandlers()
        {
            EventManager.AddEventHandler(this, EventType.UIStarted | EventType.ProcessArgs | EventType.FileSwitch | EventType.FileSave);
            EventManager.AddEventHandler(this, EventType.Command, HandlingPriority.High);
            EventManager.AddEventHandler(this, EventType.Command | EventType.Keys, HandlingPriority.Low);
        }

        /// <summary>
        /// Loads the plugin settings
        /// </summary>
        public void LoadSettings()
        {
            settingObject = new AS3Settings();
            if (!File.Exists(this.settingFilename)) this.SaveSettings();
            else
            {
                Object obj = ObjectSerializer.Deserialize(this.settingFilename, settingObject);
                settingObject = (AS3Settings)obj;
            }
            if (settingObject.AS3ClassPath == null) settingObject.AS3ClassPath = @"Library\AS3\intrinsic";
            if (settingObject.FlexSDK == null || settingObject.FlexSDK == String.Empty)
            {
                String includedSDK = Path.Combine(PathHelper.ToolDir, "flexsdk");
                if (Directory.Exists(includedSDK)) settingObject.FlexSDK = includedSDK;
            }
            settingObject.OnClasspathChanged += SettingObjectOnClasspathChanged;
        }

        /// <summary>
        /// Update the classpath if an important setting has changed
        /// </summary>
        private void SettingObjectOnClasspathChanged()
        {
            if (contextInstance != null) contextInstance.BuildClassPath();
        }

        /// <summary>
        /// Saves the plugin settings
        /// </summary>
        public void SaveSettings()
        {
            settingObject.OnClasspathChanged -= SettingObjectOnClasspathChanged;
            ObjectSerializer.Serialize(this.settingFilename, settingObject);
        }

        /// <summary>
        /// Explore the possible locations for the Macromedia Flash IDE classpath
        /// </summary>
        static public string FindAuthoringConfigurationPath(string flashPath)
        {
            if (flashPath == null)
            {
                flashPath = CallFlashIDE.FindFlashIDE(true);
                if (flashPath == null)
                    return null;
            }
            string ext = Path.GetExtension(flashPath).ToLower();
            if (ext == ".exe" || ext == ".bat" || ext == ".cmd")
                flashPath = Path.GetDirectoryName(flashPath);
            string basePath = flashPath;

            string deflang = System.Globalization.CultureInfo.CurrentUICulture.Name;
            deflang = deflang.Substring(0, 2);

            // CS4+ default configuration
            if (Directory.Exists(basePath + "\\Common\\Configuration\\ActionScript 3.0"))
                return basePath + "\\Common\\Configuration\\";

            // default language
            if (Directory.Exists(basePath + deflang + "\\Configuration\\ActionScript 3.0"))
            {
                return basePath + deflang + "\\Configuration\\";
            }
            // look for other languages
            else if (Directory.Exists(basePath))
            {
                string[] dirs = Directory.GetDirectories(basePath);
                foreach (string dir in dirs)
                {
                    if (Directory.Exists(dir + "\\Configuration\\ActionScript 3.0"))
                        return dir + "\\Configuration\\";
                }
            }
            return null;
        }
        #endregion
    
    }

}
