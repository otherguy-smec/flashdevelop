﻿package mx.skins.halo
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import mx.skins.Border;
	import mx.styles.StyleManager;
	import mx.utils.ColorUtil;

include "../../core/Version.as"
	/**
	 *  The skin for all the states of a thumb in a Slider.
	 */
	public class SliderThumbSkin extends Border
	{
		/**
		 *  @private
		 */
		private static var cache : Object;

		/**
		 *  @private
		 */
		public function get measuredWidth () : Number;

		/**
		 *  @private
		 */
		public function get measuredHeight () : Number;

		/**
		 *  @private
	 *  Several colors used for drawing are calculated from the base colors
	 *  of the component (themeColor, borderColor and fillColors).
	 *  Since these calculations can be a bit expensive,
	 *  we calculate once per color set and cache the results.
		 */
		private static function calcDerivedStyles (themeColor:uint, borderColor:uint, fillColor0:uint, fillColor1:uint) : Object;

		/**
		 *  Constructor.
		 */
		public function SliderThumbSkin ();

		/**
		 * For internal use.
		 */
		protected function drawThumbState (w:Number, h:Number, borderColors:Array, fillColors:Array, fillAlphas:Array, drawBacking:Boolean, drillHole:Boolean) : void;

		/**
		 *  @private
		 */
		protected function updateDisplayList (w:Number, h:Number) : void;
	}
}
