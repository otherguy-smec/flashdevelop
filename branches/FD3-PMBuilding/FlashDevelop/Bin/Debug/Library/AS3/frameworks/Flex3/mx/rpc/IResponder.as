﻿package mx.rpc
{
	/**
	 *  This interface provides the contract for any service
	 */
	public interface IResponder
	{
		/**
		 *  This method is called by a service when the return value
		 */
		public function result (data:Object) : void;
		/**
		 *  This method is called by a service when an error has been received.
		 */
		public function fault (info:Object) : void;
	}
}