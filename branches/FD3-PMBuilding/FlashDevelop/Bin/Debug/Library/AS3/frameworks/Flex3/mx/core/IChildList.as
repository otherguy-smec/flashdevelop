﻿package mx.core
{
	import flash.display.DisplayObject;
	import flash.geom.Point;

	/**
	 *  The IChildList interface defines the properties and methods
	 */
	public interface IChildList
	{
		/**
		 *  The number of children in this child list.
		 */
		public function get numChildren () : int;

		/**
		 *  Adds a child DisplayObject after the end of this child list.
		 */
		public function addChild (child:DisplayObject) : DisplayObject;
		/**
		 *  Adds a child DisplayObject to this child list at the index specified.
		 */
		public function addChildAt (child:DisplayObject, index:int) : DisplayObject;
		/**
		 *  Removes the specified child DisplayObject from this child list.
		 */
		public function removeChild (child:DisplayObject) : DisplayObject;
		/**
		 *  Removes the child DisplayObject at the specified index
		 */
		public function removeChildAt (index:int) : DisplayObject;
		/**
		 *  Gets the child DisplayObject at the specified index in this child list.
		 */
		public function getChildAt (index:int) : DisplayObject;
		/**
		 *  Gets the child DisplayObject with the specified name
		 */
		public function getChildByName (name:String) : DisplayObject;
		/**
		 *  Gets the index of a specific child in this child list.
		 */
		public function getChildIndex (child:DisplayObject) : int;
		/**
		 *  Changes the index of a particular child in this child list.
		 */
		public function setChildIndex (child:DisplayObject, newIndex:int) : void;
		/**
		 *  Returns an array of DisplayObjects that lie under the specified point
		 */
		public function getObjectsUnderPoint (point:Point) : Array;
		/**
		 *  Determines if a DisplayObject is in this child list,
		 */
		public function contains (child:DisplayObject) : Boolean;
	}
}