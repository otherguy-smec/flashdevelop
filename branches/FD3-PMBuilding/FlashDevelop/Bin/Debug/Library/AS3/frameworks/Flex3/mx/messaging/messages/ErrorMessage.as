﻿package mx.messaging.messages
{
	/**
	 *  The ErrorMessage class is used to report errors within the messaging system.
	 */
	public class ErrorMessage extends AcknowledgeMessage
	{
		/**
		 *  If a message may not have been delivered, the <code>faultCode</code> will
		 */
		public static const MESSAGE_DELIVERY_IN_DOUBT : String = "Client.Error.DeliveryInDoubt";
		/**
		 *  Header name for the retryable hint header.
		 */
		public static const RETRYABLE_HINT_HEADER : String = "DSRetryableErrorHint";
		/**
		 *  The fault code for the error.
		 */
		public var faultCode : String;
		/**
		 *  A simple description of the error.
		 */
		public var faultString : String;
		/**
		 *  Detailed description of what caused the error.
		 */
		public var faultDetail : String;
		/**
		 *  Should a root cause exist for the error, this property contains those details.
		 */
		public var rootCause : Object;
		/**
		 * Extended data that the remote destination has chosen to associate
		 */
		public var extendedData : Object;

		/**
		 *  Constructs an ErrorMessage instance.
		 */
		public function ErrorMessage ();
		/**
		 * @private
		 */
		public function getSmallMessage () : IMessage;
	}
}