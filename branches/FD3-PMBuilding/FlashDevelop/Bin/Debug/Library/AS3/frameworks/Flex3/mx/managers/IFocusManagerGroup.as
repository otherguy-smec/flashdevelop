﻿package mx.managers
{
	/**
	 *  The IFocusManagerGroup interface defines the interface that 
	 */
	public interface IFocusManagerGroup
	{
		/**
		 *	The name of the group of controls to which the control belongs.
		 */
		public function get groupName () : String;
		/**
		 *  @private
		 */
		public function set groupName (value:String) : void;
		/**
		 *	A flag that indicates whether this control is selected.
		 */
		public function get selected () : Boolean;
		/**
		 *  @private
		 */
		public function set selected (value:Boolean) : void;

	}
}