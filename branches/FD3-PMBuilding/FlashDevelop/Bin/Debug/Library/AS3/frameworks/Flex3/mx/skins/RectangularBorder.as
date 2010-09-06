﻿package mx.skins
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Shape;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.getDefinitionByName;
	import mx.core.EdgeMetrics;
	import mx.core.FlexLoader;
	import mx.core.FlexShape;
	import mx.core.IChildList;
	import mx.core.IContainer;
	import mx.core.IRawChildrenContainer;
	import mx.core.mx_internal;
	import mx.core.IRectangularBorder;
	import mx.managers.ISystemManager;
	import mx.managers.SystemManager;
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;
	import mx.styles.ISimpleStyleClient;

	/**
	 *  The RectangularBorder class is an abstract base class for various classes
	 */
	public class RectangularBorder extends Border implements IRectangularBorder
	{
		/**
		 *  @private
		 */
		private var backgroundImageStyle : Object;
		/**
		 *  @private
		 */
		private var backgroundImageWidth : Number;
		/**
		 *  @private
		 */
		private var backgroundImageHeight : Number;
		/**
		 *  @private
		 */
		private var resourceManager : IResourceManager;
		/**
		 *  The DisplayObject instance that contains the background image, if any.
		 */
		private var backgroundImage : DisplayObject;
		/**
		 *  @private
		 */
		private var _backgroundImageBounds : Rectangle;

		/**
		 *  Contains <code>true</code> if the RectangularBorder instance
		 */
		public function get hasBackgroundImage () : Boolean;
		/**
		 *  Rectangular area within which to draw the background image.
		 */
		public function get backgroundImageBounds () : Rectangle;
		/**
		 *  @private
		 */
		public function set backgroundImageBounds (value:Rectangle) : void;

		/**
		 *  Constructor.
		 */
		public function RectangularBorder ();
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		private function initBackgroundImage (image:DisplayObject) : void;
		/**
		 *  Layout the background image.
		 */
		public function layoutBackgroundImage () : void;
		/**
		 *  @private
		 */
		private function getBackgroundSize () : Number;
		/**
		 *  @private
		 */
		private function errorEventHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function completeEventHandler (event:Event) : void;
		/**
		 * Discard old background image.
		 */
		private function removedHandler (event:Event) : void;
	}
}