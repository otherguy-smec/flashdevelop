﻿package mx.logging
{
	import flash.events.EventDispatcher;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  The logger that is used within the logging framework.
	 */
	public class LogLogger extends EventDispatcher implements ILogger
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _category : String;

		/**
		 *  The category this logger send messages for.
		 */
		public function get category () : String;

		/**
		 *  Constructor.
		 */
		public function LogLogger (category:String);
		/**
		 *  @inheritDoc
		 */
		public function log (level:int, msg:String, ...rest) : void;
		/**
		 *  @inheritDoc
		 */
		public function debug (msg:String, ...rest) : void;
		/**
		 *  @inheritDoc
		 */
		public function error (msg:String, ...rest) : void;
		/**
		 *  @inheritDoc
		 */
		public function fatal (msg:String, ...rest) : void;
		/**
		 *  @inheritDoc
		 */
		public function info (msg:String, ...rest) : void;
		/**
		 *  @inheritDoc
		 */
		public function warn (msg:String, ...rest) : void;
	}
}