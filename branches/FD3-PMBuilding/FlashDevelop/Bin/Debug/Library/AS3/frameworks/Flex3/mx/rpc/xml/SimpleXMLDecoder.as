﻿package mx.rpc.xml
{
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectProxy;

	/**
	 *  The SimpleXMLDecoder class deserialize XML into a graph of ActionScript objects.
	 */
	public class SimpleXMLDecoder
	{
		private var makeObjectsBindable : Boolean;

		/**
		 *  @private
		 */
		public static function simpleType (val:Object) : Object;
		/**
		 *  @private
		 */
		public function SimpleXMLDecoder (makeObjectsBindable:Boolean = false);
		/**
		 *  Converts a tree of XMLNodes into a tree of ActionScript Objects.
		 */
		public function decodeXML (dataNode:XMLNode) : Object;
		/**
		 * Returns the local name of an XMLNode.
		 */
		public static function getLocalName (xmlNode:XMLNode) : String;
	}
}