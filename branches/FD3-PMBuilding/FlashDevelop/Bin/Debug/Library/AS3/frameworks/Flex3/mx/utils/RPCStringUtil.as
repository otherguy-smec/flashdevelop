﻿package mx.utils
{
	/**
	 *  The RPCStringUtil class is a subset of StringUtil, removing methods
	 */
	public class RPCStringUtil
	{
		/**
		 *  Removes all whitespace characters from the beginning and end
		 */
		public static function trim (str:String) : String;
		/**
		 *  Removes all whitespace characters from the beginning and end
		 */
		public static function trimArrayElements (value:String, delimiter:String) : String;
		/**
		 *  Returns <code>true</code> if the specified string is
		 */
		public static function isWhitespace (character:String) : Boolean;
		/**
		 *  Substitutes "{n}" tokens within the specified string
		 */
		public static function substitute (str:String, ...rest) : String;
	}
}