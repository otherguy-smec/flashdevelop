﻿package mx.events
{
	import flash.events.Event;
	import mx.events.PropertyChangeEventKind;

	/**
	 * The PropertyChangeEvent class represents the event object 
	 */
	public class PropertyChangeEvent extends Event
	{
		/**
		 *  The <code>PropertyChangeEvent.PROPERTY_CHANGE</code> constant defines the value of the 
		 */
		public static const PROPERTY_CHANGE : String = "propertyChange";
		/**
		 *  Specifies the kind of change.
		 */
		public var kind : String;
		/**
		 *  The value of the property after the change.
		 */
		public var newValue : Object;
		/**
		 *  The value of the property before the change.
		 */
		public var oldValue : Object;
		/**
		 *  A String, QName, or int specifying the property that changed.
		 */
		public var property : Object;
		/**
		 *  The object that the change occured on.
		 */
		public var source : Object;

		/**
		 *  Returns a new PropertyChangeEvent of kind
		 */
		public static function createUpdateEvent (source:Object, property:Object, oldValue:Object, newValue:Object) : PropertyChangeEvent;
		/**
		 *  Constructor.
		 */
		public function PropertyChangeEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, kind:String = null, property:Object = null, oldValue:Object = null, newValue:Object = null, source:Object = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}