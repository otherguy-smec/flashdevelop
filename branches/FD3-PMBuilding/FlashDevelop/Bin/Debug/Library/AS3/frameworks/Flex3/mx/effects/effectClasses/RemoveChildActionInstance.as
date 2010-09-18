﻿package mx.effects.effectClasses
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import mx.core.mx_internal;

	/**
	 *  The RemoveChildActionInstance class implements the instance class
	 */
	public class RemoveChildActionInstance extends ActionEffectInstance
	{
		/**
		 *  @private
		 */
		private var _startIndex : Number;
		/**
		 *  @private
		 */
		private var _startParent : DisplayObjectContainer;

		/**
		 *  Constructor.
		 */
		public function RemoveChildActionInstance (target:Object);
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
		protected function saveStartValue () : *;
	}
}