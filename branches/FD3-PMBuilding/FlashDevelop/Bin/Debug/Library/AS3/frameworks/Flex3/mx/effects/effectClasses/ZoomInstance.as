﻿package mx.effects.effectClasses
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.core.mx_internal;
	import mx.effects.EffectManager;
	import mx.events.FlexEvent;

	/**
	 *  The ZoomInstance class implements the instance class for the Zoom effect.
	 */
	public class ZoomInstance extends TweenEffectInstance
	{
		/**
		 *  @private
		 */
		private var origScaleX : Number;
		/**
		 *  @private
		 */
		private var origScaleY : Number;
		/**
		 *  @private
		 */
		private var origX : Number;
		/**
		 *  @private
		 */
		private var origY : Number;
		/**
		 *  @private
		 */
		private var newX : Number;
		/**
		 *  @private
		 */
		private var newY : Number;
		/**
		 *  @private
		 */
		private var scaledOriginX : Number;
		/**
		 *  @private
		 */
		private var scaledOriginY : Number;
		/**
		 *  @private
		 */
		private var origPercentWidth : Number;
		/**
		 *  @private
		 */
		private var origPercentHeight : Number;
		/**
		 *  @private
		 */
		private var _mouseHasMoved : Boolean;
		/**
		 *  @private
		 */
		private var show : Boolean;
		/**
		 *  Prevents the <code>rollOut</code> and <code>rollOver</code> events
		 */
		public var captureRollEvents : Boolean;
		/**
		 *  Number that represents the x-position of the zoom origin,
		 */
		public var originX : Number;
		/**
		 *  Number that represents the y-position of the zoom origin,
		 */
		public var originY : Number;
		/**
		 *  Number that represents the scale at which to start the height zoom, 
		 */
		public var zoomHeightFrom : Number;
		/**
		 *  Number that represents the scale at which to complete the height zoom, 
		 */
		public var zoomHeightTo : Number;
		/**
		 *  Number that represents the scale at which to start the width zoom, 
		 */
		public var zoomWidthFrom : Number;
		/**
		 *  Number that represents the scale at which to complete the width zoom, 
		 */
		public var zoomWidthTo : Number;

		/**
		 *  Constructor.
		 */
		public function ZoomInstance (target:Object);
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
		public function finishEffect () : void;
		/**
		 *  @private
		 */
		private function applyPropertyChanges () : void;
		/**
		 *  @private
		 */
		private function getScaleFromWidth (value:Number) : Number;
		/**
		 *  @private
		 */
		private function getScaleFromHeight (value:Number) : Number;
		/**
		 *  @private
		 */
		private function mouseEventHandler (event:MouseEvent) : void;
	}
}