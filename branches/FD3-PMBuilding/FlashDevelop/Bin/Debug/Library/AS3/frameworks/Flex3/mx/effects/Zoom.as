﻿package mx.effects
{
	import mx.core.mx_internal;
	import mx.effects.effectClasses.ZoomInstance;

	/**
	 *  The Zoom effect zooms the object in or out on a center point.
	 */
	public class Zoom extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  If <code>true</code>, prevents Flex from dispatching the <code>rollOut</code> 
		 */
		public var captureRollEvents : Boolean;
		/**
		 *  Number that represents the x-position of the zoom origin 
		 */
		public var originX : Number;
		/**
		 *  Number that represents the y-position of the zoom origin 
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
		public function Zoom (target:Object = null);
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