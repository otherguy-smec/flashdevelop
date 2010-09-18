﻿package mx.binding
{
	import flash.events.Event;
	import mx.core.IRepeaterClient;
	import mx.core.mx_internal;

	/**
	 *  @private
	 */
	public class RepeatableBinding extends Binding
	{
		/**
		 *  Create a Binding object
		 */
		public function RepeatableBinding (document:Object, srcFunc:Function, destFunc:Function, destString:String);
		/**
		 *  Execute the binding.
		 */
		public function execute (o:Object = null) : void;
		/**
		 *  @private
		 */
		private function recursivelyProcessIDArray (o:Object) : void;
		/**
		 *  The only reason a Binding listens to an event
		 */
		public function eventHandler (event:Event) : void;
	}
}