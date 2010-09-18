﻿package mx.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.accessibility.AccessibilityProperties;
	import flash.events.Event;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.managers.SystemManager;

	/**
	 *  The AlertAccImpl class is the accessibility class for Alert.
	 */
	public class AlertAccImpl extends TitleWindowAccImpl
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;

		/**
		 *  @private
		 */
		protected function get eventsToHandle () : Array;

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
		public function AlertAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		protected function getName (childID:uint) : String;
		/**
		 *  @private
		 */
		protected function eventHandler (event:Event) : void;
	}
}