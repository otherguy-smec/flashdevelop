﻿package fl.video
{
	import flash.net.*;
	import flash.events.TimerEvent;
	import flash.events.NetStatusEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	/**
	 * The NCManagerNative class is a subclass of the NCManager class and supports 
	 */
	public class NCManagerNative extends NCManager implements INCManager
	{
		/**
		 * Length of the stream, in milliseconds. After the <code>VideoPlayer.ncConnected()</code> method
		 */
		public function get streamLength () : Number;

		/**
		 * Creates a new NCManagerNative instance.
		 */
		public function NCManagerNative ();
		/**
		 * Overridden to create ConnectClientNative instead of ConnectClient.
		 */
		function connectRTMP () : Boolean;
		/**
		 * Overridden to avoid call to getStreamLength
		 */
		function onConnected (p_nc:NetConnection, p_bw:Number) : void;
		/**
		 * overriden to call run() when _autoSenseBW is on, and to immediately
		 */
		function connectOnStatus (e:NetStatusEvent) : void;
		/**
		 * netStatus event listener when reconnecting
		 */
		function reconnectOnStatus (e:NetStatusEvent) : void;
	}
}