﻿package mx.effects.effectClasses
{
	import mx.effects.EffectTargetFilter;

	/**
	 *  AddRemoveEffectTargetFilter is a subclass of EffectTargetFilter that handles
	 */
	public class AddRemoveEffectTargetFilter extends EffectTargetFilter
	{
		/**
		 *  Determines if this is an add or remove filter.
		 */
		public var add : Boolean;

		/**
		 *  Constructor.
		 */
		public function AddRemoveEffectTargetFilter ();
		/**
		 *  @private
		 */
		protected function defaultFilterFunction (propChanges:Array, instanceTarget:Object) : Boolean;
	}
}