﻿package mx.core
{
	import flash.geom.Rectangle;

	/**
	 *  The IToolTip interface defines the API that tooltip-like components
	 */
	public interface IToolTip extends IUIComponent
	{
		/**
		 *  A Rectangle that specifies the size and position
		 */
		public function get screen () : Rectangle;
		/**
		 *  The text that appears in the tooltip.
		 */
		public function get text () : String;
		/**
		 *  @private
		 */
		public function set text (value:String) : void;

	}
}