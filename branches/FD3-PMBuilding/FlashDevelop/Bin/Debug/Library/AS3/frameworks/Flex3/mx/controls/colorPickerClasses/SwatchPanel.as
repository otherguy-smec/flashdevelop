﻿package mx.controls.colorPickerClasses
{
	import flash.events.Event;
	import flash.events.EventPhase;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.controls.ColorPicker;
	import mx.controls.TextInput;
	import mx.core.FlexVersion;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.ColorPickerEvent;
	import mx.managers.IFocusManagerContainer;
	import mx.skins.halo.SwatchPanelSkin;
	import mx.skins.halo.SwatchSkin;
	import mx.styles.StyleManager;

	/**
	 *  Dispatched when the selected color changes.
	 */
	[Event(name="change", type="flash.events.Event")] 
	/**
	 *  Dispatched when the user presses the Enter key.
	 */
	[Event(name="enter", type="flash.events.Event")] 
	/**
	 *  Dispatched when the mouse rolls over a color.
	 */
	[Event(name="itemRollOver", type="mx.events.ColorPickerEvent")] 
	/**
	 *  Dispatched when the mouse rolls out of a color.
	 */
	[Event(name="itemRollOut", type="mx.events.ColorPickerEvent")] 
	/**
	 *  Background color of the component.
	 */
	[Style(name="backgroundColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Black section of a three-dimensional border, or the color section
	 */
	[Style(name="borderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Number of columns in the swatch grid.
	 */
	[Style(name="columnCount", type="int", inherit="no")] 
	/**
	 *  Color of the control border highlight.
	 */
	[Style(name="highlightColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Color for the left and right inside edges of a component's skin.
	 */
	[Style(name="shadowCapColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Bottom inside color of a button's skin.
	 */
	[Style(name="shadowColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Height of the larger preview swatch that appears above the swatch grid on
	 */
	[Style(name="previewHeight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Width of the larger preview swatch.
	 */
	[Style(name="previewWidth", type="Number", format="Length", inherit="no")] 
	/**
	 *  Size of the swatchBorder outlines.
	 */
	[Style(name="swatchBorderSize", type="Number", format="Length", inherit="no")] 
	/**
	 *  Color of the swatch borders.
	 */
	[Style(name="swatchBorderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Size of the single border around the grid of swatches.
	 */
	[Style(name="swatchGridBorderSize", type="Number", format="Length", inherit="no")] 
	/**
	 *  Color of the background rectangle behind the swatch grid.
	 */
	[Style(name="swatchGridBackgroundColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Height of each swatch.
	 */
	[Style(name="swatchHeight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Color of the highlight that appears around the swatch when the user
	 */
	[Style(name="swatchHighlightColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Size of the highlight that appears around the swatch when the user
	 */
	[Style(name="swatchHighlightSize", type="Number", format="Length", inherit="no")] 
	/**
	 *  Width of each swatch.
	 */
	[Style(name="swatchWidth", type="Number", format="Length", inherit="no")] 
	/**
	 *  @REVIEW 
	 */
	[Style(name="textFieldStyleName", type="String", inherit="no")] 
	/**
	 *  Width of the hexadecimal text box that appears above the swatch grid.
	 */
	[Style(name="textFieldWidth", type="Number", format="Length", inherit="no")] 

	/**
	 *  @private
	 */
	public class SwatchPanel extends UIComponent implements IFocusManagerContainer
	{
		/**
		 *  @private
		 */
		local var textInput : TextInput;
		/**
		 *  @private
		 */
		private var border : SwatchPanelSkin;
		/**
		 *  @private
		 */
		private var preview : SwatchSkin;
		/**
		 *  @private
		 */
		private var swatches : SwatchSkin;
		/**
		 *  @private
		 */
		private var highlight : SwatchSkin;
		/**
		 *  @private
		 */
		local var isOverGrid : Boolean;
		/**
		 *  @private
		 */
		local var isOpening : Boolean;
		/**
		 *  @private
		 */
		local var focusedIndex : int;
		/**
		 *  @private
		 */
		local var tweenUp : Boolean;
		/**
		 *  @private
		 */
		private var initializing : Boolean;
		/**
		 *  @private
		 */
		private var indexFlag : Boolean;
		/**
		 *  @private
		 */
		private var lastIndex : int;
		/**
		 *  @private
		 */
		private var grid : Rectangle;
		/**
		 *  @private
		 */
		private var rows : int;
		/**
		 *  @private
		 */
		private var horizontalGap : Number;
		/**
		 *  @private
		 */
		private var verticalGap : Number;
		/**
		 *  @private
		 */
		private var columnCount : int;
		/**
		 *  @private
		 */
		private var paddingLeft : Number;
		/**
		 *  @private
		 */
		private var paddingRight : Number;
		/**
		 *  @private
		 */
		private var paddingTop : Number;
		/**
		 *  @private
		 */
		private var paddingBottom : Number;
		/**
		 *  @private
		 */
		private var textFieldWidth : Number;
		/**
		 *  @private
		 */
		private var previewWidth : Number;
		/**
		 *  @private
		 */
		private var previewHeight : Number;
		/**
		 *  @private
		 */
		private var swatchWidth : Number;
		/**
		 *  @private
		 */
		private var swatchHeight : Number;
		/**
		 *  @private
		 */
		private var swatchGridBorderSize : Number;
		/**
		 *  @private
		 */
		private var cellOffset : Number;
		/**
		 *  @private
		 */
		private var itemOffset : Number;
		/**
		 *  Storage for the colorField property.
		 */
		private var _colorField : String;
		/**
		 *  Storage for the dataProvider property.
		 */
		private var _dataProvider : IList;
		/**
		 *  Storage for the editable property.
		 */
		private var _editable : Boolean;
		/**
		 *  Storage for the labelField property.
		 */
		private var _labelField : String;
		/**
		 *  Storage for the selectedColor property.
		 */
		private var _selectedColor : uint;
		/**
		 *  Storage for the selectedIndex property.
		 */
		private var _selectedIndex : int;
		/**
		 *  Storage for the showTextField property.
		 */
		private var _showTextField : Boolean;

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
		public function get width () : Number;
		/**
		 *  @private
		 */
		public function set width (value:Number) : void;
		/**
		 *  @private
		 */
		public function get colorField () : String;
		/**
		 *  @private
		 */
		public function set colorField (value:String) : void;
		/**
		 *  @private
		 */
		public function get dataProvider () : Object;
		/**
		 *  @private
		 */
		public function set dataProvider (value:Object) : void;
		/**
		 *  @private
		 */
		public function get editable () : Boolean;
		/**
		 *  @private
		 */
		public function set editable (value:Boolean) : void;
		/**
		 *  @private
		 */
		public function get labelField () : String;
		/**
		 *  @private
		 */
		public function set labelField (value:String) : void;
		/**
		 *  @private
		 */
		public function get length () : int;
		/**
		 *  @private
		 */
		public function get selectedColor () : uint;
		/**
		 *  @private
		 */
		public function set selectedColor (value:uint) : void;
		/**
		 *  @private
		 */
		public function get selectedIndex () : int;
		/**
		 *  @private
		 */
		public function set selectedIndex (value:int) : void;
		/**
		 *  @private
		 */
		public function get selectedItem () : Object;
		/**
		 *  @private
		 */
		public function set selectedItem (value:Object) : void;
		/**
		 *  @private
		 */
		public function get showTextField () : Boolean;
		/**
		 *  @private
		 */
		public function set showTextField (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function SwatchPanel ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
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
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		public function drawFocus (isFocused:Boolean) : void;
		/**
		 *  @private
		 */
		public function setFocus () : void;
		/**
		 *  @private
		 */
		private function updateStyleCache () : void;
		/**
		 *  @private
		 */
		private function refresh () : void;
		/**
		 *  @private
		 */
		private function updateColor (color:uint) : void;
		/**
		 *  @private
		 */
		private function rgbToHex (color:uint) : String;
		/**
		 *  @private
		 */
		private function findColorByName (name:Number) : int;
		/**
		 *  @private
		 */
		private function getColor (index:int) : uint;
		/**
		 *  @private
		 */
		private function setFocusOnSwatch (index:int) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function swatches_clickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function textInput_keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function textInput_changeHandler (event:Event) : void;
	}
}