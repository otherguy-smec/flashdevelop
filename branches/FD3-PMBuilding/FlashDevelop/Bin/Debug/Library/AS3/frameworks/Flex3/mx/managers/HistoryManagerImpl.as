﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.events.StatusEvent;
	import flash.events.TimerEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import mx.core.ApplicationGlobals;
	import mx.core.mx_internal;
	import mx.core.Singleton;
	import mx.events.BrowserChangeEvent;
	import mx.managers.BrowserManager;
	import mx.managers.IHistoryManagerClient;
	import mx.managers.HistoryManagerGlobals;

	/**
	 *  @private
	 */
	public class HistoryManagerImpl implements IHistoryManager
	{
		/**
		 *  @private
		 */
		private static const HANDSHAKE_INTERVAL : int = 500;
		/**
		 *  @private
		 */
		private static const MAX_HANDSHAKE_TRIES : int = 100;
		/**
		 *  @private
		 */
		private static const ID_NAME_SEPARATOR : String = "-";
		/**
		 *  @private
		 */
		private static const NAME_VALUE_SEPARATOR : String = "=";
		/**
		 *  @private
		 */
		private static const PROPERTY_SEPARATOR : String = "&";
		/**
		 *  @private
		 */
		private static var systemManager : ISystemManager;
		/**
		 *  @private
		 */
		private static var instance : IHistoryManager;
		/**
		 *  @private
		 */
		private static var appID : String;
		/**
		 *  @private
		 */
		private static var historyURL : String;
		/**
		 *  @Private
		 */
		private var registeredObjects : Array;
		/**
		 *  @private
		 */
		private var registrationMap : Dictionary;
		/**
		 *  @private
		 */
		private var pendingStates : Object;
		/**
		 *  @private
		 */
		private var pendingQueryString : String;

		/**
		 *  @private
		 */
		public static function getInstance () : IHistoryManager;
		/**
		 *  @private
		 */
		public function HistoryManagerImpl ();
		/**
		 *  Registers an object with the HistoryManager.
		 */
		public function register (obj:IHistoryManagerClient) : void;
		/**
		 *  @private
		 */
		private function getPath (obj:IHistoryManagerClient) : String;
		/**
		 *  @private
		 */
		private function calcCRC (s:String) : String;
		/**
		 *  @private
		 */
		private function updateCRC (crc:uint, byte:uint) : uint;
		/**
		 *  @private
		 */
		private function calcDepth (path:String) : int;
		/**
		 *  @private
		 */
		private function depthCompare (a:Object, b:Object) : int;
		/**
		 *  @private
		 */
		private function getRegistrationInfo (obj:IHistoryManagerClient) : RegistrationInfo;
		/**
		 *  Unregisters an object with the HistoryManager.
		 */
		public function unregister (obj:IHistoryManagerClient) : void;
		/**
		 *  Saves the application's current state so it can be restored later.
		 */
		public function save () : void;
		/**
		 *  @private
		 */
		private function submitQuery () : void;
		/**
		 *  @private
		 */
		public function browserURLChangeHandler (event:BrowserChangeEvent) : void;
		private function parseString (s:String) : Object;
		public function registered () : void;
		public function registerHandshake () : void;
		public function load (stateVars:Object) : void;
		public function loadInitialState () : void;
	}
	/**
	 *  @private
	 */
	internal class RegistrationInfo
	{
		/**
		 *  @private
		 */
		public var crc : String;
		/**
		 *  @private
		 */
		public var depth : int;

		/**
		 *  Constructor.
		 */
		public function RegistrationInfo (crc:String, depth:int);
	}
}