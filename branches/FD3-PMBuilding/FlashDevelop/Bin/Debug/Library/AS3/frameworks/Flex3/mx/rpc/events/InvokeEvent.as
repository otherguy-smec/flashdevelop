﻿package mx.rpc.events
{
	import flash.events.Event;
	import mx.messaging.messages.IMessage;
	import mx.rpc.AsyncToken;

	/**
	 * The event that indicates an RPC operation has been invoked.
	 */
	public class InvokeEvent extends AbstractEvent
	{
		/**
		 * The INVOKE event type.
		 */
		public static const INVOKE : String = "invoke";

		/**
		 * Create a new InvokeEvent.
		 */
		public function InvokeEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, token:AsyncToken = null, message:IMessage = null);
		/**
		 * @private
		 */
		public static function createEvent (token:AsyncToken = null, message:IMessage = null) : InvokeEvent;
		/**
		 * Because this event can be re-dispatched we have to implement clone to
		 */
		public function clone () : Event;
		/**
		 * Returns a string representation of the InvokeEvent.
		 */
		public function toString () : String;
	}
}