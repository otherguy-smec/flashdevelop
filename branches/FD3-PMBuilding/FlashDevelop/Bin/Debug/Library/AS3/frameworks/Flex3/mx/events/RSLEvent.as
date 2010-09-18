﻿package mx.events
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;

	/**
	 *  The RSLEvent class represents an event object used by the 
	 */
	public class RSLEvent extends ProgressEvent
	{
		/**
		 *  Dispatched when the RSL has finished downloading. 	
		 */
		public static const RSL_COMPLETE : String = "rslComplete";
		/**
		 *  Dispatched when there is an error downloading the RSL.
		 */
		public static const RSL_ERROR : String = "rslError";
		/**
		 *  Dispatched when the RSL is downloading.
		 */
		public static const RSL_PROGRESS : String = "rslProgress";
		/**
		 *  The error message if the type is RSL_ERROR; otherwise, it is null;
		 */
		public var errorText : String;
		/**
		 *  The index number of the RSL currently being downloaded.
		 */
		public var rslIndex : int;
		/**
		 *  The total number of RSLs being downloaded by the preloader
		 */
		public var rslTotal : int;
		/**
		 *  The URLRequest object that represents the location
		 */
		public var url : URLRequest;

		/**
		 *  Constructor.
		 */
		public function RSLEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, bytesLoaded:int = -1, bytesTotal:int = -1, rslIndex:int = -1, rslTotal:int = -1, url:URLRequest = null, errorText:String = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}