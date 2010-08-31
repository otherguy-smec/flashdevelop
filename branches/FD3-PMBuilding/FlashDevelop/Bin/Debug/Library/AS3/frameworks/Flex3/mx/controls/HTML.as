﻿package mx.controls
{
	import flash.events.Event;
	import flash.events.HTMLUncaughtScriptExceptionEvent;
	import flash.events.MouseEvent;
	import flash.html.HTMLLoader;
	import flash.html.HTMLHistoryItem;
	import flash.html.HTMLHost;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.ClassFactory;
	import mx.core.EdgeMetrics;
	import mx.core.IDataRenderer;
	import mx.core.IFactory;
	import mx.core.FlexHTMLLoader;
	import mx.core.mx_internal;
	import mx.core.ScrollControlBase;
	import mx.core.ScrollPolicy;
	import mx.events.FlexEvent;
	import mx.events.ScrollEvent;
	import mx.styles.StyleManager;
	import mx.styles.CSSStyleDeclaration;
	import mx.managers.IFocusManagerComponent;

	/**
	 *  Dispatched after the last loading operation caused by
	 */
	[Event(name="complete", type="flash.events.Event")] 
	/**
	 *  Dispatched after the HTML DOM has been initialized
	 */
	[Event(name="htmlDOMInitialize", type="flash.events.Event")] 
	/**
	 *  Dispatched when this control's HTML content initially renders,
	 */
	[Event(name="htmlRender", type="flash.events.Event")] 
	/**
	 *  Dispatched when the <code>location</code> property changes.
	 */
	[Event(name="locationChange", type="flash.events.Event")] 
	/**
	 *  Dispatched when an uncaught JavaScript exception occurs.
	 */
	[Event(name="uncaughtScriptException", type="flash.events.HTMLUncaughtScriptExceptionEvent")] 
	/**
	 *  The number of pixels between the bottom edge of this control
	 */
	[Style(name="paddingBottom", type="Number", format="Length", inherit="no")] 
	/**
	 *  The number of pixels between the left edge of this control
	 */
	[Style(name="paddingLeft", type="Number", format="Length", inherit="no")] 
	/**
	 *  The number of pixels between the right edge of this control
	 */
	[Style(name="paddingRight", type="Number", format="Length", inherit="no")] 
	/**
	 *  The number of pixels between the top edge of this control
	 */
	[Style(name="paddingTop", type="Number", format="Length", inherit="no")] 

	/**
	 *  The HTML control lets you display HTML content in your application.
	 */
	public class HTML extends ScrollControlBase implements IDataRenderer
	{
		/**
		 *  @private
		 */
		private static const MAX_HTML_WIDTH : Number = 2880;
		/**
		 *  @private
		 */
		private static const MAX_HTML_HEIGHT : Number = 2880;
		/**
		 *  @private
		 */
		private var textSet : Boolean;
		/**
		 *  @private
		 */
		private var _data : Object;
		/**
		 *  The internal HTMLLoader object that renders
		 */
		public var htmlLoader : HTMLLoader;
		/**
		 *  @private
		 */
		private var _htmlLoaderFactory : IFactory;
		/**
		 *  @private
		 */
		private var _htmlHost : HTMLHost;
		/**
		 *  @private
		 */
		private var htmlHostChanged : Boolean;
		/**
		 *  @private
		 */
		private var _htmlText : String;
		/**
		 *  @private
		 */
		private var htmlTextChanged : Boolean;
		/**
		 *  @private
		 */
		private var _listData : BaseListData;
		/**
		 *  @private
		 */
		private var _location : String;
		/**
		 *  @private
		 */
		private var locationChanged : Boolean;
		/**
		 *  @private
		 */
		private var _paintsDefaultBackground : Boolean;
		/**
		 *  @private
		 */
		private var paintsDefaultBackgroundChanged : Boolean;
		/**
		 *  @private
		 */
		private var _runtimeApplicationDomain : ApplicationDomain;
		/**
		 *  @private
		 */
		private var runtimeApplicationDomainChanged : Boolean;
		/**
		 *  @private
		 */
		private var _userAgent : String;
		/**
		 *  @private
		 */
		private var userAgentChanged : Boolean;

		/**
		 *  The type of PDF support on the user's system,
		 */
		public static function get pdfCapability () : int;
		/**
		 *  @private
		 */
		public function set verticalScrollPosition (value:Number) : void;
		/**
		 *  The height, in pixels, of the HTML content.
		 */
		public function get contentHeight () : Number;
		/**
		 *  The width, in pixels, of the HTML content.
		 */
		public function get contentWidth () : Number;
		/**
		 *  Lets you pass a value to the component
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;
		/**
		 *  The overall length of the history list,
		 */
		public function get historyLength () : int;
		/**
		 *  The current position in the history list.
		 */
		public function get historyPosition () : int;
		/**
		 *  @private
		 */
		public function set historyPosition (value:int) : void;
		/**
		 *  The IFactory that creates an HTMLLoader-derived instance
		 */
		public function get htmlLoaderFactory () : IFactory;
		/**
		 *  @private
		 */
		public function set htmlLoaderFactory (value:IFactory) : void;
		/**
		 *  The HTMLHost object is used to handle changes
		 */
		public function get htmlHost () : HTMLHost;
		/**
		 *  @private
		 */
		public function set htmlHost (value:HTMLHost) : void;
		/**
		 *  Specifies an HTML-formatted String for display by the control.
		 */
		public function get htmlText () : String;
		/**
		 *  @private
		 */
		public function set htmlText (value:String) : void;
		/**
		 *  The JavaScript <code>window</code> object
		 */
		public function get domWindow () : Object;
		/**
		 *  When a component is used as a drop-in item renderer or drop-in
		 */
		public function get listData () : BaseListData;
		/**
		 *  @private
		 */
		public function set listData (value:BaseListData) : void;
		/**
		 *  A flag which indicates whether the JavaScript <code>load</code> event
		 */
		public function get loaded () : Boolean;
		/**
		 *  The URL of an HTML page to be displayed by this control.
		 */
		public function get location () : String;
		/**
		 *  @private
		 */
		public function set location (value:String) : void;
		/**
		 *  Whether this control's HTML content
		 */
		public function get paintsDefaultBackground () : Boolean;
		/**
		 *  @private
		 */
		public function set paintsDefaultBackground (value:Boolean) : void;
		/**
		 *  The ApplicationDomain to use for HTML's <code>window.runtime</code>
		 */
		public function get runtimeApplicationDomain () : ApplicationDomain;
		/**
		 *  @private
		 */
		public function set runtimeApplicationDomain (value:ApplicationDomain) : void;
		/**
		 *  The user agent string to be used in content requests
		 */
		public function get userAgent () : String;
		/**
		 *  @private
		 */
		public function set userAgent (value:String) : void;

		/**
		 *  Constructor.
		 */
		public function HTML ();
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
		 *  Cancels any load operation in progress.
		 */
		public function cancelLoad () : void;
		/**
		 *  Returns the HTMLHistoryItem at the specified position
		 */
		public function getHistoryAt (position:int) : HTMLHistoryItem;
		/**
		 *  Navigates back in this control's history list, if possible.
		 */
		public function historyBack () : void;
		/**
		 *  Navigates forward in this control's history list, if possible.
		 */
		public function historyForward () : void;
		/**
		 *  Navigates the specified number of steps in this control's history list.
		 */
		public function historyGo (steps:int) : void;
		/**
		 *  Reloads the HTML content from the current <code>location</code>.
		 */
		public function reload () : void;
		/**
		 *  @private
		 */
		private function adjustScrollBars () : void;
		/**
		 *  @private
		 */
		protected function scrollHandler (event:Event) : void;
		/**
		 *  @private
		 */
		protected function mouseWheelHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_domInitialize (event:Event) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_completeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_htmlRenderHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_locationChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_htmlBoundsChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_scrollHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function htmlLoader_uncaughtScriptExceptionHandler (event:HTMLUncaughtScriptExceptionEvent) : void;
	}
}