﻿using System;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace FlashDevelop
{
    class Win32
    {
        public const Int32 SW_HIDE = 0;
        public const Int32 SW_SHOW = 1;
        public const Int32 SW_RESTORE = 9;
        public const Int32 SW_SHOWMINIMIZED = 2;
        public const UInt32 SWP_SHOWWINDOW = 64;

        [DllImport("user32.dll")]
        public static extern Boolean ShowWindow(IntPtr hWnd, Int32 nCmdShow);

        [DllImport("user32.dll")]
        public static extern void SetWindowPos(IntPtr hwnd, IntPtr hwndInsertAfter, Int32 x, Int32 y, Int32 width, Int32 height, UInt32 flags);

        /// <summary>
        /// Sets the window specified by handle to fullscreen
        /// </summary>
        public static void SetWinFullScreen(IntPtr hwnd)
        {
            Screen screen = Screen.FromHandle(hwnd);
            Int32 screenTop = screen.WorkingArea.Top;
            Int32 screenLeft = screen.WorkingArea.Left;
            Int32 screenWidth = screen.WorkingArea.Width;
            Int32 screenHeight = screen.WorkingArea.Height;
            Win32.SetWindowPos(hwnd, IntPtr.Zero, screenLeft, screenTop, screenWidth, screenHeight, Win32.SWP_SHOWWINDOW);
        }

    }

}