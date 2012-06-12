﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using PluginCore;
using PluginCore.Localization;

namespace CssCompletion
{
    public class CssFeatures
    {
        public CssMode Mode;
        public string Compile;
        public string Syntax;
        public Regex Pattern;
        public Regex ErrorPattern;
        public char Trigger;
        public bool AutoCompile;
        public bool AutoMinify;

        public CssFeatures(string mode, Dictionary<string, string> config)
        {
            Mode = (CssMode)Enum.Parse(typeof(CssMode), mode);
            string compile = GetParam("compile", config);
            if (compile.Length > 0)
                Compile = compile;
            string syntax = GetParam("syntax", config);
            if (syntax.Length > 0)
                Syntax = syntax;
            string pattern = GetParam("variable", config);
            if (pattern.Length > 0)
                Pattern = new Regex(pattern, RegexOptions.Compiled | RegexOptions.IgnoreCase);
            string error = GetParam("error", config);
            if (error.Length > 0)
            {
                RegexOptions options = RegexOptions.Compiled | RegexOptions.IgnoreCase;
                if (error.EndsWith("/s")) options |= RegexOptions.Singleline;
                else options |= RegexOptions.Multiline;
                ErrorPattern = new Regex(error.Substring(1, error.Length - 3), options);
            }
            string trigger = GetParam("trigger", config);
            if (trigger.Length > 0)
                Trigger = trigger[0];
        }

        private string GetParam(string name, Dictionary<string, string> config)
        {
            if (!config.ContainsKey(name)) return "";
            return config[name].Trim();
        }
    }

    class LocalContext
    {
        public ScintillaNet.ScintillaControl Sci;
        public char Separator;
        public int Position;
        public bool InValue;
        public bool InBlock;
        public string Word;
        public string Property;

        public LocalContext(ScintillaNet.ScintillaControl sci)
        {
            Sci = sci;
        }
    }

    class CssBlock
    {
        public CssBlock Parent;
        public List<CssBlock> Children = new List<CssBlock>();
        public int LineFrom;
        public int LineTo;
        public int ColFrom;
        public int ColTo;
    }

    public enum CssMode
    {
        CSS,
        SCSS,
        LESS,
        HSS
    }

    public enum ItemKind 
    {
        Property,
        Value,
        Variable,
        Pseudo,
        Prefixes
    }

    /// <summary>
    /// Simple completion list item
    /// </summary>
    public class CompletionItem : ICompletionListItem, IComparable, IComparable<ICompletionListItem>
    {
        static public System.Drawing.Bitmap PropertyIcon;
        static public System.Drawing.Bitmap VariableIcon;
        static public System.Drawing.Bitmap ValueIcon;
        static public System.Drawing.Bitmap PseudoIcon;
        static public System.Drawing.Bitmap PrefixesIcon;

        private string label;
        private ItemKind kind;

        public CompletionItem(string label, ItemKind kind)
        {
            this.label = label;
            this.kind = kind;
        }
        public string Label
        {
            get { return label; }
        }
        public string Description
        {
            get 
            {
                switch (kind)
                {
                    case ItemKind.Property: return TextHelper.GetString("Info.CompletionPropertyDesc");
                    case ItemKind.Variable: return TextHelper.GetString("Info.CompletionVariableDesc");
                    case ItemKind.Value: return TextHelper.GetString("Info.CompletionValueDesc");
                    case ItemKind.Pseudo: return TextHelper.GetString("Info.CompletionPseudoDesc");
                    case ItemKind.Prefixes: return TextHelper.GetString("Info.CompletionPrefixesDesc");
                }
                return "";
            }
        }
        public ItemKind Kind { get { return kind; } }
        public System.Drawing.Bitmap Icon
        {
            get 
            {
                switch (kind)
                {
                    case ItemKind.Property: return PropertyIcon;
                    case ItemKind.Variable: return VariableIcon;
                    case ItemKind.Value: return ValueIcon;
                    case ItemKind.Pseudo: return PseudoIcon;
                    case ItemKind.Prefixes: return PrefixesIcon;
                }
                return PropertyIcon;
            }
        }
        public string Value
        {
            get { return label; }
        }
        Int32 IComparable.CompareTo(Object obj)
        {
            return String.Compare(Label, (obj as ICompletionListItem).Label, true);
        }
        Int32 IComparable<ICompletionListItem>.CompareTo(ICompletionListItem other)
        {
            return String.Compare(Label, other.Label, true);
        }
    }
}
