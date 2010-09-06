﻿package mx.messaging.channels
{
	/**
	 *  The SecureStreamingHTTPChannel class is identical to the StreamingHTTPChannel
	 */
	public class SecureStreamingHTTPChannel extends StreamingHTTPChannel
	{
		/**
		 *  Returns the protocol for this channel (https).
		 */
		public function get protocol () : String;

		/**
		 *  Creates an new SecureStreamingHTTPChannel instance.
		 */
		public function SecureStreamingHTTPChannel (id:String = null, uri:String = null);
	}
}