﻿package mx.controls
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventPhase;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	import mx.core.FlexSprite;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.FlexVersion;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.DateChooserEvent;
	import mx.events.DateChooserEventDetail;
	import mx.events.FlexEvent;
	import mx.graphics.RectangularDropShadow;
	import mx.managers.IFocusManagerComponent;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.ResourceBundle;
	import mx.styles.StyleManager;
	import mx.utils.GraphicsUtil;
	import mx.styles.StyleProxy;

	/**
	 *  Dispatched when a date is selected or changed.
	 */
	[Event(name="change", type="mx.events.CalendarLayoutChangeEvent")] 
	/**
	 *  Dispatched when the month changes due to user interaction.
	 */
	[Event(name="scroll", type="mx.events.DateChooserEvent")] 
	/**
	 *  Alpha level of the color defined by the <code>backgroundColor</code>
	 */
	[Style(name="backgroundAlpha", type="Number", inherit="no")] 
	/**
	 *  Background color of the DateChooser control.
	 */
	[Style(name="backgroundColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Color of the border.
	 */
	[Style(name="borderColor", type="uint", format="Color", inherit="no")] 
	/**
	 *  Bounding box thickness.
	 */
	[Style(name="borderThickness", type="Number", format="Length", inherit="no")] 
	/**
	 *  Radius of component corners.
	 */
	[Style(name="cornerRadius", type="Number", format="Length", inherit="no")] 
	/**
	 *  Alphas used for the background fill of controls. Use [1, 1] to make the control background
	 */
	[Style(name="fillAlphas", type="Array", arrayType="Number", inherit="no", deprecatedReplacement="nextMonthStyleFilters, prevMonthStyleFilters", deprecatedSince="3.0")] 
	/**
	 *  Colors used to tint the background of the control.
	 */
	[Style(name="fillColors", type="Array", arrayType="uint", format="Color", inherit="no", deprecatedReplacement="nextMonthStyleFilters, prevMonthStyleFilters", deprecatedSince="3.0")] 
	/**
	 *  Colors of the band at the top of the DateChooser control.
	 */
	[Style(name="headerColors", type="Array", arrayType="uint", format="Color", inherit="yes")] 
	/**
	 *  Name of the style sheet definition to configure the text (month name and year)
	 */
	[Style(name="headerStyleName", type="String", inherit="no")] 
	/**
	 *  Alpha transparencies used for the highlight fill of controls.
	 */
	[Style(name="highlightAlphas", type="Array", arrayType="Number", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next month arrow.
	 */
	[Style(name="nextMonthSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  Name of the class to use as the skin for the next month arrow
	 */
	[Style(name="nextMonthDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next month arrow
	 */
	[Style(name="nextMonthDownSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next month arrow
	 */
	[Style(name="nextMonthOverSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next month arrow
	 */
	[Style(name="nextMonthUpSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next year arrow.
	 */
	[Style(name="nextYearSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  Name of the class to use as the skin for the next year arrow
	 */
	[Style(name="nextYearDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next Year arrow
	 */
	[Style(name="nextYearDownSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next Year arrow
	 */
	[Style(name="nextYearOverSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the next Year arrow
	 */
	[Style(name="nextYearUpSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous month arrow.
	 */
	[Style(name="prevMonthSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  Name of the class to use as the skin for the previous month arrow
	 */
	[Style(name="prevMonthDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous month arrow
	 */
	[Style(name="prevMonthDownSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous month arrow
	 */
	[Style(name="prevMonthOverSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous month arrow
	 */
	[Style(name="prevMonthUpSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous year arrow.
	 */
	[Style(name="prevYearSkin", type="Class", inherit="no", states="up, over, down, disabled")] 
	/**
	 *  Name of the class to use as the skin for the previous Year arrow
	 */
	[Style(name="prevYearDisabledSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous Year arrow
	 */
	[Style(name="prevYearDownSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous Year arrow
	 */
	[Style(name="prevYearOverSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the class to use as the skin for the previous Year arrow
	 */
	[Style(name="prevYearUpSkin", type="Class", inherit="no")] 
	/**
	 *  Color of the highlight area of the date when the user holds the
	 */
	[Style(name="rollOverColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Name of the class to use as the skin for the 
	 */
	[Style(name="rollOverIndicatorSkin", type="Class", inherit="no")] 
	/**
	 *  Color of the highlight area of the currently selected date
	 */
	[Style(name="selectionColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Name of the class to use as the skin for the 
	 */
	[Style(name="selectionIndicatorSkin", type="Class", inherit="no")] 
	/**
	 *  Color of the background of today's date.
	 */
	[Style(name="todayColor", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Name of the class to use as the skin for the 
	 */
	[Style(name="todayIndicatorSkin", type="Class", inherit="no")] 
	/**
	 *  Name of the style sheet definition to configure the appearance of the current day's
	 */
	[Style(name="todayStyleName", type="String", inherit="no")] 
	/**
	 *  Name of the style sheet definition to configure the weekday names of
	 */
	[Style(name="weekDayStyleName", type="String", inherit="no")] 

	/**
	 *  The DateChooser control displays the name of a month, the year,
	 */
	public class DateChooser extends UIComponent implements IFocusManagerComponent
	{
		/**
		 *  @private
		 */
		private var HEADER_WIDTH_PAD : Number;
		/**
		 *  @private
		 */
		private var SKIN_WIDTH_PAD : Number;
		/**
		 *  @private
		 */
		private var SKIN_HEIGHT_PAD : Number;
		/**
		 *  @private
		 */
		private var YEAR_BUTTONS_PAD : Number;
		/**
		 *  @private
		 */
		static var createAccessibilityImplementation : Function;
		/**
		 *  @private
		 */
		local var background : UIComponent;
		/**
		 *  @private
		 */
		local var border : UIComponent;
		/**
		 *  @private
		 */
		local var headerDisplay : UIComponent;
		/**
		 *  @private
		 */
		local var monthDisplay : IUITextField;
		/**
		 *  @private
		 */
		local var fwdMonthHit : Sprite;
		/**
		 *  @private
		 */
		local var backMonthHit : Sprite;
		/**
		 *  @private
		 */
		local var upYearHit : Sprite;
		/**
		 *  @private
		 */
		local var downYearHit : Sprite;
		/**
		 *  @private
		 */
		local var calHeader : UIComponent;
		/**
		 *  @private
		 */
		local var yearDisplay : IUITextField;
		/**
		 *  @private
		 */
		local var upYearButton : Button;
		/**
		 *  @private
		 */
		local var downYearButton : Button;
		/**
		 *  @private
		 */
		local var fwdMonthButton : Button;
		/**
		 *  @private
		 */
		local var backMonthButton : Button;
		/**
		 *  @private
		 */
		local var dateGrid : CalendarLayout;
		/**
		 *  @private
		 */
		local var dropShadow : RectangularDropShadow;
		/**
		 *  @private
		 */
		private var previousSelectedCellIndex : Number;
		/**
		 *  @private
		 */
		private var monthSkinWidth : Number;
		/**
		 *  @private
		 */
		private var monthSkinHeight : Number;
		/**
		 *  @private
		 */
		private var yearSkinWidth : Number;
		/**
		 *  @private
		 */
		private var yearSkinHeight : Number;
		/**
		 *  @private
		 */
		private var headerHeight : Number;
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
		private var _allowDisjointSelection : Boolean;
		/**
		 *  @private
		 */
		private var allowDisjointSelectionChanged : Boolean;
		/**
		 *  @private
		 */
		private var _allowMultipleSelection : Boolean;
		/**
		 *  @private
		 */
		private var allowMultipleSelectionChanged : Boolean;
		/**
		 *  @private
		 */
		private var _dayNames : Array;
		/**
		 *  @private
		 */
		private var dayNamesChanged : Boolean;
		/**
		 *  @private
		 */
		private var dayNamesOverride : Array;
		/**
		 *  @private
		 */
		private var _disabledDays : Array;
		/**
		 *  @private
		 */
		private var disabledDaysChanged : Boolean;
		/**
		 *  @private
		 */
		private var _disabledRanges : Array;
		/**
		 *  @private
		 */
		private var disabledRangesChanged : Boolean;
		/**
		 *  @private
		 */
		private var _displayedMonth : int;
		/**
		 *  @private
		 */
		private var displayedMonthChanged : Boolean;
		/**
		 *  @private
		 */
		private var _displayedYear : int;
		/**
		 *  @private
		 */
		private var displayedYearChanged : Boolean;
		/**
		 *  @private
		 */
		private var _firstDayOfWeek : Object;
		/**
		 *  @private
		 */
		private var firstDayOfWeekChanged : Boolean;
		/**
		 *  @private
		 */
		private var firstDayOfWeekOverride : Object;
		/**
		 *  @private
		 */
		private var _maxYear : int;
		/**
		 *  @private
		 */
		private var _minYear : int;
		/**
		 *  @private
		 */
		private var _monthNames : Array;
		/**
		 *  @private
		 */
		private var monthNamesChanged : Boolean;
		/**
		 *  @private
		 */
		private var monthNamesOverride : Array;
		/**
		 *  @private
		 */
		private var _monthSymbol : String;
		/**
		 *  @private
		 */
		private var monthSymbolChanged : Boolean;
		/**
		 *  @private
		 */
		private var monthSymbolOverride : String;
		private static var _nextMonthStyleFilters : Object;
		private static var _nextYearStyleFilters : Object;
		private static var _prevMonthStyleFilters : Object;
		private static var _prevYearStyleFilters : Object;
		/**
		 *  @private
		 */
		private var _selectableRange : Object;
		/**
		 *  @private
		 */
		private var selectableRangeChanged : Boolean;
		/**
		 *  @private
		 */
		private var _selectedDate : Date;
		/**
		 *  @private
		 */
		private var selectedDateChanged : Boolean;
		/**
		 *  @private
		 */
		private var _selectedRanges : Array;
		/**
		 *  @private
		 */
		private var selectedRangesChanged : Boolean;
		/**
		 *  @private
		 */
		private var _showToday : Boolean;
		/**
		 *  @private
		 */
		private var showTodayChanged : Boolean;
		/**
		 *  @private
		 */
		private var _yearNavigationEnabled : Boolean;
		/**
		 *  @private
		 */
		private var yearNavigationEnabledChanged : Boolean;
		/**
		 *  @private
		 */
		private var _yearSymbol : String;
		/**
		 *  @private
		 */
		private var yearSymbolChanged : Boolean;
		/**
		 *  @private
		 */
		private var yearSymbolOverride : String;

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
		 *  If <code>true</code>, specifies that non-contiguous(disjoint)
		 */
		public function get allowDisjointSelection () : Boolean;
		/**
		 *  @private
		 */
		public function set allowDisjointSelection (value:Boolean) : void;
		/**
		 *  If <code>true</code>, specifies that multiple selection
		 */
		public function get allowMultipleSelection () : Boolean;
		/**
		 *  @private
		 */
		public function set allowMultipleSelection (value:Boolean) : void;
		/**
		 *  The set of styles to pass from the DateChooser to the calendar layout.
		 */
		protected function get calendarLayoutStyleFilters () : Object;
		/**
		 *  The weekday names for DateChooser control.
		 */
		public function get dayNames () : Array;
		/**
		 *  @private
		 */
		public function set dayNames (value:Array) : void;
		/**
		 *  The days to disable in a week.
		 */
		public function get disabledDays () : Array;
		/**
		 *  @private
		 */
		public function set disabledDays (value:Array) : void;
		/**
		 *  Disables single and multiple days.
		 */
		public function get disabledRanges () : Array;
		/**
		 *  @private
		 */
		public function set disabledRanges (value:Array) : void;
		/**
		 *  Used together with the <code>displayedYear</code> property,
		 */
		public function get displayedMonth () : int;
		/**
		 *  @private
		 */
		public function set displayedMonth (value:int) : void;
		/**
		 *  Used together with the <code>displayedMonth</code> property,
		 */
		public function get displayedYear () : int;
		/**
		 *  @private
		 */
		public function set displayedYear (value:int) : void;
		/**
		 *  Number representing the day of the week to display in the
		 */
		public function get firstDayOfWeek () : Object;
		/**
		 *  @private
		 */
		public function set firstDayOfWeek (value:Object) : void;
		/**
		 *  @private
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  The last year selectable in the control.
		 */
		public function get maxYear () : int;
		/**
		 *  @private
		 */
		public function set maxYear (value:int) : void;
		/**
		 *  The first year selectable in the control.
		 */
		public function get minYear () : int;
		/**
		 *  @private
		 */
		public function set minYear (value:int) : void;
		/**
		 *  Names of the months displayed at the top of the DateChooser control.
		 */
		public function get monthNames () : Array;
		/**
		 *  @private
		 */
		public function set monthNames (value:Array) : void;
		/**
		 *  This property is appended to the end of the value specified 
		 */
		public function get monthSymbol () : String;
		/**
		 *  @private
		 */
		public function set monthSymbol (value:String) : void;
		/**
		 *  The set of styles to pass from the DateChooser to the next month button.
		 */
		protected function get nextMonthStyleFilters () : Object;
		/**
		 *  The set of styles to pass from the DateChooser to the next year button.
		 */
		protected function get nextYearStyleFilters () : Object;
		/**
		 *  The set of styles to pass from the DateChooser to the previous month button.
		 */
		protected function get prevMonthStyleFilters () : Object;
		/**
		 *  The set of styles to pass from the DateChooser to the previous year button.
		 */
		protected function get prevYearStyleFilters () : Object;
		/**
		 *  Range of dates between which dates are selectable.
		 */
		public function get selectableRange () : Object;
		/**
		 *  @private
		 */
		public function set selectableRange (value:Object) : void;
		/**
		 *  Date selected in the DateChooser control.
		 */
		public function get selectedDate () : Date;
		/**
		 *  @private
		 */
		public function set selectedDate (value:Date) : void;
		/**
		 *  Selected date ranges.
		 */
		public function get selectedRanges () : Array;
		/**
		 *  @private
		 */
		public function set selectedRanges (value:Array) : void;
		/**
		 *  If <code>true</code>, specifies that today is highlighted
		 */
		public function get showToday () : Boolean;
		/**
		 *  @private
		 */
		public function set showToday (value:Boolean) : void;
		/**
		 *  Enables year navigation. When <code>true</code>
		 */
		public function get yearNavigationEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set yearNavigationEnabled (value:Boolean) : void;
		/**
		 *  This property is appended to the end of the year 
		 */
		public function get yearSymbol () : String;
		/**
		 *  @private
		 */
		public function set yearSymbol (value:String) : void;

		/**
		 *  Constructor.
		 */
		public function DateChooser ();
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
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  @private
		 */
		function createMonthDisplay (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeMonthDisplay () : void;
		/**
		 *  @private
		 */
		function createYearDisplay (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeYearDisplay () : void;
		/**
		 *  @private
		 */
		function updateDateDisplay () : void;
		/**
		 *  @private
		 */
		private function getYearNavigationButtons () : void;
		/**
		 *  @private
		 */
		function setMonthWidth () : void;
		/**
		 *  @private
		 */
		private function yearBeforeMonth (dateFormat:String) : Boolean;
		/**
		 *  @private
		 */
		function scrubTimeValue (value:Object) : Object;
		/**
		 *  @private
		 */
		function scrubTimeValues (values:Array) : Array;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function upYearButton_buttonDownHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function downYearButton_buttonDownHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function fwdMonthButton_buttonDownHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function backMonthButton_buttonDownHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function dateGrid_scrollHandler (event:DateChooserEvent) : void;
		/**
		 *  @private
		 */
		private function dateGrid_changeHandler (event:CalendarLayoutChangeEvent) : void;
	}
}