﻿package mx.validators
{
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	/**
	 *  The ZipCodeValidator class validates that a String
	 */
	public class ZipCodeValidator extends Validator
	{
		/**
		 *  @private
		 */
		private static const DOMAIN_US : uint = 1;
		/**
		 *  @private
		 */
		private static const DOMAIN_US_OR_CANADA : uint = 2;
		/**
		 * @private
		 */
		private static const DOMAIN_CANADA : uint = 3;
		/**
		 *  @private
		 */
		private var _allowedFormatChars : String;
		/**
		 *  @private
		 */
		private var allowedFormatCharsOverride : String;
		/**
		 *  @private
		 */
		private var _domain : String;
		/**
		 *  @private
		 */
		private var domainOverride : String;
		/**
		 *  @private
		 */
		private var _invalidCharError : String;
		/**
		 *  @private
		 */
		private var invalidCharErrorOverride : String;
		/**
		 *  @private
		 */
		private var _invalidDomainError : String;
		/**
		 *  @private
		 */
		private var invalidDomainErrorOverride : String;
		/**
		 *  @private
		 */
		private var _wrongCAFormatError : String;
		/**
		 *  @private
		 */
		private var wrongCAFormatErrorOverride : String;
		/**
		 *  @private
		 */
		private var _wrongLengthError : String;
		/**
		 *  @private
		 */
		private var wrongLengthErrorOverride : String;
		/**
		 *  @private
		 */
		private var _wrongUSFormatError : String;
		/**
		 *  @private
		 */
		private var wrongUSFormatErrorOverride : String;

		/**
		 *  The set of formatting characters allowed in the ZIP code.
		 */
		public function get allowedFormatChars () : String;
		/**
		 *  @private
		 */
		public function set allowedFormatChars (value:String) : void;
		/**
		 *  Type of ZIP code to check.
		 */
		public function get domain () : String;
		/**
		 *  @private
		 */
		public function set domain (value:String) : void;
		/**
		 *  Error message when the ZIP code contains invalid characters.
		 */
		public function get invalidCharError () : String;
		/**
		 *  @private
		 */
		public function set invalidCharError (value:String) : void;
		/**
		 *  Error message when the <code>domain</code> property contains an invalid value.
		 */
		public function get invalidDomainError () : String;
		/**
		 *  @private
		 */
		public function set invalidDomainError (value:String) : void;
		/**
		 *  Error message for an invalid Canadian postal code.
		 */
		public function get wrongCAFormatError () : String;
		/**
		 *  @private
		 */
		public function set wrongCAFormatError (value:String) : void;
		/**
		 *  Error message for an invalid US ZIP code.
		 */
		public function get wrongLengthError () : String;
		/**
		 *  @private
		 */
		public function set wrongLengthError (value:String) : void;
		/**
		 *  Error message for an incorrectly formatted ZIP code.
		 */
		public function get wrongUSFormatError () : String;
		/**
		 *  @private
		 */
		public function set wrongUSFormatError (value:String) : void;

		/**
		 *  Convenience method for calling a validator.
		 */
		public static function validateZipCode (validator:ZipCodeValidator, value:Object, baseField:String) : Array;
		/**
		 *  @private
		 */
		private function validateUSCode (zip:String, containsLetters:Boolean) : Boolean;
		/**
		 *  @private
		 */
		private function validateCACode (zip:String, containsLetters:Boolean) : Boolean;
		/**
		 *  Constructor.
		 */
		public function ZipCodeValidator ();
		/**
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  Override of the base class <code>doValidation()</code> method
		 */
		protected function doValidation (value:Object) : Array;
	}
}