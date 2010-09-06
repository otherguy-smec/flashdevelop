﻿package mx.rpc.events
{
	import flash.events.Event;
	import mx.rpc.wsdl.WSDL;

	/**
	 * The WSDLLoadEvent class represents the event object for the event dispatched 
	 */
	public class WSDLLoadEvent extends XMLLoadEvent
	{
		/**
		 * The full WSDL document.
		 */
		public var wsdl : WSDL;
		/**
		 * The LOAD constant defines the value of the <code>type</code> property of the event object 
		 */
		public static const LOAD : String = "wsdlLoad";

		/**
		 * Constructor.
		 */
		public function WSDLLoadEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = true, wsdl:WSDL = null, location:String = null);
		/**
		 * Returns a copy of this WSDLLoadEvent object.
		 */
		public function clone () : Event;
		/**
		 * Returns a String representation of this WSDLLoadEvent object.
		 */
		public function toString () : String;
		/**
		 * A helper method to create a new WSDLLoadEvent.
		 */
		public static function createEvent (wsdl:WSDL, location:String = null) : WSDLLoadEvent;
	}
}