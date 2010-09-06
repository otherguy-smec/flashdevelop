﻿package mx.managers.dragClasses
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;
	import mx.core.DragSource;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.core.UIComponent;
	import mx.effects.EffectInstance;
	import mx.effects.Move;
	import mx.effects.Zoom;
	import mx.events.DragEvent;
	import mx.events.EffectEvent;
	import mx.events.InterDragManagerEvent;
	import mx.events.SandboxMouseEvent;
	import mx.events.InterManagerRequest;
	import mx.managers.CursorManager;
	import mx.managers.DragManager;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	/**
	 *  @private
	 */
	public class DragProxy extends UIComponent
	{
		/**
		 *  @private
		 */
		private var cursorClass : Class;
		/**
		 *  @private
		 */
		private var cursorID : int;
		/**
		 *  @private
		 */
		private var lastKeyEvent : KeyboardEvent;
		/**
		 *  @private
		 */
		private var lastMouseEvent : MouseEvent;
		/**
		 *  @private
		 */
		private var sandboxRoot : IEventDispatcher;
		/**
		 *  @private
		 */
		public var dragInitiator : IUIComponent;
		/**
		 *  @private
		 */
		public var dragSource : DragSource;
		/**
		 *  @private
		 */
		public var xOffset : Number;
		/**
		 *  @private
		 */
		public var yOffset : Number;
		/**
		 *  @private
		 */
		public var startX : Number;
		/**
		 *  @private
		 */
		public var startY : Number;
		/**
		 *  @private
		 */
		public var target : DisplayObject;
		/**
		 *  @private
		 */
		public var action : String;
		/**
		 *  @private
		 */
		public var allowMove : Boolean;
		private static var $visible : QName;

		/**
		 *  Constructor.
		 */
		public function DragProxy (dragInitiator:IUIComponent, dragSource:DragSource);
		/**
		 *  @private
		 */
		public function initialize () : void;
		/**
		 *  @private
		 */
		public function showFeedback () : void;
		/**
		 *  @private
		 */
		public function checkKeyEvent (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function keyUpHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		public function stage_mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function dispatchDragEvent (type:String, mouseEvent:MouseEvent, eventTarget:Object) : void;
		/**
		 *  @private
		 */
		private function _dispatchDragEvent (target:DisplayObject, event:DragEvent) : void;
		private function isSameOrChildApplicationDomain (target:Object) : Boolean;
		/**
		 *  @private
		 */
		public function mouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		public function mouseLeaveHandler (event:Event) : void;
		/**
		 *  @private
		 */
		public function mouseUpHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function effectEndHandler (event:EffectEvent) : void;
		/**
		 *  Player doesn't handle this correctly so we have to do it ourselves
		 */
		private static function getObjectsUnderPoint (obj:DisplayObject, pt:Point, arr:Array) : void;
	}
}