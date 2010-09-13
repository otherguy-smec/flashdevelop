﻿package mx.effects
{
	import mx.core.mx_internal;
	import mx.effects.effectClasses.PropertyChanges;
	import mx.effects.effectClasses.AddItemActionInstance;
	import mx.controls.listClasses.ListBase;

	/**
	 *  The AddItemAction class defines an action effect that determines 
	 */
	public class AddItemAction extends Effect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;

		/**
		 *  Constructor.
		 */
		public function AddItemAction (target:Object = null);
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