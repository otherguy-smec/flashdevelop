﻿package mx.graphics
{
	import flash.display.IBitmapDrawable;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	import flash.utils.ByteArray;
	import flash.utils.getDefinitionByName;
	import mx.core.IFlexDisplayObject;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.graphics.codec.IImageEncoder;
	import mx.graphics.codec.PNGEncoder;
	import mx.utils.Base64Encoder;

	/**
	 *  A helper class used to capture a snapshot of any Flash component 
	 */
	public dynamic class ImageSnapshot
	{
		/**
		 *  The maximum width and height of a Bitmap.
		 */
		public static const MAX_BITMAP_DIMENSION : int = 2880;
		/**
		 *  The default <code>mx.graphics.codec.IImageEncoder</code> implementation
		 */
		public static var defaultEncoder : Class;
		/**
		 *  @private
		 */
		private var _contentType : String;
		/**
		 *  @private
		 */
		private var _data : ByteArray;
		/**
		 *  @private
		 */
		private var _height : int;
		/**
		 *  @private
		 */
		private var _properties : Object;
		/**
		 *  @private
		 */
		private var _width : int;

		/**
		 *  The MIME content type for the image encoding format
		 */
		public function get contentType () : String;
		/**
		 *  @private
		 */
		public function set contentType (value:String) : void;
		/**
		 *  The encoded data representing the image snapshot.
		 */
		public function get data () : ByteArray;
		/**
		 *  @private
		 */
		public function set data (value:ByteArray) : void;
		/**
		 *  The image height in pixels.
		 */
		public function get height () : int;
		/**
		 *  @private
		 */
		public function set height (value:int) : void;
		/**
		 *  An Object containing name/value pairs
		 */
		public function get properties () : Object;
		/**
		 *  @private
		 */
		public function set properties (value:Object) : void;
		/**
		 * The image width in pixels.
		 */
		public function get width () : int;
		/**
		 *  @private
		 */
		public function set width (value:int) : void;

		/**
		 *  A utility method to grab a raw snapshot of a UI component as BitmapData.
		 */
		public static function captureBitmapData (source:IBitmapDrawable, matrix:Matrix = null, colorTransform:ColorTransform = null, blendMode:String = null, clipRect:Rectangle = null, smoothing:Boolean = false) : BitmapData;
		/**
		 *  A utility method to grab a snapshot of a component, scaled to a specific
		 */
		public static function captureImage (source:IBitmapDrawable, dpi:Number = 0, encoder:IImageEncoder = null, scaleLimited:Boolean = true) : ImageSnapshot;
		/**
		 *  A utility method to convert an ImageSnapshot into a Base-64 encoded
		 */
		public static function encodeImageAsBase64 (snapshot:ImageSnapshot) : String;
		/**
		 *  @private
		 */
		private static function captureAll (source:IBitmapDrawable, bounds:Rectangle, matrix:Matrix, colorTransform:ColorTransform = null, blendMode:String = null, clipRect:Rectangle = null, smoothing:Boolean = false) : ByteArray;
		/**
		 *  @private
		 */
		private static function mergePixelRows (left:ByteArray, leftWidth:int, right:ByteArray, rightWidth:int, rightHeight:int) : ByteArray;
		/**
		 *  @private
		 */
		private static function prepareToPrintObject (target:IUIComponent) : Array;
		/**
		 *  @private
		 */
		private static function finishPrintObject (target:IUIComponent, normalStates:Array) : void;
		/**
		 *  Constructor.
		 */
		public function ImageSnapshot (width:int = 0, height:int = 0, data:ByteArray = null, contentType:String = null);
	}
}