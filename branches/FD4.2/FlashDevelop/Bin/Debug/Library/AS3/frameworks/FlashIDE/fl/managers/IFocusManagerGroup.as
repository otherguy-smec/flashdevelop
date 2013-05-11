﻿package fl.managers
{
	/**
	 * The IFocusManagerGroup interface provides properties that are used 
	 */
	public interface IFocusManagerGroup
	{
		/**
		 * Gets or sets the name of the group of components to which this component belongs.
		 */
		public function get groupName () : String;
		/**
		 * @private (setter)
		 */
		public function set groupName (value:String) : void;
		/**
		 * Gets or sets a Boolean value that indicates whether this component is selected. 
		 */
		public function get selected () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set selected (value:Boolean) : void;

	}
}