package funkin.audio.visualize.dsp;

using Lambda;

/**
Signal processing miscellaneous utilities.
**/
class Signal
{
/**
Returns a smoothed version of the input array using a moving average.
**/
public static function smooth(y:Array<Float>, n:Int):Null<Array<Float>>
{
{
}
else if (n == 1)
{
}
else
{
smoothed.resize(y.length);
for (i in 0...y.length)
{
smoothed[i] = sum(y.slice(i - m, i + 1));
}
}
}

/**
Finds indexes of peaks in the order they appear in the input sequence.

**/
public static function findPeaks(y:Array<Float>, ?threshold:Float, ?minHeight:Float):Array<Int>
{
threshold = threshold == null ? 0.0 : Math.abs(threshold);
minHeight = minHeight == null ? Signal.min(y) : minHeight;


for (i in 1...dy.length)
{
{
peaks.push(i);
}
}

}

/**
Returns the sum of all the elements of a given array.

This function tries to minimize floating-point precision errors.
**/
public static function sum(array:Array<Float>):Float
{


for (v in array)
{
c += Math.abs(sum) >= Math.abs(v) ? (sum - t) + v // sum is bigger => low-order digits of v are lost
: (v - t) + sum; // v is bigger => low-order digits of sum are lost
sum = t;
}

}

/**
Returns the average value of an array.
**/
public static function mean(y:Array<Float>):Float return sum(y) / y.length;

/**
Returns the global maximum.
**/
public static function max(y:Array<Float>):Float return y.fold(Math.max, y[0]);

/**
Returns the global maximum's index.
**/
public static function maxi(y:Array<Float>):Int return y.foldi((yi, m, i) -> yi > y[m] ? i : m, 0);

/**
Returns the global minimum.
**/
public static function min(y:Array<Float>):Float return y.fold(Math.min, y[0]);

/**
Returns the global minimum's index.
**/
public static function mini(y:Array<Float>):Int return y.foldi((yi, m, i) -> yi < y[m] ? i : m, 0);
}
