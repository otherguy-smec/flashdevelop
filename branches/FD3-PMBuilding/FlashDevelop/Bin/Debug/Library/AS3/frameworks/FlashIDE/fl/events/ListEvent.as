﻿package fl.events
{
	import flash.events.Event;

	/**
	 * The ListEvent class defines events for list-based components including the List, DataGrid, TileList, and ComboBox components. 
	 */
	public class ListEvent extends Event
	{
		/**
		 * Defines the value of the <code>type</code> property of an  
		 */
		public static const ITEM_ROLL_OUT : String = "itemRollOut";
		/**
		 * Defines the value of the <code>type</code> property of an <code>itemRollOver</code> 
		 */
		public static const ITEM_ROLL_OVER : String = "itemRollOver";
		/**
		 * Defines the value of the <code>type</code> property of an <code>itemClick</code> 
		 */
		public static const ITEM_CLICK : String = "itemClick";
		/**
		 * Defines the value of the <code>type</code> property of an <code>itemDoubleClick</code> 
		 */
		public static const ITEM_DOUBLE_CLICK : String = "itemDoubleClick";
		/**
		 * @private (protected)
		 */
		protected var _rowIndex : int;
		/**
		 * @private (protected)
		 */
		protected var _columnIndex : int;
		/**
		 * @private (protected)
		 */
		protected var _index : int;
		/**
		 * @private (protected)
		 */
		protected var _item : Object;

		/**
		 * Gets the row index of the item that is associated with this event.
		 */
		public function get rowIndex () : Object;
		/**
		 * Gets the column index of the item that is associated with this event.
		 */
		public function get columnIndex () : int;
		/**
		 * Gets the zero-based index of the cell that contains the renderer.
		 */
		public function get index () : int;
		/**
		 * Gets the data that belongs to the current cell renderer.
		 */
		public function get item () : Object;

		/**
		 * Creates a new ListEvent object with the specified parameters. 
		 */
		public function ListEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, columnIndex:int = -1, rowIndex:int = -1, index:int = -1, item:Object = null);
		/**
		 * Returns a string that contains all the properties of the ListEvent object. The string
		 */
		public function toString () : String;
		/**
		 * Creates a copy of the ListEvent object and sets the value of each parameter to match
		 */
		public function clone () : Event;
	}
}