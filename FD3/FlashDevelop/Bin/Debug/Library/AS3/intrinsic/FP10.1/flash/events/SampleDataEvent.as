package flash.events
{
	import flash.events.Event;
	import flash.utils.ByteArray;

	/// Dispatched when the player requests new audio data.
	public class SampleDataEvent extends Event
	{
		/// Defines the value of the type property of a SampleDataEvent event object.
		public static const SAMPLE_DATA : String = "sampleData";

		/// The data in the audio stream.
		public function get data () : ByteArray;
		public function set data (thedata:ByteArray) : void;

		/// The position of the data in the audio stream.
		public function get position () : Number;
		public function set position (theposition:Number) : void;

		/// Creates a copy of the SampleDataEvent object and sets each property's value to match that of the original.
		public function clone () : Event;

		/// Creates an event object that contains information about audio data events.
		public function SampleDataEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = false, theposition:Number = 0, thedata:ByteArray = null);

		/// Returns a string that contains all the properties of the SampleDataEvent object.
		public function toString () : String;
	}
}
