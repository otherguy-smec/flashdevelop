﻿package fl.video
{
	import flash.events.Event;
	import flash.geom.Rectangle;

	/**
	 * Event dispatched when the video player is resized and/or laid out. Here are two layout scenarios:
	 */
	public class LayoutEvent extends Event
	{
		/**
		 * Defines the value of the <code>type</code>
		 */
		public static const LAYOUT : String = "layout";
		private var _oldBounds : Rectangle;
		private var _oldRegistrationBounds : Rectangle;

		/**
		 * Indicates the values of the <code>x</code>, <code>y</code>,
		 */
		public function get oldBounds () : Rectangle;
		/**
		 * @private (setter)
		 */
		public function set oldBounds (r:Rectangle) : void;
		/**
		 * Indicates the values of the <code>registrationX</code>, <code>registrationY</code>,
		 */
		public function get oldRegistrationBounds () : Rectangle;
		/**
		 * @private (setter)
		 */
		public function set oldRegistrationBounds (r:Rectangle) : void;

		/**
		 * Creates an Event object that contains information about <code>layout</code> events. 
		 */
		public function LayoutEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, oldBounds:Rectangle = null, oldRegistrationBounds:Rectangle = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}