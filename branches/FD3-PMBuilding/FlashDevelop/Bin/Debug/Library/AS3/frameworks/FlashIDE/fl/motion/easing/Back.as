﻿package fl.motion.easing
{
	/**
	 *  The Back class defines three easing functions to implement 
	 */
	public class Back
	{
		/**
		 *  The <code>easeIn()</code> method starts 
		 */
		public static function easeIn (t:Number, b:Number, c:Number, d:Number, s:Number = 0) : Number;
		/**
		 *  The <code>easeOut()</code> method starts the motion by
		 */
		public static function easeOut (t:Number, b:Number, c:Number, d:Number, s:Number = 0) : Number;
		/**
		 *  The <code>easeInOut()</code> method combines the motion
		 */
		public static function easeInOut (t:Number, b:Number, c:Number, d:Number, s:Number = 0) : Number;
	}
}