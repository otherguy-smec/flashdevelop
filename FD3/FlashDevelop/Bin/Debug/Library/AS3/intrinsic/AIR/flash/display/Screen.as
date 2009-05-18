package flash.display
{
	import flash.events.EventDispatcher;
	import flash.display.Screen;
	import flash.geom.Rectangle;

	/// The Screen class provides information about the display screens available to this application.
	public class Screen extends EventDispatcher
	{
		/// [AIR] The bounds of this screen.
		public function get bounds () : Rectangle;

		/// [AIR] The color depth of this screen (expressed in number of bits).
		public function get colorDepth () : int;

		/// [AIR] The primary display.
		public static function get mainScreen () : Screen;

		/// [AIR] The array of the currently available screens.
		public static function get screens () : Array;

		/// [AIR] The bounds of the area on this screen in which windows will be visible.
		public function get visibleBounds () : Rectangle;

		/// [AIR] Returns the (possibly empty) set of screens that intersect the provided rectangle.
		public static function getScreensForRectangle (rect:Rectangle) : Array;

		public function Screen ();
	}
}
