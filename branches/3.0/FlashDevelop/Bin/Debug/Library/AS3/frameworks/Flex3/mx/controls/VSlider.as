﻿package mx.controls
{
	import mx.controls.sliderClasses.Slider;
	import mx.controls.sliderClasses.SliderDirection;

	/**
	 *  The location of the data tip relative to the thumb. *  Possible values are <code>"left"</code>, <code>"right"</code>, *  <code>"top"</code>, and <code>"bottom"</code>. *   *  @default "left"
	 */
	[Style(name="dataTipPlacement", type="String", enumeration="left, top, right, bottom", inherit="no")] 

	/**
	 *  The VSlider control lets users select a value by moving *  a slider thumb between the end points of the slider track. *  The current value of the slider is determined by the relative *  location of the thumb between the end points of the slider, *  corresponding to the slider's minimum and maximum values. * *  <p>The slider may allow a continuous range of values between its *  minimum and maximum values, or it may be restricted to values *  at concrete intervals between the minimum and maximum value. *  It may show tick marks at specified intervals along the track. These *  tick marks are independent of the allowed values of the slider. It *  may also use a data tip to display its current value.</p> *  	 *  <p>The VSlider has a vertical orientation. *  The slider track stretches from bottom to top, and the labels *  and tick marks are placed to the left or right of the track.</p> * *  <p>The VSlider control has the following default characteristics:</p> *     <table class="innertable"> *        <tr> *           <th>Characteristic</th> *           <th>Description</th> *        </tr> *        <tr> *           <td>Default size</td> *           <td>250 pixels high, wide enough to hold the slider and any associated labels</td> *        </tr> *        <tr> *           <td>Minimum size</td> *           <td>None</td> *        </tr> *        <tr> *           <td>Maximum size</td> *           <td>None</td> *        </tr> *     </table> * *  @mxml *   *  <p>The <code>&lt;mx:VSlider&gt;</code> tag inherits all of the tag attributes *  of its superclass, and adds the following tag attribute:</p> *  *  <pre> *  &lt;mx:VSlider *    <strong>Styles</strong> *    dataTipPlacement="top" *  /&gt; *  </pre> *  </p> *   *  @includeExample examples/SimpleImageVSlider.mxml *  	 *  @see mx.controls.HSlider *  @see mx.controls.sliderClasses.Slider *  @see mx.controls.sliderClasses.SliderThumb *  @see mx.controls.sliderClasses.SliderDataTip *  @see mx.controls.sliderClasses.SliderLabel
	 */
	public class VSlider extends Slider
	{
		/**
		 *  Constructor.
		 */
		public function VSlider ();
	}
}
