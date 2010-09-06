﻿package mx.containers.utilityClasses
{
	import mx.core.Container;
	import mx.core.IUIComponent;
	import mx.core.FlexVersion;

	/**
	 *  @private
	 */
	public class Flex
	{
		/**
		 *  This function sets the width of each child
		 */
		public static function flexChildWidthsProportionally (parent:Container, spaceForChildren:Number, h:Number) : Number;
		/**
		 *  This function sets the height of each child
		 */
		public static function flexChildHeightsProportionally (parent:Container, spaceForChildren:Number, w:Number) : Number;
		/**
		 *  This function distributes excess space among the flexible children.
		 */
		public static function flexChildrenProportionally (spaceForChildren:Number, spaceToDistribute:Number, totalPercent:Number, childInfoArray:Array) : Number;
		/**
		 *  This function distributes excess space among the flexible children
		 */
		public static function distributeExtraHeight (parent:Container, spaceForChildren:Number) : void;
		/**
		 *  This function distributes excess space among the flexible children
		 */
		public static function distributeExtraWidth (parent:Container, spaceForChildren:Number) : void;
	}
}