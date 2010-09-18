﻿package mx.controls
{
	import flash.events.KeyboardEvent;
	import flash.filesystem.File;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.controls.fileSystemClasses.FileSystemControlHelper;
	import mx.core.ClassFactory;
	import mx.core.IUITextField;
	import mx.core.ScrollPolicy;
	import mx.core.mx_internal;
	import mx.events.ListEvent;
	import mx.formatters.DateFormatter;
	import flash.display.DisplayObject;
	import flash.filesystem.File;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.controls.dataGridClasses.DataGridListData;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.FileSystemDataGrid;
	import mx.controls.listClasses.IDropInListItemRenderer;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.controls.listClasses.ListBase;
	import mx.core.IDataRenderer;
	import mx.core.IFlexDisplayObject;
	import mx.core.mx_internal;
	import mx.core.UIComponent;
	import mx.core.UITextField;
	import mx.events.FlexEvent;
	import mx.core.IUITextField;

	/**
	 *  Dispatched when the selected directory displayed by this control
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
	 *  The FileSystemDataGrid control lets you display the contents of a
	 */
	public class FileSystemDataGrid extends DataGrid
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
		 *  The DateFormatter object used to format the dates
		 */
		local var dateFormatter : DateFormatter;
		/**
		 *  The DataGridColumn representing the Created column.
		 */
		public var creationDateColumn : DataGridColumn;
		/**
		 *  @private
		 */
		private var _dateFormatString : String;
		/**
		 *  @private
		 */
		private var dateFormatStringOverride : String;
		/**
		 *  The DataGridColumn representing the Modified column.
		 */
		public var modificationDateColumn : DataGridColumn;
		/**
		 *  The DataGridColumn representing the Name column.
		 */
		public var nameColumn : DataGridColumn;
		/**
		 *  The DataGridColumn representing the Size column.
		 */
		public var sizeColumn : DataGridColumn;
		/**
		 *  @private
		 */
		private var _sizeDisplayMode : String;
		/**
		 *  The DataGridColumn representing the Type column.
		 */
		public var typeColumn : DataGridColumn;

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
		 *  A String that determines how dates in the Created and Modified
		 */
		public function get dateFormatString () : String;
		/**
		 *  @private
		 */
		public function set dateFormatString (value:String) : void;
		/**
		 *  @copy mx.controls.FileSystemList#directory
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
		 *  An Array of File objects representing directories
		 */
		public function get forwardHistory () : Array;
		/**
		 *  @copy mx.controls.FileSystemList#nameCompareFunction
		 */
		public function get nameCompareFunction () : Function;
		/**
		 *  @private
		 */
		public function set nameCompareFunction (value:Function) : void;
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
		 *  A String specifying whether the Size column displays file sizes
		 */
		public function get sizeDisplayMode () : String;
		/**
		 *  @private
		 */
		public function set sizeDisplayMode (value:String) : void;

		/**
		 *  Constructor.
		 */
		public function FileSystemDataGrid ();
		/**
		 *  @private
		 */
		protected function childrenCreated () : void;
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
		protected function resourcesChanged () : void;
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
		 *  @copy mx.controls.FileSystemList#navigateTo()
		 */
		public function navigateTo (directory:File) : void;
		/**
		 *  @copy mx.controls.FileSystemList#refresh()
		 */
		public function refresh () : void;
		/**
		 *  @copy mx.controls.FileSystemList#clear()
		 */
		public function clear () : void;
		/**
		 *  @private
		 */
		public function resetHistory (dir:File) : void;
		/**
		 *  @private
		 */
		private function nameSortCompareFunction (item1:File, item2:File) : int;
		/**
		 *  @private
		 */
		private function typeLabelFunction (item:File, column:DataGridColumn = null) : String;
		/**
		 *  @private
		 */
		private function typeSortCompareFunction (item1:File, item2:File) : int;
		/**
		 *  @private
		 */
		private function sizeLabelFunction (item:File, column:DataGridColumn = null) : String;
		/**
		 *  @private
		 */
		private function sizeSortCompareFunction (item1:File, item2:File) : int;
		/**
		 *  @private
		 */
		private function creationDateLabelFunction (item:File, column:DataGridColumn = null) : String;
		/**
		 *  @private
		 */
		private function modificationDateLabelFunction (item:File, column:DataGridColumn = null) : String;
		/**
		 *  @private
		 */
		private function determineWidthToDisplay (s:String) : Number;
		/**
		 *  @private
		 */
		protected function keyDownHandler (event:KeyboardEvent) : void;
		/**
		 *  @private
		 */
		protected function itemDoubleClickHandler (event:ListEvent) : void;
	}
	/**
	 *  @private
	 */
	internal class CustomDataGridColumn extends DataGridColumn
	{
		/**
		 *  Constructor.
		 */
		public function CustomDataGridColumn (columnName:String = null);
		/**
		 *  @private
		 */
		public function itemToDataTip (data:Object) : String;
	}
	/**
	 *  @private
	 */
	internal class NameColumnRenderer extends UIComponent implements IDataRenderer
	{
		/**
		 *  @private
		 */
		private var listOwner : ListBase;
		/**
		 *  @private
		 */
		private var _data : Object;
		/**
		 *  The internal IFlexDisplayObject that displays the icon in this renderer.
		 */
		protected var icon : IFlexDisplayObject;
		/**
		 *  The internal IUITextField that displays the text in this renderer.
		 */
		protected var label : IUITextField;
		/**
		 *  @private
		 */
		private var _listData : DataGridListData;

		/**
		 *  @private
		 */
		public function get baselinePosition () : Number;
		/**
		 *  The implementation of the <code>data</code> property
		 */
		public function get data () : Object;
		/**
		 *  @private
		 */
		public function set data (value:Object) : void;
		/**
		 *  The implementation of the <code>listData</code> property
		 */
		public function get listData () : BaseListData;
		/**
		 *  @private
		 */
		public function set listData (value:BaseListData) : void;

		/**
		 *  Constructor.
		 */
		public function NameColumnRenderer ();
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
	}
}