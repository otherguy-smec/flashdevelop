﻿package mx.rpc.soap
{
	import flash.events.Event;
	import mx.core.mx_internal;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.DirectHTTPChannel;
	import mx.messaging.config.LoaderConfig;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.rpc.AbstractOperation;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncRequest;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.WSDLLoadEvent;
	import mx.rpc.http.HTTPService;
	import mx.rpc.wsdl.WSDL;
	import mx.rpc.wsdl.WSDLLoader;
	import mx.rpc.wsdl.WSDLOperation;
	import mx.rpc.wsdl.WSDLPort;
	import mx.utils.URLUtil;
	import mx.utils.XMLUtil;

	/**
	 * The <code>LoadEvent.LOAD</code> is dispatched when the WSDL
	 */
	[Event(name="load", type="mx.rpc.soap.LoadEvent")] 

	/**
	 * The WebService class provides access to SOAP-based web services on remote
	 */
	public dynamic class WebService extends AbstractWebService
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		private var _wsdlURL : String;
		private var _log : ILogger;
		private var _wsdlFault : Boolean;
		private var _wsdl : mx.rpc.wsdl.WSDL;
		private var _wsdlLoader : WSDLLoader;
		public static const DEFAULT_DESTINATION_HTTP : String = "DefaultHTTP";
		public static const DEFAULT_DESTINATION_HTTPS : String = "DefaultHTTPS";

		function get wsdlFault () : Boolean;
		/**
		 * The location of the WSDL document for this WebService. If you use a
		 */
		public function get wsdl () : String;
		public function set wsdl (w:String) : void;

		/**
		 * Creates a new WebService.  The destination, if specified, should match
		 */
		public function WebService (destination:String = null, rootURL:String = null);
		/**
		 * Returns a Boolean value that indicates whether the WebService is ready to
		 */
		public function canLoadWSDL () : Boolean;
		/**
		 * Returns an Operation of the given name. If the Operation wasn't
		 */
		public function getOperation (name:String) : mx.rpc.AbstractOperation;
		/**
		 * Instructs the WebService to download the WSDL document.  The WebService
		 */
		public function loadWSDL (uri:String = null) : void;
		/**
		 * Represents an instance of WebService as a String, describing
		 */
		public function toString () : String;
		function wsdlFaultHandler (event:FaultEvent) : void;
		function wsdlHandler (event:WSDLLoadEvent) : void;
		/**
		 * @private
		 */
		function deriveHTTPService () : HTTPService;
		/**
		 * Initializes a new Operation.
		 */
		protected function initializeOperation (operation:Operation) : void;
		private function dispatchFault (faultCode:String, faultString:String, faultDetail:String = null) : void;
	}
}