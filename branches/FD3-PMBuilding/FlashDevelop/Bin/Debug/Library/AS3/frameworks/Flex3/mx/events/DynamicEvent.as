﻿package mx.events
{
	import flash.events.Event;

	/**
	 *  This subclass of Event is dynamic, meaning that you can set
	 */
	public dynamic class DynamicEvent extends Event
	{
		/**
		 *  Constructor.
		 */
		public function DynamicEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}