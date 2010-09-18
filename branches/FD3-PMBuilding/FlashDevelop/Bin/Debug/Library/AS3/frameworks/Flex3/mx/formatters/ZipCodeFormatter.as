﻿package mx.formatters
{
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;

	/**
	 *  The ZipCodeFormatter class formats a valid number
	 */
	public class ZipCodeFormatter extends Formatter
	{
		/**
		 *  @private
		 */
		private static const VALID_LENGTHS : String = "9,5,6";
		/**
		 *  @private
		 */
		private var _formatString : String;
		/**
		 *  @private
		 */
		private var formatStringOverride : String;

		/**
		 *  The mask pattern.
		 */
		public function get formatString () : String;
		/**
		 *  @private
		 */
		public function set formatString (value:String) : void;

		/**
		 *  Constructor.
		 */
		public function ZipCodeFormatter ();
		/**
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  Formats the String by using the specified format.
		 */
		public function format (value:Object) : String;
	}
}