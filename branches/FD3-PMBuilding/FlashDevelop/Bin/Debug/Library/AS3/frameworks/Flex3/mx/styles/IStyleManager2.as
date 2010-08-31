﻿package mx.styles
{
	import flash.events.IEventDispatcher;
	import flash.system.ApplicationDomain;
	import flash.system.SecurityDomain;

	/**
	 *  @private
	 */
	public interface IStyleManager2 extends IStyleManager
	{
		/**
		 *  @private
		 */
		public function get selectors () : Array;

		/**
		 *  @private
		 */
		public function loadStyleDeclarations2 (url:String, update:Boolean = true, applicationDomain:ApplicationDomain = null, securityDomain:SecurityDomain = null) : IEventDispatcher;
	}
}