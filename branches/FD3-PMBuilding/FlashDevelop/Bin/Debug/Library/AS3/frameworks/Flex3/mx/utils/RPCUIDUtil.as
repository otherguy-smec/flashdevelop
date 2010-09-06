﻿package mx.utils
{
	import flash.utils.ByteArray;

	/**
	 *  The RPCUIDUtil class is a copy of UIDUtil without some functions that
	 */
	public class RPCUIDUtil
	{
		/**
		 *  @private
		 */
		private static const ALPHA_CHAR_CODES : Array = [];

		/**
		 *  Generates a UID (unique identifier) based on ActionScript's
		 */
		public static function createUID () : String;
		/**
		 * Converts a 128-bit UID encoded as a ByteArray to a String representation.
		 */
		public static function fromByteArray (ba:ByteArray) : String;
		/**
		 * A utility method to check whether a String value represents a 
		 */
		public static function isUID (uid:String) : Boolean;
		/**
		 * Converts a UID formatted String to a ByteArray. The UID must be in the
		 */
		public static function toByteArray (uid:String) : ByteArray;
		/**
		 * Returns the decimal representation of a hex digit.
		 */
		private static function getDigit (hex:String) : uint;
	}
}