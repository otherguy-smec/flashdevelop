﻿package mx.rpc.xml
{
	/**
	 * This internal utility class is used by SimpleXMLDecoder. The class is
	 */
	internal dynamic class ComplexString
	{
		public var value : String;

		public function ComplexString (val:String);
		public function toString () : String;
		public function valueOf () : Object;
	}
}