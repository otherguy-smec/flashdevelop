﻿package mx.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.accessibility.AccessibilityProperties;
	import flash.events.Event;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.managers.SystemManager;

include "../core/Version.as"
	/**
	 *  AlertAccImpl is a subclass of AccessibilityImplementation
 *  which implements accessibility for the Alert class.
	 */
	public class AlertAccImpl extends TitleWindowAccImpl
	{
		/**
		 *  @private
	 *	Array of events that we should listen for from the master component.
		 */
		protected function get eventsToHandle () : Array;

		/**
		 *  Enables accessibility in the Alert class.
	 * 
	 *  <p>This method is called by application startup code
	 *  that is autogenerated by the MXML compiler.
	 *  Afterwards, when instances of Alert are initialized,
	 *  their <code>accessibilityImplementation</code> property
	 *  will be set to an instance of this class.</p>
		 */
		public static function enableAccessibility () : void;

		/**
		 *  @private
	 *  Creates an Alert's AccessibilityImplementation object.
	 *  This method is called from UIComponent's
	 *  initializeAccessibility() method.
		 */
		static function createAccessibilityImplementation (component:UIComponent) : void;

		/**
		 *  Constructor.
	 *
	 *  @param master The UIComponent instance that this AccImpl instance
	 *  is making accessible.
		 */
		public function AlertAccImpl (master:UIComponent);

		/**
		 *  @private
	 *  method for returning the name of the child
	 *  which is spoken out by the screen reader.
	 *
	 *  @param childID uint
	 *
	 *  @return Name String
		 */
		protected function getName (childID:uint) : String;

		/**
		 *  @private
	 *  Override the generic event handler.
	 *  All AccImpl must implement this
	 *  to listen for events from its master component.
		 */
		protected function eventHandler (event:Event) : void;
	}
}
