﻿package mx.messaging
{
	import flash.events.EventDispatcher;
	import mx.core.IMXMLObject;
	import mx.core.mx_internal;
	import mx.events.PropertyChangeEvent;
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.messaging.FlexClient;
	import mx.messaging.config.ConfigMap;
	import mx.messaging.config.ServerConfig;
	import mx.messaging.errors.InvalidDestinationError;
	import mx.messaging.events.ChannelEvent;
	import mx.messaging.events.ChannelFaultEvent;
	import mx.messaging.events.MessageAckEvent;
	import mx.messaging.events.MessageFaultEvent;
	import mx.messaging.messages.AbstractMessage;
	import mx.messaging.messages.AcknowledgeMessage;
	import mx.messaging.messages.CommandMessage;
	import mx.messaging.messages.ErrorMessage;
	import mx.messaging.messages.IMessage;
	import mx.messaging.messages.MessagePerformanceUtils;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.utils.Base64Encoder;
	import mx.utils.UIDUtil;

	/**
	 *  Dispatched when an acknowledge message is received for a sent message.
	 */
	[Event(name="acknowledge", type="mx.messaging.events.MessageAckEvent")] 
	/**
	 *  Dispatched when a message fault occurs.
	 */
	[Event(name="fault", type="mx.messaging.events.MessageFaultEvent")] 
	/**
	 *  Dispatched when the underlying Channel the MessageAgent is using connects.
	 */
	[Event(name="channelConnect", type="mx.messaging.events.ChannelEvent")] 
	/**
	 *  Dispatched when the underlying Channel the MessageAgent is using disconnects.
	 */
	[Event(name="channelDisconnect", type="mx.messaging.events.ChannelEvent")] 
	/**
	 *  Dispatched when the underlying Channel the MessageAgent is using faults.
	 */
	[Event(name="channelFault", type="mx.messaging.events.ChannelFaultEvent")] 
	/**
	 *  Dispatched when the <code>connected</code> property of the MessageAgent changes.
	 */
	[Event(name="propertyChange", type="mx.events.PropertyChangeEvent")] 

	/**
	 *  The MessageAgent class provides the basic low-level functionality common to
	 */
	public class MessageAgent extends EventDispatcher implements IMXMLObject
	{
		/**
		 *  @private
		 */
		static const AUTO_CONFIGURED_CHANNELSET : int = 0;
		/**
		 *  @private
		 */
		static const MANUALLY_ASSIGNED_CHANNELSET : int = 1;
		/**
		 *  @private
		 */
		protected var _agentType : String;
		/**
		 *  @private
		 */
		protected var _credentials : String;
		/**
		 *  @private
		 */
		protected var _credentialsCharset : String;
		/**
		 *  @private
		 */
		protected var _disconnectBarrier : Boolean;
		/**
		 *  @private
		 */
		private var _pendingConnectEvent : ChannelEvent;
		/**
		 *  @private
		 */
		private var _remoteCredentials : String;
		/**
		 *  @private
		 */
		private var _remoteCredentialsCharset : String;
		/**
		 *  @private
		 */
		private var _sendRemoteCredentials : Boolean;
		/**
		 *  @private
		 */
		protected var _log : ILogger;
		/**
		 *  @private
		 */
		private var _clientIdWaitQueue : Array;
		/**
		 *  @private
		 */
		protected var _ignoreFault : Boolean;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  @private
		 */
		private var _authenticated : Boolean;
		/**
		 *  @private
		 */
		private var _channelSet : ChannelSet;
		/**
		 *  @private
		 */
		private var _clientId : String;
		/**
		 *  @private
		 */
		private var _connected : Boolean;
		/**
		 *  @private
		 */
		private var _destination : String;
		/**
		 *  @private
		 */
		private var _id : String;
		/**
		 *  @private
		 */
		private var _requestTimeout : int;
		/**
		 *  @private
		 */
		private var _channelSetMode : int;
		/**
		 *  @private
		 */
		local var configRequested : Boolean;
		/**
		 * @private
		 */
		private var _needsConfig : Boolean;

		/**
		 *  Indicates if this MessageAgent is using an authenticated connection to 
		 */
		public function get authenticated () : Boolean;
		/**
		 *  Provides access to the ChannelSet used by the MessageAgent. The
		 */
		public function get channelSet () : ChannelSet;
		/**
		 *  @private
		 */
		public function set channelSet (value:ChannelSet) : void;
		/**
		 *  Provides access to the client id for the MessageAgent.
		 */
		public function get clientId () : String;
		/**
		 *  Indicates whether this MessageAgent is currently connected to its
		 */
		public function get connected () : Boolean;
		/**
		 *  Provides access to the destination for the MessageAgent. 
		 */
		public function get destination () : String;
		/**
		 *  @private
		 */
		public function set destination (value:String) : void;
		/**
		 *  @private
		 */
		public function get id () : String;
		/**
		 *  @private
		 */
		public function set id (value:String) : void;
		/**
		 *  Provides access to the request timeout in seconds for sent messages.
		 */
		public function get requestTimeout () : int;
		/**
		 *  @private
		 */
		public function set requestTimeout (value:int) : void;
		function get channelSetMode () : int;
		/**
		 *  Indicates if this MessageAgent needs to request configuration from the 
		 */
		function get needsConfig () : Boolean;
		/**
		 *  @private
		 */
		function set needsConfig (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function MessageAgent ();
		/**
		 *  @private
		 */
		function setAuthenticated (value:Boolean, creds:String) : void;
		/**
		 *  @private
		 */
		function internalSetChannelSet (value:ChannelSet) : void;
		/**
		 *  @private
		 */
		function setClientId (value:String) : void;
		/**
		 *  @private
		 */
		protected function setConnected (value:Boolean) : void;
		/**
		 *  Invoked by a MessageResponder upon receiving a result for a sent
		 */
		public function acknowledge (ackMsg:AcknowledgeMessage, msg:IMessage) : void;
		/**
		 *  Disconnects the MessageAgent's network connection.
		 */
		public function disconnect () : void;
		/**
		 *  Invoked by a MessageResponder upon receiving a fault for a sent message.
		 */
		public function fault (errMsg:ErrorMessage, msg:IMessage) : void;
		/**
		 * This function should be overriden by sublasses to implement re-authorization due to 
		 */
		protected function reAuthorize (msg:IMessage) : void;
		/**
		 *  Handles a CONNECT ChannelEvent. Subclasses that need to perform custom
		 */
		public function channelConnectHandler (event:ChannelEvent) : void;
		/**
		 *  Handles a DISCONNECT ChannelEvent. Subclasses that need to perform
		 */
		public function channelDisconnectHandler (event:ChannelEvent) : void;
		/**
		 *  Handles a ChannelFaultEvent. Subclasses that need to perform custom
		 */
		public function channelFaultHandler (event:ChannelFaultEvent) : void;
		/**
		 *  Called after the implementing object has been created
		 */
		public function initialized (document:Object, id:String) : void;
		/**
		 *  Logs the MessageAgent out from its remote destination. 
		 */
		public function logout () : void;
		/**
		 *  Sets the credentials that the MessageAgent uses to authenticate to 
		 */
		public function setCredentials (username:String, password:String, charset:String = null) : void;
		/**
		 *  Sets the remote credentials that will be passed through to the remote destination
		 */
		public function setRemoteCredentials (username:String, password:String, charset:String = null) : void;
		/**
		 * Returns true if there are any pending requests for the passed in message.
		 */
		public function hasPendingRequestForMessage (msg:IMessage) : Boolean;
		/**
		 *  @private
		 */
		function internalSetCredentials (credentials:String) : void;
		/**
		 *  @private
		 */
		protected function assertCredentials (value:String) : void;
		/**
		 *  @private
		 */
		protected function flushClientIdWaitQueue () : void;
		/**
		 *  Sends a Message from the MessageAgent to its destination using the
		 */
		protected function internalSend (message:IMessage, waitForClientId:Boolean = true) : void;
		/**
		 *  Used to automatically initialize the <code>channelSet</code> property for the
		 */
		protected function initChannelSet (message:IMessage) : void;
	}
}