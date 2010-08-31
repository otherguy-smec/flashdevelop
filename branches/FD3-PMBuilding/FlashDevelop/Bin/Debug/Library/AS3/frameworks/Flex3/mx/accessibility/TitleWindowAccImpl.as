﻿package mx.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.containers.Panel;
	import mx.containers.TitleWindow;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

	/**
	 *  The TitleWindowAccImpl class is the accessibility class for TitleWindow.
	 */
	public class TitleWindowAccImpl extends PanelAccImpl
	{
		/**
		 *  @private
		 */
		private static var accessibilityHooked : Boolean;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_FOCUSED : uint = 0x00000004;
		/**
		 *  @private
		 */
		private static const STATE_SYSTEM_MOVEABLE : uint = 0x00040000;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_CREATE : uint = 0x8000;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_DESTROY : uint = 0x8001;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_LOCATIONCHANGE : uint = 0x800B;

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
		public function TitleWindowAccImpl (master:UIComponent);
		/**
		 *  @private
		 */
		public function get_accState (childID:uint) : uint;
		/**
		 *  @private
		 */
		protected function eventHandler (event:Event) : void;
	}
}