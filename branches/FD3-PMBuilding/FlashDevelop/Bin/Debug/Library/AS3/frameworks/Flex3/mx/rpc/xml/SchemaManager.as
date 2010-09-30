﻿package mx.rpc.xml
{
	/**
	 * SchemaManager manages multiple Schema definitions by target namespace.
	 */
	public class SchemaManager extends QualifiedResourceManager
	{
		private var namespaceCount : uint;
		/**
		 * A Stack of Schemas which records the current scope and the last Schema
		 */
		private var schemaStack : Array;
		private var initialScope : *;
		private var _namespaces : Object;
		private var _schemaMarshaller : SchemaMarshaller;
		private var _schemaConstants : SchemaConstants;
		private var _schemaDatatypes : SchemaDatatypes;

		public function get namespaces () : Object;
		public function set namespaces (value:Object) : void;
		/**
		 * The constants for the version of Schema that is to be used 
		 */
		public function get schemaConstants () : SchemaConstants;
		public function set schemaConstants (value:SchemaConstants) : void;
		public function get schemaMarshaller () : SchemaMarshaller;
		public function get schemaDatatypes () : SchemaDatatypes;
		/**
		 * Returns the Schema that was last used to retrieve a definition.
		 */
		public function get currentSchema () : Schema;

		public function SchemaManager ();
		public function addNamespaces (map:Object) : void;
		/**
		 * Adds a Schema to the current scope. If a Schema already exists in
		 */
		public function addSchema (schema:Schema, toCurrentScope:Boolean = true) : void;
		public function currentScope () : Array;
		/**
		 * Look for the definition of the given QName in all schemas in the current
		 */
		public function getNamedDefinition (name:QName, ...componentTypes:Array) : XML;
		/**
		 * Locate a schema for the given namespace and push it to a
		 */
		public function pushNamespaceInScope (nsParam:*) : Boolean;
		/**
		 * Push the given Schema to a new scope level, and set it as the
		 */
		public function pushSchemaInScope (schema:Schema) : void;
		/**
		 * @private FIXME: Find a better method name and/or document
		 */
		public function getOrCreatePrefix (uri:String) : String;
		public function getQNameForAttribute (ncname:String, form:String = null) : QName;
		public function getQNameForElement (ncname:String, form:String = null) : QName;
		/**
		 * Resolves a prefixed name back into a QName based on the prefix to
		 */
		public function getQNameForPrefixedName (prefixedName:String, parent:XML = null, qualifyToTargetNamespace:Boolean = false) : QName;
		/**
		 * Converts ActionScript to XML based on default rules
		 */
		public function marshall (value:*, type:QName = null, restriction:XML = null) : String;
		/**
		 * Informs the SchemaManager that the current definition is no
		 */
		public function releaseScope () : *;
		/**
		 * Reverts to initialScope.
		 */
		public function reset () : void;
		/**
		 * Converts XML to ActionScript based on default rules
		 */
		public function unmarshall (value:*, type:QName = null, restriction:XML = null) : *;
	}
}