﻿package mx.core
{
	import flash.display.NativeWindow;

	/**
	 *  The IWindow interface defines the API for components that serve as top-level
	 */
	public interface IWindow
	{
		/**
		 *  Specifies whether the window can be maximized.
		 */
		public function get maximizable () : Boolean;
		/**
		 *  Specifies whether the window can be minimized.
		 */
		public function get minimizable () : Boolean;
		/**
		 *  The underlying NativeWindow that the Window component uses.
		 */
		public function get nativeWindow () : NativeWindow;
		/**
		 *  Specifies whether the window can be resized.
		 */
		public function get resizable () : Boolean;
		/**
		 *  The string that appears in the status bar, if it is visible.
		 */
		public function get status () : String;
		/**
		 *  @private
		 */
		public function set status (value:String) : void;
		/**
		 *  Specifies the type of system chrome (if any) the window has.
		 */
		public function get systemChrome () : String;
		/**
		 *  The title text that appears in the window title bar and
		 */
		public function get title () : String;
		/**
		 *  @private
		 */
		public function set title (value:String) : void;
		/**
		 *  The Class (usually an image) used to draw the title bar icon.
		 */
		public function get titleIcon () : Class;
		/**
		 *  @private
		 */
		public function set titleIcon (value:Class) : void;
		/**
		 *  Specifies whether the window is transparent.
		 */
		public function get transparent () : Boolean;
		/**
		 *  Specifies the type of NativeWindow that this component
		 */
		public function get type () : String;
		/**
		 *  Controls the window's visibility.
		 */
		public function get visible () : Boolean;

		/**
		 *  Closes the window.
		 */
		public function close () : void;
		/**
		 *  Maximizes the window, or does nothing if it's already maximized.
		 */
		public function maximize () : void;
		/**
		 *  Minimizes the window.
		 */
		public function minimize () : void;
		/**
		 *  Restores the window (unmaximizes it if it's maximized, or
		 */
		public function restore () : void;
	}
}