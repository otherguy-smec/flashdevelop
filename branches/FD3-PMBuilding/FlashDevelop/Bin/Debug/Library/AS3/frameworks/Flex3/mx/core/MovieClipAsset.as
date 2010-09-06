﻿package mx.core
{
	/**
	 *  MovieClipAsset is a subclass of the flash.display.MovieClip class
	 */
	public class MovieClipAsset extends FlexMovieClip implements IFlexAsset
	{
		/**
		 *  @private
		 */
		private var _measuredHeight : Number;
		/**
		 *  @private
		 */
		private var _measuredWidth : Number;

		/**
		 *  @inheritDoc
		 */
		public function get measuredHeight () : Number;
		/**
		 *  @inheritDoc
		 */
		public function get measuredWidth () : Number;
		/**
		 *  @inheritDoc
		 */
		public function get borderMetrics () : EdgeMetrics;

		/**
		 *  Constructor.
		 */
		public function MovieClipAsset ();
		/**
		 *  @inheritDoc
		 */
		public function move (x:Number, y:Number) : void;
		/**
		 *  @inheritDoc
		 */
		public function setActualSize (newWidth:Number, newHeight:Number) : void;
	}
}