﻿package mx.core
{
	/**
	 *  A ClassFactory instance is a "factory object" which Flex uses
	 */
	public class ClassFactory implements IFactory
	{
		/**
		 *  The Class that the <code>newInstance()</code> method uses
		 */
		public var generator : Class;
		/**
		 *	An Object whose name/value pairs specify the properties to be set
		 */
		public var properties : Object;

		/**
		 *  Constructor.
		 */
		public function ClassFactory (generator:Class = null);
		/**
		 *  Creates a new instance of the <code>generator</code> class,
		 */
		public function newInstance () : *;
	}
}