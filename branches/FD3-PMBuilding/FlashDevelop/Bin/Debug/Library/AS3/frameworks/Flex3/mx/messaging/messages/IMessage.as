﻿package mx.messaging.messages
{
	/**
	 *  This interface defines the contract for message objects.
	 */
	public interface IMessage
	{
		/**
		 *  The body of a message contains the specific data that needs to be 
		 */
		public function get body () : Object;
		/**
		 *  @private
		 */
		public function set body (value:Object) : void;
		/**
		 *  The clientId indicates which client sent the message.
		 */
		public function get clientId () : String;
		/**
		 *  @private
		 */
		public function set clientId (value:String) : void;
		/**
		 *  The message destination.
		 */
		public function get destination () : String;
		/**
		 *  @private
		 */
		public function set destination (value:String) : void;
		/**
		 *  Provides access to the headers of the message.
		 */
		public function get headers () : Object;
		/**
		 *  @private
		 */
		public function set headers (value:Object) : void;
		/**
		 *  The unique id for the message.
		 */
		public function get messageId () : String;
		/**
		 *  @private
		 */
		public function set messageId (value:String) : void;
		/**
		 *  Provides access to the time stamp for the message.
		 */
		public function get timestamp () : Number;
		/**
		 *  @private
		 */
		public function set timestamp (value:Number) : void;
		/**
		 *  The time to live value of a message indicates how long the message
		 */
		public function get timeToLive () : Number;
		/**
		 *  @private
		 */
		public function set timeToLive (value:Number) : void;

		/**
		 *  This method will return a string representation of the message.
		 */
		public function toString () : String;
	}
}