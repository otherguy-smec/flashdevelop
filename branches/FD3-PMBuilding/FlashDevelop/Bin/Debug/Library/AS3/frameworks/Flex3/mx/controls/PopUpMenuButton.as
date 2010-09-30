﻿package mx.controls
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.collections.ICollectionView;
	import mx.collections.IViewCursor;
	import mx.collections.CursorBookmark;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.controls.menuClasses.IMenuDataDescriptor;
	import mx.controls.treeClasses.DefaultDataDescriptor;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.events.ListEvent;
	import mx.events.MenuEvent;
	import mx.managers.PopUpManager;

	/**
	 *  Dispatched when a user selects an item from the pop-up menu.
	 */
	[Event(name="itemClick", type="mx.events.MenuEvent")] 
	/**
	 *  The name of a CSS style declaration used by the dropdown menu.  
	 */
	[Style(name="popUpStyleName", type="String", inherit="no")] 

	/**
	 *  The PopUpMenuButton control creates a PopUpButton control with a main
	 */
	public class PopUpMenuButton extends PopUpButton
	{
		/**
		 *  @private
		 */
		private var dataProviderChanged : Boolean;
		/**
		 *  @private
		 */
		private var labelSet : Boolean;
		/**
		 *  @private
		 */
		private var popUpMenu : Menu;
		/**
		 *  @private
		 */
		private var selectedIndex : int;
		/**
		 *  @private
		 */
		private var itemRenderer : IListItemRenderer;
		/**
		 *  @private
		 */
		private var explicitIcon : Class;
		/**
		 *  @private
		 */
		private var menuSelectedStyle : Boolean;
		/**
		 *  @private
		 */
		private var _dataDescriptor : IMenuDataDescriptor;
		/**
		 *  @private
		 */
		private var _dataProvider : Object;
		/**
		 *  @private
		 */
		private var _label : String;
		/**
		 *  @private
		 */
		private var _labelField : String;
		/**
		 *  @private
		 */
		private var _labelFunction : Function;
		/**
		 *  @private
		 */
		local var _showRoot : Boolean;
		/**
		 *  @private
		 */
		private var _showRootChanged : Boolean;

		/**
		 *  A reference to the pop-up Menu object.
		 */
		public function set popUp (value:IUIComponent) : void;
		/**
		 *  The data descriptor accesses and manipulates data in the data provider.
		 */
		public function get dataDescriptor () : IMenuDataDescriptor;
		/**
		 *  @private
		 */
		public function set dataDescriptor (value:IMenuDataDescriptor) : void;
		/**
		 *  DataProvider for popUpMenu.
		 */
		public function get dataProvider () : Object;
		/**
		 *  @private
		 */
		public function set dataProvider (value:Object) : void;
		/**
		 *  @private
		 */
		public function set label (value:String) : void;
		/**
		 *  Name of the field in the <code>dataProvider</code> Array that contains the text to
		 */
		public function get labelField () : String;
		/**
		 *  @private
		 */
		public function set labelField (value:String) : void;
		/**
		 *  A function that determines the text to display for each menu item.
		 */
		public function get labelFunction () : Function;
		/**
		 *  @private
		 */
		public function set labelFunction (value:Function) : void;
		/**
		 *  Specifies whether to display the top-level node or nodes of the data provider.
		 */
		public function get showRoot () : Boolean;
		/**
		 *  @private
		 */
		public function set showRoot (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function PopUpMenuButton ();
		/**
		 *  @private
		 */
		protected function commitProperties () : void;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		function getPopUp () : IUIComponent;
		/**
		 *  @private
		 */
		private function setSafeIcon (iconClass:Class) : void;
		/**
		 *  @private
		 */
		protected function clickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function menuClickHandler (event:MouseEvent) : void;
		/**
		 *  @private
		 */
		private function menuValueCommitHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function menuChangeHandler (event:MenuEvent) : void;
	}
}