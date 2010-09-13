﻿package mx.rpc.soap.mxml
{
	import mx.core.mx_internal;
	import mx.managers.CursorManager;
	import mx.messaging.events.MessageEvent;
	import mx.messaging.messages.AsyncMessage;
	import mx.messaging.messages.IMessage;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.rpc.AbstractService;
	import mx.rpc.AsyncToken;
	import mx.rpc.AsyncDispatcher;
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.mxml.Concurrency;
	import mx.rpc.mxml.IMXMLSupport;
	import mx.rpc.soap.WebService;
	import mx.rpc.soap.Operation;
	import mx.rpc.soap.mxml.WebService;
	import mx.validators.Validator;

	/**
	 * An Operation used specifically by WebServices. An Operation is an individual method on a service. An Operation can be called either by invoking the function of the same name on the service or by accessing the Operation
	 */
	public class Operation extends mx.rpc.soap.Operation implements IMXMLSupport
	{
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		private var _concurrency : String;
		private var _concurrencySet : Boolean;
		private var webService : mx.rpc.soap.mxml.WebService;
		private var _showBusyCursor : Boolean;
		private var _showBusyCursorSet : Boolean;

		/**
		 * The concurrency for this Operation.  If it has not been explicitly set the setting from the WebService
		 */
		public function get concurrency () : String;
		/**
		 *  @private
		 */
		public function set concurrency (c:String) : void;
		/**
		 * Whether this operation should show the busy cursor while it is executing.
		 */
		public function get showBusyCursor () : Boolean;
		public function set showBusyCursor (sbc:Boolean) : void;

		/**
		 * Creates a new Operation. 
		 */
		public function Operation (webService:mx.rpc.soap.WebService = null, name:String = null);
		function setService (ro:AbstractService) : void;
		/**
		 * @inheritDoc
		 */
		public function cancel (id:String = null) : AsyncToken;
		/**
		 * @private
		 */
		public function send (...args:Array) : AsyncToken;
		/**
		 * @private
		 */
		function getNetmonId () : String;
		function invoke (message:IMessage, token:AsyncToken = null) : AsyncToken;
		/**
		 * Kill the busy cursor, find the matching call object and pass it back
		 */
		function preHandle (event:MessageEvent) : AsyncToken;
	}
}