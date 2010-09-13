﻿package fl.motion
{
	import flash.display.BlendMode;
	import flash.filters.BitmapFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.utils.*;

	/**
	 * The KeyframeBase class defines the visual state at a specific time in a motion tween.
	 */
	public class KeyframeBase
	{
		/**
		 * @private
		 */
		private var _index : int;
		/**
		 * The horizontal position of the target object's transformation point in its parent's coordinate space.
		 */
		public var x : Number;
		/**
		 * The vertical position of the target object's transformation point in its parent's coordinate space.
		 */
		public var y : Number;
		/**
		 * Indicates the horizontal scale as a percentage of the object as applied from the transformation point.
		 */
		public var scaleX : Number;
		/**
		 * Indicates the vertical scale as a percentage of the object as applied from the transformation point.
		 */
		public var scaleY : Number;
		/**
		 * Indicates the horizontal skew angle of the target object in degrees as applied from the transformation point.
		 */
		public var skewX : Number;
		/**
		 * Indicates the vertical skew angle of the target object in degrees as applied from the transformation point.
		 */
		public var skewY : Number;
		/**
		 * The rotation (z-axis) values of the target object in the motion relative to previous orientation as applied from the transformation point,
		 */
		public var rotationConcat : Number;
		/**
		 * If set to <code>true</code>, this property causes the target object to rotate when data for motion is supplied by <code>addpropertyarray</code>.
		 */
		public var useRotationConcat : Boolean;
		/**
		 * An array that contains each filter object to be applied to the target object at a particular keyframe.
		 */
		public var filters : Array;
		/**
		 * A color object that adjusts the color transform in the target object.
		 */
		public var color : fl.motion.Color;
		/**
		 * A string used to describe the keyframe.
		 */
		public var label : String;
		/**
		 * Stores the value of the Loop checkbox for motion tweens, which affects graphic symbols only. 
		 */
		public var loop : String;
		/**
		 * Stores the name of the first frame for motion tweens, which affects graphic symbols only. 
		 */
		public var firstFrame : String;
		/**
		 * If set to <code>true</code>, Flash Player caches an internal bitmap representation of the display object.
		 */
		public var cacheAsBitmap : Boolean;
		/**
		 * A value from the BlendMode class that specifies how Flash Player 
		 */
		public var blendMode : String;
		/**
		 * Controls how the target object rotates during a motion tween,
		 */
		public var rotateDirection : String;
		/**
		 * Adds rotation to the target object during a motion tween, in addition to any existing rotation.
		 */
		public var rotateTimes : uint;
		/**
		 * If set to <code>true</code>, this property causes the target object to rotate automatically 
		 */
		public var orientToPath : Boolean;
		/**
		 * Indicates that the target object should not be displayed on this keyframe.
		 */
		public var blank : Boolean;
		/**
		 * Stores <code>matrix3d</code> property if one exists for this keyframe. <code>matrix3d</code> is used for non-tween frames containing 3D.
		 */
		public var matrix3D : Object;
		/**
		 * The depth (z-axis) position of the target object's transformation point in its parent's coordinate space.
		 */
		public var z : Number;
		/**
		 * Stores <code>rotationX</code> property for this keyframe. This property is the rotation of the target object around the x-axis from its original orientation.
		 */
		public var rotationX : Number;
		/**
		 * Stores <code>rotationY</code> property for this keyframe. This property is the rotation of the target object around the y-axis from its original orientation.
		 */
		public var rotationY : Number;
		/**
		 * Stores <code>AdjustColor</code> instances mapped to their corresponding index in the filters Array for this keyframe. 
		 */
		public var adjustColorObjects : Dictionary;

		/**
		 * The keyframe's unique time value in the motion tween. The first frame in a motion tween has an index of <code>0</code>.
		 */
		public function get index () : int;
		/**
		 * @private (setter)
		 */
		public function set index (value:int) : void;
		/**
		 * Indicates the rotation of the target object in degrees 
		 */
		public function get rotation () : Number;
		/**
		 * @private (setter)
		 */
		public function set rotation (value:Number) : void;
		public function get tweensLength () : int;

		/**
		 * Constructor for keyframe instances.
		 */
		function KeyframeBase (xml:XML = null);
		/**
		 * @private
		 */
		private function setDefaults () : void;
		/**
		 * Retrieves the value of a specific tweenable property on the keyframe.
		 */
		public function getValue (tweenableName:String) : Number;
		/**
		 * Changes the value of a specific tweenable property on the keyframe.
		 */
		public function setValue (tweenableName:String, newValue:Number) : void;
		/**
		 * @private
		 */
		protected function hasTween () : Boolean;
		/**
		 * Indicates whether the keyframe has an influence on a specific animation property.
		 */
		public function affectsTweenable (tweenableName:String = '') : Boolean;
		/**
		 * Sets one of the four <code>AdjustColor</code> properties to the <code>AdjustColor</code> object for the given filter index. 
		 */
		public function setAdjustColorProperty (filterIndex:int, propertyName:String, value:*) : void;
	}
}