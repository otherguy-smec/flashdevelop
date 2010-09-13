﻿package mx.rpc.soap
{
	/**
	 * You use a SOAPHeader to specify the headers that need 
	 */
	public class SOAPHeader
	{
		/**
		 * The content to send for the header value. 
		 */
		public var content : Object;
		/**
		 * The qualified name of the SOAP header.
		 */
		public var qname : QName;
		/**
		 * Internal use only. The internal datatype as determined from
		 */
		public var xmlType : QName;
		/**
		 * Specifies whether the header must be understood by the endpoint. If
		 */
		public var mustUnderstand : Boolean;
		/**
		 * Specifies the URI for the role that this header is intended in a 
		 */
		public var role : String;

		/**
		 * Constructs a new SOAPHeader. The qualified name and content for the
		 */
		public function SOAPHeader (qname:QName, content:Object);
		/**
		 * @private
		 */
		public function toString () : String;
	}
}