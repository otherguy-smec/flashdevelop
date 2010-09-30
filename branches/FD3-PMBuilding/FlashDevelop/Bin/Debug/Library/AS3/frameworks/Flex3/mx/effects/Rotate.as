﻿package mx.effects
{
	import mx.effects.effectClasses.RotateInstance;

	/**
	 *  The Rotate effect rotates a component around a specified point. 
	 */
	public class Rotate extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  The starting angle of rotation of the target object,
		 */
		public var angleFrom : Number;
		/**
		 *  The ending angle of rotation of the target object,
		 */
		public var angleTo : Number;
		/**
		 *  The x-position of the center point of rotation.
		 */
		public var originX : Number;
		/**
		 *  The y-position of the center point of rotation.
		 */
		public var originY : Number;

		/**
		 *  Determines whether the effect should hide the focus ring when starting the
		 */
		public function set hideFocusRing (value:Boolean) : void;
		public function get hideFocusRing () : Boolean;

		/**
		 *  Constructor.
		 */
		public function Rotate (target:Object = null);
		/**
		 *  @private
		 */
		public function getAffectedProperties () : Array;
		/**
		 *  @private
		 */
		protected function initInstance (instance:IEffectInstance) : void;
	}
}