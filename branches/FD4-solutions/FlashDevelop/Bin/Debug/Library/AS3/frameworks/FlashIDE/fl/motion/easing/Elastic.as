﻿package fl.motion.easing
{
	/**
	 *  The Elastic class defines three easing functions to implement 
	 */
	public class Elastic
	{
		/**
		 *  The <code>easeIn()</code> method starts motion slowly 
		 */
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, a:Number = 0, p:Number = 0) : Number;
		/**
		 *  The <code>easeOut()</code> method starts motion fast 
		 */
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, a:Number = 0, p:Number = 0) : Number;
		/**
		 *  The <code>easeInOut()</code> method combines the motion
		 */
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, a:Number = 0, p:Number = 0) : Number;
	}
}