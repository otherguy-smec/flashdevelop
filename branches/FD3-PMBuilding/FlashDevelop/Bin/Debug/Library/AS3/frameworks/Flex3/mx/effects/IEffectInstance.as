﻿package mx.effects
{
	import flash.events.Event;
	import mx.effects.effectClasses.PropertyChanges;

	/**
	 *  The IEffectInstance interface represents an instance of an effect
	 */
	public interface IEffectInstance
	{
		/**
		 *  The name of the effect class, such as <code>"FadeInstance"</code>.
		 */
		public function get className () : String;
		/**
		 *  The duration of the effect, in milliseconds.
		 */
		public function get duration () : Number;
		/**
		 *  @private
		 */
		public function set duration (value:Number) : void;
		/**
		 *  The IEffect object that created this IEffectInstance object.
		 */
		public function get effect () : IEffect;
		/**
		 *  @private
		 */
		public function set effect (value:IEffect) : void;
		/**
		 *  A property that lets you access the target
		 */
		public function get effectTargetHost () : IEffectTargetHost;
		/**
		 *  @private
		 */
		public function set effectTargetHost (value:IEffectTargetHost) : void;
		/**
		 *  Determines whether the effect should hide
		 */
		public function get hideFocusRing () : Boolean;
		/**
		 *  @private
		 */
		public function set hideFocusRing (value:Boolean) : void;
		/**
		 *  Current position in time of the effect.
		 */
		public function get playheadTime () : Number;
		/**
		 *  Specifies the PropertyChanges object containing
		 */
		public function get propertyChanges () : PropertyChanges;
		/**
		 *  @private
		 */
		public function set propertyChanges (value:PropertyChanges) : void;
		/**
		 *  Number of times to repeat the effect.
		 */
		public function get repeatCount () : int;
		/**
		 *  @private
		 */
		public function set repeatCount (value:int) : void;
		/**
		 *  Amount of time, in milliseconds,
		 */
		public function get repeatDelay () : int;
		/**
		 *  @private
		 */
		public function set repeatDelay (value:int) : void;
		/**
		 *  Amount of time, in milliseconds,
		 */
		public function get startDelay () : int;
		/**
		 *  @private
		 */
		public function set startDelay (value:int) : void;
		/**
		 *  If <code>true</code>, blocks all background processing
		 */
		public function get suspendBackgroundProcessing () : Boolean;
		/**
		 *  @private
		 */
		public function set suspendBackgroundProcessing (value:Boolean) : void;
		/**
		 *  The UIComponent object to which this effect is applied.
		 */
		public function get target () : Object;
		/**
		 *  @private
		 */
		public function set target (value:Object) : void;
		/**
		 *  The event, if any, which triggered the playing of the effect.
		 */
		public function get triggerEvent () : Event;
		/**
		 *  @private
		 */
		public function set triggerEvent (value:Event) : void;

		/**
		 *  This method is called if the effect was triggered by the EffectManager. 
		 */
		public function initEffect (event:Event) : void;
		/**
		 *  Plays the effect instance on the target after the
		 */
		public function startEffect () : void;
		/**
		 *  Plays the effect instance on the target.
		 */
		public function play () : void;
		/**
		 *  Pauses the effect until you call the <code>resume()</code> method.
		 */
		public function pause () : void;
		/**
		 *  Stops the effect, leaving the target in its current state.
		 */
		public function stop () : void;
		/**
		 *  Resumes the effect after it has been paused 
		 */
		public function resume () : void;
		/**
		 *  Plays the effect in reverse, starting from
		 */
		public function reverse () : void;
		/**
		 *  Interrupts an effect instance that is currently playing,
		 */
		public function end () : void;
		/**
		 *  Called by the <code>end()</code> method when the effect
		 */
		public function finishEffect () : void;
		/**
		 *  Called after each iteration of a repeated effect finishes playing.
		 */
		public function finishRepeat () : void;
	}
}