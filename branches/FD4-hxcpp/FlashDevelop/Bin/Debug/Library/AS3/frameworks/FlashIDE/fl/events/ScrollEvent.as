﻿package fl.events
{
	import flash.events.Event;

	/**
	 * The ScrollEvent class defines the scroll event that is associated with the ScrollBar component.
	 */
	public class ScrollEvent extends Event
	{
		/**
		 * Defines the value of the <code>type</code> property of a <code>scroll</code>
		 */
		public static const SCROLL : String = "scroll";
		/**
		 * @private
		 */
		private var _direction : String;
		/**
		 * @private
		 */
		private var _delta : Number;
		/**
		 * @private
		 */
		private var _position : Number;

		/**
		 * Gets a constant value that indicates the direction of movement associated with the event. 
		 */
		public function get direction () : String;
		/**
		 * Gets the size of the change in scroll position, in pixels. A positive value 
		 */
		public function get delta () : Number;
		/**
		 * Gets the current scroll position, in pixels.
		 */
		public function get position () : Number;

		/**
		 * Creates a new ScrollEvent object with the specified parameters.
		 */
		public function ScrollEvent (direction:String, delta:Number, position:Number);
		/**
		 * Returns a string that contains all the properties of the ScrollEvent object. The
		 */
		public function toString () : String;
		/**
		 * Creates a copy of the ScrollEvent object and sets the value of each parameter to 
		 */
		public function clone () : Event;
	}
}