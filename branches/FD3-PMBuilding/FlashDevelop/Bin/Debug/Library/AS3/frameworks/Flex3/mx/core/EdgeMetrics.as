﻿package mx.core
{
	/**
	 *  The EdgeMetrics class specifies the thickness, in pixels,
	 */
	public class EdgeMetrics
	{
		/**
		 *  An EdgeMetrics object with a value of zero for its
		 */
		public static const EMPTY : EdgeMetrics = new EdgeMetrics(0, 0, 0, 0);
		/**
		 *  The height, in pixels, of the bottom edge region.
		 */
		public var bottom : Number;
		/**
		 *  The width, in pixels, of the left edge region.
		 */
		public var left : Number;
		/**
		 *  The width, in pixels, of the right edge region.
		 */
		public var right : Number;
		/**
		 *  The height, in pixels, of the top edge region.
		 */
		public var top : Number;

		/**
		 *  Constructor.
		 */
		public function EdgeMetrics (left:Number = 0, top:Number = 0, right:Number = 0, bottom:Number = 0);
		/**
		 *  Returns a copy of this EdgeMetrics object.
		 */
		public function clone () : EdgeMetrics;
	}
}