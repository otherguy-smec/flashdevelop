﻿package mx.controls
{
	import flash.events.KeyboardEvent;
	import flash.filesystem.File;
	import mx.controls.fileSystemClasses.FileSystemControlHelper;
	import mx.controls.List;
	import mx.core.mx_internal;
	import mx.core.ScrollPolicy;
	import mx.events.ListEvent;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;

	/**
	 *  Dispatched when the directory displayed by this control
	 */
	[Event(name="directoryChange", type="mx.events.FileEvent")] 
	/**
	 *  Dispatched when the user tries to change
	 */
	[Event(name="directoryChanging", type="mx.events.FileEvent")] 
	/**
	 *  Dispatched when the user chooses a file by double-clicking it
	 */
	[Event(name="fileChoose", type="mx.events.FileEvent")] 
	/**
	 *  Specifies the icon that indicates a directory.
	 */
	[Style(name="directoryIcon", type="Class", format="EmbeddedFile", inherit="no")] 
	/**
	 *  Specifies the icon that indicates a file.
	 */
	[Style(name="fileIcon", type="Class", format="EmbeddedFile", inherit="no")] 

	/**
	 *  The FileSystemList control lets you display the contents of a
	 */
	public class FileSystemList extends List
	{
		/**
		 *  A constant that can be used as a value for the <code>directory</code> property,
		 */
		public static const COMPUTER : File = FileSystemControlHelper.COMPUTER;
		/**
		 *  @private
		 */
		local var helper : FileSystemControlHelper;

		/**
		 *  An Array of File objects representing directories
		 */
		public function get backHistory () : Array;
		/**
		 *  A flag which is <code>true</code> if there is at least one directory
		 */
		public function get canNavigateBack () : Boolean;
		/**
		 *  A flag which is <code>true</code> if the user can navigate down
		 */
		public function get canNavigateDown () : Boolean;
		/**
		 *  A flag which is <code>true</code> if there is at least one directory
		 */
		public function get canNavigateForward () : Boolean;
		/**
		 *  A flag which is <code>true</code> if the user can navigate up
		 */
		public function get canNavigateUp () : Boolean;
		/**
		 *  The directory whose contents this control displays.
		 */
		public function get directory () : File;
		/**
		 *  @private
		 */
		public function set directory (value:File) : void;
		/**
		 *  A String specifying whether this control displays
		 */
		public function get enumerationMode () : String;
		/**
		 *  @private
		 */
		public function set enumerationMode (value:String) : void;
		/**
		 *  An Array of extensions specifying which files
		 */
		public function get extensions () : Array;
		/**
		 *  @private
		 */
		public function set extensions (value:Array) : void;
		/**
		 *  A callback Function that you can use to perform additional filtering,
		 */
		public function get filterFunction () : Function;
		/**
		 *  @private
		 */
		public function set filterFunction (value:Function) : void;
		/**
		 *  An Array of File objects representing directories
		 */
		public function get forwardHistory () : Array;
		/**
		 *  A callback Function that you can use to change how file and subdirectory
		 */
		public function get nameCompareFunction () : Function;
		/**
		 *  @private
		 */
		public function set nameCompareFunction (value:Function) : void;
		/**
		 *  The <code>nativePath</code> of the File item
		 */
		public function get selectedPath () : String;
		/**
		 *  @private
		 */
		public function set selectedPath (value:String) : void;
		/**
		 *  An Array of <code>nativePath</code> Strings for the File items
		 */
		public function get selectedPaths () : Array;
		/**
		 *  @private
		 */
		public function set selectedPaths (value:Array) : void;
		/**
		 *  A flag that specifies whether extensions in file names are shown.
		 */
		public function get showExtensions () : Boolean;
		/**
		 *  @private
		 */
		public function set showExtensions (value:Boolean) : void;
		/**
		 *  A flag that specifies whether files and directories
		 */
		public function get showHidden () : Boolean;
		/**
		 *  @private
		 */
		public function set showHidden (value:Boolean) : void;
		/**
		 *  A flag that specifies that icons are displayed
		 */
		public function get showIcons () : Boolean;
		/**
		 *  @private
		 */
		public function set showIcons (value:Boolean) : void;

		/**
		 *  Constructor.
		 */
		public function FileSystemList ();
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
		public function styleChanged (styleProp:String) : void;
		/**
		 *  @private
		 */
		protected function itemToUID (data:Object) : String;
		/**
		 *  @private
		 */
		public function itemToDataTip (data:Object) : String;
		/**
		 *  Returns the index of the File item with the specified
		 */
		public function findIndex (nativePath:String) : int;
		/**
		 *  Searches the File instances currently displayed in this control
		 */
		public function findItem (nativePath:String) : File;
		/**
		 *  Changes this control to display the contents
		 */
		public function navigateDown () : void;
		/**
		 *  Changes this control to display the contents of the next directory
		 */
		public function navigateUp () : void;
		/**
		 *  Changes this control to display the contents of a previously-visited
		 */
		public function navigateBack (index:int = 0) : void;
		/**
		 *  Changes this control to display the contents of a previously-visited
		 */
		public function navigateForward (index:int = 0) : void;
		/**
		 *  Changes this control to display the contents of the specified
		 */
		public function navigateTo (directory:File) : void;
		/**
		 *  Re-enumerates the current directory being displayed by this control.
		 */
		public function refresh () : void;
		/**
		 *  Clears this control so that it displays no items.
		 */
		public function clear () : void;
		/**
		 *  @private
		 */
		public function resetHistory (dir:File) : void;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function itemDoubleClickHandler (event:ListEvent) : void;
	}
}