﻿package fl.controls.listClasses
{
	import fl.core.UIComponent;

	/**
	 * ListData is a messenger class that holds information relevant to a specific 
	 */
	public class ListData
	{
		/**
		 * @private (protected)
		 */
		protected var _icon : Object;
		/**
		 * @private (protected)
		 */
		protected var _label : String;
		/**
		 * @private (protected)
		 */
		protected var _owner : UIComponent;
		/**
		 * @private (protected)
		 */
		protected var _index : uint;
		/**
		 * @private (protected)
		 */
		protected var _row : uint;
		/**
		 * @private (protected)
		 */
		protected var _column : uint;

		/**
		 * The label to be displayed in the cell.
		 */
		public function get label () : String;
		/**
		 * A class that represents the icon for the item in the List component, 
		 */
		public function get icon () : Object;
		/**
		 * A reference to the List object that owns this item.
		 */
		public function get owner () : UIComponent;
		/**
		 * The index of the item in the data provider.
		 */
		public function get index () : uint;
		/**
		 * The row in which the data item is displayed.
		 */
		public function get row () : uint;
		/**
		 * The column in which the data item is displayed. In a list, 
		 */
		public function get column () : uint;

		/**
		 * Creates a new instance of the ListData class as specified by its parameters. 
		 */
		public function ListData (label:String, icon:Object, owner:UIComponent, index:uint, row:uint, col:uint = 0);
	}
}