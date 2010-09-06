﻿package mx.accessibility
{
	import mx.controls.List;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The ListAccImpl class is the accessibility class for List.
	 */
	public class ListAccImpl extends ListBaseAccImpl
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;

		/**
		 *  @private
		 */
		private static function hookAccessibility () : Boolean;
		/**
		 *  @private
		 */
		static function createAccessibilityImplementation (component:UIComponent) : void;
		/**
		 *  Method call for enabling accessibility for a component.
		 */
		public static function enableAccessibility () : void;
		/**
		 *  Constructor.
		 */
		public function ListAccImpl (master:UIComponent);
	}
}