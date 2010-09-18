﻿package fl.transitions
{
	import flash.display.MovieClip;

	/**
	 * The Squeeze class scales the movie clip object horizontally or vertically. This effect requires the
	 */
	public class Squeeze extends Transition
	{
		/**
		 * @private
		 */
		protected var _scaleProp : String;
		/**
		 * @private
		 */
		protected var _scaleFinal : Number;

		/**
		 * @private
		 */
		public function get type () : Class;

		/**
		 * @private
		 */
		function Squeeze (content:MovieClip, transParams:Object, manager:TransitionManager);
		/**
		 * @private
		 */
		protected function _render (p:Number) : void;
	}
}