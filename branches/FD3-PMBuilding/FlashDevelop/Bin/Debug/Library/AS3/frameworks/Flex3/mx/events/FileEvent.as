﻿package mx.events
{
	import flash.events.Event;
	import flash.filesystem.File;

	/**
	 *  The FileEvent class represents event objects that are specific to
	 */
	public class FileEvent extends Event
	{
		/**
		 *  The FileEvent.DIRECTORY_CHANGE constant defines the value of the
		 */
		public static const DIRECTORY_CHANGE : String = "directoryChange";
		/**
		 *  The FileEvent.DIRECTORY_CHANGING constant defines the value of the
		 */
		public static const DIRECTORY_CHANGING : String = "directoryChanging";
		/**
		 *  The FileEvent.DIRECTORY_OPENING constant defines the value of the
		 */
		public static const DIRECTORY_OPENING : String = "directoryOpening";
		/**
		 *  The FileEvent.DIRECTORY_CLOSING constant defines the value of the
		 */
		public static const DIRECTORY_CLOSING : String = "directoryClosing";
		/**
		 *  The FileEvent.FILE_CHOOSE constant defines the value of the
		 */
		public static const FILE_CHOOSE : String = "fileChoose";
		/**
		 *  The File instance associated with this event.
		 */
		public var file : File;

		/**
		 *  Constructor.
		 */
		public function FileEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, file:File = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}