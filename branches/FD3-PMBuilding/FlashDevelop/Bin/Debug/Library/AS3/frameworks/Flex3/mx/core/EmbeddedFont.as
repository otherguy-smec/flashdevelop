﻿package mx.core
{
	import flash.text.FontStyle;

	/**
	 *  @private
	 */
	public class EmbeddedFont
	{
		/**
		 *  @private
		 */
		private var _fontName : String;
		/**
		 *  @private
		 */
		private var _fontStyle : String;

		/**
		 *  The name of the font.
		 */
		public function get fontName () : String;
		/**
		 *  The style of the font.
		 */
		public function get fontStyle () : String;

		/**
		 *  Create a new EmbeddedFont object.
		 */
		public function EmbeddedFont (fontName:String, bold:Boolean, italic:Boolean);
	}
}