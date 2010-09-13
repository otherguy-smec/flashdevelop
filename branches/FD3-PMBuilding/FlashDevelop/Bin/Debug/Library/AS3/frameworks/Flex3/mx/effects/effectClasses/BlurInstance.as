﻿package mx.effects.effectClasses
{
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import mx.core.mx_internal;

	/**
	 *  The BlurInstance class implements the instance class
	 */
	public class BlurInstance extends TweenEffectInstance
	{
		/**
		 *  The starting amount of horizontal blur.
		 */
		public var blurXFrom : Number;
		/**
		 *  The ending amount of horizontal blur.
		 */
		public var blurXTo : Number;
		/**
		 *  The starting amount of vertical blur.
		 */
		public var blurYFrom : Number;
		/**
		 *  The ending amount of vertical blur.
		 */
		public var blurYTo : Number;

		/**
		 *  Constructor.
		 */
		public function BlurInstance (target:Object);
		/**
		 *  @private
		 */
		public function initEffect (event:Event) : void;
		/**
		 *  @private
		 */
		public function play () : void;
		/**
		 *  @private
		 */
		public function onTweenUpdate (value:Object) : void;
		/**
		 *  @private
		 */
		public function onTweenEnd (value:Object) : void;
		/**
		 *  @private
		 */
		private function setBlurFilter (blurX:Number, blurY:Number) : void;
	}
}