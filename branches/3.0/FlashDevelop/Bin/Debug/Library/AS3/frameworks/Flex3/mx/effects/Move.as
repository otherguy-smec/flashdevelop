﻿package mx.effects
{
	import mx.effects.effectClasses.MoveInstance;

	/**
	 *  The Move effect changes the position of a component *  over a specified time interval. *  You can specify the initial position with the <code>xFrom</code> and *  <code>yFrom</code> values, the destination position with <code>xTo</code> *  and <code>yTo</code>, or the number of pixels to move the component *  with <code>xBy</code> and <code>yBy</code>.  * *  <p>If you specify any two of the values (initial position, destination, *  or amount to move), Flex calculates the third. *  If you specify all three, Flex ignores the <code>xBy</code> and *  <code>yBy</code> values.   *  If you specify only the <code>xTo</code> and <code>yTo</code> values *  or the <code>xBy</code> and <code>yBy</code> values, *  Flex sets <code>xFrom</code> and <code>yFrom</code> to be the object's *  current position.</p> *   *  <p>If you specify a Move effect for a <code>moveEffect</code> trigger, *  and if you do not set the six From, To, and By properties,  *  Flex sets them to create a smooth transition between the object's  *  old position and its new position.</p> * *  <p>You typically apply this effect to a target in a container  *  that uses absolute positioning, such as Canvas,  *  or one with <code>"layout=absolute"</code>,  such as Application or Panel.  *  If you apply it to a target in a container that performs automatic layout,  *  such as a VBox or Grid container,  *  the move occurs, but the next time the container updates its layout,  *  it moves the target back to its original position. *  You can set the container's <code>autoLayout</code> property to <code>false</code> *  to disable the move back, but that disables layout for all controls in the container.</p> *   *  @mxml * *  <p>The <code>&lt;mx:Move&gt;</code> tag *  inherits all of the tag attributes of its of its superclass, *  and adds the following tag attributes:</p> *   *  <pre> *  &lt;mx:Move *    id="ID" *    xFrom="val"  *    yFrom="val" *    xTo="val" *    yTo="val" *    xBy="val" *    yBy="val" *   /&gt; *  </pre> * *  @see mx.effects.effectClasses.MoveInstance *   *  @includeExample examples/MoveEffectExample.mxml
	 */
	public class Move extends TweenEffect
	{
		/**
		 *  @private
		 */
		private static var AFFECTED_PROPERTIES : Array;
		/**
		 *  Number of pixels to move the components along the x axis.     *  Values can be negative.
		 */
		public var xBy : Number;
		/**
		 *  Initial position's x coordinate.
		 */
		public var xFrom : Number;
		/**
		 *  Destination position's x coordinate.
		 */
		public var xTo : Number;
		/**
		 *  Number of pixels to move the components along the y axis.     *  Values can be negative.
		 */
		public var yBy : Number;
		/**
		 *  Initial position's y coordinate.
		 */
		public var yFrom : Number;
		/**
		 *  Destination position's y coordinate.
		 */
		public var yTo : Number;

		/**
		 *  Constructor.     *     *  @param target The Object to animate with this effect.
		 */
		public function Move (target:Object = null);
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
