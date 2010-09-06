﻿package mx.states
{
	import flash.events.EventDispatcher;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;

	/**
	 *  Dispatched when the view state has been entered.
	 */
	[Event(name="enterState", type="mx.events.FlexEvent")] 
	/**
	 *  Dispatched before a view state is exited.
	 */
	[Event(name="exitState", type="mx.events.FlexEvent")] 

	/**
	 *  The State class defines a view state, a particular view of a component.
	 */
	public class State extends EventDispatcher
	{
		/**
		 *  @private
		 */
		private var initialized : Boolean;
		/**
		 *  The name of the view state upon which this view state is based, or
		 */
		public var basedOn : String;
		/**
		 *  The name of the view state.
		 */
		public var name : String;
		/**
		 *  The overrides for this view state, as an Array of objects that implement
		 */
		public var overrides : Array;

		/**
		 *  Constructor.
		 */
		public function State ();
		/**
		 *  @private
		 */
		function initialize () : void;
		/**
		 *  @private
		 */
		function dispatchEnterState () : void;
		/**
		 *  @private
		 */
		function dispatchExitState () : void;
	}
}