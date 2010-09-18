﻿package mx.messaging.errors
{
	/**
	 *  This error is thrown when no Channel is available to send messages.
	 */
	public class NoChannelAvailableError extends MessagingError
	{
		/**
		 *  Constructs a new instance of the NoChannelAvailableError with the specified message.
		 */
		public function NoChannelAvailableError (msg:String);
	}
}