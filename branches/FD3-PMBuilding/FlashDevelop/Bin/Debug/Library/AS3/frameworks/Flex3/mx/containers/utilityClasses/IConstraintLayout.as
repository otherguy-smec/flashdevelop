﻿package mx.containers.utilityClasses
{
	/**
	 *  IConstraintLayout is a marker interface that indicates that a container
	 */
	public interface IConstraintLayout
	{
		/**
		 *  An Array of ConstraintColumn instances that partition this container.
		 */
		public function get constraintColumns () : Array;
		/**
		 *  @private
		 */
		public function set constraintColumns (value:Array) : void;
		/**
		 *  An Array of ConstraintRow instances that partition this container.
		 */
		public function get constraintRows () : Array;
		/**
		 *  @private
		 */
		public function set constraintRows (value:Array) : void;

	}
}