﻿package mx.core
{
	/**
	 *  A deferred instance factory that creates and returns an instance
	 */
	public class DeferredInstanceFromClass implements IDeferredInstance
	{
		/**
		 * 	@private
		 */
		private var generator : Class;
		/**
		 * 	@private
		 */
		private var instance : Object;

		/**
		 *  Constructor.
		 */
		public function DeferredInstanceFromClass (generator:Class);
		/**
		 *	Creates and returns an instance of the class specified in the
		 */
		public function getInstance () : Object;
	}
}