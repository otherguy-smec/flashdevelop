﻿package mx.controls
{
	import flash.events.FileListEvent;
	import flash.events.KeyboardEvent;
	import flash.filesystem.File;
	import flash.ui.Keyboard;
	import mx.collections.ArrayCollection;
	import mx.collections.Sort;
	import mx.controls.fileSystemClasses.FileSystemControlHelper;
	import mx.controls.fileSystemClasses.FileSystemTreeDataDescriptor;
	import mx.controls.Tree;
	import mx.core.mx_internal;
	import mx.core.ScrollPolicy;
	import mx.events.FileEvent;
	import mx.events.ListEvent;
	import mx.events.TreeEvent;
	import mx.styles.StyleManager;
	import mx.styles.CSSStyleDeclaration;

	/**
	 *  Dispatched whenever the <code>directory</code> property changes
	 */
	[Event(name="directoryChange", type="mx.events.FileEvent")] 
	/**
	 *  Dispatched when the user closes an open directory node
	 */
	[Event(name="directoryClosing", type="mx.events.FileEvent")] 
	/**
	 *  Dispatched when the user opens a directory node
	 */
	[Event(name="directoryOpening", type="mx.events.FileEvent")] 
	/**
	 *  Dispatched when the user chooses a file by double-clicking it
	 */
	[Event(name="fileChoose", type="mx.events.FileEvent")] 

	/**
	 *  The FileSystemTree control displays the contents of a
	 */
	public class FileSystemTree extends Tree
	{
		/**
		 *  @copy mx.controls.FileSystemList#COMPUTER
		 */
		public static const COMPUTER : File = FileSystemControlHelper.COMPUTER;
		/**
		 *  @private
		 */
		local var helper : FileSystemControlHelper;

		/**
		 *  The directory whose contents this control displays.
		 */
		public function get directory () : File;
		/**
		 *  @private
		 */
		public function set directory (value:File) : void;
		/**
		 *  @copy mx.controls.FileSystemList#enumerationMode
		 */
		public function get enumerationMode () : String;
		/**
		 *  @private
		 */
		public function set enumerationMode (value:String) : void;
		/**
		 *  @copy mx.controls.FileSystemList#extensions
		 */
		public function get extensions () : Array;
		/**
		 *  @private
		 */
		public function set extensions (value:Array) : void;
		/**
		 *  @copy mx.controls.FileSystemList#filterFunction
		 */
		public function get filterFunction () : Function;
		/**
		 *  @private
		 */
		public function set filterFunction (value:Function) : void;
		/**
		 *  @copy mx.controls.FileSystemList#nameCompareFunction
		 */
		public function get nameCompareFunction () : Function;
		/**
		 *  @private
		 */
		public function set nameCompareFunction (value:Function) : void;
		/**
		 *  An Array of <code>nativePath</code> Strings for the File items
		 */
		public function get openPaths () : Array;
		/**
		 *  @private
		 */
		public function set openPaths (value:Array) : void;
		/**
		 *  @copy mx.controls.FileSystemList#selectedPath
		 */
		public function get selectedPath () : String;
		/**
		 *  @private
		 */
		public function set selectedPath (value:String) : void;
		/**
		 *  @copy mx.controls.FileSystemList#selectedPaths
		 */
		public function get selectedPaths () : Array;
		/**
		 *  @private
		 */
		public function set selectedPaths (value:Array) : void;
		/**
		 *  @copy mx.controls.FileSystemList#showExtensions
		 */
		public function get showExtensions () : Boolean;
		/**
		 *  @private
		 */
		public function set showExtensions (value:Boolean) : void;
		/**
		 *  @copy mx.controls.FileSystemList#showHidden
		 */
		public function get showHidden () : Boolean;
		/**
		 *  @private
		 */
		public function set showHidden (value:Boolean) : void;
		/**
		 *  @copy mx.controls.FileSystemList#showIcons
		 */
		public function get showIcons () : Boolean;
		/**
		 *  @private
		 */
		public function set showIcons (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function FileSystemTree ();
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
		public function getStyle (styleProp:String) : *;
		/**
		 *  @private
		 */
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		protected function itemToUID (data:Object) : String;
		/**
		 *  @copy mx.controls.FileSystemList#findIndex()
		 */
		public function findIndex (nativePath:String) : int;
		/**
		 *  @copy mx.controls.FileSystemList#findItem()
		 */
		public function findItem (nativePath:String) : File;
		/**
		 *  Re-enumerates the current directory being displayed by this control.
		 */
		public function refresh () : void;
		/**
		 *  Clears the list.
		 */
		public function clear () : void;
		/**
		 *  Opens a subdirectory specified by a native file system path.
		 */
		public function openSubdirectory (nativePath:String) : void;
		/**
		 *  @private
		 */
		function openItem (item:File, async:Boolean = true) : void;
		/**
		 *  Closes a subdirectory specified by a native file system path.
		 */
		public function closeSubdirectory (nativePath:String) : void;
		/**
		 *  @private
		 */
		function closeItem (item:File) : void;
		/**
		 *  @private
		 */
		function fixSelectionAfterClose (item:File) : void;
		/**
		 *  @private
		 */
		private function getParentPaths (file:File) : Array;
		/**
		 *  @private
		 */
		private function modificationDateHasChanged (item:File) : Boolean;
		/**
		 *  @private
		 */
		function insertChildItems (subdirectory:File, childItems:Array) : void;
		/**
		 *  @private
		 */
		private function openSelectedSubdirectory () : void;
		/**
		 *  @private
		 */
		private function closeSelectedSubdirectory () : void;
		/**
		 *  @private
		 */
		private function dispatchDirectoryOpeningEvent (directory:File) : Boolean;
		/**
		 *  @private
		 */
		private function dispatchDirectoryClosingEvent (directory:File) : Boolean;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		private function itemOpeningHandler (event:TreeEvent) : void;
		/**
		 *  @private
		 */
		private function directoryListingHandler (event:FileListEvent) : void;
		/**
		 *  @private
		 */
		private function itemDoubleClickHandler (event:ListEvent) : void;
	}
}