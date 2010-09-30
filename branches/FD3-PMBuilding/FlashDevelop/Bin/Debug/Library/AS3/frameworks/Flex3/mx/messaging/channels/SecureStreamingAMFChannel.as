﻿package mx.messaging.channels
{
	/**
	 *  The SecureStreamingAMFChannel class is identical to the StreamingAMFChannel 
	 */
	public class SecureStreamingAMFChannel extends StreamingAMFChannel
	{
		/**
		 *  Returns the protocol for this channel (https).
		 */
		public function get protocol () : String;

		/**
		 *  Creates an new SecureStreamingAMFChannel instance.
		 */
		public function SecureStreamingAMFChannel (id:String = null, uri:String = null);
	}
}