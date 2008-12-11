package 
{
	/// The int class lets you work with the data type representing a 32-bit signed integer.
	public class int
	{
		/// The largest representable 32-bit signed integer, which is 2,147,483,647.
		public static const MAX_VALUE:int;

		/// The smallest representable 32-bit signed integer, which is -2,147,483,648.
		public static const MIN_VALUE:int;

		/// Constructor; creates a new int object.
		public function int(num:Object);

		/// Returns the string representation of an int object.
		public function toString(radix:uint):String;

		/// Returns the primitive value of the specified int object.
		public function valueOf():int;

		/// Returns a string representation of the number in fixed-point notation.
		public function toFixed(fractionDigits:uint):String;

		/// Returns a string representation of the number in exponential notation.
		public function toExponential(fractionDigits:uint):String;

		/// Returns a string representation of the number either in exponential notation or in fixed-point notation.
		public function toPrecision(precision:uint):String;

	}

}

