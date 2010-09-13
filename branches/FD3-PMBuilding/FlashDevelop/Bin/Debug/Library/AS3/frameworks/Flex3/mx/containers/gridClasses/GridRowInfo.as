﻿package mx.containers.gridClasses
{
	import mx.core.UIComponent;

	/**
	 *  @private
	 */
	public class GridRowInfo
	{
		/**
		 *  Input: Measurement for the GridRow.
		 */
		public var flex : Number;
		/**
		 *  Output: The actual height of each row,
		 */
		public var height : Number;
		/**
		 *  Input: Measurement for the GridRow.
		 */
		public var max : Number;
		/**
		 *  Input: Measurement for the GridRow.
		 */
		public var min : Number;
		/**
		 *  Input: Measurement for the GridRow.
		 */
		public var preferred : Number;
		/**
		 *  Output: The actual position of each row,
		 */
		public var y : Number;

		/**
		 *  Constructor.
		 */
		public function GridRowInfo ();
	}
}