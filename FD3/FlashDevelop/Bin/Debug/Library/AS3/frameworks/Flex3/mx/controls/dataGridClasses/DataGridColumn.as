/**********************************************************/
/*** Generated using Asapire [brainy 2008-Mar-07 11:06] ***/
/**********************************************************/
package mx.controls.dataGridClasses {
	import mx.styles.CSSStyleDeclaration;
	import mx.core.IIMESupport;
	import mx.core.IFactory;
	public class DataGridColumn extends CSSStyleDeclaration implements IIMESupport {
		/**
		 * The name of the field or property in the data provider item associated
		 *  with the column.
		 *  Each DataGridColumn control
		 *  requires this property and/or the labelFunction property
		 *  to be set in order to calculate the displayable text for the item
		 *  renderer.
		 *  If the dataField
		 *  and labelFunction properties are set,
		 *  the data is displayed using the labelFunction and sorted
		 *  using the dataField.  If the property named in the
		 *  dataField does not exist, the
		 *  sortCompareFunction must be set for the sort to work
		 *  correctly.
		 */
		public var dataField:String;
		/**
		 * The name of the field in the data provider to display as the datatip.
		 *  By default, the DataGrid control looks for a property named
		 *  label on each data provider item and displays it.
		 *  However, if the data provider does not contain a label
		 *  property, you can set the dataTipField property to
		 *  specify a different property.
		 *  For example, you could set the value to "FullName" when a user views a
		 *  set of people's names included from a database.
		 */
		public function get dataTipField():String;
		public function set dataTipField(value:String):void;
		/**
		 * Specifies a callback function to run on each item of the data provider
		 *  to determine its dataTip.
		 *  This property is used by the itemToDataTip method.
		 */
		public function get dataTipFunction():Function;
		public function set dataTipFunction(value:Function):void;
		/**
		 * A flag that indicates whether the user is allowed to drag
		 *  the column to a new position
		 *  If true, the user can drag the
		 *  the column headers to a new position
		 */
		public var draggable:Boolean = true;
		/**
		 * A flag that indicates whether the items in the column are editable.
		 *  If true, and the DataGrid's editable
		 *  property is also true, the items in a column are
		 *  editable and can be individually edited
		 *  by clicking on an item or by navigating to the item by using the
		 *  Tab and Arrow keys.
		 */
		public var editable:Boolean = true;
		/**
		 * The name of the property of the item editor that contains the new
		 *  data for the list item.
		 *  For example, the default itemEditor is
		 *  TextInput, so the default value of the editorDataField
		 *  property is "text", which specifies the
		 *  text property of the TextInput control.
		 */
		public var editorDataField:String = "text";
		/**
		 * The height of the item editor, in pixels, relative to the size of the
		 *  item renderer.  This property can be used to make the editor overlap
		 *  the item renderer by a few pixels to compensate for a border around the
		 *  editor.
		 *  Note that changing these values while the editor is displayed
		 *  will have no effect on the current editor, but will affect the next
		 *  item renderer that opens an editor.
		 */
		public var editorHeightOffset:Number = 0;
		/**
		 * A flag that indicates whether the item editor uses Enter key.
		 *  If true the item editor uses the Enter key and the
		 *  DataGrid will not look for the Enter key and move the editor in
		 *  response.
		 *  Note that changing this value while the editor is displayed
		 *  will have no effect on the current editor, but will affect the next
		 *  item renderer that opens an editor.
		 */
		public var editorUsesEnterKey:Boolean = false;
		/**
		 * The width of the item editor, in pixels, relative to the size of the
		 *  item renderer.  This property can be used to make the editor overlap
		 *  the item renderer by a few pixels to compensate for a border around the
		 *  editor.
		 *  Note that changing these values while the editor is displayed
		 *  will have no effect on the current editor, but will affect the next
		 *  item renderer that opens an editor.
		 */
		public var editorWidthOffset:Number = 0;
		/**
		 * The x location of the upper-left corner of the item editor,
		 *  in pixels, relative to the upper-left corner of the item.
		 *  This property can be used to make the editor overlap
		 *  the item renderer by a few pixels to compensate for a border around the
		 *  editor.
		 *  Note that changing these values while the editor is displayed
		 *  will have no effect on the current editor, but will affect the next
		 *  item renderer that opens an editor.
		 */
		public var editorXOffset:Number = 0;
		/**
		 * The y location of the upper-left corner of the item editor,
		 *  in pixels, relative to the upper-left corner of the item.
		 *  This property can be used to make the editor overlap
		 *  the item renderer by a few pixels to compensate for a border around the
		 *  editor.
		 *  Note that changing these values while the editor is displayed
		 *  will have no effect on the current editor, but will affect the next
		 *  item renderer that opens an editor.
		 */
		public var editorYOffset:Number = 0;
		/**
		 * The class factory for item renderer instances that display the
		 *  column header for the column.
		 *  You can specify a drop-in item renderer,
		 *  an inline item renderer, or a custom item renderer component as the
		 *  value of this property.
		 */
		public function get headerRenderer():IFactory;
		public function set headerRenderer(value:IFactory):void;
		/**
		 * Text for the header of this column. By default, the DataGrid
		 *  control uses the value of the dataField property
		 *  as the header text.
		 */
		public function get headerText():String;
		public function set headerText(value:String):void;
		/**
		 * A flag that indicates whether text in the header will be
		 *  word wrapped if it doesn't fit on one line.
		 *  If undefined, the DataGrid control's wordWrap property
		 *  is used.
		 */
		public function get headerWordWrap():*;
		public function set headerWordWrap(value:any):void;
		/**
		 * Specifies the IME (input method editor) mode.
		 *  The IME enables users to enter text in Chinese, Japanese, and Korean.
		 *  Flex sets the IME mode when the itemFocusIn event occurs,
		 *  and sets it back
		 *  to the previous value when the itemFocusOut event occurs.
		 *  The flash.system.IMEConversionMode class defines constants for
		 *  the valid values for this property.
		 */
		public function get imeMode():String;
		public function set imeMode(value:String):void;
		/**
		 * A class factory for the instances of the item editor to use for the
		 *  column, when it is editable.
		 */
		public var itemEditor:IFactory;
		/**
		 * The class factory for item renderer instances that display the
		 *  data for each item in the column.
		 *  You can specify a drop-in item renderer,
		 *  an inline item renderer, or a custom item renderer component as the
		 *  value of this property.
		 */
		public function get itemRenderer():IFactory;
		public function set itemRenderer(value:IFactory):void;
		/**
		 * A function that determines the text to display in this column.  By default
		 *  the column displays the text for the field in the data that matches the
		 *  column name.  However, sometimes you want to display text based on
		 *  more than one field in the data, or display something that does not
		 *  have the format that you want.
		 *  In such a case you specify a callback function using labelFunction.
		 */
		public function get labelFunction():Function;
		public function set labelFunction(value:Function):void;
		/**
		 * The minimum width of the column.
		 */
		public function get minWidth():Number;
		public function set minWidth(value:Number):void;
		/**
		 * The class factory for item renderer instances that display the
		 *  data for each item in the column.
		 *  You can specify a drop-in item renderer,
		 *  an inline item renderer, or a custom item renderer component as the
		 *  value of this property.
		 */
		public function get nullItemRenderer():IFactory;
		public function set nullItemRenderer(value:IFactory):void;
		/**
		 * A flag that indicates that the item renderer is also an item editor.
		 *  If this property is true, Flex
		 *  ignores the itemEditor property and uses the item
		 *  renderer for that item as the editor.
		 */
		public var rendererIsEditor:Boolean = false;
		/**
		 * A flag that indicates whether the user is allowed to resize
		 *  the width of the column.
		 *  If true, the user can drag the grid lines between
		 *  the column headers to resize
		 *  the column.
		 */
		public var resizable:Boolean = true;
		/**
		 * A flag that indicates whether the datatips are shown in the column.
		 *  If true, datatips are displayed for text in the rows. Datatips
		 *  are tooltips designed to show the text that is too long for the row.
		 */
		public function get showDataTips():*;
		public function set showDataTips(value:any):void;
		/**
		 * A flag that indicates whether the user can click on the
		 *  header of this column to sort the data provider.
		 *  If this property and the DataGrid sortableColumns property
		 *  are both true, the DataGrid control dispatches a
		 *  headerRelease event when a user releases the mouse button
		 *  on this column's header.
		 *  If no other handler calls the preventDefault() method on
		 *  the headerRelease event, the dataField
		 *  property or sortCompareFunction in the column is used
		 *  to reorder the items in the dataProvider.
		 */
		public var sortable:Boolean = true;
		/**
		 * A callback function that gets called when sorting the data in
		 *  the column.  If this property is not specified, the sort tries
		 *  to use a basic string or number sort on the data.
		 *  If the data is not a string or number or if the dataField
		 *  property is not a valid property of the data provider, the sort does
		 *  not work or will generate an exception.
		 *  If you specify a value of the labelFunction property,
		 *  you must also provide a function to the sortCompareFunction property,
		 *  unless sorting is not allowed on this column.
		 */
		public function get sortCompareFunction():Function;
		public function set sortCompareFunction(value:Function):void;
		/**
		 * Indicates whether the column sort is
		 *  in ascending order, false,
		 *  or descending order, true.
		 */
		public var sortDescending:Boolean = false;
		/**
		 * A flag that indicates whethe the column is visible.
		 *  If true, the column is visible.
		 */
		public function get visible():Boolean;
		public function set visible(value:Boolean):void;
		/**
		 * The width of the column, in pixels.
		 *  If the DataGrid's horizontalScrollPolicy property
		 *  is false, all visible columns must fit in the displayable
		 *  area, and the DataGrid will not always honor the width of
		 *  the columns if the total width of the columns is too
		 *  small or too large for the displayable area.
		 */
		public function get width():Number;
		public function set width(value:Number):void;
		/**
		 * A flag that indicates whether the text in a row of this column
		 *  is word wrapped if it doesn't fit on one line.
		 *  If undefined, the DataGrid control's wordWrap property
		 *  is used.
		 */
		public function get wordWrap():*;
		public function set wordWrap(value:any):void;
		/**
		 * Constructor.
		 *
		 * @param columnName        <String (default = null)> The name of the field in the data provider
		 *                            associated with the column, and the text for the header cell of this
		 *                            column.  This is equivalent to setting the dataField
		 *                            and headerText properties.
		 */
		public function DataGridColumn(columnName:String = null);
		/**
		 * Return the appropriate factory, using the default factory if none specified.
		 *
		 * @param forHeader         <Boolean> true if this is a header renderer.
		 * @param data              <Object> The data to be presented by the item renderer.
		 * @return                  <IFactory> if data is null, the default item renderer,
		 *                            otherwis it returns the custom item renderer.
		 */
		public function getItemRendererFactory(forHeader:Boolean, data:Object):IFactory;
		/**
		 * Returns a String that the item renderer displays as the datatip for the given data object,
		 *  based on the dataTipField and dataTipFunction properties.
		 *  If the method cannot convert the parameter to a String, it returns a
		 *  single space.
		 *
		 * @param data              <Object> Object to be rendered.
		 * @return                  <String> Displayable String based on the data.
		 */
		public function itemToDataTip(data:Object):String;
		/**
		 * Returns the String that the item renderer displays for the given data object.
		 *  If the DataGridColumn or its DataGrid control
		 *  has a non-null labelFunction
		 *  property, it applies the function to the data object.
		 *  Otherwise, the method extracts the contents of the field specified by the
		 *  dataField property, or gets the string value of the data object.
		 *  If the method cannot convert the parameter to a String, it returns a
		 *  single space.
		 *
		 * @param data              <Object> Object to be rendered.
		 * @return                  <String> Displayable String based on the data.
		 */
		public function itemToLabel(data:Object):String;
	}
}
