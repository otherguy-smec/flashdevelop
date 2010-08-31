﻿package mx.graphics.codec
{
	import flash.display.BitmapData;
	import flash.utils.ByteArray;

	/**
	 *  The PNGEncoder class converts raw bitmap images into encoded
	 */
	public class PNGEncoder implements IImageEncoder
	{
		/**
		 *  @private
		 */
		private static const CONTENT_TYPE : String = "image/png";
		/**
		 *  @private
		 */
		private var crcTable : Array;

		/**
		 *  The MIME type for the PNG encoded image.
		 */
		public function get contentType () : String;

		/**
		 *  Constructor.
		 */
		public function PNGEncoder ();
		/**
		 *  Converts the pixels of a BitmapData object
		 */
		public function encode (bitmapData:BitmapData) : ByteArray;
		/**
		 *  Converts a ByteArray object containing raw pixels
		 */
		public function encodeByteArray (byteArray:ByteArray, width:int, height:int, transparent:Boolean = true) : ByteArray;
		/**
		 *  @private
		 */
		private function initializeCRCTable () : void;
		/**
		 *  @private
		 */
		private function internalEncode (source:Object, width:int, height:int, transparent:Boolean = true) : ByteArray;
		/**
		 *  @private
		 */
		private function writeChunk (png:ByteArray, type:uint, data:ByteArray) : void;
	}
}