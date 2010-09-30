﻿package mx.graphics
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import mx.core.mx_internal;

	/**
	 *  The LinearGradientStroke class lets you specify a gradient filled stroke.
	 */
	public class LinearGradientStroke extends GradientBase implements IStroke
	{
		/**
		 *  @private
		 */
		private var _rotation : Number;
		/**
		 *  @private
		 */
		private var _caps : String;
		/**
		 *  @private
		 */
		private var _interpolationMethod : String;
		/**
		 *  @private
		 */
		private var _joints : String;
		/**
		 *  @private
		 */
		private var _miterLimit : Number;
		/**
		 *  @private
		 */
		private var _pixelHinting : Boolean;
		/**
		 *  @private
		 */
		private var _scaleMode : String;
		/**
		 *  @private
		 */
		private var _spreadMethod : String;
		/**
		 *  @private
		 */
		private var _weight : Number;

		/**
		 *  By default, the LinearGradientStroke defines a transition
		 */
		public function get angle () : Number;
		/**
		 *  @private
		 */
		public function set angle (value:Number) : void;
		/**
		 *  A value from the CapsStyle class
		 */
		public function get caps () : String;
		/**
		 *  @private
		 */
		public function set caps (value:String) : void;
		/**
		 *  A value from the InterpolationMethod class
		 */
		public function get interpolationMethod () : String;
		/**
		 *  @private
		 */
		public function set interpolationMethod (value:String) : void;
		/**
		 *  A value from the JointStyle class that specifies the type
		 */
		public function get joints () : String;
		/**
		 *  @private
		 */
		public function set joints (value:String) : void;
		/**
		 *  A number that indicates the limit at which a miter is cut off. 
		 */
		public function get miterLimit () : Number;
		/**
		 *  @private
		 */
		public function set miterLimit (value:Number) : void;
		/**
		 *  A Boolean value that specifies whether to hint strokes to full pixels.
		 */
		public function get pixelHinting () : Boolean;
		/**
		 *  @private
		 */
		public function set pixelHinting (value:Boolean) : void;
		/**
		 *  A value from the LineScaleMode class
		 */
		public function get scaleMode () : String;
		/**
		 *  @private
		 */
		public function set scaleMode (value:String) : void;
		/**
		 *  A value from the SpreadMethod class
		 */
		public function get spreadMethod () : String;
		/**
		 *  @private
		 */
		public function set spreadMethod (value:String) : void;
		/**
		 *  The line weight, in pixels.
		 */
		public function get weight () : Number;
		/**
		 *  @private
		 */
		public function set weight (value:Number) : void;

		/**
		 *  Constructor.
		 */
		public function LinearGradientStroke (weight:Number = 0, pixelHinting:Boolean = false, scaleMode:String = "normal", caps:String = null, joints:String = null, miterLimit:Number = 0);
		/**
		 *  Applies the properties to the specified Graphics object.
		 */
		public function apply (g:Graphics) : void;
	}
}