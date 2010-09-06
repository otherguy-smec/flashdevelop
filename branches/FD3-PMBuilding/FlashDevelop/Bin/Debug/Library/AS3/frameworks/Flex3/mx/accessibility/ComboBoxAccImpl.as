﻿package mx.accessibility
{
	import mx.collections.CursorBookmark;
	import mx.controls.ComboBox;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The ComboBoxAccImpl class is the accessibility class for List.
	 */
	public class ComboBoxAccImpl extends ComboBaseAccImpl
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
		public function ComboBoxAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		protected function getName (childID:uint) : String;
	}
}