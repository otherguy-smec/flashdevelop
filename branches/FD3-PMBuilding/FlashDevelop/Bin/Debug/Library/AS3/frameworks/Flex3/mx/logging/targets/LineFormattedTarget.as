﻿package mx.logging.targets
{
	import mx.core.mx_internal;
	import mx.logging.AbstractTarget;
	import mx.logging.ILogger;
	import mx.logging.LogEvent;

	/**
	 *  All logger target implementations that have a formatted line style output
	 */
	public class LineFormattedTarget extends AbstractTarget
	{
		/**
		 *  The separator string to use between fields (the default is " ")
		 */
		public var fieldSeparator : String;
		/**
		 *  Indicates if the category for this target should added to the trace.
		 */
		public var includeCategory : Boolean;
		/**
		 *  Indicates if the date should be added to the trace.
		 */
		public var includeDate : Boolean;
		/**
		 *  Indicates if the level for the event should added to the trace.
		 */
		public var includeLevel : Boolean;
		/**
		 *  Indicates if the time should be added to the trace.
		 */
		public var includeTime : Boolean;

		/**
		 *  Constructor.
		 */
		public function LineFormattedTarget ();
		/**
		 *  This method handles a <code>LogEvent</code> from an associated logger.
		 */
		public function logEvent (event:LogEvent) : void;
		/**
		 *  @private
		 */
		private function padTime (num:Number, millis:Boolean = false) : String;
		/**
		 *  Descendants of this class should override this method to direct the 
		 */
		function internalLog (message:String) : void;
	}
}