﻿package fl.video
{
	/**
	 * @private
	 */
	public dynamic class VideoPlayerClient
	{
		protected var _owner : VideoPlayer;
		protected var gotMetadata : Boolean;

		public function get owner () : VideoPlayer;
		/**
		 * property that specifies whether early messages (onMetaData, any
		 */
		public function get ready () : Boolean;

		public function VideoPlayerClient (vp:VideoPlayer);
		/**
		 * handles NetStream.onMetaData callback
		 */
		public function onMetaData (info:Object, ...rest) : void;
		/**
		 * handles NetStream.onCuePoint callback
		 */
		public function onCuePoint (info:Object, ...rest) : void;
	}
}