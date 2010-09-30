﻿package mx.managers
{
	import mx.core.Singleton;
	import mx.core.mx_internal;
	import mx.managers.IHistoryManagerClient;

	/**
	 *  History management lets users navigate through a Flex application
	 */
	public class HistoryManager
	{
		/**
		 *  @private
		 */
		private static var implClassDependency : HistoryManagerImpl;
		/**
		 *  @private
		 */
		private static var _impl : IHistoryManager;

		/**
		 *  @private
		 */
		private static function get impl () : IHistoryManager;

		/**
		 *  DEPRECATED - Initializes the HistoryManager. In general, this does not need to be called
		 */
		public static function initialize (sm:ISystemManager) : void;
		/**
		 *  Registers an object with the HistoryManager.
		 */
		public static function register (obj:IHistoryManagerClient) : void;
		/**
		 *  Unregisters an object with the HistoryManager.
		 */
		public static function unregister (obj:IHistoryManagerClient) : void;
		/**
		 *  Saves the application's current state so it can be restored later.
		 */
		public static function save () : void;
	}
}