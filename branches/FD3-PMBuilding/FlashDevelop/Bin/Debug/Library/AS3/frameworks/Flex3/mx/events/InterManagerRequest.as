﻿package mx.events
{
	import flash.events.Event;

	/**
	 *  This is an event that is sent between ApplicationDomains
	 */
	public class InterManagerRequest extends Event
	{
		/**
		 *  Communication between CursorManagers use this request type.
		 */
		public static const CURSOR_MANAGER_REQUEST : String = "cursorManagerRequest";
		/**
		 *  Communication between DragManagers use this request type.
		 */
		public static const DRAG_MANAGER_REQUEST : String = "dragManagerRequest";
		/**
		 *  Ask the other ApplicationDomain to instantiate a manager in
		 */
		public static const INIT_MANAGER_REQUEST : String = "initManagerRequest";
		/**
		 *  Request the SystemManager to perform some action.
		 */
		public static const SYSTEM_MANAGER_REQUEST : String = "systemManagerRequest";
		/**
		 *  Communication between ToolTipManagers use this request type.
		 */
		public static const TOOLTIP_MANAGER_REQUEST : String = "tooltipManagerRequest";
		/**
		 *  Name of property or method or manager to instantiate.
		 */
		public var name : String;
		/**
		 *  Value of property, or array of parameters for method.
		 */
		public var value : Object;

		/**
		 *  Constructor. Does not return anything, but the <code>value</code> property can be modified
		 */
		public function InterManagerRequest (type:String, bubbles:Boolean = false, cancelable:Boolean = false, name:String = null, value:Object = null);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}