﻿package fl.video
{
	import flash.display.DisplayObject;
	import flash.events.Event;

	/**
	 * Type for the <code>captionTargetCreated</code> event, dispatched after the
	 */
	public class CaptionTargetEvent extends Event
	{
		/**
		 * The <code>CaptionTargetEvent.CAPTION_TARGET_CREATED</code> constant defines the value of the 
		 */
		public static const CAPTION_TARGET_CREATED : String = "captionTargetCreated";
		private var _captionTarget : DisplayObject;

		/**
		 * The caption target from the FLVPlaybackCaptioning instance property of the
		 */
		public function get captionTarget () : DisplayObject;
		/**
		 * @private (setter)
		 */
		public function set captionTarget (d:DisplayObject) : void;

		/**
		 * Creates an Event object that contains information about caption target events.
		 */
		public function CaptionTargetEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, captionTarget:DisplayObject = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}