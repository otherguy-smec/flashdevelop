﻿package mx.messaging.messages
{
	/**
	 *  SOAPMessages are similar to HTTPRequestMessages. However,
	 */
	public class SOAPMessage extends HTTPRequestMessage
	{
		/**
		 *  The HTTP header that stores the SOAP action for the SOAPMessage.
		 */
		public static const SOAP_ACTION_HEADER : String = "SOAPAction";

		/**
		 *  Constructs an uninitialized SOAPMessage.
		 */
		public function SOAPMessage ();
		/**
		 *  Provides access to the name of the remote method/operation that
		 */
		public function getSOAPAction () : String;
		/**
		 *  @private
		 */
		public function setSOAPAction (value:String) : void;
	}
}