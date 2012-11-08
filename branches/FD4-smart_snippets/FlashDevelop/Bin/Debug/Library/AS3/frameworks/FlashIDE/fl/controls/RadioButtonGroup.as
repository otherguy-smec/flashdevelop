﻿package fl.controls
{
	import fl.controls.RadioButton;
	import flash.utils.Dictionary;
	import flash.events.EventDispatcher;
	import flash.events.Event;

	/**
	 * Dispatched when the selected RadioButton instance in a group changes.
	 */
	[Event(name="change", type="flash.events.Event")] 
	/**
	 * Dispatched when a RadioButton instance is clicked.
	 */
	[Event(name="click", type="flash.events.MouseEvent")] 

	/**
	 * The RadioButtonGroup class defines a group of RadioButton components 
	 */
	public class RadioButtonGroup extends EventDispatcher
	{
		/**
		 * @private
		 */
		private static var groups : Object;
		/**
		 * @private
		 */
		private static var groupCount : uint;
		/**
		 * @private (protected)
		 */
		protected var _name : String;
		/**
		 * @private (protected)
		 */
		protected var radioButtons : Array;
		/**
		 * @private (protected)
		 */
		protected var _selection : RadioButton;

		/**
		 * Gets the instance name of the radio button.
		 */
		public function get name () : String;
		/**
		 * Gets or sets a reference to the radio button that is currently selected 
		 */
		public function get selection () : RadioButton;
		/**
		 * @private (setter)
		 */
		public function set selection (value:RadioButton) : void;
		/**
		 * Gets or sets the selected radio button's <code>value</code> property.
		 */
		public function get selectedData () : Object;
		/**
		 * @private (setter)
		 */
		public function set selectedData (value:Object) : void;
		/**
		 * Gets the number of radio buttons in this radio button group.
		 */
		public function get numRadioButtons () : int;

		/**
		 * Retrieves a reference to the specified radio button group.
		 */
		public static function getGroup (name:String) : RadioButtonGroup;
		/**
		 * @private
		 */
		private static function registerGroup (group:RadioButtonGroup) : void;
		/**
		 * @private
		 */
		private static function cleanUpGroups () : void;
		/**
		 * Creates a new RadioButtonGroup instance.  
		 */
		public function RadioButtonGroup (name:String);
		/**
		 * Adds a radio button to the internal radio button array for use with 
		 */
		public function addRadioButton (radioButton:RadioButton) : void;
		/**
		 * Clears the RadioButton instance from the internal list of radio buttons.
		 */
		public function removeRadioButton (radioButton:RadioButton) : void;
		/**
		 * Returns the index of the specified RadioButton instance.
		 */
		public function getRadioButtonIndex (radioButton:RadioButton) : int;
		/**
		 * Retrieves the RadioButton component at the specified index location.
		 */
		public function getRadioButtonAt (index:int) : RadioButton;
	}
}