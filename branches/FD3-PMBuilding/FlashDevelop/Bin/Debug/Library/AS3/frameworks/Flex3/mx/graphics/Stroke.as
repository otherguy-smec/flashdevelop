﻿package mx.graphics
{
	import flash.display.Graphics;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import mx.events.PropertyChangeEvent;

	/**
	 *  The Stroke class defines the properties for a line. 
	 */
	public class Stroke extends EventDispatcher implements IStroke
	{
		private var _alpha : Number;
		private var _caps : String;
		private var _color : uint;
		private var _joints : String;
		private var _miterLimit : Number;
		private var _pixelHinting : Boolean;
		private var _scaleMode : String;
		/**
		 *  @private
		 */
		private var _weight : Number;

		/**
		 *  The transparency of a line.
		 */
		public function get alpha () : Number;
		public function set alpha (value:Number) : void;
		/**
		 *  Specifies the type of caps at the end of lines.
		 */
		public function get caps () : String;
		public function set caps (value:String) : void;
		/**
		 *  The line color. 
		 */
		public function get color () : uint;
		public function set color (value:uint) : void;
		/**
		 *  Specifies the type of joint appearance used at angles.
		 */
		public function get joints () : String;
		public function set joints (value:String) : void;
		/**
		 *  Indicates the limit at which a miter is cut off.
		 */
		public function get miterLimit () : Number;
		public function set miterLimit (value:Number) : void;
		/**
		 *  Specifies whether to hint strokes to full pixels.
		 */
		public function get pixelHinting () : Boolean;
		public function set pixelHinting (value:Boolean) : void;
		/**
		 *  Specifies how to scale a stroke.
		 */
		public function get scaleMode () : String;
		public function set scaleMode (value:String) : void;
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
		public function Stroke (color:uint = 0x000000, weight:Number = 0, alpha:Number = 1.0, pixelHinting:Boolean = false, scaleMode:String = "normal", caps:String = null, joints:String = null, miterLimit:Number = 0);
		/**
		 *  Applies the properties to the specified Graphics object.
		 */
		public function apply (g:Graphics) : void;
		/**
		 *  @private
		 */
		private function dispatchStrokeChangedEvent (prop:String, oldValue:*, value:*) : void;
	}
}