﻿package fl.controls.dataGridClasses
{
	import fl.controls.DataGrid;
	import fl.controls.listClasses.ICellRenderer;
	import fl.core.InvalidationType;
	import fl.controls.dataGridClasses.DataGridCellEditor;

	/**
	 * The DataGridColumn class describes a column in a DataGrid component. There 
	 */
	public class DataGridColumn
	{
		/**
		 * @private
		 */
		private var _columnName : String;
		/**
		 * @private
		 */
		private var _headerText : String;
		/**
		 * @private
		 */
		private var _minWidth : Number;
		/**
		 * @private
		 */
		private var _width : Number;
		/**
		 * @private
		 */
		private var _visible : Boolean;
		/**
		 * @private
		 */
		private var _cellRenderer : Object;
		/**
		 * @private
		 */
		private var _headerRenderer : Object;
		/**
		 * @private
		 */
		private var _labelFunction : Function;
		/**
		 * @private
		 */
		private var _sortCompareFunction : Function;
		/**
		 *  @private
		 */
		private var _imeMode : String;
		/**
		 * @private (internal)
		 */
		public var owner : DataGrid;
		/**
		 * @private (internal)
		 */
		public var colNum : Number;
		/**
		 * @private (internal)
		 */
		public var explicitWidth : Number;
		/**
		 * Indicates whether the user can click on the header of the current column 
		 */
		public var sortable : Boolean;
		/**
		 * Indicates whether the user is allowed to change the width of the
		 */
		public var resizable : Boolean;
		/**
		 *  Indicates whether the items in the column can be edited. A value of <code>true</code>
		 */
		public var editable : Boolean;
		/**
		 *  Indicates the class of the instances of the item editor to use for the 
		 */
		public var itemEditor : Object;
		/**
		 *  Identifies the name of the property of the item editor that contains the new
		 */
		public var editorDataField : String;
		/**
		 * Identifies the name of the field or property in the data provider item
		 */
		public var dataField : String;
		/**
		 * Indicates whether the DataGridColumn is to be sorted in ascending or 
		 */
		public var sortDescending : Boolean;
		/**
		 * One or more defined constants, identified by name or number and separated
		 */
		public var sortOptions : uint;
		/**
		 * @private
		 */
		private var forceImport : DataGridCellEditor;

		/**
		 * The class that is used to render the items in this column.
		 */
		public function get cellRenderer () : Object;
		/**
		 * @private (setter)
		 */
		public function set cellRenderer (value:Object) : void;
		/**
		 * The class that is used to render the header of this column.
		 */
		public function get headerRenderer () : Object;
		/**
		 * @private (setter)
		 */
		public function set headerRenderer (value:Object) : void;
		/**
		 * The column name to be displayed in the column header.
		 */
		public function get headerText () : String;
		/**
		 * @private (setter)
		 */
		public function set headerText (value:String) : void;
		/**
		 *  The mode of the input method editor (IME). The IME enables users to 
		 */
		public function get imeMode () : String;
		/**
		 * @private (setter)
		 */
		public function set imeMode (value:String) : void;
		/**
		 * A function that determines the text to be displayed in this column. By default, the
		 */
		public function get labelFunction () : Function;
		/**
		 * @private (setter)
		 */
		public function set labelFunction (value:Function) : void;
		/**
		 * The minimum width of the column, in pixels.
		 */
		public function get minWidth () : Number;
		/**
		 * @private (setter)
		 */
		public function set minWidth (value:Number) : void;
		/**
		 * A callback function that is called when sorting the data in
		 */
		public function get sortCompareFunction () : Function;
		/**
		 * @private (setter)
		 */
		public function set sortCompareFunction (value:Function) : void;
		/**
		 * Indicates whether the column is visible. A value of <code>true</code> indicates
		 */
		public function get visible () : Boolean;
		/**
		 * @private (setter)
		 */
		public function set visible (value:Boolean) : void;
		/**
		 * The width of the column, in pixels.
		 */
		public function get width () : Number;
		/**
		 * @private (setter)
		 */
		public function set width (value:Number) : void;

		/**
		 * Creates a new DataGridColumn instance.
		 */
		public function DataGridColumn (columnName:String = null);
		/**
		 * @private
		 */
		public function setWidth (value:Number) : void;
		/**
		 *  Returns the string that the item renderer displays for the given data object.
		 */
		public function itemToLabel (data:Object) : String;
		/**
		 *  Returns a string representation of the DataGridColumn object.
		 */
		public function toString () : String;
	}
}