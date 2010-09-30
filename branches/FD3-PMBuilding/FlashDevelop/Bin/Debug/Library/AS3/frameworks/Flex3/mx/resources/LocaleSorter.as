﻿package mx.resources
{
	/**
	 *  @private
	 */
	public class LocaleSorter
	{
		/**
		 *  @private
		 */
		public static function sortLocalesByPreference (appLocales:Array, systemPreferences:Array, ultimateFallbackLocale:String = null, addAll:Boolean = false) : Array;
		/**
		 *  @private
		 */
		private static function trimAndNormalize (list:Array) : Array;
		/**
		 *  @private
		 */
		private static function normalizeLocale (locale:String) : String;
		/**
		 *  @private
		 */
		private static function addUltimateFallbackLocale (preferenceLocales:Array, ultimateFallbackLocale:String) : void;
	}
	/**
	 *  @private
	 */
	internal class LocaleID
	{
		/**
		 *  @private
		 */
		public static const STATE_PRIMARY_LANGUAGE : int = 0;
		/**
		 *  @private
		 */
		public static const STATE_EXTENDED_LANGUAGES : int = 1;
		/**
		 *  @private
		 */
		public static const STATE_SCRIPT : int = 2;
		/**
		 *  @private
		 */
		public static const STATE_REGION : int = 3;
		/**
		 *  @private
		 */
		public static const STATE_VARIANTS : int = 4;
		/**
		 *  @private
		 */
		public static const STATE_EXTENSIONS : int = 5;
		/**
		 *  @private
		 */
		public static const STATE_PRIVATES : int = 6;
		/**
		 *  @private
		 */
		private var lang : String;
		/**
		 *  @private
		 */
		private var script : String;
		/**
		 *  @private
		 */
		private var region : String;
		/**
		 *  @private
		 */
		private var extended_langs : Array;
		/**
		 *  @private
		 */
		private var variants : Array;
		/**
		 *  @private
		 */
		private var extensions : Object;
		/**
		 *  @private
		 */
		private var privates : Array;
		/**
		 *  @private
		 */
		private var privateLangs : Boolean;

		/**
		 *  @private
		 */
		public static function fromString (str:String) : LocaleID;
		/**
		 *  Constructor.
		 */
		public function LocaleID ();
		/**
		 *  @private
		 */
		public function canonicalize () : void;
		/**
		 *  @private
		 */
		public function toString () : String;
		/**
		 *  @private
		 */
		public function equals (locale:LocaleID) : Boolean;
		/**
		 *  @private
		 */
		public function isSiblingOf (other:LocaleID) : Boolean;
		/**
		 *  @private
		 */
		public function transformToParent () : Boolean;
	}
	/**
	 *  @private
	 */
	internal class LocaleRegistry
	{
		/**
		 *  @private
		 */
		private static const SCRIPTS : Array;

	}
}