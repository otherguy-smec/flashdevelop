﻿package mx.effects
{
	import flash.events.Event;
	import mx.effects.effectClasses.PropertyChanges;

	/**
	 *  The IEffectInstance interface represents an instance of an effect
 *  playing on a target.
 *  Each target has a separate effect instance associated with it.
 *  An effect instance's lifetime is transitory.
 *  An instance is created when the effect is played on a target
 *  and is destroyed when the effect has finished playing. 
 *  If there are multiple effects playing on a target at the same time 
 *  (for example, a Parallel effect), there is a separate effect instance
 *  for each effect.
 * 
 *  <p>Effect developers must create an instance class
 *  for their custom effects.</p>
 *
 *  @see mx.effects.Effect
	 */
	public interface IEffectInstance
	{
		/**
		 *  The name of the effect class, such as <code>"FadeInstance"</code>.
     *
     *  <p>This is a short or "unqualified" class name
     *  that does not include the package name.
     *  If you need the qualified name, use the 
     *  <code>getQualifiedClassName()</code> method
     *  in the flash.utils package.</p>
		 */
		public function get className () : String;

		/**
		 *  The duration of the effect, in milliseconds.
     *
     *  @default 500
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
     *  list-based control of a data effect. 
     *  This property enables an instance of an effect class
     *  to communicate with the  list-based control
     *  on which the effect is playing.
		 */
		public function get effectTargetHost () : IEffectTargetHost;
		/**
		 *  @private
		 */
		public function set effectTargetHost (value:IEffectTargetHost) : void;

		/**
		 *  Determines whether the effect should hide
     *  the focus ring when starting the effect.
     *  The effect target is responsible for the hiding the focus ring. 
     *  Subclasses of the UIComponent class hide the focus ring automatically. 
     *  If the effect target is not a subclass of the UIComponent class,
     *  you must add functionality to it to hide the focus ring.
     *
     *  <p>Set this property to <code>true</code>
     *  to hide the focus ring during the effect.</p>
     *  
     *  <p>For subclasses of Effect, the default value is <code>false</code>. 
     *  For subclasses of MaskEffect, the default value is <code>true</code>.
     *  </p>
		 */
		public function get hideFocusRing () : Boolean;
		/**
		 *  @private
		 */
		public function set hideFocusRing (value:Boolean) : void;

		/**
		 *  Current position in time of the effect.
     *  This property has a value between 0 and the actual duration 
     *  (which includes the value of the <code>startDelay</code>, 
     *  <code>repeatCount</code>, and <code>repeatDelay</code> properties).
		 */
		public function get playheadTime () : Number;

		/**
		 *  Specifies the PropertyChanges object containing
     *  the start and end values for the set of properties
     *  relevant to the effect's targets. 
     *  This property is only set if the
     *  <code>captureStartValues()</code> method was called
     *  on the effect that created this effect instance. 
     *  
     *  <p>You often use the <code>propertyChanges</code> property  
     *  to create an effect that is used as part of a transition. 
     *  Flex automatically calls the <code>captureStartValues()</code>
     *  method when it starts a transition.
     *  Within your override of  the <code>Effectinstance.play()</code>
     *  method, you can examine the information within the 
     *  <code>propertyChanges()</code> method to initialize
     *  the start and end values of the effect.</p>
     *
     *  @see mx.effects.effectClasses.PropertyChanges
		 */
		public function get propertyChanges () : PropertyChanges;
		/**
		 *  @private
		 */
		public function set propertyChanges (value:PropertyChanges) : void;

		/**
		 *  Number of times to repeat the effect.
     *  Possible values are any integer greater than or equal to 0.
     *  
     *  @default 1
     *  @see mx.effects.Effect#repeatCount
		 */
		public function get repeatCount () : int;
		/**
		 *  @private
		 */
		public function set repeatCount (value:int) : void;

		/**
		 *  Amount of time, in milliseconds,
     *  to wait before repeating the effect.
     *  
     *  @default 0
     *  @see mx.effects.Effect#repeatDelay
		 */
		public function get repeatDelay () : int;
		/**
		 *  @private
		 */
		public function set repeatDelay (value:int) : void;

		/**
		 *  Amount of time, in milliseconds,
     *  to wait before starting the effect.
     *  Possible values are any int greater than or equal to 0.
     *  If the effect is repeated by using the <code>repeatCount</code>
     *  property, the <code>startDelay</code> property is applied 
     *  only the first time the effect is played.
     *
     *  @default 0
		 */
		public function get startDelay () : int;
		/**
		 *  @private
		 */
		public function set startDelay (value:int) : void;

		/**
		 *  If <code>true</code>, blocks all background processing
     *  while the effect is playing.
     *  Background processing includes measurement, layout,
     *  and processing responses that have arrived from the server.
     *  
     *  @default false
     *  @see mx.effects.Effect#suspendBackgroundProcessing
		 */
		public function get suspendBackgroundProcessing () : Boolean;
		/**
		 *  @private
		 */
		public function set suspendBackgroundProcessing (value:Boolean) : void;

		/**
		 *  The UIComponent object to which this effect is applied.
     *
     *  @see mx.effects.Effect#target
		 */
		public function get target () : Object;
		/**
		 *  @private
		 */
		public function set target (value:Object) : void;

		/**
		 *  The event, if any, which triggered the playing of the effect.
     *  This property is useful when an effect is assigned to 
     *  multiple triggering events.
     * 
     *  <p>If the effect was played programmatically by a call to the 
     *  <code>play()</code> method, rather than being triggered by an event,
     *  this property is <code>null</code>.</p>
		 */
		public function get triggerEvent () : Event;
		/**
		 *  @private
		 */
		public function set triggerEvent (value:Event) : void;

		/**
		 *  This method is called if the effect was triggered by the EffectManager. 
     *  This base class version saves the event that triggered the effect
     *  in the <code>triggerEvent</code> property.
     *  Each subclass should override this method.
     * 
     *  @param event The Event object that was dispatched
     *  to trigger the effect.
     *  For example, if the trigger was a mouseDownEffect, the event
     *  would be a MouseEvent with type equal to MouseEvent.MOUSEDOWN.
		 */
		public function initEffect (event:Event) : void;

		/**
		 *  Plays the effect instance on the target after the
     *  <code>startDelay</code> period has elapsed.
     *  Called by the Effect class.
     *  Use this function instead of the <code>play()</code> method
     *  when starting an EffectInstance.
		 */
		public function startEffect () : void;

		/**
		 *  Plays the effect instance on the target.
     *  Call the <code>startEffect()</code> method instead
     *  to make an effect start playing on an EffectInstance.
     * 
     *  <p>In a subclass of EffectInstance, you must override this method. 
     *  The override must call the <code>super.play()</code> method 
     *  so that an <code>effectStart</code> event is dispatched
     *  from the target.</p>
		 */
		public function play () : void;

		/**
		 *  Pauses the effect until you call the <code>resume()</code> method.
		 */
		public function pause () : void;

		/**
		 *  Stops the effect, leaving the target in its current state.
     *  This method is invoked by a call
     *  to the <code>Effect.stop()</code> method. 
     *  As part of its implementation, it calls
     *  the <code>finishEffect()</code> method.
     *
     *  <p>The effect instance dispatches an <code>effectEnd</code> event
     *  when you call this method as part of ending the effect.</p>
		 */
		public function stop () : void;

		/**
		 *  Resumes the effect after it has been paused 
     *  by a call to the <code>pause()</code> method.
		 */
		public function resume () : void;

		/**
		 *  Plays the effect in reverse, starting from
     *  the current position of the effect.
		 */
		public function reverse () : void;

		/**
		 *  Interrupts an effect instance that is currently playing,
     *  and jumps immediately to the end of the effect.
     *  This method is invoked by a call
     *  to the <code>Effect.end()</code> method. 
     *  As part of its implementation, it calls
     *  the <code>finishEffect()</code> method.
     *
     *  <p>The effect instance dispatches an <code>effectEnd</code> event
     *  when you call this method as part of ending the effect.</p>
     *
     *  <p>In a subclass of EffectInstance,
     *  you can optionally override this method
     *  As part of your override, you should call
     *  the <code>super.end()</code> method
     *  from the end of your override, after your logic.</p>
     *
     *  @see mx.effects.Effect#end()
		 */
		public function end () : void;

		/**
		 *  Called by the <code>end()</code> method when the effect
     *  finishes playing.
     *  This function dispatches an <code>endEffect</code> event
     *  for the effect target.
     *
     *  <p>You do not have to override this method in a subclass.
     *  You do not need to call this method when using effects,
     *  but you may need to call it if you create an effect subclass.</p>
     *
     *  @see mx.events.EffectEvent
		 */
		public function finishEffect () : void;

		/**
		 *  Called after each iteration of a repeated effect finishes playing.
     *
     *  <p>You do not have to override this method in a subclass.
     *  You do not need to call this method when using effects.</p>
		 */
		public function finishRepeat () : void;
	}
}
