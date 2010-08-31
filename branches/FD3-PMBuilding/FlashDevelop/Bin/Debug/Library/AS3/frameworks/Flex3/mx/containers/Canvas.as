﻿package mx.containers
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import mx.containers.utilityClasses.ConstraintColumn;
	import mx.containers.utilityClasses.ConstraintRow;
	import mx.containers.utilityClasses.CanvasLayout;
	import mx.containers.utilityClasses.IConstraintLayout;
	import mx.core.Container;
	import mx.core.EdgeMetrics;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.styles.IStyleClient;

	/**
	 *  A Canvas layout container defines a rectangular region
	 */
	public class Canvas extends Container implements IConstraintLayout
	{
		/**
		 *  @private
		 */
		private var layoutObject : CanvasLayout;
		/**
		 *  @private
		 */
		private var _constraintColumns : Array;
		/**
		 *  @private
		 */
		private var _constraintRows : Array;

		/**
		 *  @private
		 */
		function get usePadding () : Boolean;
		/**
		 *  @copy mx.containers.utilityClasses.IConstraintLayout#constraintColumns
		 */
		public function get constraintColumns () : Array;
		/**
		 *  @private
		 */
		public function set constraintColumns (value:Array) : void;
		/**
		 *  @copy mx.containers.utilityClasses.IConstraintLayout#constraintRows
		 */
		public function get constraintRows () : Array;
		/**
		 *  @private
		 */
		public function set constraintRows (value:Array) : void;

		/**
		 *  Constructor.
		 */
		public function Canvas ();
		/**
		 *  Calculates the preferred minimum and preferred maximum sizes
		 */
		protected function measure () : void;
		/**
		 *  Sets the size of each child of the container.
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
	}
}