﻿package mx.core
{
	/**
	 *  The IDataRenderer interface defines the interface for components that have a <code>data</code> property.
	 */
	public interface IDataRenderer
	{
		/**
		 *  The data to render or edit.
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;

	}
}