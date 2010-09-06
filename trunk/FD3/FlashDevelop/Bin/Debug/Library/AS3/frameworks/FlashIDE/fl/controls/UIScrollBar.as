﻿package fl.controls
{
	import Error;
	import fl.controls.ScrollBar;
	import fl.controls.ScrollBarDirection;
	import fl.core.InvalidationType;
	import fl.core.UIComponent;
	import fl.events.ScrollEvent;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;

	/**
	 * The UIScrollBar class includes all of the scroll bar functionality, but 
	 */
	public class UIScrollBar extends ScrollBar
	{
		/**
		 * @private (private)
		 */
		protected var _scrollTarget : TextField;
		/**
		 * @private (private)
		 */
		protected var inEdit : Boolean;
		/**
		 * @private
		 */
		protected var inScroll : Boolean;
		/**
		 * @private
		 */
		private static var defaultStyles : Object;

		/**
		 * @private
		 */
		public function set minScrollPosition (minScrollPosition:Number) : void;
		/**
		 * @private
		 */
		public function set maxScrollPosition (maxScrollPosition:Number) : void;
		/**
		 * Registers a TextField component instance with the ScrollBar component instance.
		 */
		public function get scrollTarget () : TextField;
		/**
		 * @private (setter)
		 */
		public function set scrollTarget (target:TextField) : void;
		/**
		 * @private (internal)
		 */
		public function get scrollTargetName () : String;
		/**
		 * @private (setter)
		 */
		public function set scrollTargetName (target:String) : void;
		/**
		 * @copy fl.controls.ScrollBar#direction
		 */
		public function get direction () : String;
		/**
		 * @private (setter)
		 */
		public function set direction (dir:String) : void;

		/**
		 * @copy fl.core.UIComponent#getStyleDefinition()
		 */
		public static function getStyleDefinition () : Object;
		/**
		 * Creates a new UIScrollBar component instance.
		 */
		public function UIScrollBar ();
		/**
		 * Forces the scroll bar to update its scroll properties immediately.  
		 */
		public function update () : void;
		/**
		 * @private (protected)
		 */
		protected function draw () : void;
		/**
		 * @private (protected)
		 */
		protected function updateScrollTargetProperties () : void;
		/**
		 * @copy fl.controls.ScrollBar#setScrollProperties()
		 */
		public function setScrollProperties (pageSize:Number, minScrollPosition:Number, maxScrollPosition:Number, pageScrollSize:Number = 0) : void;
		/**
		 * @private (protected)
		 */
		public function setScrollPosition (scrollPosition:Number, fireEvent:Boolean = true) : void;
		/**
		 * @private (protected)
		 */
		protected function updateTargetScroll (event:ScrollEvent = null) : void;
		/**
		 * @private (protected)
		 */
		protected function handleTargetChange (event:Event) : void;
		/**
		 * @private (protected)
		 */
		protected function handleTargetScroll (event:Event) : void;
	}
}