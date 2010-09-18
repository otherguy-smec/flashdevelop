﻿package mx.effects.effectClasses
{
	import flash.events.Event;
	import mx.core.Container;
	import mx.core.EdgeMetrics;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.effects.EffectManager;
	import mx.events.MoveEvent;
	import mx.styles.IStyleClient;

	/**
	 *  The MoveInstance class implements the instance class
	 */
	public class MoveInstance extends TweenEffectInstance
	{
		/**
		 *  @private 
		 */
		private var left : *;
		/**
		 *  @private 
		 */
		private var right : *;
		/**
		 *  @private 
		 */
		private var top : *;
		/**
		 *  @private 
		 */
		private var bottom : *;
		/**
		 *  @private 
		 */
		private var horizontalCenter : *;
		/**
		 *  @private 
		 */
		private var verticalCenter : *;
		/**
		 *  @private
		 */
		private var forceClipping : Boolean;
		/**
		 *  @private
		 */
		private var checkClipping : Boolean;
		private var oldWidth : Number;
		private var oldHeight : Number;
		/**
		 *  Number of pixels to move the components along the x axis.
		 */
		public var xBy : Number;
		/**
		 *  Initial position's x coordinate.
		 */
		public var xFrom : Number;
		/**
		 *  Destination position's x coordinate.
		 */
		public var xTo : Number;
		/**
		 *  Number of pixels to move the components along the y axis.
		 */
		public var yBy : Number;
		/**
		 *  Initial position's y coordinate.
		 */
		public var yFrom : Number;
		/**
		 *  Destination position's y coordinate.
		 */
		public var yTo : Number;

		/**
		 *  Constructor.
		 */
		public function MoveInstance (target:Object);
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
	}
}