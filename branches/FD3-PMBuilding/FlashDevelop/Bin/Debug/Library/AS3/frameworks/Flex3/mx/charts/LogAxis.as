/**********************************************************/
/*** Generated using Asapire [brainy 2008-Mar-07 11:06] ***/
/**********************************************************/
package mx.charts {
	import mx.charts.chartClasses.NumericAxis;
	public class LogAxis extends NumericAxis {
		/**
		 * Specifies the multiplier label values along the axis.
		 *  A value of 10 generates labels at 1, 10, 100, 1000, etc.,
		 *  while a value of 100 generates labels at 1, 100, 10000, etc.
		 *  Flex calculates the interval if this property
		 *  is set to NaN.
		 *  Intervals must be even powers of 10, and must be greater than or equal to 10.
		 *  The LogAxis rounds the interval down to an even power of 10, if necessary.
		 */
		public function get interval():Number;
		public function set interval(value:Number):void;
		/**
		 * Specifies the maximum value for an axis label.
		 *  If NaN, Flex determines the maximum value
		 *  from the data in the chart.
		 *  The maximum value must be an even power of 10.
		 *  The LogAxis rounds an explicit maximum value
		 *  up to an even power of 10, if necessary.
		 */
		public function get maximum():Number;
		public function set maximum(value:Number):void;
		/**
		 * Specifies the maximum number of decimal places for representing fractional
		 *  values on the labels generated by this axis. By default, the
		 *  Axis autogenerates this value from the labels themselves.  A value of 0
		 *  round to the nearest integer value, while a value of 2 rounds to the nearest
		 *  1/100th of a value.
		 */
		public function get maximumLabelPrecision():Number;
		public function set maximumLabelPrecision(value:Number):void;
		/**
		 * Specifies the minimum value for an axis label.
		 *  If NaN, Flex determines the minimum value
		 *  from the data in the chart.
		 *  The minimum value must be an even power of 10.
		 *  The LogAxis will round an explicit minimum value
		 *  downward to an even power of 10 if necessary.
		 */
		public function get minimum():Number;
		public function set minimum(value:Number):void;
		/**
		 * Constructor.
		 */
		public function LogAxis();
	}
}