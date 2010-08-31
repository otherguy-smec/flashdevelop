﻿package mx.managers
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import mx.core.Application;
	import mx.core.FlexSprite;
	import mx.core.ISWFLoader;
	import mx.core.IButton;
	import mx.core.IChildList;
	import mx.core.IRawChildrenContainer;
	import mx.core.ISWFBridgeProvider;
	import mx.core.IUIComponent;
	import mx.core.mx_internal;
	import mx.core.SWFBridgeGroup;
	import mx.events.FlexEvent;
	import mx.events.FocusRequestDirection;
	import mx.events.SWFBridgeEvent;
	import mx.events.SWFBridgeRequest;
	import mx.utils.DisplayUtil;
	import flash.display.DisplayObject;

	/**
	 *  The FocusManager class manages the focus on components in response to mouse
	 */
	public class FocusManager implements IFocusManager
	{
		/**
		 * @private
		 */
		private static const FROM_INDEX_UNSPECIFIED : int = -2;
		private var LARGE_TAB_INDEX : int;
		private var calculateCandidates : Boolean;
		/**
		 *  @private
		 */
		private var lastAction : String;
		/**
		 *  @private
		 */
		public var browserMode : Boolean;
		/**
		 *  @private
		 */
		private var browserFocusComponent : InteractiveObject;
		/**
		 *  @private
		 */
		private var focusableObjects : Array;
		/**
		 *  @private
		 */
		private var focusableCandidates : Array;
		/**
		 *  @private
		 */
		private var activated : Boolean;
		/**
		 * 	@private
		 */
		private var focusChanged : Boolean;
		/**
		 * 	@private
		 */
		private var fauxFocus : DisplayObject;
		/**
		 *  @private
		 */
		private var swfBridgeGroup : SWFBridgeGroup;
		/**
		 * @private
		 */
		private var lastActiveFocusManager : FocusManager;
		/**
		 * @private
		 */
		private var focusSetLocally : Boolean;
		/**
		 * @private
		 */
		private var popup : Boolean;
		/**
		 *  @private
		 */
		private var skipBridge : IEventDispatcher;
		/**
		 *  @private
		 */
		private var _showFocusIndicator : Boolean;
		/**
		 *  @private
		 */
		private var defButton : IButton;
		/**
		 *  @private
		 */
		private var _defaultButton : IButton;
		/**
		 *  @private
		 */
		private var _defaultButtonEnabled : Boolean;
		/**
		 *  @private
		 */
		private var _focusPane : Sprite;
		/**
		 *  @private
		 */
		private var _form : IFocusManagerContainer;
		/**
		 *  @private
		 */
		private var _lastFocus : IFocusManagerComponent;

		/**
		 *  @inheritDoc
		 */
		public function get showFocusIndicator () : Boolean;
		/**
		 *  @private
		 */
		public function set showFocusIndicator (value:Boolean) : void;
		/**
		 *  @inheritDoc
		 */
		public function get defaultButton () : IButton;
		/**
		 *  @private
		 */
		public function set defaultButton (value:IButton) : void;
		/**
		 *  @inheritDoc
		 */
		public function get defaultButtonEnabled () : Boolean;
		/**
		 *  @private
		 */
		public function set defaultButtonEnabled (value:Boolean) : void;
		/**
		 *  @inheritDoc
		 */
		public function get focusPane () : Sprite;
		/**
		 *  @private
		 */
		public function set focusPane (value:Sprite) : void;
		/**
		 *  @private
		 */
		function get form () : IFocusManagerContainer;
		/**
		 *  @private
		 */
		function set form (value:IFocusManagerContainer) : void;
		/**
		 * 	@private
		 */
		function get lastFocus () : IFocusManagerComponent;
		/**
		 *  @inheritDoc
		 */
		public function get nextTabIndex () : int;

		/**
		 *  Constructor.
		 */
		public function FocusManager (container:IFocusManagerContainer, popup:Boolean = false);
		/**
		 *  Gets the highest tab index currently used in this Focus Manager's form or subform.
		 */
		private function getMaxTabIndex () : int;
		/**
		 *  @inheritDoc
		 */
		public function getFocus () : IFocusManagerComponent;
		/**
		 *  @inheritDoc
		 */
		public function setFocus (o:IFocusManagerComponent) : void;
		/**
		 *  @private
		 */
		private function focusInHandler (event:FocusEvent) : void;
		/**
		 *  @private  Useful for debugging
		 */
		private function focusOutHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function activateHandler (event:Event) : void;
		/**
		 *  @private  Useful for debugging
		 */
		private function deactivateHandler (event:Event) : void;
		/**
		 *  @inheritDoc
		 */
		public function showFocus () : void;
		/**
		 *  @inheritDoc
		 */
		public function hideFocus () : void;
		/**
		 *  The SystemManager activates and deactivates a FocusManager
		 */
		public function activate () : void;
		/**
		 *  The SystemManager activates and deactivates a FocusManager
		 */
		public function deactivate () : void;
		/**
		 *  @inheritDoc
		 */
		public function findFocusManagerComponent (o:InteractiveObject) : IFocusManagerComponent;
		/**
		 * @private
		 */
		private function findFocusManagerComponent2 (o:InteractiveObject) : DisplayObject;
		/**
		 *  @inheritDoc
		 */
		public function moveFocus (direction:String, fromDisplayObject:DisplayObject = null) : void;
		/**
		 *  @private
		 */
		private function isParent (p:DisplayObjectContainer, o:DisplayObject) : Boolean;
		private function isEnabledAndVisible (o:DisplayObject) : Boolean;
		/**
		 *  @private
		 */
		private function sortByTabIndex (a:InteractiveObject, b:InteractiveObject) : int;
		/**
		 *  @private
		 */
		private function sortFocusableObjectsTabIndex () : void;
		/**
		 *  @private
		 */
		private function sortByDepth (aa:DisplayObject, bb:DisplayObject) : Number;
		private function getChildIndex (parent:DisplayObjectContainer, child:DisplayObject) : int;
		/**
		 *  @private
		 */
		private function sortFocusableObjects () : void;
		/**
		 *  Call this method to make the system
		 */
		function sendDefaultButtonEvent () : void;
		/**
		 *  @private
		 */
		private function addFocusables (o:DisplayObject, skipTopLevel:Boolean = false) : void;
		/**
		 *  @private
		 */
		private function isTabVisible (o:DisplayObject) : Boolean;
		private function isValidFocusCandidate (o:DisplayObject, g:String) : Boolean;
		private function getIndexOfFocusedObject (o:DisplayObject) : int;
		private function getIndexOfNextObject (i:int, shiftKey:Boolean, bSearchAll:Boolean, groupName:String) : int;
		/**
		 *  @private
		 */
		private function setFocusToNextObject (event:FocusEvent) : void;
		private function setFocusToComponent (o:Object, shiftKey:Boolean) : void;
		/**
		 *  @private
		 */
		private function setFocusToTop () : void;
		/**
		 *  @private
		 */
		private function setFocusToBottom () : void;
		/**
		 *  @private
		 */
		private function setFocusToNextIndex (index:int, shiftKey:Boolean) : void;
		/**
		 *  @inheritDoc
		 */
		public function getNextFocusManagerComponent (backward:Boolean = false) : IFocusManagerComponent;
		/**
		 * Find the next object to set focus to.
		 */
		private function getNextFocusManagerComponent2 (backward:Boolean = false, fromObject:DisplayObject = null, fromIndex:int = FROM_INDEX_UNSPECIFIED) : FocusInfo;
		/**
		 *  @private
		 */
		private function getTopLevelFocusTarget (o:InteractiveObject) : InteractiveObject;
		/**
		 *  Returns a String representation of the component hosting the FocusManager object, 
		 */
		public function toString () : String;
		/**
		 *  @private
		 */
		private function addedHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function removedHandler (event:Event) : void;
		/**
		 * After the form is added to the stage, if there are no focusable objects,
		 */
		private function addedToStageHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function removeFocusables (o:DisplayObject, dontRemoveTabChildrenHandler:Boolean) : void;
		/**
		 *  @private
		 */
		private function showHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function hideHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function creationCompleteHandler (event:FlexEvent) : void;
		/**
		 *  @private
		 */
		private function tabIndexChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function tabEnabledChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function tabChildrenChangeHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function mouseFocusChangeHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function keyFocusChangeHandler (event:FocusEvent) : void;
		/**
		 *  @private
		 */
		private function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function mouseDownHandler (event:MouseEvent) : void;
		/**
		 * @private
		 */
		private function focusRequestMoveHandler (event:Event) : void;
		private function focusRequestActivateHandler (event:Event) : void;
		private function focusRequestDeactivateHandler (event:Event) : void;
		private function bridgeEventActivateHandler (event:Event) : void;
		/**
		 *  @private
		 */
		private function setShowFocusIndicatorRequestHandler (event:Event) : void;
		/**
		 * This is called on the top-level focus manager and the parent focus
		 */
		public function addSWFBridge (bridge:IEventDispatcher, owner:DisplayObject) : void;
		/**
		 * @inheritdoc
		 */
		public function removeSWFBridge (bridge:IEventDispatcher) : void;
		/**
		 
		 */
		private function removeFromParentBridge (event:Event) : void;
		/**
		 *  @private
		 */
		private function moveFocusToParent (shiftKey:Boolean) : Boolean;
		/**
		 *  Get the bridge to the parent focus manager.
		 */
		private function getParentBridge () : IEventDispatcher;
		/**
		 *  @private
		 */
		private function dispatchSetShowFocusIndicatorRequest (value:Boolean, skip:IEventDispatcher) : void;
		/**
		 *  @private
		 */
		private function dispatchActivatedFocusManagerEvent (skip:IEventDispatcher = null) : void;
		/**
		 *  A Focus Manager has its own set of child bridges that may be different from the child
		 */
		private function dispatchEventFromSWFBridges (event:Event, skip:IEventDispatcher = null) : void;
		private function getBrowserFocusComponent (shiftKey:Boolean) : InteractiveObject;
	}
	/**
	 * @private
	 */
	internal class FocusInfo
	{
		public var displayObject : DisplayObject;
		public var wrapped : Boolean;

	}
}