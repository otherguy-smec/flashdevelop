﻿package mx.core
{
	/**
	 *  @private
	 */
	public interface IEmbeddedFontRegistry
	{
		/**
		 *  Registers a font and associates it with a moduleFactory.
		 */
		public function registerFont (font:EmbeddedFont, moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  Deregisters a font.
		 */
		public function deregisterFont (font:EmbeddedFont, moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  Finds the <code>moduleFactory</code> associated with a font.
		 */
		public function getAssociatedModuleFactory (font:EmbeddedFont, defaultModuleFactory:IFlexModuleFactory) : IFlexModuleFactory;
		/**
		 *  Gets an array of all the fonts that have been registered.
		 */
		public function getFonts () : Array;
	}
}