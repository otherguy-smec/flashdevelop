﻿package mx.binding
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	import mx.core.EventPriority;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.utils.DescribeTypeCache;

	/**
	 *  @private
	 */
	public class PropertyWatcher extends Watcher
	{
		/**
		 *  The parent object of this property.
		 */
		private var parentObj : Object;
		/**
		 *  The events that indicate the property has changed
		 */
		protected var events : Object;
		/**
		 *  Storage for the propertyGetter property.
		 */
		protected var propertyGetter : Function;
		/**
		 *  Storage for the propertyName property.
		 */
		private var _propertyName : String;
		/**
		 *	If compiler can't determine bindability from static type,
		 */
		private var useRTTI : Boolean;

		/**
		 *  The name of the property this Watcher is watching.
		 */
		public function get propertyName () : String;

		/**
		 *  Create a PropertyWatcher
		 */
		public function PropertyWatcher (propertyName:String, events:Object, listeners:Array, propertyGetter:Function = null);
		/**
		 *  If the parent has changed we need to update ourselves
		 */
		public function updateParent (parent:Object) : void;
		/**
		 *  @private
		 */
		protected function shallowClone () : Watcher;
		/**
		 *  @private
		 */
		private function addParentEventListeners () : void;
		/**
		 *  @private
		 */
		private function traceInfo () : String;
		/**
		 *  @private
		 */
		private function eventNamesToString () : String;
		/**
		 *  @private
		 */
		private function objectIsEmpty (o:Object) : Boolean;
		/**
		 *  Gets the actual property then updates
		 */
		private function updateProperty () : void;
		/**
		 *  The generic event handler.
		 */
		public function eventHandler (event:Event) : void;
	}
}