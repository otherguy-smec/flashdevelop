﻿package mx.effects
{
	import mx.core.mx_internal;
	import mx.effects.effectClasses.PropertyChanges;
	import mx.effects.effectClasses.RemoveChildActionInstance;

	/**
	 *  The RemoveChildAction class defines an action effect that corresponds
	 */
	public class RemoveChildAction extends Effect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;

		/**
		 *  Constructor.
		 */
		public function RemoveChildAction (target:Object = null);
		/**
		 *  @private
		 */
		public function getAffectedProperties () : Array;
		/**
		 *  @private
		 */
		private function propChangesSortHandler (first:PropertyChanges, second:PropertyChanges) : Number;
		/**
		 *  @private
		 */
		function applyStartValues (propChanges:Array, targets:Array) : void;
		/**
		 *  @private
		 */
		protected function getValueFromTarget (target:Object, property:String) : *;
		/**
		 *  @private
		 */
		protected function applyValueToTarget (target:Object, property:String, value:*, props:Object) : void;
	}
}