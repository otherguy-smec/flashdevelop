/**********************************************************/
/*** Generated using Asapire [brainy 2008-Mar-07 11:06] ***/
/**********************************************************/
package mx.messaging.messages {
	public class ErrorMessage extends AcknowledgeMessage {
		/**
		 * Extended data that the remote destination has chosen to associate
		 *  with this error to facilitate custom error processing on the client.
		 */
		public var extendedData:Object;
		/**
		 * The fault code for the error.
		 *  This value typically follows the convention of
		 *  "[outer_context].[inner_context].[issue]".
		 *  For example: "Channel.Connect.Failed", "Server.Call.Failed", etc.
		 */
		public var faultCode:String;
		/**
		 * Detailed description of what caused the error.
		 *  This is typically a stack trace from the remote destination.
		 */
		public var faultDetail:String;
		/**
		 * A simple description of the error.
		 */
		public var faultString:String;
		/**
		 * Should a root cause exist for the error, this property contains those details.
		 *  This may be an ErrorMessage, a NetStatusEvent info Object, or an underlying
		 *  Flash error event: ErrorEvent, IOErrorEvent, or SecurityErrorEvent.
		 */
		public var rootCause:Object;
		/**
		 * Constructs an ErrorMessage instance.
		 */
		public function ErrorMessage();
		/**
		 * If a message may not have been delivered, the faultCode will
		 *  contain this constant.
		 */
		public static const MESSAGE_DELIVERY_IN_DOUBT:String = "Client.Error.DeliveryInDoubt";
		/**
		 * Header name for the retryable hint header.
		 *  This is used to indicate that the operation that generated the error
		 *  may be retryable rather than fatal.
		 */
		public static const RETRYABLE_HINT_HEADER:String = "DSRetryableErrorHint";
	}
}
