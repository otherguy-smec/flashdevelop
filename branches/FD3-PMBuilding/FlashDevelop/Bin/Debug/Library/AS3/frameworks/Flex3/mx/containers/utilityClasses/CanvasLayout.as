﻿package mx.containers.utilityClasses
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import mx.containers.Canvas;
	import mx.containers.errors.ConstraintError;
	import mx.core.Container;
	import mx.core.EdgeMetrics;
	import mx.core.FlexVersion;
	import mx.core.IConstraintClient;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.MoveEvent;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.styles.StyleManager;
	import flash.utils.Dictionary;
	import mx.containers.utilityClasses.ConstraintColumn;
	import mx.core.IUIComponent;
	import mx.containers.utilityClasses.ConstraintRow;

	/**
	 *  @private
	 */
	public class CanvasLayout extends Layout
	{
		/**
		 *  @private
		 */
		private static var r : Rectangle;
		private var _contentArea : Rectangle;
		private var colSpanChildren : Array;
		private var rowSpanChildren : Array;
		private var constraintCache : Dictionary;
		private var constraintRegionsInUse : Boolean;

		/**
		 *  @private
		 */
		public function set target (value:Container) : void;

		/**
		 *  @private
		 */
		private function bound (a:Number, min:Number, max:Number) : Number;
		/**
		 *  Constructor.
		 */
		public function CanvasLayout ();
		/**
		 *  @private
		 */
		public function measure () : void;
		/**
		 *  @private
		 */
		public function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		private function applyAnchorStylesDuringMeasure (child:IUIComponent, r:Rectangle) : void;
		/**
		 *  @private
		 */
		private function applyAnchorStylesDuringUpdateDisplayList (availableWidth:Number, availableHeight:Number, child:IUIComponent = null) : void;
		/**
		 *  @private
		 */
		private function measureContentArea () : Rectangle;
		/**
		 *  @private
		 */
		private function parseConstraints (child:IUIComponent = null) : ChildConstraintInfo;
		/**
		 *  @private
		 */
		private function measureColumnsAndRows () : void;
		/**
		 *  @private
		 */
		private function shareColumnSpace (entry:ContentColumnChild, availableWidth:Number) : Number;
		/**
		 *  @private
		 */
		private function shareRowSpace (entry:ContentRowChild, availableHeight:Number) : Number;
		/**
		 *  @private
		 */
		private function getLayoutConstraints (child:IUIComponent) : LayoutConstraints;
		/**
		 *  @private
		 */
		private function parseConstraintExp (val:String) : Array;
		/**
		 *  @private
		 */
		private function target_childAddHandler (event:ChildExistenceChangedEvent) : void;
		/**
		 *  @private
		 */
		private function target_childRemoveHandler (event:ChildExistenceChangedEvent) : void;
		/**
		 *  @private
		 */
		private function child_moveHandler (event:MoveEvent) : void;
	}
	/**
	 /////////////////////////////////////////////////////////////////////////////
	 */
	internal class ChildConstraintInfo
	{
		public var left : Number;
		public var right : Number;
		public var hc : Number;
		public var top : Number;
		public var bottom : Number;
		public var vc : Number;
		public var baseline : Number;
		public var leftBoundary : String;
		public var rightBoundary : String;
		public var hcBoundary : String;
		public var topBoundary : String;
		public var bottomBoundary : String;
		public var vcBoundary : String;
		public var baselineBoundary : String;

		/**
		 *  @private
		 */
		public function ChildConstraintInfo (left:Number, right:Number, hc:Number, top:Number, bottom:Number, vc:Number, baseline:Number, leftBoundary:String = null, rightBoundary:String = null, hcBoundary:String = null, topBoundary:String = null, bottomBoundary:String = null, vcBoundary:String = null, baselineBoundary:String = null);
	}
	/**
	 /////////////////////////////////////////////////////////////////////////////
	 */
	internal class ContentColumnChild
	{
		public var leftCol : ConstraintColumn;
		public var leftOffset : Number;
		public var left : Number;
		public var rightCol : ConstraintColumn;
		public var rightOffset : Number;
		public var right : Number;
		public var hcCol : ConstraintColumn;
		public var hcOffset : Number;
		public var hc : Number;
		public var child : IUIComponent;
		public var span : Number;

		/**
		 *  @private
		 */
		public function ContentColumnChild ();
	}
	/**
	 /////////////////////////////////////////////////////////////////////////////
	 */
	internal class ContentRowChild
	{
		public var topRow : ConstraintRow;
		public var topOffset : Number;
		public var top : Number;
		public var bottomRow : ConstraintRow;
		public var bottomOffset : Number;
		public var bottom : Number;
		public var vcRow : ConstraintRow;
		public var vcOffset : Number;
		public var vc : Number;
		public var baselineRow : ConstraintRow;
		public var baselineOffset : Number;
		public var baseline : Number;
		public var child : IUIComponent;
		public var span : Number;

		/**
		 *  @private
		 */
		public function ContentRowChild ();
	}
	/**
	 /////////////////////////////////////////////////////////////////////////////
	 */
	internal class LayoutConstraints
	{
		public var baseline : *;
		public var bottom : *;
		public var horizontalCenter : *;
		public var left : *;
		public var right : *;
		public var top : *;
		public var verticalCenter : *;

		/**
		 *  @private
		 */
		public function LayoutConstraints ();
	}
}