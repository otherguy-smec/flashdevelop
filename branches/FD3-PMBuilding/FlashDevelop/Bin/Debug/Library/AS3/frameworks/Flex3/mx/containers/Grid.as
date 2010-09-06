﻿package mx.containers
{
	import mx.containers.gridClasses.GridColumnInfo;
	import mx.containers.gridClasses.GridRowInfo;
	import mx.core.EdgeMetrics;

	/**
	 *  Number of pixels between children in the horizontal direction. 
	 */
	[Style(name="horizontalGap", type="Number", format="Length", inherit="no")] 
	/**
	 *  Number of pixels between children in the vertical direction. 
	 */
	[Style(name="verticalGap", type="Number", format="Length", inherit="no")] 

	/**
	 *  A Grid container lets you arrange children as rows and columns
	 */
	public class Grid extends Box
	{
		/**
		 *  @private
		 */
		private var columnWidths : Array;
		/**
		 *  @private
		 */
		private var rowHeights : Array;
		/**
		 *  @private
		 */
		private var needToRemeasure : Boolean;

		/**
		 *  Constructor.
		 */
		public function Grid ();
		/**
		 *  @private
		 */
		public function invalidateSize () : void;
		/**
		 *  Calculates the preferred, minimum, and maximum sizes of the Grid.
		 */
		protected function measure () : void;
		/**
		 *  Sets the size and position of each child of the Grid.
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		private function distributeItemHeight (item:GridItem, rowIndex:Number, verticalGap:Number, rowHeights:Array) : void;
		/**
		 *  @private
		 */
		private function distributeItemWidth (item:GridItem, colIndex:int, horizontalGap:Number, columnWidths:Array) : void;
	}
}