﻿package mx.utils
{
	import flash.utils.ByteArray;

	/**
	 *  Documentation is not currently available.
	 */
	public class HexEncoder
	{
		/**
		 *  @private
		 */
		public static const UPPER_CASE : String = "upper";
		/**
		 *  @private
		 */
		public static const LOWER_CASE : String = "lower";
		/**
		 *  @private
		 */
		public static var encodingStyle : String;
		/**
		 *  @private
		 */
		public var encodingStyle : String;
		/**
		 *  An Array of buffer Arrays. 
		 */
		private var _buffers : Array;
		/**
		 *  @private
		 */
		private var _work : int;
		/**
		 * This value represents a safe number of characters (i.e. arguments) that
		 */
		public static const MAX_BUFFER_SIZE : uint = 32767;
		/**
		 '0', '1', '2', '3', '4', '5', '6', '7',
		 */
		private static const UPPER_CHAR_CODES : Array = [];
		/**
		 '0', '1', '2', '3', '4', '5', '6', '7',
		 */
		private static const LOWER_CHAR_CODES : Array = [];

		/**
		 *  @private
		 */
		public function HexEncoder ();
		/**
		 *  @private
		 */
		public function encode (data:ByteArray, offset:uint = 0, length:uint = 0) : void;
		/**
		 *  @private
		 */
		public function drain () : String;
		/**
		 *  @private
		 */
		public function flush () : String;
		/**
		 *  @private
		 */
		private function encodeBlock (_work:int, digits:Array) : void;
	}
}