﻿package mx.graphics
{
	import flash.geom.Rectangle;

	/**
	 *  RoundedRectangle represents a Rectangle with curved corners
	 */
	public class RoundedRectangle extends Rectangle
	{
		/**
		 *  The radius of each corner (in pixels).
		 */
		public var cornerRadius : Number;

		/**
		 *  Constructor.
		 */
		public function RoundedRectangle (x:Number = 0, y:Number = 0, width:Number = 0, height:Number = 0, cornerRadius:Number = 0);
	}
}