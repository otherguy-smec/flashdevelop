﻿package mx.controls.treeClasses
{
	import flash.utils.Dictionary;
	import mx.collections.ArrayCollection;
	import mx.collections.CursorBookmark;
	import mx.collections.ICollectionView;
	import mx.collections.IList;
	import mx.collections.IViewCursor;
	import mx.collections.XMLListCollection;
	import mx.controls.menuClasses.IMenuDataDescriptor;
	import mx.utils.UIDUtil;

	/**
	 *  The DefaultDataDescriptor class provides a default implementation for
	 */
	public class DefaultDataDescriptor implements ITreeDataDescriptor2
	{
		/**
		 *  @private
		 */
		private var ChildCollectionCache : Dictionary;

		/**
		 *  Constructor.
		 */
		public function DefaultDataDescriptor ();
		/**
		 *  Provides access to a node's children. Returns a collection
		 */
		public function getChildren (node:Object, model:Object = null) : ICollectionView;
		/**
		 *  Determines if the node actually has children. 
		 */
		public function hasChildren (node:Object, model:Object = null) : Boolean;
		/**
		 *  Tests a node for termination.
		 */
		public function isBranch (node:Object, model:Object = null) : Boolean;
		/**
		 *  Returns a node's data.
		 */
		public function getData (node:Object, model:Object = null) : Object;
		/**
		 *  Add a child node to a node at the specified index. 
		 */
		public function addChildAt (parent:Object, newChild:Object, index:int, model:Object = null) : Boolean;
		/**
		 *  Removes the child node from a node at the specified index.
		 */
		public function removeChildAt (parent:Object, child:Object, index:int, model:Object = null) : Boolean;
		/**
		 *  Returns the type identifier of a node.
		 */
		public function getType (node:Object) : String;
		/**
		 *  Returns whether the node is enabled.
		 */
		public function isEnabled (node:Object) : Boolean;
		/**
		 *  Sets the value of the field or attribute in the data provider
		 */
		public function setEnabled (node:Object, value:Boolean) : void;
		/**
		 *  Returns whether the node is toggled.
		 */
		public function isToggled (node:Object) : Boolean;
		/**
		 *  Sets the value of the field or attribute in the data provider
		 */
		public function setToggled (node:Object, value:Boolean) : void;
		/**
		 *  Returns the name of the radio button group to which
		 */
		public function getGroupName (node:Object) : String;
		/**
		 *  @inheritDoc
		 */
		public function getHierarchicalCollectionAdaptor (hierarchicalData:ICollectionView, uidFunction:Function, openItems:Object, model:Object = null) : ICollectionView;
		/**
		 *  @inheritDoc
		 */
		public function getNodeDepth (node:Object, iterator:IViewCursor, model:Object = null) : int;
		/**
		 *  @inheritDoc
		 */
		public function getParent (node:Object, collection:ICollectionView, model:Object = null) : Object;
	}
}