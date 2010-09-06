﻿package mx.managers
{
	import mx.core.Singleton;

	/**
	 *  The BrowserManager is a Singleton manager that acts as
	 */
	public class BrowserManager
	{
		/**
		 *  @private
		 */
		private static var implClassDependency : BrowserManagerImpl;
		/**
		 *  @private
		 */
		private static var instance : IBrowserManager;

		/**
		 *  Returns the sole instance of this Singleton class;
		 */
		public static function getInstance () : IBrowserManager;
	}
}