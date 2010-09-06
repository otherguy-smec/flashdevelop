﻿package mx.collections
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.utils.getQualifiedClassName;
	import mx.core.IPropertyChangeNotifier;
	import mx.core.mx_internal;
	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;
	import mx.events.PropertyChangeEvent;
	import mx.events.PropertyChangeEventKind;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.ArrayUtil;
	import mx.utils.UIDUtil;

	/**
	 *  Dispatched when the IList has been updated in some way.
	 */
	[Event(name="collectionChange", type="mx.events.CollectionEvent")] 

	/**
	 *  @private
	 */
	public class ArrayList extends EventDispatcher implements IList
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  indicates if events should be dispatched.
		 */
		private var _dispatchEvents : int;
		private var _source : Array;
		private var _uid : String;

		/**
		 *  Get the number of items in the list.  An ArrayList should always
		 */
		public function get length () : int;
		/**
		 *  The source array for this ArrayList.  
		 */
		public function get source () : Array;
		public function set source (s:Array) : void;
		/**
		 *  Provides access to the unique id for this list.
		 */
		public function get uid () : String;
		public function set uid (value:String) : void;

		/**
		 *  Construct a new ArrayList using the specified array as its source.
		 */
		public function ArrayList (source:Array = null);
		/**
		 *  Get the item at the specified index.
		 */
		public function getItemAt (index:int, prefetch:int = 0) : Object;
		/**
		 *  Place the item at the specified index.  
		 */
		public function setItemAt (item:Object, index:int) : Object;
		/**
		 *  Add the specified item to the end of the list.
		 */
		public function addItem (item:Object) : void;
		/**
		 *  Add the item at the specified index.  
		 */
		public function addItemAt (item:Object, index:int) : void;
		/**
		 *  Return the index of the item if it is in the list such that
		 */
		public function getItemIndex (item:Object) : int;
		/**
		 *  Removes the specified item from this list, should it exist.
		 */
		public function removeItem (item:Object) : Boolean;
		/**
		 *  Remove the item at the specified index and return it.  
		 */
		public function removeItemAt (index:int) : Object;
		/**
		 *  Remove all items from the list.
		 */
		public function removeAll () : void;
		/**
		 *  Notify the view that an item has been updated.  
		 */
		public function itemUpdated (item:Object, property:Object = null, oldValue:Object = null, newValue:Object = null) : void;
		/**
		 *  Return an Array that is populated in the same order as the IList
		 */
		public function toArray () : Array;
		/**
		 *  Ensures that only the source property is seralized.
		 */
		public function readExternal (input:IDataInput) : void;
		/**
		 *  Ensures that only the source property is serialized.
		 */
		public function writeExternal (output:IDataOutput) : void;
		/**
		 *  Pretty prints the contents of this ArrayList to a string and returns it.
		 */
		public function toString () : String;
		/**
		 *  Enables event dispatch for this list.
		 */
		private function enableEvents () : void;
		/**
		 *  Disables event dispatch for this list.
		 */
		private function disableEvents () : void;
		/**
		 *  Dispatches a collection event with the specified information.
		 */
		private function internalDispatchEvent (kind:String, item:Object = null, location:int = -1) : void;
		/**
		 *  Called whenever any of the contained items in the list fire an
		 */
		protected function itemUpdateHandler (event:PropertyChangeEvent) : void;
		/**
		 *  If the item is an IEventDispatcher watch it for updates.  
		 */
		protected function startTrackUpdates (item:Object) : void;
		/**
		 *  If the item is an IEventDispatcher stop watching it for updates.
		 */
		protected function stopTrackUpdates (item:Object) : void;
	}
}