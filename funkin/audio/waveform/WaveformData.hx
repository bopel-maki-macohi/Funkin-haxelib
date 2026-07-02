
class WaveformData
{

/**
* The version of the waveform data format.
* @default `2` (-1 if not specified/invalid)
*/

/**
* The number of channels in the waveform.
*/


/**
* Number of input audio samples per output waveform data point.
* At base zoom level this is number of samples per pixel.
* Lower values can more accurately represent the waveform when zoomed in, but take more data.
*/

/**
* Number of bits to use for each sample value. Valid values are `8` and `16`.
*/

/**
* The length of the data array, in points.
*/

/**
* Array of Int16 values representing the waveform.
* TODO: Use an `openfl.Vector` for performance.
*/


public function new(?version:Int, channels:Int, sampleRate:Int, samplesPerPoint:Int, bits:Int, length:Int, data:Array<Int>)
{
}

function buildChannelData():Array<WaveformDataChannel>
{
for (i in 0...channels)
{
}
}

public function channel(index:Int)
{
}

public function get(index:Int):Int
{
}

public function set(index:Int, value:Int)
{
}

/**
* Maximum possible value for a waveform data point.
* The minimum possible value is (-1 * maxSampleValue)
*/
public function maxSampleValue():Int
{
}

/**
* Cache the value because `Math.pow` is expensive and the value gets used a lot.
*/

/**
* @return The length of the waveform in samples.
*/
public function lenSamples():Int
{
}

/**
* @return The length of the waveform in seconds.
*/
public function lenSeconds():Float
{
}

/**
* Given the time in seconds, return the waveform data point index.
*/
public function secondsToIndex(seconds:Float):Int
{
}

/**
* Given a waveform data point index, return the time in seconds.
*/
public function indexToSeconds(index:Int):Float
{
}

/**
* The number of data points this waveform data provides per second of audio.
*/
public inline function pointsPerSecond():Float
{
}

/**
* Given the percentage progress through the waveform, return the waveform data point index.
*/
public function percentToIndex(percent:Float):Int
{
}

/**
* Given a waveform data point index, return the percentage progress through the waveform.
*/
public function indexToPercent(index:Int):Float
{
}

/**
* Resample the waveform data to create a new WaveformData object matching the desired `samplesPerPoint` value.
* This is useful for zooming in/out of the waveform in a performant manner.
*
* @param newSamplesPerPoint The new value for `samplesPerPoint`.
*/
public function resample(newSamplesPerPoint:Int):WaveformData
{





}

/**
* Create a new WaveformData whose data represents the two waveforms overlayed.
*/
public function merge(that:WaveformData):WaveformData
{


for (channelIndex in 0...this.channels)
{

for (index in 0...this.length)
{


}
}


}

/**
* Create a new WaveformData whose parameters match the current object.
*/
public function clone(?newData:Array<Int> = null):WaveformData
{
{
}


}
}

class WaveformDataChannel
{

public function new(parent:WaveformData, channelId:Int)
{
}

/**
* @param i Index
* @return minimum point at an index.
*/
public function minSample(i:Int):Int
{
}

/**
* Mapped to a value between 0 and 1.
*/
public function minSampleMapped(i:Int)
{
}

/**
* Minimum value within the range of samples.
* NOTE: Inefficient for large ranges. Use `WaveformData.remap` instead.
*/
public function minSampleRange(start:Int, end:Int)
{
for (i in start...end)
{
}
}

/**
* Maximum value within the range of samples, mapped to a value between 0 and 1.
*/
public function minSampleRangeMapped(start:Int, end:Int)
{
}

/**
* Retrieve a given maximum point at an index.
*/
public function maxSample(i:Int)
{
}

/**
* Mapped to a value between 0 and 1.
*/
public function maxSampleMapped(i:Int)
{
}

/**
* Maximum value within the range of samples.
* NOTE: Inefficient for large ranges. Use `WaveformData.remap` instead.
*/
public function maxSampleRange(start:Int, end:Int)
{
for (i in start...end)
{
}
}

/**
* Maximum value within the range of samples, mapped to a value between 0 and 1.
*/
public function maxSampleRangeMapped(start:Int, end:Int)
{
}

public function setMinSample(i:Int, value:Int)
{
}

public function setMaxSample(i:Int, value:Int)
{
}
}
