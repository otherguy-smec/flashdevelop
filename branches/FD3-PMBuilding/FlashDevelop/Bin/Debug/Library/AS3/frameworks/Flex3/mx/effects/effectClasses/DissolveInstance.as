﻿package mx.effects.effectClasses
{
	import flash.events.Event;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.FlexEvent;
	import mx.graphics.RoundedRectangle;
	import mx.styles.StyleManager;

	/**
	 *  The DissolveInstance class implements the instance class
	 */
	public class DissolveInstance extends TweenEffectInstance
	{
		/**
		 *  @private
		 */
		private var overlay : UIComponent;
		/**
		 *  Initial transparency level between 0.0 and 1.0,
		 */
		public var alphaFrom : Number;
		/**
		 *  Final transparency level between 0.0 and 1.0,
		 */
		public var alphaTo : Number;
		/**
		 *  Hex value that represents the color of the floating rectangle 
		 */
		public var color : uint;
		/**
		 *  @private
		 */
		local var persistAfterEnd : Boolean;
		/**
		 *  The area of the target to play the effect upon.
		 */
		public var targetArea : RoundedRectangle;

		/**
		 *  Constructor.
		 */
		public function DissolveInstance (target:Object);
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
		 *	@private
		 */
		private function overlayCreatedHandler (event:ChildExistenceChangedEvent) : void;
	}
}