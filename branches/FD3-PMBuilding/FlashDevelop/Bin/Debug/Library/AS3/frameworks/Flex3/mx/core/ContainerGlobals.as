﻿package mx.core
{
	import flash.display.InteractiveObject;
	import mx.managers.IFocusManager;

	public class ContainerGlobals
	{
		/**
		 *  @private
		 */
		public static var focusedContainer : InteractiveObject;

		/**
		 *  @private
		 */
		public static function checkFocus (oldObj:InteractiveObject, newObj:InteractiveObject) : void;
	}
}