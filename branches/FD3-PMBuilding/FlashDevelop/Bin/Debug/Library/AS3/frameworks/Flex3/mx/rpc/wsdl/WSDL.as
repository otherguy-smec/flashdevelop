﻿package mx.rpc.wsdl
{
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.rpc.Fault;
	import mx.rpc.soap.SOAPConstants;
	import mx.rpc.xml.QualifiedResourceManager;
	import mx.rpc.xml.Schema;
	import mx.rpc.xml.SchemaConstants;
	import mx.rpc.xml.SchemaManager;

	/**
	 * Manages a WSDL top-level <code>definitions</code> element. WSDL definitions
	 */
	public class WSDL
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 * Manages WSDL imports.
		 */
		private var importsManager : QualifiedResourceManager;
		/**
		 * Logs warnings encountered while parsing WSDL.
		 */
		private var _log : ILogger;
		/**
		 * Maps a namespace prefix (as a <code>String</code>) to a
		 */
		private var namespaces : Object;
		/**
		 * Provides a static cache of the constants for various versions of XSD.
		 */
		private var _schemaConstants : SchemaConstants;
		/**
		 * A map of target namespaces to XSD Schemas that describe the types 
		 */
		private var _schemaManager : SchemaManager;
		/**
		 * Map to cache a WSDLService by service name. The cache is cleared 
		 */
		private var serviceMap : Object;
		private var _soapConstants : SOAPConstants;
		/**
		 * WSDL target namespace.
		 */
		private var _targetNamespace : Namespace;
		/**
		 * Provides a static cache of the constants for various versions of WSDL.
		 */
		private var _wsdlConstants : WSDLConstants;
		/**
		 * The raw XML representing the WSDL definitions top level element.
		 */
		private var _xml : XML;

		public function get schemaManager () : SchemaManager;
		public function get schemaConstants () : SchemaConstants;
		public function get soapConstants () : SOAPConstants;
		public function get targetNamespace () : Namespace;
		public function get wsdlConstants () : WSDLConstants;
		/**
		 * The raw XML representing the WSDL starting from the top-level
		 */
		public function get xml () : XML;

		/**
		 * Constructs a WSDL from XML. Services and their operations are
		 */
		public function WSDL (xml:XML);
		/**
		 FIXME:
		 */
		public function addImport (targetNamespace:Namespace, wsdl:WSDL) : void;
		public function addSchema (schema:Schema) : void;
		public function getOperation (operationName:String, serviceName:String = null, portName:String = null) : WSDLOperation;
		/**
		 * Locate a port for a service by name. If a serviceName is provided, a
		 */
		public function getPort (serviceName:String = null, portName:String = null) : WSDLPort;
		/**
		 * Search for WSDL service and port by name. If a serviceName is not
		 */
		public function getService (serviceName:String = null, portName:String = null) : WSDLService;
		public function getTypes (targetNamespace:Namespace) : XML;
		/**
		 * Search for a requested service in the definitions XML, including all
		 */
		private function parseService (serviceName:String = null, portName:String = null) : WSDLService;
		/**
		 * Search for a requested port in the given service XML. If a port
		 */
		private function parsePort (service:WSDLService, serviceXML:XML, portName:String = null) : WSDLPort;
		/**
		 * Search for a binding by QName. If a URI is not specified, the
		 */
		private function parseBinding (bindingQName:QName) : WSDLBinding;
		/**
		 * Search for a portType by QName. If a URI is not specified, the
		 */
		private function parsePortType (portTypeQName:QName, portType:WSDLPortType) : Boolean;
		/**
		 * Search for a message by QName. If a URI is not specified, the
		 */
		private function parseMessage (message:WSDLMessage, messageQName:QName, operationName:String, mode:int) : Boolean;
		/**
		 * Returns a WSDL message part based on the name and looks for either an
		 */
		private function parseMessagePart (partXML:XML) : WSDLMessagePart;
		/**
		 * Looks for the SOAP encoding extensions based on the type of WSDL
		 */
		private function parseHeader (operationName:String, headerXML:XML) : WSDLMessage;
		/**
		 * Looks for the SOAP encoding extensions based on the type of WSDL
		 */
		private function parseEncodingExtension (extensionXML:XML, isHeader:Boolean = false, isFault:Boolean = false) : WSDLEncoding;
		/**
		 * A Document-Literal operation may make use of "wrapped" style. If so,
		 */
		private function parseDocumentOperation (operation:WSDLOperation) : void;
		/**
		 * Returns a WSDL message part based on the name and looks for either an
		 */
		private function parseWrappedMessagePart (elementXML:XML) : WSDLMessagePart;
		/**
		 * Determines the WSDL and SOAP versions from the definitions and creates
		 */
		private function processNamespaces () : void;
		private function processSchemas () : void;
	}
}