﻿package mx.events
{
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.events.NativeWindowBoundsEvent;

	/**
	 *  The FlexNativeWindowBoundsEvent is dispatched when the size or location changes for
	 */
	public class FlexNativeWindowBoundsEvent extends NativeWindowBoundsEvent
	{
		/**
		 *  The FlexNativeWindowBoundsEvent.WINDOW_RESIZE constant defines the value of the
		 */
		public static const WINDOW_RESIZE : String = "windowResize";
		/**
		 *  The FlexNativeWindowBoundsEvent.WINDOW_MOVE constant defines the value of the
		 */
		public static const WINDOW_MOVE : String = "windowMove";

		/**
		 *  Constructor.
		 */
		public function FlexNativeWindowBoundsEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, beforeBounds:Rectangle = null, afterBounds:Rectangle = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}