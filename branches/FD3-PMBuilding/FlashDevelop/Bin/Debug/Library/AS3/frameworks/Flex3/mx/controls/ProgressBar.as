﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.ProgressEvent;
	import flash.events.TimerEvent;
	import flash.text.TextLineMetrics;
	import flash.utils.Timer;
	import mx.core.FlexVersion;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.mx_internal;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.events.FlexEvent;
	import mx.styles.ISimpleStyleClient;

	/**
	 *  Dispatched when the load completes.
	 */
	[Event(name="complete", type="flash.events.Event")] 
	/**
	 *  Dispatched when an object's state changes from visible to invisible.
	 */
	[Event(name="hide", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched as content loads in event
	 */
	[Event(name="progress", type="flash.events.ProgressEvent")] 
	/**
	 *  Dispatched when the component becomes visible.
	 */
	[Event(name="show", type="mx.events.FlexEvent")] 
	/**
	 *  Skin style for a determinate progress bar.
	 */
	[Style(name="barSkin", type="Class", inherit="no")] 
	/**
	 *  Black section of a three-dimensional border, or the color section
	 */
	[Style(name="borderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  The number of pixels to move the indeterminate progress bar for each indeterminate loop.
	 */
	[Style(name="indeterminateMoveInterval", type="Number", inherit="no")] 
	/**
	 *  Skin style for an indeterminate progress bar.
	 */
	[Style(name="indeterminateSkin", type="Class", inherit="no")] 
	/**
	 *  Skin style for the mask of the determinate and indeterminate bars.
	 */
	[Style(name="maskSkin", type="Class", inherit="no")] 
	/**
	 *  Skin style for the progress indicator track.
	 */
	[Style(name="trackSkin", type="Class", inherit="no")] 
	/**
	 *  Theme color of the ProgressBar control.
	 */
	[Style(name="themeColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  The colors of the track, as an array of two colors.
	 */
	[Style(name="trackColors", type="Array", arrayType="uint", format="Color", inherit="no")] 
	/**
	 *  The height of the track in pixels. If the value is NaN, then
	 */
	[Style(name="trackHeight", type="Number", format="Length", inherit="no")] 
	/**
	 *  The width of the label in pixels. If the value is NaN,
	 */
	[Style(name="labelWidth", type="Number", format="Length", inherit="yes")] 

	/**
	 *  The ProgressBar control provides a visual representation of the progress of a task over
	 */
	public class ProgressBar extends UIComponent implements IFontContextComponent
	{
		/**
		 *  @private
		 */
		local var _content : UIComponent;
		/**
		 *  @private
		 */
		local var _bar : UIComponent;
		/**
		 *  @private
		 */
		local var _indeterminateBar : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var _determinateBar : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var _track : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var _barMask : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var _labelField : IUITextField;
		/**
		 *  @private
		 */
		private var pollTimer : Timer;
		/**
		 *  @private
		 */
		private var _interval : Number;
		/**
		 *  @private
		 */
		private var indeterminatePlaying : Boolean;
		/**
		 *  @private
		 */
		private var stopPolledMode : Boolean;
		/**
		 *  @private
		 */
		private var barSkinChanged : Boolean;
		/**
		 *  @private
		 */
		private var trackSkinChanged : Boolean;
		/**
		 *  @private
		 */
		private var indeterminateSkinChanged : Boolean;
		/**
		 *  @private
		 */
		private var visibleChanged : Boolean;
		/**
		 *  @private
		 */
		private var _conversion : Number;
		/**
		 *  @private
		 */
		private var _direction : String;
		/**
		 *  @private
		 */
		private var _indeterminate : Boolean;
		/**
		 *  @private
		 */
		private var indeterminateChanged : Boolean;
		/**
		 *  @private
		 */
		private var _label : String;
		/**
		 *  @private
		 */
		private var labelOverride : String;
		/**
		 *  @private
		 */
		private var _labelPlacement : String;
		/**
		 *  @private
		 */
		private var _maximum : Number;
		/**
		 *  @private
		 */
		private var _minimum : Number;
		/**
		 *  @private
		 */
		private var _mode : String;
		/**
		 *  @private
		 */
		private var modeChanged : Boolean;
		/**
		 *  @private
		 */
		private var _source : Object;
		/**
		 *  @private
		 */
		private var _stringSource : String;
		/**
		 *  @private
		 */
		private var sourceChanged : Boolean;
		/**
		 *  @private
		 */
		private var stringSourceChanged : Boolean;
		/**
		 *  @private
		 */
		private var _value : Number;

		/**
		 *  Number used to convert incoming current bytes loaded value and
		 */
		public function get conversion () : Number;
		/**
		 *  @private
		 */
		public function set conversion (value:Number) : void;
		/**
		 *  Direction in which the fill of the ProgressBar expands toward completion. 
		 */
		public function get direction () : String;
		/**
		 *  @private
		 */
		public function set direction (value:String) : void;
		/**
		 *  @private
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  Whether the ProgressBar control has a determinate or
		 */
		public function get indeterminate () : Boolean;
		/**
		 *  @private
		 */
		public function set indeterminate (value:Boolean) : void;
		/**
		 *  Text that accompanies the progress bar. You can include
		 */
		public function get label () : String;
		/**
		 *  @private
		 */
		public function set label (value:String) : void;
		/**
		 *  Placement of the label.
		 */
		public function get labelPlacement () : String;
		/**
		 *  @private
		 */
		public function set labelPlacement (value:String) : void;
		/**
		 *  Largest progress value for the ProgressBar. You
		 */
		public function get maximum () : Number;
		/**
		 *  @private
		 */
		public function set maximum (value:Number) : void;
		/**
		 *  Smallest progress value for the ProgressBar. This
		 */
		public function get minimum () : Number;
		/**
		 *  @private
		 */
		public function set minimum (value:Number) : void;
		/**
		 *  Specifies the method used to update the bar. 
		 */
		public function get mode () : String;
		/**
		 *  @private
		 */
		public function set mode (value:String) : void;
		/**
		 *  Percentage of process that is completed.The range is 0 to 100.
		 */
		public function get percentComplete () : Number;
		/**
		 *  Refers to the control that the ProgressBar is measuring the progress of. Use this property only in
		 */
		public function get source () : Object;
		/**
		 *  @private
		 */
		public function set source (value:Object) : void;
		/**
		 *  Read-only property that contains the amount of progress
		 */
		public function get value () : Number;
		/**
		 *  @private
		 */
		public function set visible (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function ProgressBar ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function childrenCreated () : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
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
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  Sets the state of the bar to reflect the amount of progress made
		 */
		public function setProgress (value:Number, total:Number) : void;
		/**
		 *  @private
		 */
		private function _setProgress (value:Number, maximum:Number) : void;
		/**
		 *  @private
		 */
		private function createTrack () : void;
		/**
		 *  @private
		 */
		private function createBar () : void;
		/**
		 *  @private
		 */
		private function createIndeterminateBar () : void;
		/**
		 *  @private
		 */
		private function layoutContent (newWidth:Number, newHeight:Number) : void;
		/**
		 *  @private
		 */
		private function getFullLabelText () : String;
		/**
		 *  @private
		 */
		private function predictLabelText () : String;
		/**
		 *  @private
		 */
		private function startPlayingIndeterminate () : void;
		/**
		 *  @private
		 */
		private function stopPlayingIndeterminate () : void;
		/**
		 *  @private
		 */
		private function addSourceListeners () : void;
		/**
		 *  @private
		 */
		private function removeSourceListeners () : void;
		/**
		 *  @private
		 */
		private function progressHandler (event:ProgressEvent) : void;
		/**
		 *  @private
		 */
		private function completeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function updateIndeterminateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function updatePolledHandler (event:Event) : void;
	}
}