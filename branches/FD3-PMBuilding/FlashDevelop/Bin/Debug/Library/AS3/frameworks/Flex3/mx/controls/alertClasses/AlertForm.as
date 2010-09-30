﻿package mx.controls.alertClasses
{
	import flash.display.DisplayObject;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextLineMetrics;
	import flash.ui.Keyboard;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.mx_internal;
	import mx.core.IUITextField;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.events.CloseEvent;
	import mx.managers.IFocusManagerContainer;
	import mx.managers.ISystemManager;
	import mx.managers.PopUpManager;

	/**
	 *  @private
	 */
	public class AlertForm extends UIComponent implements IFontContextComponent
	{
		/**
		 *  The UITextField that displays the text of the Alert control.
		 */
		local var textField : IUITextField;
		/**
		 *  @private
		 */
		private var textWidth : Number;
		/**
		 *  @private
		 */
		private var textHeight : Number;
		/**
		 *  The DisplayObject that displays the icon.
		 */
		private var icon : DisplayObject;
		/**
		 *  An Array that contains any Buttons appearing in the Alert control.
		 */
		local var buttons : Array;
		/**
		 *  @private
		 */
		local var defaultButton : Button;
		/**
		 *  @private
		 */
		private var defaultButtonChanged : Boolean;

		/**
		 *  @private
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;

		/**
		 *  Constructor.
		 */
		public function AlertForm ();
		/**
		 *  @private
		 */
		protected function createChildren () : void;
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  @private
		 */
		protected function measure () : void;
		/**
		 *  @private
		 */
		protected function updateDisplayList (unscaledWidth:Number, unscaledHeight:Number) : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		protected function resourcesChanged () : void;
		/**
		 *  @private
		 */
		function createTextField (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeTextField () : void;
		/**
		 *  @private
		 */
		private function createButton (label:String, name:String) : Button;
		/**
		 *  @private
		 */
		private function removeAlert (buttonPressed:String) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function clickHandler (event:MouseEvent) : void;
	}
}