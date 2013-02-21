﻿package fl.events
{
	import flash.events.Event;

	/**
	 * The DataChangeEvent class defines the event that is dispatched when the data 
	 */
	public class DataChangeEvent extends Event
	{
		/**
		 * Defines the value of the <code>type</code> property of a <code>dataChange</code>
		 */
		public static const DATA_CHANGE : String = "dataChange";
		/**
		 * Defines the value of the <code>type</code> property of a <code>preDataChange</code>
		 */
		public static const PRE_DATA_CHANGE : String = "preDataChange";
		/**
		 * @private (protected)
		 */
		protected var _startIndex : uint;
		/**
		 * @private (protected)
		 */
		protected var _endIndex : uint;
		/**
		 * @private (protected)
		 */
		protected var _changeType : String;
		/**
		 * @private (protected)
		 */
		protected var _items : Array;

		/**
		 * Gets the type of the change that triggered the event. The DataChangeType class 
		 */
		public function get changeType () : String;
		/**
		 * Gets an array that contains the changed items.
		 */
		public function get items () : Array;
		/**
		 * Gets the index of the first changed item in the array of items 
		 */
		public function get startIndex () : uint;
		/**
		 * Gets the index of the last changed item in the array of items
		 */
		public function get endIndex () : uint;

		/**
		 * Creates a new DataChangeEvent object with the specified parameters.
		 */
		public function DataChangeEvent (eventType:String, changeType:String, items:Array, startIndex:int = -1, endIndex:int = -1);
		/**
		 * Returns a string that contains all the properties of the DataChangeEvent object. The
		 */
		public function toString () : String;
		/**
		 * Creates a copy of the DataEvent object and sets the value of each parameter to match
		 */
		public function clone () : Event;
	}
}