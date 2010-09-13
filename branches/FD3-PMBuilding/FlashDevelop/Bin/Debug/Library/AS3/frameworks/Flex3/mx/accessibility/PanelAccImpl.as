﻿package mx.accessibility
{
	import mx.containers.Panel;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The PanelAccImpl class is the accessibility class for Panel.
	 */
	public class PanelAccImpl extends AccImpl
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;
		/**
		 *  @private
		 */
		private static const ROLE_SYSTEM_DIALOG : uint = 0x12;
		/**
		 *  @private
		 */
		private static const ROLE_SYSTEM_TITLEBAR : uint = 0x01;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_FOCUSED : uint = 0x00000004;

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
		public function PanelAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		public function get_accRole (childID:uint) : uint;
		/**
		 *  @private
		 */
		public function get_accState (childID:uint) : uint;
		/**
		 *  @private
		 */
		public function getChildIDArray () : Array;
		/**
		 *  @private
		 */
		public function accLocation (childID:uint) : *;
		/**
		 *  @private
		 */
		protected function getName (childID:uint) : String;
	}
}