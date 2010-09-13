﻿package mx.rpc.soap
{
	import mx.rpc.wsdl.WSDLOperation;
	import mx.rpc.xml.SchemaConstants;
	import mx.rpc.xml.IXMLEncoder;

	/**
	 * An ISOAPEncoder is used to create SOAP 1.1 formatted requests for a web
	 */
	public interface ISOAPEncoder extends IXMLEncoder
	{
		/**
		 * Determines whether the encoder should ignore whitespace when
		 */
		public function get ignoreWhitespace () : Boolean;
		public function set ignoreWhitespace (value:Boolean) : void;
		/**
		 * A WSDLOperation defines the SOAP binding styles and specifies how to
		 */
		public function get wsdlOperation () : WSDLOperation;
		public function set wsdlOperation (value:WSDLOperation) : void;

		/**
		 * Creates a SOAP-encoded request to an operation from the given input
		 */
		public function encodeRequest (args:* = null, headers:Array = null) : XML;
	}
}