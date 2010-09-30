﻿package mx.controls.sliderClasses
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import mx.core.FlexVersion;
	import mx.core.IFlexDisplayObject;
	import mx.core.mx_internal;
	import mx.core.UIComponent;
	import mx.effects.Tween;
	import mx.events.FlexEvent;
	import mx.events.SliderEvent;
	import mx.events.SliderEventClickTarget;
	import mx.formatters.NumberFormatter;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.StyleProxy;

	/**
	 *  Dispatched when the slider changes value due to mouse or keyboard interaction.
	 */
	[Event(name="change", type="mx.events.SliderEvent")] 
	/**
	 *  Dispatched when the slider's thumb is pressed and then moved by the mouse.
	 */
	[Event(name="thumbDrag", type="mx.events.SliderEvent")] 
	/**
	 *  Dispatched when the slider's thumb is pressed, meaning
	 */
	[Event(name="thumbPress", type="mx.events.SliderEvent")] 
	/**
	 *  Dispatched when the slider's thumb is released, 
	 */
	[Event(name="thumbRelease", type="mx.events.SliderEvent")] 
	/**
	 *  The color of the black section of the border. 
	 */
	[Style(name="borderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Invert the direction of the thumbs. 
	 */
	[Style(name="invertThumbDirection", type="Boolean", inherit="no")] 
	/**
	 *  The y-position offset (if direction is horizontal)
	 */
	[Style(name="labelOffset", type="Number", format="Length", inherit="no")] 
	/**
	 *  The name of the style to use for the slider label.  
	 */
	[Style(name="labelStyleName", type="String", inherit="no")] 
	/**
	 *  Duration in milliseconds for the sliding animation
	 */
	[Style(name="slideDuration", type="Number", format="Time", inherit="no")] 
	/**
	 *  Tweening function used by the sliding animation
	 */
	[Style(name="slideEasingFunction", type="Function", inherit="no")] 
	/**
	 *  The y-position offset (if direction is horizontal)
	 */
	[Style(name="thumbOffset", type="Number", format="Length", inherit="no")] 
	/**
	 *  The color of the tick marks.
	 */
	[Style(name="tickColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  The length in pixels of the tick marks.
	 */
	[Style(name="tickLength", type="Number", format="Length", inherit="no")] 
	/**
	 *  The y-position offset (if direction is horizontal)
	 */
	[Style(name="tickOffset", type="Number", format="Length", inherit="no")] 
	/**
	 *  The thickness in pixels of the tick marks.
	 */
	[Style(name="tickThickness", type="Number", format="Length", inherit="no")] 
	/**
	 *  The colors of the track, as an array of two colors.
	 */
	[Style(name="trackColors", type="Array", arrayType="uint", format="Color", inherit="no")] 
	/**
	 *  Specifies whether to enable track highlighting between thumbs
	 */
	[Style(name="showTrackHighlight", type="Boolean", inherit="no")] 
	/**
	 *  The size of the track margins, in pixels.
	 */
	[Style(name="trackMargin", type="Number", format="Length", inherit="no")] 
	/**
	 *  The name of the style declaration to use for the data tip.
	 */
	[Style(name="dataTipStyleName", type="String", inherit="no")] 
	/**
	 *  The offset, in pixels, of the data tip relative to the thumb.
	 */
	[Style(name="dataTipOffset", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of decimal places to use for the data tip text.
	 */
	[Style(name="dataTipPrecision", type="int", inherit="no")] 
	/**
	 *  The default skin for the slider thumb.
	 */
	[Style(name="thumbSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  The skin for the slider thumb up state.
	 */
	[Style(name="thumbUpSkin", type="Class", inherit="no")] 
	/**
	 *  The skin for the slider thumb over state.
	 */
	[Style(name="thumbOverSkin", type="Class", inherit="no")] 
	/**
	 *  The skin for the slider thumb down state.
	 */
	[Style(name="thumbDownSkin", type="Class", inherit="no")] 
	/**
	 *  The skin for the slider thumb disabled state.
	 */
	[Style(name="thumbDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  The skin for the slider track when it is selected.
	 */
	[Style(name="trackHighlightSkin", type="Class", inherit="no")] 
	/**
	 *  The skin for the slider track.
	 */
	[Style(name="trackSkin", type="Class", inherit="no")] 

	/**
	 *  The Slider class is the base class for the Flex slider controls.
	 */
	public class Slider extends UIComponent
	{
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;
		/**
		 *  @private
		 */
		private var track : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var thumbs : UIComponent;
		/**
		 *  @private
		 */
		private var thumbsChanged : Boolean;
		/**
		 *  @private
		 */
		private var ticks : UIComponent;
		/**
		 *  @private
		 */
		private var ticksChanged : Boolean;
		/**
		 *  @private
		 */
		private var labelObjects : UIComponent;
		/**
		 *  @private
		 */
		private var highlightTrack : IFlexDisplayObject;
		/**
		 *  @private
		 */
		local var innerSlider : UIComponent;
		/**
		 *  @private
		 */
		private var trackHitArea : UIComponent;
		/**
		 *  @private
		 */
		local var dataTip : SliderDataTip;
		/**
		 *  @private
		 */
		private var trackHighlightChanged : Boolean;
		/**
		 *  @private
		 */
		private var initValues : Boolean;
		/**
		 *  @private
		 */
		private var dataFormatter : NumberFormatter;
		/**
		 *  @private
		 */
		private var interactionClickTarget : String;
		/**
		 *  @private
		 */
		private var labelStyleChanged : Boolean;
		/**
		 *  @private
		 */
		local var keyInteraction : Boolean;
		/**
		 *  @private
		 */
		private var _enabled : Boolean;
		/**
		 *  @private
		 */
		private var enabledChanged : Boolean;
		/**
		 *  @private
		 */
		private var _tabIndex : Number;
		/**
		 *  @private
		 */
		private var tabIndexChanged : Boolean;
		/**
		 *  If set to <code>false</code>, then each thumb can only be moved to the edge of
		 */
		public var allowThumbOverlap : Boolean;
		/**
		 *  Specifies whether clicking on the track will move the slider thumb.
		 */
		public var allowTrackClick : Boolean;
		/**
		 *  @private
		 */
		private var _dataTipFormatFunction : Function;
		/**
		 *  @private
		 */
		private var _direction : String;
		/**
		 *  @private
		 */
		private var directionChanged : Boolean;
		/**
		 *  @private
		 */
		private var _labels : Array;
		/**
		 *  @private
		 */
		private var labelsChanged : Boolean;
		/**
		 *  Specifies whether live dragging is enabled for the slider.
		 */
		public var liveDragging : Boolean;
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
		private var minimumSet : Boolean;
		/**
		 *  If set to <code>true</code>, show a data tip during user interaction
		 */
		public var showDataTip : Boolean;
		/**
		 *  @private
		 */
		private var _thumbClass : Class;
		/**
		 *  @private
		 */
		private var _sliderDataTipClass : Class;
		/**
		 *  @private
		 */
		private var _snapInterval : Number;
		/**
		 *  @private
		 */
		private var snapIntervalPrecision : int;
		/**
		 *  @private
		 */
		private var snapIntervalChanged : Boolean;
		/**
		 *  @private
		 */
		private var _thumbCount : int;
		/**
		 *  @private
		 */
		private var _tickInterval : Number;
		/**
		 *  @private
		 */
		private var _tickValues : Array;
		/**
		 *  @private
		 */
		private var _values : Array;
		/**
		 *  @private
		 */
		private var valuesChanged : Boolean;

		/**
		 *  @private
		 */
		public function get baselinePosition () : Number;
		/**
		 *  @private
		 */
		public function get enabled () : Boolean;
		/**
		 *  @private
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function set tabIndex (value:int) : void;
		/**
		 *  Callback function that formats the data tip text.
		 */
		public function get dataTipFormatFunction () : Function;
		/**
		 *  @private
		 */
		public function set dataTipFormatFunction (value:Function) : void;
		/**
		 *  The orientation of the slider control.
		 */
		public function get direction () : String;
		/**
		 *  @private
		 */
		public function set direction (value:String) : void;
		/**
		 *  An array of strings used for the slider labels.
		 */
		public function get labels () : Array;
		/**
		 *  @private
		 */
		public function set labels (value:Array) : void;
		/**
		 *  The maximum allowed value on the slider.
		 */
		public function get maximum () : Number;
		/**
		 *  @private
		 */
		public function set maximum (value:Number) : void;
		/**
		 *  The minimum allowed value on the slider control.
		 */
		public function get minimum () : Number;
		/**
		 *  @private
		 */
		public function set minimum (value:Number) : void;
		/**
		 *  A reference to the class to use for each thumb.
		 */
		public function get sliderThumbClass () : Class;
		/**
		 *  @private
		 */
		public function set sliderThumbClass (value:Class) : void;
		/**
		 *  A reference to the class to use for the data tip.
		 */
		public function get sliderDataTipClass () : Class;
		/**
		 *  @private
		 */
		public function set sliderDataTipClass (value:Class) : void;
		/**
		 *  Specifies the increment value of the slider thumb
		 */
		public function get snapInterval () : Number;
		/**
		 *  @private
		 */
		public function set snapInterval (value:Number) : void;
		/**
		 *  The number of thumbs allowed on the slider.
		 */
		public function get thumbCount () : int;
		/**
		 *  @private
		 */
		public function set thumbCount (value:int) : void;
		/**
		 *  Set of styles to pass from the Slider to the thumbs.
		 */
		protected function get thumbStyleFilters () : Object;
		/**
		 *  The spacing of the tick marks relative to the <code>maximum</code> value
		 */
		public function get tickInterval () : Number;
		/**
		 *  @private
		 */
		public function set tickInterval (value:Number) : void;
		/**
		 *  The positions of the tick marks on the slider. The positions correspond
		 */
		public function get tickValues () : Array;
		/**
		 *  @private
		 */
		public function set tickValues (value:Array) : void;
		/**
		 *  Contains the position of the thumb, and is a number between the
		 */
		public function get value () : Number;
		/**
		 *  @private
		 */
		public function set value (val:Number) : void;
		/**
		 *  An array of values for each thumb when <code>thumbCount</code>
		 */
		public function get values () : Array;
		/**
		 *  @private
		 */
		public function set values (value:Array) : void;

		/**
		 *  Constructor.
		 */
		public function Slider ();
		/**
		 *  @private
		 */
		protected function initializeAccessibility () : void;
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  Calculates the amount of space that the component takes up.
		 */
		protected function measure () : void;
		/**
		 *  Positions the elements of the control.
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		private function createBackgroundTrack () : void;
		/**
		 *  @private
		 */
		private function createHighlightTrack () : void;
		/**
		 *  @private
		 */
		private function createThumbs () : void;
		/**
		 *  @private
		 */
		private function createLabels () : void;
		/**
		 *  @private
		 */
		private function createTicks () : void;
		/**
		 *  @private
		 */
		private function getComponentBounds () : Object;
		/**
		 *  @private
		 */
		private function layoutTicks () : void;
		/**
		 *  @private
		 */
		private function layoutLabels () : void;
		/**
		 *  @private
		 */
		function drawTrackHighlight () : void;
		/**
		 *  @private
		 */
		function onThumbPress (thumb:Object) : void;
		/**
		 *  @private
		 */
		function onThumbRelease (thumb:Object) : void;
		/**
		 *  @private
		 */
		function onThumbMove (thumb:Object) : void;
		/**
		 *  @private
		 */
		private function positionDataTip (thumb:Object) : void;
		/**
		 *  @private
		 */
		private function destroyDataTip () : void;
		/**
		 *  @private
		 */
		function getXFromValue (v:Number) : Number;
		/**
		 *  @private
		 */
		function getXBounds (selectedThumbIndex:int) : Object;
		/**
		 *  @private
		 */
		private function setPosFromValue () : void;
		/**
		 *  @private
		 */
		function getValueFromX (xPos:Number) : Number;
		/**
		 *  @private
		 */
		private function setValueFromPos (thumbIndex:int) : void;
		/**
		 *  @private
		 */
		function getSnapValue (value:Number, thumb:SliderThumb = null) : Number;
		/**
		 *  @private Accessed by the Thumb to find out the snap interval
		 */
		function getSnapIntervalWidth () : Number;
		/**
		 *  @private
		 */
		function updateThumbValue (thumbIndex:int) : void;
		/**
		 *  Returns the thumb object at the given index. Use this method to
		 */
		public function getThumbAt (index:int) : SliderThumb;
		/**
		 *  This method sets the value of a slider thumb, and updates the display.
		 */
		public function setThumbValueAt (index:int, value:Number) : void;
		/**
		 *  @private
		 */
		private function setValueAt (value:Number, index:int, isProgrammatic:Boolean = false) : void;
		/**
		 *  @private
		 */
		function registerMouseMove (listener:Function) : void;
		/**
		 *  @private
		 */
		function unRegisterMouseMove (listener:Function) : void;
		/**
		 *  @private
		 */
		private function track_mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function thumb_focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function thumb_focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		function getTrackHitArea () : UIComponent;
	}
}