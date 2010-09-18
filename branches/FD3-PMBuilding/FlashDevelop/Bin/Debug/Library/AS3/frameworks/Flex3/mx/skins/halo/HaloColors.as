﻿package mx.skins.halo
{
	import mx.utils.ColorUtil;

	/**
	 *  Defines the colors used by components that support the Halo theme.
	 */
	public class HaloColors
	{
		/**
		 *  @private
		 */
		private static var cache : Object;

		/**
		 *  Returns a unique hash key based on the colors that are
		 */
		public static function getCacheKey (...colors) : String;
		/**
		 *  Calculates colors that are used by components that 
		 */
		public static function addHaloColors (colors:Object, themeColor:uint, fillColor0:uint, fillColor1:uint) : void;
	}
}