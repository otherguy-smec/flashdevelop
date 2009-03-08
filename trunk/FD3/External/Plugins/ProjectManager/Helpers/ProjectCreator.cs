using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Diagnostics;
using ProjectManager.Projects;
using ProjectManager.Controls.TreeView;
using PluginCore.Helpers;
using System.Text;
using PluginCore;
using System.Text.RegularExpressions;
using System.Globalization;
using PluginCore.Utilities;
using PluginCore.Managers;

namespace ProjectManager.Helpers
{
	/// <summary>
	/// Contains methods useful for working with project templates.
	/// </summary>
	public class ProjectCreator
	{
        private static Regex reArgs = new Regex("\\$\\(([a-z]+)\\)", RegexOptions.IgnoreCase | RegexOptions.Compiled);

		string projectName;
        string projectId;
        string packageName;
        string packagePath;
        string packageDot = "";
        string packageSlash = "";
        List<Argument> arguments;

		/// <summary>
		/// Creates a new project based on the specified template directory.
		/// </summary>
		public Project CreateProject(string templateDirectory,
            string projectLocation, string projectName, string packageName)
		{
			this.projectName = projectName;
            this.packageName = packageName;
            projectId = Regex.Replace(RemoveDiacritics(projectName), "[^a-z0-9]", "", RegexOptions.IgnoreCase);
            packagePath = packageName.Replace('.', '\\');
            if (packageName.Length > 0)
            {
                packageDot = packageName + ".";
                packageSlash = packagePath + "\\";
            }
            
            string projectTemplate = FindProjectTemplate(templateDirectory);
            string projectPath = Path.Combine(projectLocation,
                projectName + Path.GetExtension(projectTemplate));

            // notify & let a plugin handle project creation
            Hashtable para = new Hashtable();
            para["template"] = projectTemplate;
            para["location"] = projectLocation;
            para["project"] = projectPath;
            para["id"] = projectId;
            para["package"] = packageName;
            DataEvent de = new DataEvent(EventType.Command, ProjectManagerEvents.CreateProject, para);
            EventManager.DispatchEvent(this, de);

            if (!de.Handled)
            {
                arguments = PluginBase.MainForm.Settings.CustomArguments;

                Directory.CreateDirectory(projectLocation);

                // manually copy important files
                CopyFile(projectTemplate, projectPath);

                CopyProjectFiles(templateDirectory, projectLocation, true);
            }

            if (File.Exists(projectPath))
            {
                de = new DataEvent(EventType.Command, ProjectManagerEvents.ProjectCreated, para);
                EventManager.DispatchEvent(this, de);

                return ProjectLoader.Load(projectPath);
            }
            else return null;
		}

        public static string FindProjectTemplate(string templateDirectory)
        {
            string path = Path.Combine(templateDirectory, "Project.fdp");

            if (!File.Exists(path))
                path = Path.Combine(templateDirectory, "Project.as2proj");

            if (!File.Exists(path))
                path = Path.Combine(templateDirectory, "Project.as3proj");

            if (!File.Exists(path))
                path = Path.Combine(templateDirectory, "Project.hxproj");

            if (!File.Exists(path))
                return null;

            return path;
        }

		private void CopyProjectFiles(string sourceDir, string destDir, bool filter)
		{
			Directory.CreateDirectory(destDir);

			foreach (string file in Directory.GetFiles(sourceDir))
			{
				if (filter && ShouldSkip(file))
					continue;

				string fileName = Path.GetFileName(file);
				string destFile = Path.Combine(destDir,fileName);

				CopyFile(file,destFile);
			}

            List<string> excludedDirs = new List<string>(PluginMain.Settings.ExcludedDirectories);

			foreach (string dir in Directory.GetDirectories(sourceDir))
			{
				string dirName = Path.GetFileName(dir);
                if (dirName.ToUpper() == "$(PACKAGENAME)" || dirName.ToUpper() == "$(PACKAGEPATH)") 
                    dirName = packagePath;
				string destSubDir = Path.Combine(destDir, dirName);

				// don't copy like .svn and stuff
				if (excludedDirs.Contains(dirName.ToLower()))
					continue;

				CopyProjectFiles(dir,destSubDir,false); // only filter the top directory
			}
		}

		// copy a file, if it's an .as or .fdp file, replace template keywords
		private void CopyFile(string source, string dest)
		{
            dest = ReplaceKeywords(dest); // you can use keywords in filenames too
            string ext = Path.GetExtension(source).ToLower();

			if (FileInspector.IsProject(source, ext) || FileInspector.IsTemplate(source, ext))
			{
                if (FileInspector.IsTemplate(source, ext)) dest = dest.Substring(0, dest.LastIndexOf('.'));

                Encoding encoding = Encoding.GetEncoding((Int32)PluginBase.MainForm.Settings.DefaultCodePage);
                // batch files must be encoded in ASCII
                ext = Path.GetExtension(dest).ToLower();
                if (ext == ".bat" || ext == ".cmd" || ext.StartsWith(".php")) encoding = Encoding.ASCII;

                string src = File.ReadAllText(source);
                src = ReplaceKeywords(ProcessCodeStyleLineBreaks(src));
                File.WriteAllText(dest, src, encoding);
			}
			else File.Copy(source,dest);
        }

        private string ReplaceKeywords(string line)
		{
            if (line.IndexOf("$") < 0) return line;
            return line = reArgs.Replace(line, new MatchEvaluator(ReplaceVars));
        }

        private string ReplaceVars(Match match)
        {
            if (match.Groups.Count > 0)
            {
                string name = match.Groups[1].Value.ToUpper();
                switch (name)
                {
                    case "CBI": return PluginBase.Settings.CommentBlockStyle == CommentBlockStyle.Indented ? " " : "";
                    case "PROJECTNAME": return projectName; 
                    case "PROJECTID": return projectId; 
                    case "PACKAGENAME": return packageName;
                    case "PACKAGEPATH": return packagePath;
                    case "PACKAGEPATHALT": return packagePath.Replace(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar); 
                    case "PACKAGEDOT": return packageDot;
                    case "PACKAGESLASH": return packageSlash;
                    case "PACKAGESLASHALT": return packageSlash.Replace(Path.DirectorySeparatorChar, Path.AltDirectorySeparatorChar); 
                    default:
                        foreach (Argument arg in arguments)
                            if (arg.Key.ToUpper() == name) return arg.Value;
                        break;
                }
            }
            return match.Value;
		}

		private bool ShouldSkip(string path)
		{
			string filename = Path.GetFileName(path).ToLower();
			return filename == "project.fdp"
                || filename == "project.as2proj"
                || filename == "project.as3proj"
                || filename == "project.hxproj"
				|| filename == "project.txt"
				|| filename == "project.png";
		}

        public static String RemoveDiacritics(String s)
        {
            String normalizedString = s.Normalize(NormalizationForm.FormD);
            StringBuilder stringBuilder = new StringBuilder();

            for (int i = 0; i < normalizedString.Length; i++)
            {
                Char c = normalizedString[i];
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                    stringBuilder.Append(c);
            }

            return stringBuilder.ToString();
        }

        #region ArgsProcessor duplicated code
        /// <summary>
        /// Gets the correct coding style line break chars
        /// </summary>
        public static String ProcessCodeStyleLineBreaks(String text)
        {
            String CSLB = "$(CSLB)";
            Int32 nextIndex = text.IndexOf(CSLB);
            if (nextIndex < 0) return text;
            CodingStyle cs = PluginBase.Settings.CodingStyle;
            if (cs == CodingStyle.BracesOnLine) return text.Replace(CSLB, "");
            Int32 eolMode = (Int32)PluginBase.Settings.EOLMode;
            String lineBreak = LineEndDetector.GetNewLineMarker(eolMode);
            String result = ""; Int32 currentIndex = 0;
            while (nextIndex >= 0)
            {
                result += text.Substring(currentIndex, nextIndex - currentIndex) + lineBreak + GetLineIndentation(text, nextIndex);
                currentIndex = nextIndex + CSLB.Length;
                nextIndex = text.IndexOf(CSLB, currentIndex);
            }
            return result + text.Substring(currentIndex);
        }

        /// <summary>
        /// Gets the line intendation from the text
        /// </summary>
        private static String GetLineIndentation(String text, Int32 position)
        {
            Char c;
            Int32 startPos = position;
            while (startPos > 0)
            {
                c = text[startPos];
                if (c == 10 || c == 13) break;
                startPos--;
            }
            Int32 endPos = ++startPos;
            while (endPos < position)
            {
                c = text[endPos];
                if (c != '\t' && c != ' ') break;
                endPos++;
            }
            return text.Substring(startPos, endPos - startPos);
        }
        #endregion
	}
}
