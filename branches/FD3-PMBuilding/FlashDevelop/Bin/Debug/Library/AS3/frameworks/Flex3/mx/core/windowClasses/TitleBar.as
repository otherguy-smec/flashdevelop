﻿package mx.core.windowClasses
{
	import flash.display.DisplayObject;
	import flash.display.NativeWindowDisplayState;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import mx.controls.Button;
	import mx.core.WindowedApplication;
	import mx.core.IFlexDisplayObject;
	import mx.core.IUITextField;
	import mx.core.IWindow;
	import mx.core.mx_internal;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.IStyleClient;
	import mx.styles.StyleManager;

	/**
	 *  The default title bar for a WindowedApplication or a Window.
	 */
	public class TitleBar extends UIComponent
	{
		/**
		 *  @private
		 */
		local var titleBarBackground : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var titleIconObject : Object;
		/**
		 *  @private
		 */
		private var minimizeButtonSkin : Class;
		/**
		 *  @private
		 */
		private var maximizeButtonSkin : Class;
		/**
		 *  @private
		 */
		private var restoreButtonSkin : Class;
		/**
		 *  @private
		 */
		private var closeButtonSkin : Class;
		/**
		 *  The Button object that defines the close button.
		 */
		public var closeButton : Button;
		/**
		 *  The Button object that defines the maximize button.
		 */
		public var maximizeButton : Button;
		/**
		 *  The Button object that defines the minimize button.
		 */
		public var minimizeButton : Button;
		/**
		 *  Storage for the title property.
		 */
		private var _title : String;
		/**
		 *  @private
		 */
		private var titleChanged : Boolean;
		/**
		 *  @private
		 */
		private var _titleIcon : Class;
		/**
		 *  @private
		 */
		private var titleIconChanged : Boolean;
		/**
		 *  The UITextField in the title bar that displays the application title.
		 */
		public var titleTextField : IUITextField;

		/**
		 *  The title that appears in the window title bar and
		 */
		public function get title () : String;
		/**
		 *  @private
		 */
		public function set title (value:String) : void;
		/**
		 *  The icon displayed in the title bar.
		 */
		public function get titleIcon () : Class;
		/**
		 *  @private
		 */
		public function set titleIcon (value:Class) : void;
		/**
		 *  The IWindow that owns this TitleBar.
		 */
		private function get window () : IWindow;

		/**
		 *  @private
		 */
		private static function isMac () : Boolean;
		/**
		 *  Constructor.
		 */
		public function TitleBar ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  Called by the StyleManager when a style changes.
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  Determines the placement of the buttons in the title bar.
		 */
		protected function placeButtons (align:String, unscaledWidth:Number, unscaledHeight:Number, leftOffset:Number, rightOffset:Number, cornerOffset:Number) : void;
		/**
		 *  Determines the alignment of the title in the title bar.
		 */
		protected function placeTitle (titleAlign:String, leftOffset:Number, rightOffset:Number, buttonAlign:String) : void;
		/**
		 *  @private
		 */
		private function measureChromeText (textField:IUITextField) : Rectangle;
		/**
		 *  @private
		 */
		private function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  Handles a <code>doubleClick</code> event in a platform-appropriate manner.
		 */
		protected function doubleClickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function button_mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function minimizeButton_clickHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function maximizeButton_clickHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function closeButton_clickHandler (event:Event) : void;
	}
}