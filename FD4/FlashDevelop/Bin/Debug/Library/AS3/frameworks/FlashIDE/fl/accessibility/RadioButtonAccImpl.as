﻿package fl.accessibility
{
	import fl.controls.RadioButton;
	import fl.core.UIComponent;

	/**
	 * The RadioButtonAccImpl class, also called the RadioButton Accessibility Implementation class,
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
		public static function createAccessibilityImplementation (component:UIComponent) : void;
		/**
		 *  Enables accessibility for a RadioButton component.
		 */
		public static function enableAccessibility () : void;
		/**
		 * @private
		 */
		public function RadioButtonAccImpl (master:UIComponent);
	}
}