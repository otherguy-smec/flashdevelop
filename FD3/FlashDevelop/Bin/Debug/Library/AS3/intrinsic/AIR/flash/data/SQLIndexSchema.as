package flash.data
{
	/// A SQLIndexSchema instance provides information describing a specific index in a database.
	public class SQLIndexSchema extends SQLSchema
	{
		/// [AIR] The name of the table to which this index is attached.
		public function get table () : String;

		/// [AIR] Creates a SQLIndexSchema instance.
		public function SQLIndexSchema (database:String, name:String, sql:String, table:String);
	}
}
