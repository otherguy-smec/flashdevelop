﻿package mx.containers.utilityClasses
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import mx.core.IInvalidating;
	import mx.core.mx_internal;
	import mx.core.IMXMLObject;
	import flash.events.EventDispatcher;

	/**
	 *  ConstraintRow class partitions an absolutely
	 */
	public class ConstraintRow extends EventDispatcher implements IMXMLObject
	{
		local var contentSize : Boolean;
		/**
		 *  @private
		 */
		private var _container : IInvalidating;
		/**
		 *  @private
		 */
		local var _height : Number;
		/**
		 *  @private
		 */
		private var _explicitHeight : Number;
		/**
		 *  @private
		 */
		private var _id : String;
		/**
		 *  @private
		 */
		private var _explicitMaxHeight : Number;
		/**
		 *  @private
		 */
		private var _explicitMinHeight : Number;
		/**
		 *  @private
		 */
		private var _percentHeight : Number;
		private var _y : Number;

		/**
		 *  The container being partitioned by this ConstraintRow instance.
		 */
		public function get container () : IInvalidating;
		/**
		 *  @private
		 */
		public function set container (value:IInvalidating) : void;
		/**
		 *  Number that specifies the height of the ConstraintRow instance, in pixels,
		 */
		public function get height () : Number;
		/**
		 *  @private
		 */
		public function set height (value:Number) : void;
		/**
		 *  Number that specifies the explicit height of the 
		 */
		public function get explicitHeight () : Number;
		/**
		 *  @private
		 */
		public function set explicitHeight (value:Number) : void;
		/**
		 *  ID of the ConstraintRow instance. This value becomes the instance name 
		 */
		public function get id () : String;
		/**
		 *  @private
		 */
		public function set id (value:String) : void;
		/**
		 *  Number that specifies the maximum height of the ConstraintRow instance,
		 */
		public function get maxHeight () : Number;
		/**
		 *  @private
		 */
		public function set maxHeight (value:Number) : void;
		/**
		 *  Number that specifies the minimum height of the ConstraintRow instance,
		 */
		public function get minHeight () : Number;
		/**
		 *  @private
		 */
		public function set minHeight (value:Number) : void;
		/**
		 *  Number that specifies the height of a component as a percentage
		 */
		public function get percentHeight () : Number;
		/**
		 *  @private
		 */
		public function set percentHeight (value:Number) : void;
		/**
		 *  @private
		 */
		public function get y () : Number;
		/**
		 *  @private
		 */
		public function set y (value:Number) : void;

		/**
		 *  Constructor.
		 */
		public function ConstraintRow ();
		/**
		 *  Called automatically by the MXML compiler when the ConstraintRow
		 */
		public function initialized (document:Object, id:String) : void;
		/**
		 *  Sizes the ConstraintRow
		 */
		public function setActualHeight (h:Number) : void;
	}
}