﻿package mx.controls.videoClasses
{
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.net.NetConnection;
	import flash.net.ObjectEncoding;
	import flash.net.Responder;
	import flash.utils.Timer;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  @private
	 */
	public class NCManager implements INCManager
	{
		/**
		 *  Default connection timeout in milliseconds.
		 */
		public static const DEFAULT_TIMEOUT : Number = 60000;
		/**
		 *  @private
		 */
		private static const DEFAULT_NC_TIMEOUT : uint = 1500;
		/**
		 *  @private
		 */
		private static var RTMP_CONN : Array;
		/**
		 * <p>fallbackServerName is exposed in two ways:</p>
		 */
		public var fallbackServerName : String;
		/**
		 *  @private
		 */
		private var owner : VideoPlayer;
		/**
		 *  @private
		 */
		private var contentPath : String;
		/**
		 *  @private
		 */
		private var protocol : String;
		/**
		 *  @private
		 */
		private var serverName : String;
		/**
		 *  @private
		 */
		private var portNumber : String;
		/**
		 *  @private
		 */
		private var wrappedURL : String;
		/**
		 *  @private
		 */
		private var appName : String;
		/**
		 *  @private
		 */
		private var streams : Array;
		/**
		 *  @private
		 */
		private var _isRTMP : int;
		/**
		 *  @private
		 */
		private var connectionTimer : Timer;
		/**
		 *  @private
		 */
		private var autoSenseBW : Boolean;
		/**
		 *  @private
		 */
		public var payload : uint;
		/**
		 *  @private
		 */
		private var ncURI : String;
		/**
		 *  @private
		 */
		private var ncConnected : Boolean;
		/**
		 *  @private
		 */
		public var tryNC : Array;
		/**
		 *  @private
		 */
		private var tryNCTimer : Timer;
		/**
		 *  @private
		 */
		private var connTypeCounter : uint;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _timeout : uint;
		/**
		 *  @private
		 */
		private var _bitrate : Number;
		/**
		 *  @private
		 */
		private var _netConnection : NetConnection;
		/**
		 *  @private
		 */
		private var _streamName : String;
		/**
		 *  @private
		 */
		private var _streamLength : Number;
		/**
		 *  @private
		 */
		private var _streamWidth : Number;
		/**
		 *  @private
		 */
		private var _streamHeight : Number;

		/**
		 *  @see INCManager#timeout
		 */
		public function get timeout () : uint;
		public function set timeout (t:uint) : void;
		/**
		 *  For RTMP streams, returns value calculated from autodetection,
		 */
		public function get bitrate () : Number;
		/**
		 *  This value is only used with progressive download (HTTP), with
		 */
		public function set bitrate (b:Number) : void;
		/**
		 *  @see INCManager#videoPlayer
		 */
		public function get videoPlayer () : VideoPlayer;
		/**
		 *  @private
		 */
		public function set videoPlayer (value:VideoPlayer) : void;
		/**
		 *  @see INCManagernetConnection
		 */
		public function get netConnection () : NetConnection;
		/**
		 *  @see INCManager#streamName
		 */
		public function get streamName () : String;
		/**
		 *  @see INCManager#streamLength
		 */
		public function get streamLength () : Number;
		/**
		 *  @see INCManager#streamWidth
		 */
		public function get streamWidth () : Number;
		/**
		 *  @see INCManager#streamHeight
		 */
		public function get streamHeight () : Number;

		/**
		 *  @private
		 */
		public function NCManager ();
		/**
		 *  @see INCManager#isRTMP
		 */
		public function isRTMP () : Boolean;
		/**
		 *  @see INCManager#connectToURL()
		 */
		public function connectToURL (url:String) : Boolean;
		/**
		 *  @see INCManager#connectAgain()
		 */
		public function connectAgain () : Boolean;
		/**
		 * INCManager#reconnect
		 */
		public function reconnect () : void;
		/**
		 *  @see INCManager#close
		 */
		public function close () : void;
		/**
		 *  @private
		 */
		private function initNCInfo () : void;
		private function initOtherInfo () : void;
		/**
		 *  matches bitrate with stream
		 */
		private function bitrateMatch () : void;
		/**
		 *  <p>Parses URL to determine if it is http or rtmp.  If it is rtmp,
		 */
		private function parseURL (url:String) : Object;
		/**
		 *  @private
		 */
		private function connectHTTP () : Boolean;
		/**
		 *  @private
		 */
		private function connectRTMP () : Boolean;
		/**
		 *  @private
		 */
		private function nextConnect (event:Event) : void;
		/**
		 *  @private
		 */
		private function cleanConns () : void;
		/**
		 *  @private
		 */
		private function tryFallBack () : void;
		/**
		 *  @private
		 */
		public function onReconnected () : void;
		/**
		 *  @private
		 */
		public function onConnected (p_nc:NetConnection, p_bw:Number) : void;
		/**
		 *  @private
		 */
		public function connectOnStatus (event:NetStatusEvent) : void;
		/**
		 *  @private
		 */
		public function reconnectOnStatus (event:NetStatusEvent) : void;
		/**
		 *  @private
		 */
		public function disconnectOnStatus (event:NetStatusEvent) : void;
		/**
		 *  @private
		 */
		private function getStreamLengthResult (length:Number) : void;
		/**
		 *  @private
		 */
		private function getStreamLengthStatus (item:Object) : void;
		/**
		 *  @private
		 */
		private function onFCSConnectTimeOut (event:Event) : void;
		/**
		 *  @private     
		 */
		private function canReuseOldConnection (parseResults:Object) : Boolean;
	}
}