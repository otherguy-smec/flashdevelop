/**********************************************************/
/*** Generated using Asapire [brainy 2008-Mar-07 11:07] ***/
/**********************************************************/
package flash.events {
	public class HTTPStatusEvent extends Event {
		/**
		 * The response headers that the response returned, as an array of URLRequestHeader objects.
		 */
		public function get responseHeaders():Array;
		public function set responseHeaders(value:Array):void;
		/**
		 * The URL that the response was returned from. In the case of redirects, this will be different
		 *  from the request URL.
		 */
		public function get responseURL():String;
		public function set responseURL(value:String):void;
		/**
		 * The HTTP status code returned by the server. For example, a value of 404 indicates that the server
		 *  has not found a match for the requested URI. HTTP status codes can be found in sections 10.4 and 10.5
		 *  of the HTTP specification at
		 *  ftp://ftp.isi.edu/in-notes/rfc2616.txt.
		 */
		public function get status():int;
		/**
		 * Creates an Event object that contains specific information about HTTP status events.
		 *  Event objects are passed as parameters to event listeners.
		 *
		 * @param type              <String> The type of the event. Event listeners can access this information through the inherited type property. There is only one type of HTTPStatus event: HTTPStatusEvent.HTTP_STATUS.
		 * @param bubbles           <Boolean (default = false)> Determines whether the Event object participates in the bubbling stage of the event flow. Event listeners can access this information through the inherited bubbles property.
		 * @param cancelable        <Boolean (default = false)> Determines whether the Event object can be canceled. Event listeners can access this information through the inherited cancelable property.
		 * @param status            <int (default = 0)> Numeric status. Event listeners can access this information through the status property.
		 */
		public function HTTPStatusEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, status:int = 0);
		/**
		 * Creates a copy of the HTTPStatusEvent object and sets the value of each property to match that of the original.
		 *
		 * @return                  <Event> A new HTTPStatusEvent object with property values that match those of the original.
		 */
		public override function clone():Event;
		/**
		 * Returns a string that contains all the properties of the HTTPStatusEvent object.
		 *
		 * @return                  <String> A string that contains all the properties of the HTTPStatusEvent object.
		 */
		public override function toString():String;
		/**
		 * Unlike the httpStatus event, the httpResponseStatus event is
		 *  delivered before any response data. Also, the httpResponseStatus event includes
		 *  values for the responseHeaders and responseURL properties (which are
		 *  undefined for an httpStatus event. Note that the httpResponseStatus event
		 *  (if any) will be sent before (and in addition to) any complete or error
		 *  event.
		 */
		public static const HTTP_RESPONSE_STATUS:String = "httpResponseStatus";
		/**
		 * The HTTPStatusEvent.HTTP_STATUS constant defines the value of the
		 *  type property of a httpStatus event object.
		 */
		public static const HTTP_STATUS:String = "httpStatus";
	}
}
