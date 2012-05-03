﻿package fl.video
{
	/**
	 * The IVPEvent interface is implemented by video events
	 */
	public interface IVPEvent
	{
		/**
		 * The type of event. The type is case-sensitive.
		 */
		public function get type () : String;
		/**
		 * The index of the VideoPlayer object involved in this event.
		 */
		public function get vp () : uint;
		/**
		 * @private (setter)
		 */
		public function set vp (n:uint) : void;

	}
}