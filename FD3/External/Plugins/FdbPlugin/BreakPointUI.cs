﻿using System;
using System.Collections.Generic;
using System.Text;
using PluginCore;
using System.Windows.Forms;
using System.Drawing;
using System.Data;
using System.IO;

namespace FdbPlugin
{
    class BreakPointUI : DockPanelControl
    {
        private PluginMain pluginMain;
        private BreakPointManager breakPointManager;

        private DataGridView dgv;

        private DataGridViewCheckBoxColumn ColumnBreakPointEnable;
        private DataGridViewTextBoxColumn ColumnBreakPointFilePath;
        private DataGridViewTextBoxColumn ColumnBreakPointFileName;
        private DataGridViewTextBoxColumn ColumnBreakPointLine;
        private DataGridViewTextBoxColumn ColumnBreakPointExp;

        private Color defaultColor;

        public BreakPointUI(PluginMain pluginMain, BreakPointManager breakPointManager)
        {
            init();

            this.pluginMain = pluginMain;
            this.pluginMain.FdbWrapper.ConditionErrorEvent += new fdbEventHandler(FdbWrapper_ConditionErrorEvent);
            this.breakPointManager = breakPointManager;
            this.breakPointManager.ChangeBreakPointEvent += new ChangeBreakPointEventHandler(breakPointManager_ChangeBreakPointEvent);
            this.breakPointManager.UpDateBreakPointEvent += new UpDateBreakPointEventHandler(breakPointManager_UpDateBreakPointEvent);
            this.Controls.Add(this.dgv);
        }

        void breakPointManager_UpDateBreakPointEvent(object sender, UpDateBreakPointArgs e)
        {
            int index = ItemIndex(e.FileFullPath, e.OldLine);
            if (index >= 0)
            {
                dgv.Rows[index].Cells["Line"].Value = e.NewLine.ToString();
            }
        }

        void FdbWrapper_ConditionErrorEvent(object sender)
        {
            BreakPointCondition[] CondErrorAry = this.breakPointManager.GetErrorAry();
            foreach (BreakPointCondition cond in CondErrorAry)
            {
                int index = ItemIndex(cond.FileFullPath, cond.Line+1);
                if (index >= 0)
                {
                    dgv.Rows[index].DefaultCellStyle.BackColor = Color.Red;
                }
            }
        }

        void breakPointManager_ChangeBreakPointEvent(object sender, BreakPointArgs e)
        {
            if (e.IsDelete)
            {
                DeleteItem(e.FileFullPath, e.Line + 1);            
            }
            else
            {
                AddItem(e.FileFullPath, e.Line + 1, e.Exp, e.Enable);
            }
        }

        private void init()
        {
            this.dgv = new DataGridView();
            this.dgv.BorderStyle = BorderStyle.None;
            this.dgv.Font = PluginBase.Settings.DefaultFont;
            this.dgv.Dock = DockStyle.Fill;

            this.ColumnBreakPointEnable = new DataGridViewCheckBoxColumn();
            this.ColumnBreakPointFilePath = new DataGridViewTextBoxColumn();
            this.ColumnBreakPointFileName = new DataGridViewTextBoxColumn();
            this.ColumnBreakPointLine = new DataGridViewTextBoxColumn();
            this.ColumnBreakPointExp = new DataGridViewTextBoxColumn();

            this.ColumnBreakPointEnable.HeaderText = "Enable";
            this.ColumnBreakPointEnable.Name = "Enable";

            this.ColumnBreakPointFilePath.HeaderText = "FilePath";
            this.ColumnBreakPointFilePath.Name = "FilePath";
            this.ColumnBreakPointFilePath.ReadOnly = true;

            this.ColumnBreakPointFileName.HeaderText = "FileName";
            this.ColumnBreakPointFileName.Name = "FileName";
            this.ColumnBreakPointFileName.ReadOnly = true;

            this.ColumnBreakPointLine.HeaderText = "Line";
            this.ColumnBreakPointLine.Name = "Line";
            this.ColumnBreakPointLine.ReadOnly = true;

            this.ColumnBreakPointExp.HeaderText = "Exp";
            this.ColumnBreakPointExp.Name = "Exp";

            this.dgv.AllowUserToAddRows = false;
            this.dgv.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            ColumnBreakPointEnable,
            this.ColumnBreakPointFilePath,
            this.ColumnBreakPointFileName,
            this.ColumnBreakPointLine,
            this.ColumnBreakPointExp});

            defaultColor = dgv.Rows[dgv.Rows.Add()].DefaultCellStyle.BackColor;
            dgv.Rows.Clear();

            this.dgv.CellEndEdit += new DataGridViewCellEventHandler(dgv_CellEndEdit);
            this.dgv.CellMouseUp += new DataGridViewCellMouseEventHandler(dgv_CellMouseUp);
            this.dgv.CellDoubleClick += new DataGridViewCellEventHandler(dgv_CellDoubleClick);
        }

        void dgv_CellMouseUp(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (dgv.Rows[e.RowIndex].Cells["Enable"].ColumnIndex == e.ColumnIndex)
            {
                Boolean enable = !(Boolean)dgv.Rows[e.RowIndex].Cells["Enable"].Value;
                string filefullpath = (string)dgv.Rows[e.RowIndex].Cells["FilePath"].Value;
                int line = int.Parse((string)dgv.Rows[e.RowIndex].Cells["Line"].Value);
                int marker = enable ? 3 : 4;

                ITabbedDocument doc = pluginMain.GetDocument(filefullpath);
                if (doc != null)
                {
                    pluginMain.ToggleMarker(doc.SciControl, 4, line - 1);

                    Int32 lineMask = doc.SciControl.MarkerGet(line - 1);
                    Boolean m = (lineMask & (1 << 4)) == 0 ? true : false;
                    if ((Boolean)dgv.Rows[e.RowIndex].Cells["Enable"].Value != m)
                    {
                        dgv.Rows[e.RowIndex].Cells["Enable"].Value = m;
                    }
                    dgv.RefreshEdit();
                }
            }
        }

        void dgv_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgv.Rows[e.RowIndex].Cells["Line"].ColumnIndex == e.ColumnIndex)
            {
                string filename = (string)dgv.Rows[e.RowIndex].Cells["FilePath"].Value;
                int line = int.Parse((string)dgv.Rows[e.RowIndex].Cells["Line"].Value);
                pluginMain.ActiveDocument(filename, line - 1, true);
            }
        }

        void dgv_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            if (dgv.Rows[e.RowIndex].Cells["Exp"].ColumnIndex == e.ColumnIndex)
            {
                dgv.Rows[e.RowIndex].DefaultCellStyle.BackColor = defaultColor;

                string filename = (string)dgv.Rows[e.RowIndex].Cells["FilePath"].Value;
                int line = int.Parse((string)dgv.Rows[e.RowIndex].Cells["Line"].Value);
                string exp = (string)dgv.Rows[e.RowIndex].Cells["Exp"].Value;

                breakPointManager.AddBreakPointCondition(filename, line - 1, exp);
            }
        }

        public void Clear()
        {
            dgv.Rows.Clear();
        }

        public new Boolean Enabled
        {
            get { return dgv.Enabled; }
            set { dgv.Enabled = value; }
        }

        private void AddItem(string filename, int line, string exp, Boolean enable)
        {
            DataGridViewRow dgvrow;
            int i = ItemIndex(filename, line);
            if (i >= 0)
            {
                dgvrow = dgv.Rows[i];
            }
            else
            {
                dgvrow = dgv.Rows[dgv.Rows.Add()];
            }
            dgvrow.Cells["Enable"].Value = enable;
            dgvrow.Cells["FilePath"].Value = filename;
            dgvrow.Cells["FileName"].Value = Path.GetFileName(filename);
            dgvrow.Cells["Line"].Value = line.ToString();
            dgvrow.Cells["Exp"].Value = exp;
        }

        private void DeleteItem(string filename, int line)
        {
            int i = ItemIndex(filename, line);
            if (i >= 0)
            {
                dgv.Rows.RemoveAt(i);
            }
        }

        private int ItemIndex(string filename, int line)
        {
            for (int i = 0; i < dgv.Rows.Count; i++)
            {
                if ((string)dgv.Rows[i].Cells["FilePath"].Value == filename
                    && (string)dgv.Rows[i].Cells["Line"].Value == line.ToString())
                {
                    return i;
                }
            }
            return -1;
        }
    }
}
