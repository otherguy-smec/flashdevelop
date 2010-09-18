﻿package mx.effects
{
	import mx.effects.effectClasses.ResizeInstance;

	/**
	 *  The Resize effect changes the width, height, or both dimensions
	 */
	public class Resize extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  Number of pixels by which to modify the height of the component.
		 */
		public var heightBy : Number;
		/**
		 *  Initial height, in pixels.
		 */
		public var heightFrom : Number;
		/**
		 *  Final height, in pixels.
		 */
		public var heightTo : Number;
		/**
		 *  An Array of Panel containers.
		 */
		public var hideChildrenTargets : Array;
		/**
		 *  Number of pixels by which to modify the width of the component.
		 */
		public var widthBy : Number;
		/**
		 *  Initial width, in pixels.
		 */
		public var widthFrom : Number;
		/**
		 *  Final width, in pixels.
		 */
		public var widthTo : Number;

		/**
		 *  Constructor.
		 */
		public function Resize (target:Object = null);
		/**
		 *  @private
		 */
		public function getAffectedProperties () : Array;
		/**
		 *  @private
		 */
		protected function initInstance (instance:IEffectInstance) : void;
	}
}