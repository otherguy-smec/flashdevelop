﻿package mx.events
{
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 *  The FlexMouseEvent class represents the event object passed to
	 */
	public class FlexMouseEvent extends MouseEvent
	{
		/**
		 *  The <code>FlexMouseEvent.MOUSE_DOWN_OUTSIDE</code> constant defines the value of the
		 */
		public static const MOUSE_DOWN_OUTSIDE : String = "mouseDownOutside";
		/**
		 *  The <code>FlexMouseEvent.MOUSE_WHEEL_OUTSIDE</code> constant defines the value of the
		 */
		public static const MOUSE_WHEEL_OUTSIDE : String = "mouseWheelOutside";

		/**
		 *  Constructor.
		 */
		public function FlexMouseEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, localX:Number = 0, localY:Number = 0, relatedObject:InteractiveObject = null, ctrlKey:Boolean = false, altKey:Boolean = false, shiftKey:Boolean = false, buttonDown:Boolean = false, delta:int = 0);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}