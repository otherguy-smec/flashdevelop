﻿package mx.managers
{
	import flash.desktop.Clipboard;
	import flash.desktop.NativeDragManager;
	import flash.desktop.NativeDragOptions;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.NativeDragEvent;
	import flash.geom.Point;
	import flash.system.Capabilities;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.core.UIComponentGlobals;
	import mx.core.mx_internal;
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	import mx.events.InterManagerRequest;
	import mx.events.InterDragManagerEvent;
	import mx.managers.dragClasses.DragProxy;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	/**
	 *  @private
	 */
	public class NativeDragManagerImpl implements IDragManager
	{
		/**
		 *  @private
		 */
		private static var sm : ISystemManager;
		/**
		 *  @private
		 */
		private static var instance : IDragManager;
		/**
		 *  @private
		 */
		public var dragProxy : DragProxy;
		/**
		 *  @private
		 */
		private var mouseIsDown : Boolean;
		private var _action : String;
		/**
		 *  @private
		 */
		private var _dragInitiator : IUIComponent;
		/**
		 *  @private
		 */
		private var _clipboard : Clipboard;
		/**
		 *  @private
		 */
		private var _dragImage : IFlexDisplayObject;
		private var _offset : Point;
		private var _allowedActions : NativeDragOptions;
		private var _allowMove : Boolean;
		private var _relatedObject : InteractiveObject;
		/**
		 *  @private
		 */
		private var sandboxRoot : IEventDispatcher;

		/**
		 *  Read-only property that returns <code>true</code>
		 */
		public function get isDragging () : Boolean;

		/**
		 *  @private
		 */
		public static function getInstance () : IDragManager;
		/**
		 *  @private
		 */
		public function NativeDragManagerImpl ();
		/**
		 *  Initiates a drag and drop operation.
		 */
		public function doDrag (dragInitiator:IUIComponent, dragSource:DragSource, mouseEvent:MouseEvent, dragImage:IFlexDisplayObject = null, xOffset:Number = 0, yOffset:Number = 0, imageAlpha:Number = 0.5, allowMove:Boolean = true) : void;
		/**
		 *  Finish up the doDrag once the dragImage has been drawn
		 */
		private function initiateDrag (event:FlexEvent, removeImage:Boolean = true) : void;
		/**
		 *  Call this method from your <code>dragEnter</code> event handler if you accept
		 */
		public function acceptDragDrop (target:IUIComponent) : void;
		/**
		 *  Sets the feedback indicator for the drag and drop operation.
		 */
		public function showFeedback (feedback:String) : void;
		/**
		 *  Returns the current drag and drop feedback.
		 */
		public function getFeedback () : String;
		/**
		 *  @Review
		 */
		public function endDrag () : void;
		/**
		 *  @private
		 */
		function registerSystemManager (sm:ISystemManager) : void;
		/**
		 *  @private
		 */
		function unregisterSystemManager (sm:ISystemManager) : void;
		private function sm_mouseDownHandler (event:MouseEvent) : void;
		private function sm_mouseUpHandler (event:MouseEvent) : void;
		/**
		 *  Listens for all NativeDragEvents and then redispatches them as DragEvents
		 */
		private function nativeDragEventHandler (event:NativeDragEvent) : void;
		/**
		 *  @private
		 */
		private function _dispatchDragEvent (target:DisplayObject, event:DragEvent) : void;
		private function isSameOrChildApplicationDomain (target:Object) : Boolean;
		/**
		 *  Marshal dispatchEvents
		 */
		private function marshalDispatchEventHandler (event:Event) : void;
		/**
		 *  Marshal dragManager
		 */
		private function marshalDragManagerHandler (event:Event) : void;
	}
}