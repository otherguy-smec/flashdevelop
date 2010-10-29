﻿package fl.video
{
	import flash.events.Event;
	import flash.events.ErrorEvent;

	/**
	 * Flash<sup>&#xAE;</sup> Player dispatches a SkinErrorEvent object when there is an 
	 */
	public class SkinErrorEvent extends ErrorEvent
	{
		/**
		 * Defines the value of the 
		 */
		public static const SKIN_ERROR : String = "skinError";

		/**
		 * Creates an Event object that contains information about <code>skinError</code> events. 
		 */
		public function SkinErrorEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, text:String = "");
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}