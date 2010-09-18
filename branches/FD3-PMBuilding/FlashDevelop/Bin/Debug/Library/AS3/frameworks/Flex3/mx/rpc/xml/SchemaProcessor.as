﻿package mx.rpc.xml
{
	import mx.utils.object_proxy;
	import mx.utils.URLUtil;

	/**
	 * This abstract class traverses an XML Schema to assist with marshalling typed
	 */
	public class SchemaProcessor
	{
		protected var strictOccurenceBounds : Boolean;
		private var _schemaManager : SchemaManager;

		public function get schemaManager () : SchemaManager;
		public function set schemaManager (manager:SchemaManager) : void;
		protected function get constants () : SchemaConstants;

		public function SchemaProcessor ();
		/**
		 * Clears the state in preparation for a fresh schema processing operation.
		 */
		public function reset () : void;
		/**
		 * @private
		 */
		public function isBuiltInType (type:QName) : Boolean;
		/**
		 * Determines the length of a given value to check minOccurs/maxOccurs
		 */
		public function getValueOccurence (value:*) : uint;
		/**
		 * A utility method to determine whether an attribute actually exists
		 */
		protected function getAttributeFromNode (name:*, node:XML) : String;
		protected function getSingleElementFromNode (node:XML, ...types:Array) : XML;
		/**
		 * Looks for a maxOccurs constraint on the given definition. The default
		 */
		protected function getMaxOccurs (definition:XML) : uint;
		/**
		 * Looks for a minOccurs constraint on the given definition. The default
		 */
		protected function getMinOccurs (definition:XML) : uint;
	}
}