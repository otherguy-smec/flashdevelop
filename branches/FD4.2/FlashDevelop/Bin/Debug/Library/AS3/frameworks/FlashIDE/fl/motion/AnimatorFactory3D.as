﻿package fl.motion
{
	import flash.geom.Vector3D;

	/**
	 * The AnimatorFactory3D class provides ActionScript-based support to associate one Motion object containing
	 */
	public class AnimatorFactory3D extends AnimatorFactoryBase
	{
		/**
		 * Creates an AnimatorFactory3D instance you can use to assign the properties of
		 */
		public function AnimatorFactory3D (motion:MotionBase);
		/**
		 * @private
		 */
		protected function getNewAnimator () : AnimatorBase;
	}
}