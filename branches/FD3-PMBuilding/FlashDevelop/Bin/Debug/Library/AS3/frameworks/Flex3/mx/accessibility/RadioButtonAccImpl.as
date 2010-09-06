﻿package mx.accessibility
{
	import mx.controls.RadioButton;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The RadioButtonAccimpl class is the accessibility class for RadioButton.
	 */
	public class RadioButtonAccImpl extends CheckBoxAccImpl
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
		public function RadioButtonAccImpl (master:UIComponent);
	}
}