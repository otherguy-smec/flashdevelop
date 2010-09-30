﻿package mx.controls.dataGridClasses
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.controls.DataGrid;
	import mx.core.EdgeMetrics;
	import mx.core.FlexSprite;
	import mx.core.FlexVersion;
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.core.UIComponentGlobals;
	import mx.events.DataGridEvent;
	import mx.events.SandboxMouseEvent;
	import mx.managers.CursorManager;
	import mx.managers.CursorManagerPriority;
	import mx.skins.halo.DataGridColumnDropIndicator;
	import mx.styles.ISimpleStyleClient;
	import mx.styles.StyleManager;
	import mx.core.mx_internal;
	import mx.effects.easing.Back;

	/**
	 *  The DataGridHeader class defines the default header
	 */
	public class DataGridHeader extends DataGridHeaderBase
	{
		/**
		 *  @private
		 */
		private var separatorAffordance : Number;
		/**
		 *  The DataGrid control associated with this renderer.
		 */
		protected var dataGrid : DataGrid;
		/**
		 *  An Array of header renderer instances.
		 */
		protected var headerItems : Array;
		/**
		 *  The cached header height, in pixels.
		 */
		protected var cachedHeaderHeight : Number;
		/**
		 *  The cached padding for the bottom of the renderer, in pixels.
		 */
		protected var cachedPaddingBottom : Number;
		/**
		 *  The cached padding for the top of the renderer, in pixels.
		 */
		protected var cachedPaddingTop : Number;
		/**
		 *  Whether we need the separator on the far right
		 */
		public var needRightSeparator : Boolean;
		/**
		 *  Whether we need the separator events on the far right
		 */
		public var needRightSeparatorEvents : Boolean;
		/**
		 *  @private
		 */
		private var resizeCursorID : int;
		/**
		 *  @private
		 */
		private var startX : Number;
		/**
		 *  @private
		 */
		private var minX : Number;
		/**
		 *  @private
		 */
		private var lastPt : Point;
		/**
		 *  @private
		 */
		private var separators : Array;
		/**
		 *  Specifies a graphic that shows the proposed column width as the user stretches it.
		 */
		private var resizeGraphic : IFlexDisplayObject;
		/**
		 *  @private
		 */
		private var lastItemDown : IListItemRenderer;
		/**
		 *  @private
		 */
		private var dropColumnIndex : int;
		/**
		 *  @private
		 */
		local var columnDropIndicator : IFlexDisplayObject;
		/**
		 *  The small arrow graphic used to show sortable columns and direction.
		 */
		local var sortArrow : IFlexDisplayObject;
		/**
		 *  The offset, in pixels, from the left side of the content of the renderer.
		 */
		public var leftOffset : Number;
		/**
		 *  The offset, in pixels, from the top of the content of the renderer.
		 */
		public var topOffset : Number;
		/**
		 *  The offset, in pixels, from the right side of the content of the renderer.
		 */
		public var rightOffset : Number;
		/**
		 *  The offset, in pixels, from the bottom of the content of the renderer.
		 */
		public var bottomOffset : Number;
		/**
		 *  @private
		 */
		private var allowItemSizeChangeNotification : Boolean;
		private var headerBGSkinChanged : Boolean;
		private var headerSepSkinChanged : Boolean;

		/**
		 *  @copy mx.core.IUIComponent#enabled
		 */
		public function set enabled (value:Boolean) : void;
		/**
		 *  @private
		 */
		private function get resizingColumn () : DataGridColumn;
		/**
		 *  @private
		 */
		private function set resizingColumn (value:DataGridColumn) : void;
		/**
		 *  diagnostics
		 */
		function get rendererArray () : Array;

		/**
		 *  Constructor.
		 */
		public function DataGridHeader ();
		/**
		 *  a function to clear selections
		 */
		function clearSelectionLayer () : void;
		/**
		 *  @inheritDoc
		 */
		protected function createChildren () : void;
		/**
		 *  @inheritDoc
		 */
		protected function measure () : void;
		/**
		 *  @inheritDoc
		 */
		protected function updateDisplayList (w:Number, h:Number) : void;
		function _drawHeaderBackground (headerBG:UIComponent) : void;
		/**
		 *  Draws the background of the headers into the given 
		 */
		protected function drawHeaderBackground (headerBG:UIComponent) : void;
		private function drawHeaderBackgroundSkin (headerBGSkin:IFlexDisplayObject) : void;
		function _clearSeparators () : void;
		/**
		 *  Removes column header separators that the user normally uses
		 */
		protected function clearSeparators () : void;
		function _drawSeparators () : void;
		/**
		 *  Creates and displays the column header separators that the user 
		 */
		protected function drawSeparators () : void;
		/**
		 *  Draws the highlight indicator into the given Sprite
		 */
		protected function drawHeaderIndicator (indicator:Sprite, x:Number, y:Number, width:Number, height:Number, color:uint, itemRenderer:IListItemRenderer) : void;
		/**
		 *  Draws the selection indicator into the given Sprite
		 */
		protected function drawSelectionIndicator (indicator:Sprite, x:Number, y:Number, width:Number, height:Number, color:uint, itemRenderer:IListItemRenderer) : void;
		/**
		 *  Draws the overlay on the dragged column into the given Sprite
		 */
		protected function drawColumnDragOverlay (indicator:Sprite, x:Number, y:Number, width:Number, height:Number, color:uint, itemRenderer:IListItemRenderer) : void;
		/**
		 *  @private
		 */
		private function columnResizeMouseOverHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function columnResizeMouseOutHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function columnResizeMouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function columnResizingHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function columnResizeMouseUpHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function columnDraggingMouseMoveHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function columnDraggingMouseUpHandler (event:Event) : void;
		/**
		 *  @private
		 */
		protected function mouseOverHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseOutHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseDownHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		protected function mouseUpHandler (event:MouseEvent) : void;
		function _placeSortArrow () : void;
		/**
		 *  Draws the sort arrow graphic on the column that is the current sort key.
		 */
		protected function placeSortArrow () : void;
		/**
		 *  @private
		 */
		public function invalidateSize () : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		function getSeparators () : Array;
	}
}