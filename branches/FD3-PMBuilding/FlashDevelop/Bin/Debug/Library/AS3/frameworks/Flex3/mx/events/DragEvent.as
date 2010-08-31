﻿package mx.events
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.core.DragSource;
	import mx.core.IUIComponent;

	/**
	 *  The DragEvent class represents event objects that are dispatched as part of a drag-and-drop
	 */
	public class DragEvent extends MouseEvent
	{
		/**
		 *  The <code>DragEvent.DRAG_COMPLETE</code> constant defines the value of the 
		 */
		public static const DRAG_COMPLETE : String = "dragComplete";
		/**
		 *  The <code>DragEvent.DRAG_DROP</code> constant defines the value of the 
		 */
		public static const DRAG_DROP : String = "dragDrop";
		/**
		 *  The <code>DragEvent.DRAG_ENTER</code> constant defines the value of the 
		 */
		public static const DRAG_ENTER : String = "dragEnter";
		/**
		 *  The <code>DragEvent.DRAG_EXIT</code> constant defines the value of the 
		 */
		public static const DRAG_EXIT : String = "dragExit";
		/**
		 *  The <code>DragEvent.DRAG_OVER</code> constant defines the value of the 
		 */
		public static const DRAG_OVER : String = "dragOver";
		/**
		 *  The DragEvent.DRAG_START constant defines the value of the 
		 */
		public static const DRAG_START : String = "dragStart";
		/**
		 *  The requested action.
		 */
		public var action : String;
		/**
		 *  If the <code>dragInitiator</code> property contains 
		 */
		public var draggedItem : Object;
		/**
		 *  The component that initiated the drag.
		 */
		public var dragInitiator : IUIComponent;
		/**
		 *  The DragSource object containing the data being dragged.
		 */
		public var dragSource : DragSource;

		/**
		 *  Constructor.
		 */
		public function DragEvent (type:String, bubbles:Boolean = false, cancelable:Boolean = true, dragInitiator:IUIComponent = null, dragSource:DragSource = null, action:String = null, ctrlKey:Boolean = false, altKey:Boolean = false, shiftKey:Boolean = false);
		/**
		 *  @private
		 */
		public function clone () : Event;
	}
}