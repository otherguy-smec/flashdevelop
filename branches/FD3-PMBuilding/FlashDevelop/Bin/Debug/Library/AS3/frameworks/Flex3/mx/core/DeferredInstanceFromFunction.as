﻿package mx.core
{
	/**
	 *  A deferred instance factory that uses a generator function
	 */
	public class DeferredInstanceFromFunction implements IDeferredInstance
	{
		/**
		 * 	@private
		 */
		private var generator : Function;
		/**
		 * 	@private
		 */
		private var instance : Object;

		/**
		 *  Constructor.
		 */
		public function DeferredInstanceFromFunction (generator:Function);
		/**
		 *	Returns a reference to an instance of the desired object.
		 */
		public function getInstance () : Object;
	}
}