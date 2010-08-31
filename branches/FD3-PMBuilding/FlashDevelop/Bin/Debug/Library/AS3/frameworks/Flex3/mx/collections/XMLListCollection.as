﻿package mx.collections
{
	/**
	 *  The XMLListCollection class provides collection functionality to
	 */
	public class XMLListCollection extends ListCollectionView
	{
		/**
		 *  The underlying XMLList for this collection.
		 */
		public function get source () : XMLList;
		/**
		 *  @private
		 */
		public function set source (s:XMLList) : void;

		/**
		 *  Constructor.
		 */
		public function XMLListCollection (source:XMLList = null);
		/**
		 *  Calls the <code>attribute()</code> method of each XML object in the
		 */
		public function attribute (attributeName:Object) : XMLList;
		/**
		 *  Calls the <code>attributes()</code> method of each XML object in the
		 */
		public function attributes () : XMLList;
		/**
		 *  Calls the <code>child()</code> method of each XML object in the XMLList
		 */
		public function child (propertyName:Object) : XMLList;
		/**
		 *  Calls the children() method of each XML object in the XMLList and
		 */
		public function children () : XMLList;
		/**
		 *  Returns a deep copy of the XMLList object.
		 */
		public function copy () : XMLList;
		/**
		 *  Calls the <code>descendants()</code> method of each XML object in the
		 */
		public function descendants (name:Object = "*") : XMLList;
		/**
		 *  Calls the <code>elements()</code> method of each XML object in the XMLList.
		 */
		public function elements (name:String = "*") : XMLList;
		/**
		 * Calls the <code>text()</code> method of each XML object in
		 */
		public function text () : XMLList;
		/**
		 *  Returns a string representation of the XMLList by calling the
		 */
		public function toString () : String;
		/**
		 *  Returns a string representation of the XMLList by calling the
		 */
		public function toXMLString () : String;
		/**
		 * XMLList doesn't allow you to do myList[funcName](arg) because
		 */
		private function execXMLListFunction (func:Function) : XMLList;
	}
}