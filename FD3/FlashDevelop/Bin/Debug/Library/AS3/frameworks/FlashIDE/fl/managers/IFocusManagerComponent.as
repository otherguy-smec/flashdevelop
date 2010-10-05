﻿package fl.managers
{
	/**
	 * The IFocusManagerComponent interface provides methods and properties
	 */
	public interface IFocusManagerComponent
	{
		/**
		 * Gets or sets a Boolean value that indicates whether a selected component can receive 
		 */
		public function get focusEnabled () : Boolean;
		/**
		 * @private
		 */
		public function set focusEnabled (value:Boolean) : void;
		/**
		 * Gets a Boolean value that indicates whether a component that is
		 */
		public function get mouseFocusEnabled () : Boolean;
		/**
		 * Gets a Boolean value that indicates whether pressing the Tab key can 
		 */
		public function get tabEnabled () : Boolean;
		/**
		 * Gets the order in which the component receives focus, if <code>tabEnabled</code>is set
		 */
		public function get tabIndex () : int;

		/**
		 * Sets focus for a component.
		 */
		public function setFocus () : void;
		/**
		 * Draws a visual focus indicator.
		 */
		public function drawFocus (draw:Boolean) : void;
	}
}