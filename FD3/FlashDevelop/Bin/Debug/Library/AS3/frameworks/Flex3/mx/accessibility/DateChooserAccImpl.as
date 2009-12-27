﻿package mx.accessibility
{
	import flash.accessibility.Accessibility;
	import flash.events.Event;
	import mx.controls.DateChooser;
	import mx.core.UIComponent;
	import mx.core.mx_internal;

include "../core/Version.as"
	/**
	 *  DateChooserAccImpl is a subclass of AccessibilityImplementation
 *  which implements accessibility for the DateChooser class.
	 */
	public class DateChooserAccImpl extends AccImpl
	{
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_FOCUS : uint = 0x8005;
		/**
		 *  @private
		 */
		private static const EVENT_OBJECT_SELECTION : uint = 0x8006;
		/**
		 *  @private
		 */
		private var calFlag : Boolean;
		/**
		 *  @private
		 */
		private var monthFlag : Boolean;
		/**
		 *  @private
		 */
		private var lastSelectedDate : Date;
		/**
		 *  @private
		 */
		private var selDateFallsInCurrMonth : Boolean;

		/**
		 *  @private
	 *	Array of events that we should listen for from the master component.
		 */
		protected function get eventsToHandle () : Array;

		/**
		 *  Enables accessibility in the DateChooser class.
	 * 
	 *  <p>This method is called by application startup code
	 *  that is autogenerated by the MXML compiler.
	 *  Afterwards, when instances of DateChooser are initialized,
	 *  their <code>accessibilityImplementation</code> property
	 *  will be set to an instance of this class.</p>
		 */
		public static function enableAccessibility () : void;

		/**
		 *  @private
	 *  Creates a DateChooser's AccessibilityImplementation object.
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
		public function DateChooserAccImpl (master:UIComponent);

		/**
		 *  @private
	 *  IAccessible method for returning the state of the DateChooser.
	 *  States are predefined for all the components in MSAA.
	 *
	 *  @param childID uint
	 *
	 *  @return State uint
		 */
		public function get_accState (childID:uint) : uint;

		/**
		 *  @private
	 *  IAccessible method for executing the Default Action.
	 *
	 *  @param childID uint
		 */
		public function accDoDefaultAction (childID:uint) : void;

		/**
		 *  @private
	 *  method for returning the name of the DateChooser
	 *  should return the selected date with weekday, month and year.
	 *  appends 'today' if selected date is also today date.
	 *
	 *  @param childID uint
	 *
	 *  @return Name String
		 */
		protected function getName (childID:uint) : String;

		/**
		 *  @private
	 *  Override the generic event handler.
	 *  All AccImpl must implement this to listen
	 *  for events from its master component.
		 */
		protected function eventHandler (event:Event) : void;
	}
}
