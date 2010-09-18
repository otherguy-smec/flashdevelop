﻿package mx.validators
{
	/**
	 *  The ValidationResult class contains the results of a validation. 
	 */
	public class ValidationResult
	{
		/**
		 *  The validation error code
		 */
		public var errorCode : String;
		/**
		 *  The validation error message
		 */
		public var errorMessage : String;
		/**
		 *  Contains <code>true</code> if the field generated a validation failure.
		 */
		public var isError : Boolean;
		/**
		 *  The name of the subfield that the result is associated with.
		 */
		public var subField : String;

		/**
		 *  Constructor
		 */
		public function ValidationResult (isError:Boolean, subField:String = "", errorCode:String = "", errorMessage:String = "");
	}
}