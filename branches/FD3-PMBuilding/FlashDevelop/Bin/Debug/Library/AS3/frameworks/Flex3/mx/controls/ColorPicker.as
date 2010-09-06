﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import mx.controls.colorPickerClasses.SwatchPanel;
	import mx.controls.colorPickerClasses.WebSafePalette;
	import mx.core.FlexVersion;
	import mx.core.UIComponent;
	import mx.core.UIComponentGlobals;
	import mx.core.mx_internal;
	import mx.effects.Tween;
	import mx.events.ColorPickerEvent;
	import mx.events.DropdownEvent;
	import mx.events.FlexEvent;
	import mx.events.FlexMouseEvent;
	import mx.events.InterManagerRequest;
	import mx.events.SandboxMouseEvent;
	import mx.managers.IFocusManager;
	import mx.managers.ISystemManager;
	import mx.managers.PopUpManager;
	import mx.managers.SystemManager;
	import mx.skins.halo.SwatchSkin;
	import mx.styles.StyleProxy;

	/**
	 *  Dispatched when the selected color 
	 */
	[Event(name="change", type="mx.events.ColorPickerEvent")] 
	/**
	 *  Dispatched when the swatch panel closes.
	 */
	[Event(name="close", type="mx.events.DropdownEvent")] 
	/**
	 *  Dispatched if the ColorPicker <code>editable</code>
	 */
	[Event(name="enter", type="mx.events.ColorPickerEvent")] 
	/**
	 *  Dispatched when the user rolls the mouse out of a swatch
	 */
	[Event(name="itemRollOut", type="mx.events.ColorPickerEvent")] 
	/**
	 *  Dispatched when the user rolls the mouse over a swatch
	 */
	[Event(name="itemRollOver", type="mx.events.ColorPickerEvent")] 
	/**
	 *  Dispatched when the color swatch panel opens.
	 */
	[Event(name="open", type="mx.events.DropdownEvent")] 
	/**
	 *  Color of the SwatchPanel object's background.
	 */
	[Style(name="backgroundColor", type="uint", format="Color", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Color of the outer border on the SwatchPanel object.
	 */
	[Style(name="borderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Length of a close transition, in milliseconds.
	 */
	[Style(name="closeDuration", type="Number", format="Time", inherit="no")] 
	/**
	 *  Easing function to control component tweening.
	 */
	[Style(name="closeEasingFunction", type="Function", inherit="no")] 
	/**
	 *  Number of columns in the swatch grid.
	 */
	[Style(name="columnCount", type="int", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Alphas used for the background fill of controls.
	 */
	[Style(name="fillAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Colors used to tint the background of the control.
	 */
	[Style(name="fillColors", type="Array", arrayType="uint", format="Color", inherit="no")] 
	/**
	 *  Alphas used for the highlight fill of controls.
	 */
	[Style(name="highlightAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Horizontal gap between swatches in the swatch grid.
	 */
	[Style(name="horizontalGap", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Length of an open transition, in milliseconds.
	 */
	[Style(name="openDuration", type="Number", format="Time", inherit="no")] 
	/**
	 *  Easing function to control component tweening.
	 */
	[Style(name="openEasingFunction", type="Function", inherit="no")] 
	/**
	 *  Bottom padding of SwatchPanel object below the swatch grid.
	 */
	[Style(name="paddingBottom", type="Number", format="Length", inherit="no")] 
	/**
	 *  Left padding of SwatchPanel object to the side of the swatch grid.
	 */
	[Style(name="paddingLeft", type="Number", format="Length", inherit="no")] 
	/**
	 *  Right padding of SwatchPanel object to the side of the swatch grid.
	 */
	[Style(name="paddingRight", type="Number", format="Length", inherit="no")] 
	/**
	 *  Top padding of SwatchPanel object above the swatch grid.
	 */
	[Style(name="paddingTop", type="Number", format="Length", inherit="no")] 
	/**
	 *  Height of the larger preview swatch that appears above the swatch grid on
	 */
	[Style(name="previewHeight", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Width of the larger preview swatch.
	 */
	[Style(name="previewWidth", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Color of the swatches' borders.
	 */
	[Style(name="swatchBorderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Size of the outlines of the swatches' borders.
	 */
	[Style(name="swatchBorderSize", type="Number", format="Length", inherit="no")] 
	/**
	 *  Color of the background rectangle behind the swatch grid.
	 */
	[Style(name="swatchGridBackgroundColor", type="uint", format="Color", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Size of the single border around the grid of swatches.
	 */
	[Style(name="swatchGridBorderSize", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Height of each swatch.
	 */
	[Style(name="swatchHeight", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Color of the highlight that appears around the swatch when the user
	 */
	[Style(name="swatchHighlightColor", type="uint", format="Color", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Size of the highlight that appears around the swatch when the user
	 */
	[Style(name="swatchHighlightSize", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Name of the class selector that defines style properties for the swatch panel.
	 */
	[Style(name="swatchPanelStyleName", type="String", inherit="no")] 
	/**
	 *  Width of each swatch.
	 */
	[Style(name="swatchWidth", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Name of the style sheet definition to configure the text input control.
	 */
	[Style(name="textFieldStyleName", type="String", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Width of the text box that appears above the swatch grid.
	 */
	[Style(name="textFieldWidth", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 
	/**
	 *  Vertical gap between swatches in the grid.
	 */
	[Style(name="verticalGap", type="Number", format="Length", inherit="no", deprecatedReplacement="swatchPanelStyleName", deprecatedSince="3.0")] 

	/**
	 *  The ColorPicker control provides a way for a user to choose a color from a swatch list.
	 */
	public class ColorPicker extends ComboBase
	{
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;
		/**
		 *  @private
		 */
		local var showingDropdown : Boolean;
		/**
		 *  @private
		 */
		local var isDown : Boolean;
		/**
		 *  @private
		 */
		local var isOpening : Boolean;
		/**
		 *  @private
		 */
		private var dropdownGap : Number;
		/**
		 *  @private
		 */
		private var indexFlag : Boolean;
		/**
		 *  @private
		 */
		private var initializing : Boolean;
		/**
		 *  @private
		 */
		private var isModelInited : Boolean;
		/**
		 *  @private
		 */
		private var collectionChanged : Boolean;
		/**
		 *  @private
		 */
		private var swatchPreview : SwatchSkin;
		/**
		 *  @private
		 */
		private var dropdownSwatch : SwatchPanel;
		/**
		 *  @private
		 */
		private var triggerEvent : Event;
		/**
		 *  @private
		 */
		private var _editable : Boolean;
		/**
		 *  @private
		 */
		private var _colorField : String;
		/**
		 *  Storage for the labelField property.
		 */
		private var _labelField : String;
		/**
		 *  @private
		 */
		private var _selectedColor : uint;
		/**
		 *  @private
		 */
		private var _showTextField : Boolean;
		private static const _swatchStyleFilters : Object;

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
		 *  Index in the dataProvider of the selected item in the
		 */
		public function set selectedIndex (value:int) : void;
		/**
		 *  @private
		 */
		public function set selectedItem (value:Object) : void;
		/**
		 *  Name of the field in the objects of the dataProvider Array that
		 */
		public function get colorField () : String;
		/**
		 *  @private
		 */
		public function set colorField (value:String) : void;
		/**
		 *  A reference to the SwatchPanel object that appears when you expand
		 */
		function get dropdown () : SwatchPanel;
		/**
		 *  Name of the field in the objects of the dataProvider Array that
		 */
		public function get labelField () : String;
		/**
		 *  @private
		 */
		public function set labelField (value:String) : void;
		/**
		 *  The value of the currently selected color in the
		 */
		public function get selectedColor () : uint;
		/**
		 *  @private
		 */
		public function set selectedColor (value:uint) : void;
		/**
		 *  Specifies whether to show the text box that displays the color
		 */
		public function get showTextField () : Boolean;
		/**
		 *  @private
		 */
		public function set showTextField (value:Boolean) : void;
		/**
		 *  Set of styles to pass from the ColorPicker through to the preview swatch. 
		 */
		protected function get swatchStyleFilters () : Object;

		/**
		 *  Constructor.
		 */
		public function ColorPicker ();
		/**
		 *  @private
		 */
		function initializeAccessibility () : void;
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
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  Displays the drop-down SwatchPanel object
		 */
		public function open () : void;
		/**
		 *  Hides the drop-down SwatchPanel object.
		 */
		public function close (trigger:Event = null) : void;
		/**
		 *  @private
		 */
		function getDropdown () : SwatchPanel;
		/**
		 *  @private
		 */
		function displayDropdown (show:Boolean, trigger:Event = null) : void;
		/**
		 *  @private
		 */
		private function loadDefaultPalette () : void;
		/**
		 *  @private
		 */
		private function updateColor (color:Number) : void;
		/**
		 *  @private
		 */
		private function findColorByName (name:Number) : int;
		/**
		 *  @private
		 */
		private function getColor (location:int) : Number;
		/**
		 *  @private
		 */
		protected function focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function collectionChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		protected function downArrowButton_buttonDownHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function dropdownSwatch_itemRollOverHandler (event:ColorPickerEvent) : void;
		/**
		 *  @private
		 */
		private function dropdownSwatch_itemRollOutHandler (event:ColorPickerEvent) : void;
		/**
		 *  @private
		 */
		private function dropdownSwatch_mouseDownOutsideHandler (event:Event) : void;
		/**
		 *  @private
		 */
		function onTweenUpdate (value:Number) : void;
		/**
		 *  @private
		 */
		function onTweenEnd (value:Number) : void;
	}
}