package flash.text.engine
{
	/// The TextLineValidity class is an enumeration of constant values for setting the validity property of the TextLine class.
	public class TextLineValidity
	{
		/// Specifies that the text line is valid.
		public static const VALID:String = "valid";

		/// Specifies that the text line is possibly invalid.
		public static const POSSIBLY_INVALID:String = "possiblyInvalid";

		/// Specifies that the line is invalid.
		public static const INVALID:String = "invalid";

		/// Specifies that the line is static, and that the connection between the line and the text block has been severed, and the atom data that is unnecessary for rendering has been discarded.
		public static const STATIC:String = "static";

	}

}

