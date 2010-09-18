﻿package mx.messaging.channels
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import mx.core.mx_internal;
	import mx.logging.Log;
	import mx.messaging.Channel;
	import mx.messaging.ConsumerMessageDispatcher;
	import mx.messaging.MessageAgent;
	import mx.messaging.MessageResponder;
	import mx.messaging.events.ChannelFaultEvent;
	import mx.messaging.messages.AcknowledgeMessage;
	import mx.messaging.messages.CommandMessage;
	import mx.messaging.messages.IMessage;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import flash.utils.Timer;
	import mx.core.mx_internal;
	import mx.logging.Log;
	import mx.logging.ILogger;
	import mx.messaging.MessageAgent;
	import mx.messaging.MessageResponder;
	import mx.messaging.channels.PollingChannel;
	import mx.messaging.events.ChannelFaultEvent;
	import mx.messaging.events.MessageEvent;
	import mx.messaging.messages.IMessage;
	import mx.messaging.messages.AcknowledgeMessage;
	import mx.messaging.messages.CommandMessage;
	import mx.messaging.messages.ErrorMessage;
	import mx.messaging.messages.MessagePerformanceUtils;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  The PollingChannel class provides the polling behavior that all polling channels in the messaging
	 */
	public class PollingChannel extends Channel
	{
		/**
		 *  @private 
		 */
		local var _pollingInterval : int;
		/**
		 *  @private
		 */
		local var _shouldPoll : Boolean;
		/**
		 *  @private
		 */
		private var _pollingRef : int;
		/**
		 *  @private
		 */
		local var pollOutstanding : Boolean;
		/**
		 *  @private 
		 */
		local var _timer : Timer;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _piggybackingEnabled : Boolean;
		/**
		 *  @private
		 */
		private var _pollingEnabled : Boolean;
		/**
		 * Define the default Polling Interval as 3000ms
		 */
		private static const DEFAULT_POLLING_INTERVAL : int = 3000;

		/**
		 *  @private
		 */
		protected function get internalPiggybackingEnabled () : Boolean;
		/**
		 *  @private
		 */
		protected function set internalPiggybackingEnabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		protected function get internalPollingEnabled () : Boolean;
		/**
		 *  @private
		 */
		protected function set internalPollingEnabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		function get internalPollingInterval () : Number;
		/**
		 *  @private
		 */
		function set internalPollingInterval (value:Number) : void;
		/**
		 *  @private
		 */
		function get realtime () : Boolean;
		/**
		 *  @private
		 */
		function get timerRunning () : Boolean;

		/**
		 *  Creates a new PollingChannel instance with the specified id. Once a PollingChannel is
		 */
		public function PollingChannel (id:String = null, uri:String = null);
		/**
		 *  Sends the specified message to its target destination.
		 */
		public function send (agent:MessageAgent, message:IMessage) : void;
		/**
		 *  @private
		 */
		protected function connectFailed (event:ChannelFaultEvent) : void;
		/**
		 *  @private
		 */
		protected function getMessageResponder (agent:MessageAgent, msg:IMessage) : MessageResponder;
		/**
		 *  @private 
		 */
		protected function internalDisconnect (rejected:Boolean = false) : void;
		/**
		 *  Enables polling based on the number of times <code>enablePolling()</code>
		 */
		public function enablePolling () : void;
		/**
		 *  Disables polling based on the number of times <code>enablePolling()</code>
		 */
		public function disablePolling () : void;
		/**
		 *  Initiates a poll operation if there are consumers subscribed to this channel, 
		 */
		public function poll () : void;
		/**
		 *  @private
		 */
		function pollFailed (rejected:Boolean = false) : void;
		/**
		 *  @private
		 */
		function stopPolling () : void;
		/**
		 *  @private
		 */
		protected function applyPollingSettings (settings:XML) : void;
		/**
		 *  @private
		 */
		protected function getPollSyncMessageResponder (agent:MessageAgent, msg:CommandMessage) : MessageResponder;
		/**
		 *  @private
		 */
		protected function getDefaultMessageResponder (agent:MessageAgent, msg:IMessage) : MessageResponder;
		/**
		 *  @private 
		 */
		protected function internalPoll (event:Event = null) : void;
		/**
		 *  @private
		 */
		protected function startPolling () : void;
		/**
		 *  @private
		 */
		protected function timerRequired () : Boolean;
	}
	/**
	 *  @private
	 */
	internal class PollCommandMessageResponder extends MessageResponder
	{
		/**
		 *  @private
		 */
		private var _log : ILogger;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;

		/**
		 *  @private 
		 */
		public function PollCommandMessageResponder (agent:MessageAgent, msg:IMessage, channel:PollingChannel, log:ILogger);
		/**
		 *  @private
		 */
		protected function resultHandler (msg:IMessage) : void;
		/**
		 *  @private
		 */
		protected function statusHandler (msg:IMessage) : void;
	}
}