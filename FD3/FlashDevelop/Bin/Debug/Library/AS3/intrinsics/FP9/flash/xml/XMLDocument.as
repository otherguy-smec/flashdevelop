package flash.xml
{
	/// The XMLDocument class represents the legacy XML object that was present in ActionScript 2.0.
	public class XMLDocument extends flash.xml.XMLNode
	{
		/// A string that specifies information about a document's XML declaration.
		public var xmlDecl:Object;

		/// Specifies information about the XML document's DOCTYPE declaration.
		public var docTypeDecl:Object;

		/// An Object containing the nodes of the XML that have an id attribute assigned.
		public var idMap:Object;

		/// When set to true, text nodes that contain only white space are discarded during the parsing process.
		public var ignoreWhite:Boolean;

		/// Creates a new XMLDocument object.
		public function XMLDocument(source:String=null);

		/// Creates a new XMLNode object with the name specified in the parameter.
		public function createElement(name:String):flash.xml.XMLNode;

		/// Creates a new XML text node with the specified text.
		public function createTextNode(text:String):flash.xml.XMLNode;

		/// Returns a string representation of the XML object.
		public function toString():String;

		/// Parses the XML text specified in the value parameter and populates the specified XMLDocument object with the resulting XML tree.
		public function parseXML(source:String):void;

	}

}

