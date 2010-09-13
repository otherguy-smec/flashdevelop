﻿package mx.controls.scrollClasses
{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import mx.controls.Button;
	import mx.core.mx_internal;
	import mx.events.ScrollEventDetail;
	import mx.managers.ISystemManager;

	/**
	 *  The ScrollThumb class defines the thumb of a ScrollBar control. 
	 */
	public class ScrollThumb extends Button
	{
		/**
		 *  @private
		 */
		private var ymin : Number;
		/**
		 *  @private
		 */
		private var ymax : Number;
		/**
		 *  @private
		 */
		private var datamin : Number;
		/**
		 *  @private
		 */
		private var datamax : Number;
		/**
		 *  @private
		 */
		private var lastY : Number;

		/**
		 *  Constructor.
		 */
		public function ScrollThumb ();
		/**
		 *  @private
		 */
		function buttonReleased () : void;
		/**
		 *  @private
		 */
		function setRange (ymin:Number, ymax:Number, datamin:Number, datamax:Number) : void;
		/**
		 *  @private
		 */
		private function stopDragThumb () : void;
		/**
		 *  @private
		 */
		protected function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function mouseMoveHandler (event:MouseEvent) : void;
	}
}