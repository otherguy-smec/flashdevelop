﻿package mx.binding
{
	import mx.rpc.IResponder;

	/**
	 *  @private
	 */
	public class EvalBindingResponder implements IResponder
	{
		/**
		 *  @private
		 */
		private var binding : Binding;
		/**
		 *  @private
		 */
		private var object : Object;

		/**
		 *  @private
		 */
		public function EvalBindingResponder (binding:Binding, object:Object);
		/**
		 *  @private
		 */
		public function result (data:Object) : void;
		/**
		 *  @private
		 */
		public function fault (data:Object) : void;
	}
}