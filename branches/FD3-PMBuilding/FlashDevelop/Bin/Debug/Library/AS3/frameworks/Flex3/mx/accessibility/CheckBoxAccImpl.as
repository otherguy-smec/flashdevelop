﻿package mx.accessibility
{
	import mx.controls.Button;
	import mx.controls.CheckBox;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The CheckBoxAccImpl class is the accessibility class for CheckBox.
	 */
	public class CheckBoxAccImpl extends ButtonAccImpl
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_CHECKED : uint = 0x00000010;

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
		public function CheckBoxAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		public function get_accState (childID:uint) : uint;
		/**
		 *  @private
		 */
		public function get_accDefaultAction (childID:uint) : String;
	}
}