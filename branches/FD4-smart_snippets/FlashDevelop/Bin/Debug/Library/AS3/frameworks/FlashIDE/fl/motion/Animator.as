﻿package fl.motion
{
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Point;

	/**
	 * The Animator class applies an XML description of a motion tween to a display object.
	 */
	public class Animator extends AnimatorBase
	{
		/**
		 * @private (setter)
		 */
		public function set motion (value:MotionBase) : void;

		/**
		 * @private
		 */
		protected function setTargetState () : void;
		/**
		 * @private
		 */
		protected function setTimeClassic (newTime:int, thisMotion:MotionBase, curKeyframe:KeyframeBase) : Boolean;
		/**
		 * Creates an Animator object to apply the XML-based motion tween description to a display object.
		 */
		function Animator (xml:XML = null, target:DisplayObject = null);
		/**
		 * Creates an Animator object from a string of XML. 
		 */
		public static function fromXMLString (xmlString:String, target:DisplayObject = null) : Animator;
	}
}