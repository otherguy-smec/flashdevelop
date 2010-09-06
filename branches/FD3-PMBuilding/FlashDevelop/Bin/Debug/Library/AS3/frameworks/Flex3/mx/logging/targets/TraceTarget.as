﻿package mx.logging.targets
{
	import mx.core.mx_internal;

	/**
	 *  Provides a logger target that uses the global <code>trace()</code> method to output log messages.
	 */
	public class TraceTarget extends LineFormattedTarget
	{
		/**
		 *  Constructor.
		 */
		public function TraceTarget ();
		/**
		 *  @private
		 */
		function internalLog (message:String) : void;
	}
}