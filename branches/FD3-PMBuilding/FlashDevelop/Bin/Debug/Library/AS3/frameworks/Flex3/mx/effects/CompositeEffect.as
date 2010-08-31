﻿package mx.effects
{
	import mx.core.mx_internal;
	import mx.effects.effectClasses.CompositeEffectInstance;
	import mx.effects.effectClasses.PropertyChanges;

	/**
	 *  The CompositeEffect class is the parent class for the Parallel
	 */
	public class CompositeEffect extends Effect
	{
		/**
		 *  @private
		 */
		private var childTargets : Array;
		/**
		 *  @private
		 */
		private var _affectedProperties : Array;
		/**
		 *  An Array containing the child effects of this CompositeEffect.
		 */
		public var children : Array;

		/**
		 *  Constructor. 
		 */
		public function CompositeEffect (target:Object = null);
		/**
		 *  @private
		 */
		public function getAffectedProperties () : Array;
		/**
		 *  @private
		 */
		public function createInstance (target:Object = null) : IEffectInstance;
		/**
		 *  @private
		 */
		public function createInstances (targets:Array = null) : Array;
		/**
		 *  @private
		 */
		protected function filterInstance (propChanges:Array, targ:Object) : Boolean;
		/**
		 *  @private
		 */
		protected function initInstance (instance:IEffectInstance) : void;
		/**
		 *  @private
		 */
		public function captureStartValues () : void;
		/**
		 *  @private
		 */
		function captureValues (propChanges:Array, setStartValues:Boolean) : Array;
		/**
		 *  @private
		 */
		function applyStartValues (propChanges:Array, targets:Array) : void;
		/**
		 *  Adds a new child effect to this composite effect.
		 */
		public function addChild (childEffect:IEffect) : void;
		/**
		 *  @private
		 */
		private function getChildrenTargets () : Array;
	}
}