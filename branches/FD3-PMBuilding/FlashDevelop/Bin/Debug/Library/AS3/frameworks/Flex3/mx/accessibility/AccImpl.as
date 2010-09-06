﻿package mx.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.accessibility.AccessibilityImplementation;
	import flash.accessibility.AccessibilityProperties;
	import flash.events.Event;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The AccImpl class is the base class for accessibility in components.
	 */
	public class AccImpl extends AccessibilityImplementation
	{
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_NORMAL : uint = 0x00000000;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_FOCUSABLE : uint = 0x00100000;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_FOCUSED : uint = 0x00000004;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_UNAVAILABLE : uint = 0x00000001;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_NAMECHANGE : uint = 0x800C;
		/**
		 *  A reference to the UIComponent instance that this AccImpl instance
		 */
		protected var master : UIComponent;
		/**
		 *  Accessibility Role of the component being made accessible.
		 */
		protected var role : uint;

		/**
		 *  All subclasses must override this function by returning an array
		 */
		protected function get eventsToHandle () : Array;

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
		public function AccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		public function get_accRole (childID:uint) : uint;
		/**
		 *  @private
		 */
		public function get_accName (childID:uint) : String;
		/**
		 *  Returns the name of the accessible component.
		 */
		protected function getName (childID:uint) : String;
		/**
		 *  Utility method determines state of the accessible component.
		 */
		protected function getState (childID:uint) : uint;
		/**
		 *  @private
		 */
		private function getStatusName () : String;
		/**
		 *  Generic event handler.
		 */
		protected function eventHandler (event:Event) : void;
	}
}