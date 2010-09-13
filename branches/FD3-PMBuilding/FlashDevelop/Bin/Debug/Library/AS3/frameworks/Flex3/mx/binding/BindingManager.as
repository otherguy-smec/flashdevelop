﻿package mx.binding
{
	import mx.core.mx_internal;

	/**
	 *  @private
	 */
	public class BindingManager
	{
		/**
		 *  @private
		 */
		static var debugDestinationStrings : Object;

		/**
		 *  Store a Binding for the destination relative to the passed in document.
		 */
		public static function addBinding (document:Object, destStr:String, b:Binding) : void;
		/**
		 *  Set isEnabled for all bindings associated with a document.
		 */
		public static function setEnabled (document:Object, isEnabled:Boolean) : void;
		/**
		 *  Execute all bindings that bind into the specified object.
		 */
		public static function executeBindings (document:Object, destStr:String, destObj:Object) : void;
		/**
		 *  @private
		 */
		private static function getFirstWord (destStr:String) : String;
		/**
		 *  Enables debugging output for the Binding or Bindings with a matching
		 */
		public static function debugBinding (destinationString:String) : void;
		/**
		 *  @private
		 */
		public function BindingManager ();
	}
}