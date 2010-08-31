﻿package mx.controls.treeClasses
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import mx.controls.Tree;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.FlexVersion;
	import mx.core.IDataRenderer;
	import mx.core.IFlexDisplayObject;
	import mx.core.IFlexModuleFactory;
	import mx.core.IFontContextComponent;
	import mx.core.IToolTip;
	import mx.core.IUITextField;
	import mx.core.SpriteAsset;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.InterManagerRequest;
	import mx.events.ToolTipEvent;
	import mx.events.TreeEvent;
	import mx.managers.ISystemManager;

	/**
	 *  Dispatched when the <code>data</code> property changes.
	 */
	[Event(name="dataChange", type="mx.events.FlexEvent")] 
	/**
	 *  Text color of a component label.
	 */
	[Style(name="color", type="uint", format="Color", inherit="yes")] 
	/**
	 *  Color of the component if it is disabled.
	 */
	[Style(name="disabledColor", type="uint", format="Color", inherit="yes")] 

	/**
	 *  The TreeItemRenderer class defines the default item renderer for a Tree control. 
	 */
	public class TreeItemRenderer extends UIComponent implements IDataRenderer
	{
		/**
		 *  @private
		 */
		private var listOwner : Tree;
		/**
		 *  @private
		 */
		private var _data : Object;
		/**
		 *  The internal IFlexDisplayObject that displays the disclosure icon
		 */
		protected var disclosureIcon : IFlexDisplayObject;
		/**
		 *  The internal IFlexDisplayObject that displays the icon in this renderer.
		 */
		protected var icon : IFlexDisplayObject;
		/**
		 *  The internal UITextField that displays the text in this renderer.
		 */
		protected var label : IUITextField;
		/**
		 *  @private
		 */
		private var _listData : TreeListData;

		/**
		 *  @private
		 */
		public function get baselinePosition () : Number;
		/**
		 *  The implementation of the <code>data</code> property as 
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;
		/**
		 *  @private
		 */
		public function get fontContext () : IFlexModuleFactory;
		/**
		 *  @private
		 */
		public function set fontContext (moduleFactory:IFlexModuleFactory) : void;
		/**
		 *  The implementation of the <code>listData</code> property as 
		 */
		public function get listData () : BaseListData;
		/**
		 *  @private
		 */
		public function set listData (value:BaseListData) : void;

		/**
		 *  Constructor.
		 */
		public function TreeItemRenderer ();
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
		function createLabel (childIndex:int) : void;
		/**
		 *  @private
		 */
		function removeLabel () : void;
		/**
		 *  @private
		 */
		private function toolTipShowHandler (event:ToolTipEvent) : void;
		/**
		 *  @private
		 */
		private function disclosureMouseDownHandler (event:Event) : void;
		/**
		 *  @private
		 */
		function getLabel () : IUITextField;
		/**
		 *  @private
		 */
		function getDisclosureIcon () : IFlexDisplayObject;
	}
}