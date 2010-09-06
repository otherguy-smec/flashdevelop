﻿package mx.messaging.channels
{
	/**
	 *  The SecureHTTPChannel class is identical to the HTTPChannel class except that it uses a
	 */
	public class SecureHTTPChannel extends HTTPChannel
	{
		/**
		 *  Returns the protocol for this channel (https).
		 */
		public function get protocol () : String;

		/**
		 *  Creates an new SecureHTTPChannel instance.
		 */
		public function SecureHTTPChannel (id:String = null, uri:String = null);
	}
}