﻿package mx.messaging
{
	import flash.utils.Dictionary;
	import mx.core.mx_internal;
	import mx.logging.Log;
	import mx.messaging.events.MessageEvent;

	/**
	 *  @private
	 */
	public class ConsumerMessageDispatcher
	{
		/**
		 *  @private
		 */
		private static var _instance : ConsumerMessageDispatcher;
		/**
		 *  Lookup table for subscribed Consumer instances; Object<Consumer clientId, Consumer>
		 */
		private const _consumers : Object;
		/**
		 *  Table used to prevent duplicate delivery of messages to a Consumer when multiple ChannelSets are
		 */
		private const _consumerDuplicateMessageBarrier : Object;

		/**
		 *  Returns the sole instance of this singleton class,
		 */
		public static function getInstance () : ConsumerMessageDispatcher;
		/**
		 *  Constructor.
		 */
		public function ConsumerMessageDispatcher ();
		/**
		 *  Registers a Consumer subscription.
		 */
		public function registerSubscription (consumer:AbstractConsumer) : void;
		/**
		 *  Unregisters a Consumer subscription.
		 */
		public function unregisterSubscription (consumer:AbstractConsumer) : void;
		/**
		 *  Handles message events from ChannelSets that Consumers are subscribed over.
		 */
		private function messageHandler (event:MessageEvent) : void;
	}
}