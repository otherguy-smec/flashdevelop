﻿package fl.controls.progressBarClasses
{
	import fl.controls.ProgressBar;
	import fl.core.UIComponent;
	import fl.core.InvalidationType;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @copy fl.controls.ProgressBar#style:indeterminateSkin
	 */
	[Style(name="indeterminateSkin", type="Class")] 

	/**
	 * The IndeterminateBar class handles the drawing of the progress bar component when the 
	 */
	public class IndeterminateBar extends UIComponent
	{
		/**
		 * @private (protected)
		 */
		protected var animationCount : uint;
		/**
		 * @private (protected)
		 */
		protected var bar : Sprite;
		/**
		 * @private (protected)
		 */
		protected var barMask : Sprite;
		/**
		 * @private (protected)
		 */
		protected var patternBmp : BitmapData;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;

		/**
		 * Gets or sets a Boolean value that indicates whether the indeterminate bar is visible.
		 */
		public function get visible () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set visible (value:Boolean) : void;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new instance of the IndeterminateBar component.
		 */
		public function IndeterminateBar ();
		/**
		 * @private (protected)
		 */
		protected function startAnimation () : void;
		/**
		 * @private (protected)
		 */
		protected function stopAnimation () : void;
		/**
		 * @private (protected)
		 */
		protected function handleEnterFrame (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function configUI () : void;
		/**
		 * @private (protected)
		 */
		protected function draw () : void;
		/**
		 * @private (protected)
		 */
		protected function drawPattern () : void;
		/**
		 * @private (protected)
		 */
		protected function drawMask () : void;
		/**
		 * @private (protected)
		 */
		protected function drawBar () : void;
	}
}