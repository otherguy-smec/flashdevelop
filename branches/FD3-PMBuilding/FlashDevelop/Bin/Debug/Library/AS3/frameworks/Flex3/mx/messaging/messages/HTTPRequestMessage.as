﻿package mx.messaging.messages
{
	/**
	 *  HTTP requests are sent to the HTTP endpoint using this message type.
	 */
	public class HTTPRequestMessage extends AbstractMessage
	{
		/**
		 *  Indicates the content type of this message.
		 */
		public var contentType : String;
		/**
		 *  Contains specific HTTP headers that should be placed on the request made
		 */
		public var httpHeaders : Object;
		/**
		 * Only used when going through the proxy, should the proxy 
		 */
		public var recordHeaders : Boolean;
		/**
		 *  Contains the final destination for this request.
		 */
		public var url : String;
		/**
		 *  @private
		 */
		private var _method : String;
		/**
		 *  Indicates that the content of this message is XML.
		 */
		public static const CONTENT_TYPE_XML : String = "application/xml";
		/**
		 *  Indicates that the content of this message is a form.
		 */
		public static const CONTENT_TYPE_FORM : String = "application/x-www-form-urlencoded";
		/**
		 *  Indicates that the content of this message is XML meant for a SOAP
		 */
		public static const CONTENT_TYPE_SOAP_XML : String = "text/xml; charset=utf-8";
		/**
		 *  Indicates that the method used for this request should be "post".
		 */
		public static const POST_METHOD : String = "POST";
		/**
		 *  Indicates that the method used for this request should be "get".
		 */
		public static const GET_METHOD : String = "GET";
		/**
		 *  Indicates that the method used for this request should be "put".
		 */
		public static const PUT_METHOD : String = "PUT";
		/**
		 *  Indicates that the method used for this request should be "head".
		 */
		public static const HEAD_METHOD : String = "HEAD";
		/**
		 *  Indicates that the method used for this request should be "delete".
		 */
		public static const DELETE_METHOD : String = "DELETE";
		/**
		 *  Indicates that the method used for this request should be "options".
		 */
		public static const OPTIONS_METHOD : String = "OPTIONS";
		/**
		 *  Indicates that the method used for this request should be "trace".
		 */
		public static const TRACE_METHOD : String = "TRACE";
		/**
		 *  @private
		 */
		private static const VALID_METHODS : String = "POST,PUT,GET,HEAD,DELETE,OPTIONS,TRACE";

		/**
		 *  Indicates what method should be used for the request.
		 */
		public function get method () : String;
		/**
		 *  @private
		 */
		public function set method (value:String) : void;

		/**
		 *  Constructs an uninitialized HTTP request.
		 */
		public function HTTPRequestMessage ();
	}
}