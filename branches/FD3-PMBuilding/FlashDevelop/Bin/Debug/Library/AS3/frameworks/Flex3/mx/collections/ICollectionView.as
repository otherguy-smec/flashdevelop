﻿package mx.collections
{
	import flash.events.IEventDispatcher;
	import mx.events.CollectionEvent;

	/**
	 *  Dispatched when the ICollectionView has been updated in some way.
	 */
	[Event(name="collectionChange", type="mx.events.CollectionEvent")] 

	/**
	 *  An <code>ICollectionView</code> is a view onto a collection of data.
	 */
	public interface ICollectionView extends IEventDispatcher
	{
		/**
		 *  The number of items in this view.
		 */
		public function get length () : int;
		/**
		 *  A function that the view will use to eliminate items that do not
		 */
		public function get filterFunction () : Function;
		/**
		 *  @private
		 */
		public function set filterFunction (value:Function) : void;
		/**
		 *  The Sort that will be applied to the ICollectionView.
		 */
		public function get sort () : Sort;
		/**
		 *  @private
		 */
		public function set sort (value:Sort) : void;

		/**
		 *  Creates a new IViewCursor that works with this view.
		 */
		public function createCursor () : IViewCursor;
		/**
		 *  Returns whether the view contains the specified object.
		 */
		public function contains (item:Object) : Boolean;
		/**
		 *  Prevents changes to the collection itself and items within the
		 */
		public function disableAutoUpdate () : void;
		/**
		 *  Enables auto-updating.
		 */
		public function enableAutoUpdate () : void;
		/**
		 *  Notifies the view that an item has been updated.
		 */
		public function itemUpdated (item:Object, property:Object = null, oldValue:Object = null, newValue:Object = null) : void;
		/**
		 *  Applies the sort and filter to the view.
		 */
		public function refresh () : Boolean;
	}
}