﻿package mx.core
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowDisplayState;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowResize;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NativeWindowBoundsEvent;
	import flash.events.NativeWindowDisplayStateEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import mx.controls.Button;
	import mx.controls.FlexNativeMenu;
	import mx.core.windowClasses.StatusBar;
	import mx.core.windowClasses.TitleBar;
	import mx.events.AIREvent;
	import mx.events.FlexEvent;
	import mx.events.FlexNativeWindowBoundsEvent;
	import mx.managers.CursorManagerImpl;
	import mx.managers.FocusManager;
	import mx.managers.ICursorManager;
	import mx.managers.ISystemManager;
	import mx.managers.WindowedSystemManager;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import mx.styles.StyleProxy;

	/**
	 *  Dispatched when this application gets activated.
	 */
	[Event(name="applicationActivate", type="mx.events.AIREvent")] 
	/**
	 *  Dispatched when this application gets deactivated.
	 */
	[Event(name="applicationDeactivate", type="mx.events.AIREvent")] 
	/**
	 *  Dispatched after the window has been activated.
	 */
	[Event(name="windowActivate", type="mx.events.AIREvent")] 
	/**
	 *  Dispatched after the window has been deactivated.
	 */
	[Event(name="windowDeactivate", type="mx.events.AIREvent")] 
	/**
	 *  Dispatched after the window has been closed.
	 */
	[Event(name="close", type="flash.events.Event")] 
	/**
	 *  Dispatched before the window closes.
	 */
	[Event(name="closing", type="flash.events.Event")] 
	/**
	 *  Dispatched after the display state changes
	 */
	[Event(name="displayStateChange", type="flash.events.NativeWindowDisplayStateEvent")] 
	/**
	 *  Dispatched before the display state changes
	 */
	[Event(name="displayStateChanging", type="flash.events.NativeWindowDisplayStateEvent")] 
	/**
	 *  Dispatched before the window moves,
	 */
	[Event(name="moving", type="flash.events.NativeWindowBoundsEvent")] 
	/**
	 *  Dispatched when the computer connects to or disconnects from the network.
	 */
	[Event(name="networkChange", type="flash.events.Event")] 
	/**
	 *  Dispatched before the underlying NativeWindow is resized, or
	 */
	[Event(name="resizing", type="flash.events.NativeWindowBoundsEvent")] 
	/**
	 *  Dispatched when the Window completes its initial layout
	 */
	[Event(name="windowComplete", type="mx.events.AIREvent")] 
	/**
	 *  Dispatched after the window moves.
	 */
	[Event(name="windowMove", type="mx.events.FlexNativeWindowBoundsEvent")] 
	/**
	 *  Dispatched after the underlying NativeWindow is resized.
	 */
	[Event(name="windowResize", type="mx.events.FlexNativeWindowBoundsEvent")] 
	/**
	 *  Position of buttons in title bar. Possible values: <code>"left"</code>,
	 */
	[Style(name="buttonAlignment", type="String", enumeration="left,right,auto", inherit="yes")] 
	/**
	 *  Defines the distance between the titleBar buttons.
	 */
	[Style(name="buttonPadding", type="Number", inherit="yes")] 
	/**
	 *  Skin for close button when using Flex chrome.
	 */
	[Style(name="closeButtonSkin", type="Class", inherit="no",states="up, over, down, disabled")] 
	/**
	 *  The extra space around the gripper. The total area of the gripper
	 */
	[Style(name="gripperPadding", type="Number", format="Length", inherit="no")] 
	/**
	 *  Style declaration for the skin of the gripper.
	 */
	[Style(name="gripperStyleName", type="String", inherit="no")] 
	/**
	 *  The explicit height of the header. If this style is not set, the header
	 */
	[Style(name="headerHeight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Skin for maximize button when using Flex chrome.
	 */
	[Style(name="maximizeButtonSkin", type="Class", inherit="no",states="up, over, down, disabled")] 
	/**
	 *  Skin for minimize button when using Flex chrome.
	 */
	[Style(name="minimizeButtonSkin", type="Class", inherit="no",states="up, over, down, disabled")] 
	/**
	 *  Skin for restore button when using Flex chrome.
	 */
	[Style(name="restoreButtonSkin", type="Class", inherit="no",states="up, over, down, disabled")] 
	/**
	 *  Determines whether the window draws its own Flex Chrome or depends on the developer
	 */
	[Style(name="showFlexChrome", type="Boolean", inherit="no")] 
	/**
	 *  The colors used to draw the status bar.
	 */
	[Style(name="statusBarBackgroundColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The status bar background skin.
	 */
	[Style(name="statusBarBackgroundSkin", type="Class", inherit="yes")] 
	/**
	 *  Style declaration for the status text.
	 */
	[Style(name="statusTextStyleName", type="String", inherit="yes")] 
	/**
	 *  Position of the title in title bar.
	 */
	[Style(name="titleAlignment", type="String", enumeration="left,center,auto", inherit="yes")] 
	/**
	 *  The title background skin.
	 */
	[Style(name="titleBarBackgroundSkin", type="Class", inherit="yes")] 
	/**
	 *  The distance between the furthest out title bar button and the
	 */
	[Style(name="titleBarButtonPadding", type="Number", inherit="true")] 
	/**
	 *  An array of two colors used to draw the header.
	 */
	[Style(name="titleBarColors", type="Array", arrayType="uint", format="Color", inherit="yes")] 
	/**
	 *  The style name for the title text.
	 */
	[Style(name="titleTextStyleName", type="String", inherit="yes")] 

	/**
	 *  The Window is a top-level container for additional windows
	 */
	public class Window extends LayoutContainer implements IWindow
	{
		/**
		 *  @private
		 */
		private static const HEADER_PADDING : Number = 4;
		/**
		 *  @private
		 */
		private static const MOUSE_SLACK : Number = 5;
		/**
		 *  The default height for a window (SDK-14399) 
		 */
		private static const DEFAULT_WINDOW_HEIGHT : Number = 100;
		/**
		 *  The default width for a window (SDK-14399) 
		 */
		private static const DEFAULT_WINDOW_WIDTH : Number = 100;
		/**
		 *  @private
		 */
		private var _nativeWindow : NativeWindow;
		/**
		 *  @private
		 */
		private var _nativeWindowVisible : Boolean;
		/**
		 *  @private
		 */
		private var maximized : Boolean;
		/**
		 *  @private
		 */
		private var _cursorManager : ICursorManager;
		/**
		 *  @private
		 */
		private var toMax : Boolean;
		/**
		 *  @private
		 */
		private var appViewMetrics : EdgeMetrics;
		/**
		 *  @private
		 */
		private var frameCounter : int;
		/**
		 *  @private
		 */
		private var gripper : Button;
		/**
		 *  @private
		 */
		private var gripperHit : Sprite;
		/**
		 *  @private
		 */
		private var flagForOpen : Boolean;
		/**
		 *   @private
		 */
		private var openActive : Boolean;
		/**
		 *  @private
		 */
		local var titleBarBackground : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var statusBarBackground : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var oldX : Number;
		/**
		 *  @private
		 */
		private var oldY : Number;
		/**
		 *  @private
		 */
		private var prevX : Number;
		/**
		 *  @private
		 */
		private var prevY : Number;
		/**
		 *  @private
		 */
		private var resizeHandlerAdded : Boolean;
		/**
		 *  @private
		 */
		private var resizeWidth : Boolean;
		/**
		 *  @private
		 */
		private var resizeHeight : Boolean;
		/**
		 *  @private
		 */
		private var _maxHeight : Number;
		/**
		 *  @private
		 */
		private var maxHeightChanged : Boolean;
		/**
		 *  @private
		 */
		private var _maxWidth : Number;
		/**
		 *  @private
		 */
		private var maxWidthChanged : Boolean;
		/**
		 *  @private
		 */
		private var _minHeight : Number;
		/**
		 *  @private
		 */
		private var minHeightChanged : Boolean;
		/**
		 *  @private
		 */
		private var _minWidth : Number;
		/**
		 *  @private
		 */
		private var minWidthChanged : Boolean;
		/**
		 *  @private
		 */
		private var _alwaysInFront : Boolean;
		/**
		 *  @private
		 */
		private var _bounds : Rectangle;
		/**
		 *  @private
		 */
		private var boundsChanged : Boolean;
		/**
		 *  The ApplicationControlBar for this Window.
		 */
		public var controlBar : IUIComponent;
		/**
		 *  @private
		 */
		private var _maximizable : Boolean;
		/**
		 *  @private
		 */
		private var _menu : FlexNativeMenu;
		/**
		 *  @private
		 */
		private var menuChanged : Boolean;
		/**
		 *  @private
		 */
		private var _minimizable : Boolean;
		/**
		 *  @private
		 */
		private var _resizable : Boolean;
		/**
		 *  @private
		 */
		private var _showGripper : Boolean;
		/**
		 *  @private
		 */
		private var showGripperChanged : Boolean;
		/**
		 *  Storage for the showStatusBar property.
		 */
		private var _showStatusBar : Boolean;
		/**
		 *  @private
		 */
		private var showStatusBarChanged : Boolean;
		/**
		 *  Storage for the showTitleBar property.
		 */
		private var _showTitleBar : Boolean;
		/**
		 *  @private
		 */
		private var showTitleBarChanged : Boolean;
		/**
		 *  @private
		 */
		private var _status : String;
		/**
		 *  @private
		 */
		private var statusChanged : Boolean;
		/**
		 *  @private
		 */
		private var _statusBar : UIComponent;
		/**
		 *  @private
		 */
		private var _statusBarFactory : IFactory;
		/**
		 *  @private
		 */
		private var statusBarFactoryChanged : Boolean;
		private static var _statusBarStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _systemChrome : String;
		/**
		 *  @private
		 */
		private var _title : String;
		/**
		 *  @private
		 */
		private var titleChanged : Boolean;
		/**
		 *  @private
		 */
		private var _titleBar : UIComponent;
		/**
		 *  @private
		 */
		private var _titleBarFactory : IFactory;
		/**
		 *  @private
		 */
		private var titleBarFactoryChanged : Boolean;
		private static var _titleBarStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _titleIcon : Class;
		/**
		 *  @private
		 */
		private var titleIconChanged : Boolean;
		/**
		 *  @private
		 */
		private var _transparent : Boolean;
		/**
		 *  @private
		 */
		private var _type : String;

		/**
		 *  @private
		 */
		public function get height () : Number;
		/**
		 *  @private
		 */
		public function set height (value:Number) : void;
		/**
		 *  @private
		 */
		public function get maxHeight () : Number;
		/**
		 *  Specifies the maximum height of the application's window.
		 */
		public function set maxHeight (value:Number) : void;
		/**
		 *  @private
		 */
		public function get maxWidth () : Number;
		/**
		 *  Specifies the maximum width of the application's window.
		 */
		public function set maxWidth (value:Number) : void;
		/**
		 *  Specifies the minimum height of the application's window.
		 */
		public function get minHeight () : Number;
		/**
		 *  @private
		 */
		public function set minHeight (value:Number) : void;
		/**
		 *  Specifies the minimum width of the application's window.
		 */
		public function get minWidth () : Number;
		/**
		 *  @private
		 */
		public function set minWidth (value:Number) : void;
		/**
		 *  Controls the window's visibility. Unlike the
		 */
		public function get visible () : Boolean;
		/**
		 *  @private
		 */
		public function set visible (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get width () : Number;
		/**
		 *  @private
		 */
		public function set width (value:Number) : void;
		/**
		 *  @private
		 */
		public function get viewMetrics () : EdgeMetrics;
		/**
		 *  Determines whether the underlying NativeWindow is always in front
		 */
		public function get alwaysInFront () : Boolean;
		/**
		 *  @private
		 */
		public function set alwaysInFront (value:Boolean) : void;
		/**
		 *  @private
		 */
		protected function get bounds () : Rectangle;
		/**
		 *  @private
		 */
		protected function set bounds (value:Rectangle) : void;
		/**
		 *  A flag indicating whether the window has been closed.
		 */
		public function get closed () : Boolean;
		/**
		 *  Specifies whether the window can be maximized.
		 */
		public function get maximizable () : Boolean;
		/**
		 *  @private
		 */
		public function set maximizable (value:Boolean) : void;
		/**
		 *  Returns the cursor manager for this Window.
		 */
		public function get cursorManager () : ICursorManager;
		/**
		 *  @private
		 */
		public function get menu () : FlexNativeMenu;
		/**
		 *  The window menu for this window.
		 */
		public function set menu (value:FlexNativeMenu) : void;
		/**
		 *  Specifies whether the window can be minimized.
		 */
		public function get minimizable () : Boolean;
		/**
		 *  @private
		 */
		public function set minimizable (value:Boolean) : void;
		/**
		 *  The underlying NativeWindow that this Window component uses.
		 */
		public function get nativeWindow () : NativeWindow;
		/**
		 *  Specifies whether the window can be resized.
		 */
		public function get resizable () : Boolean;
		/**
		 *  @private
		 */
		public function set resizable (value:Boolean) : void;
		/**
		 *  If <code>true</code>, the gripper is visible.
		 */
		public function get showGripper () : Boolean;
		/**
		 *  @private
		 */
		public function set showGripper (value:Boolean) : void;
		/**
		 *  If <code>true</code>, the status bar is visible.
		 */
		public function get showStatusBar () : Boolean;
		/**
		 *  @private
		 */
		public function set showStatusBar (value:Boolean) : void;
		/**
		 *  If <code>true</code>, the window's title bar is visible.
		 */
		public function get showTitleBar () : Boolean;
		/**
		 *  @private
		 */
		public function set showTitleBar (value:Boolean) : void;
		/**
		 *  The string that appears in the status bar, if it is visible.
		 */
		public function get status () : String;
		/**
		 *  @private
		 */
		public function set status (value:String) : void;
		/**
		 *  The UIComponent that displays the status bar.
		 */
		public function get statusBar () : UIComponent;
		/**
		 *  The IFactory that creates an instance to use
		 */
		public function get statusBarFactory () : IFactory;
		/**
		 *  @private
		 */
		public function set statusBarFactory (value:IFactory) : void;
		/**
		 *  Set of styles to pass from the window to the status bar.
		 */
		protected function get statusBarStyleFilters () : Object;
		/**
		 *  Specifies the type of system chrome (if any) the window has.
		 */
		public function get systemChrome () : String;
		/**
		 *  @private
		 */
		public function set systemChrome (value:String) : void;
		/**
		 *  The title text that appears in the window title bar and
		 */
		public function get title () : String;
		/**
		 *  @private
		 */
		public function set title (value:String) : void;
		/**
		 *  The UIComponent that displays the title bar.
		 */
		public function get titleBar () : UIComponent;
		/**
		 *  The IFactory that creates an instance to use
		 */
		public function get titleBarFactory () : IFactory;
		/**
		 *  @private
		 */
		public function set titleBarFactory (value:IFactory) : void;
		/**
		 *  Set of styles to pass from the Window to the titleBar.
		 */
		protected function get titleBarStyleFilters () : Object;
		/**
		 *  The Class (usually an image) used to draw the title bar icon.
		 */
		public function get titleIcon () : Class;
		/**
		 *  @private
		 */
		public function set titleIcon (value:Class) : void;
		/**
		 *  Specifies whether the window is transparent. Setting this
		 */
		public function get transparent () : Boolean;
		/**
		 *  @private
		 */
		public function set transparent (value:Boolean) : void;
		/**
		 *  Specifies the type of NativeWindow that this component
		 */
		public function get type () : String;
		/**
		 *  @private
		 */
		public function set type (value:String) : void;

		/**
		 *  Returns the Window to which a component is parented.
		 */
		public static function getWindow (component:UIComponent) : Window;
		/**
		 *  Constructor.
		 */
		public function Window ();
		/**
		 *  @private
		 */
		public function initialize () : void;
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
		public function validateDisplayList () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		public function move (x:Number, y:Number) : void;
		/**
		 *  @private
		 */
		function initThemeColor () : Boolean;
		/**
		 *  Closes the window. This action is cancelable.
		 */
		public function close () : void;
		/**
		 *  @private
		 */
		private function getHeaderHeight () : Number;
		/**
		 *  @private
		 */
		public function getStatusBarHeight () : Number;
		/**
		 *  @private
		 */
		private function initManagers (sm:ISystemManager) : void;
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
		/**
		 *  Activates the underlying NativeWindow (even if this Window's application
		 */
		public function activate () : void;
		/**
		 *  Creates the underlying NativeWindow and opens it.
		 */
		public function open (openWindowActive:Boolean = true) : void;
		/**
		 *  Orders the window just behind another. To order the window behind
		 */
		public function orderInBackOf (window:IWindow) : Boolean;
		/**
		 *  Orders the window just in front of another. To order the window
		 */
		public function orderInFrontOf (window:IWindow) : Boolean;
		/**
		 *  Orders the window behind all others in the same application.
		 */
		public function orderToBack () : Boolean;
		/**
		 *  Orders the window in front of all others in the same application.
		 */
		public function orderToFront () : Boolean;
		/**
		 *  @private
		 */
		private function chromeWidth () : Number;
		/**
		 *  @private
		 */
		private function chromeHeight () : Number;
		/**
		 *  @private
		 */
		private function startMove (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function startResize (start:String) : void;
		/**
		 *  @private
		 */
		private function enterFrameHandler (e:Event) : void;
		/**
		 *  @private
		 */
		private function hideEffectEndHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function windowMinimizeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function windowUnminimizeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function window_moveHandler (event:NativeWindowBoundsEvent) : void;
		/**
		 *  @private
		 */
		private function window_displayStateChangeHandler (event:NativeWindowDisplayStateEvent) : void;
		/**
		 *  @private
		 */
		private function window_displayStateChangingHandler (event:NativeWindowDisplayStateEvent) : void;
		/**
		 *  @private
		 */
		private function windowMaximizeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function windowUnmaximizeHandler (event:Event) : void;
		/**
		 *  Manages mouse down events on the window border.
		 */
		protected function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function closeButton_clickHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function resizeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function creationCompleteHandler (event:Event = null) : void;
		/**
		 *  @private
		 */
		private function preinitializeHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function mouseUpHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function window_boundsHandler (event:NativeWindowBoundsEvent) : void;
		/**
		 *  @private
		 */
		private function window_closeEffectEndHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function window_closingHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function window_closeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function window_resizeHandler (event:NativeWindowBoundsEvent) : void;
		/**
		 *  @private
		 */
		private function nativeApplication_activateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function nativeApplication_deactivateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function nativeWindow_activateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function nativeWindow_deactivateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function nativeApplication_networkChangeHandler (event:Event) : void;
	}
}