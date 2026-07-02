

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
for (i in 0...y.length)
{
}
}
}

/**
Finds indexes of peaks in the order they appear in the input sequence.

**/
public static function findPeaks(y:Array<Float>, ?threshold:Float, ?minHeight:Float):Array<Int>
{


for (i in 1...dy.length)
{
{
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
}

}

/**
Returns the average value of an array.
**/

/**
Returns the global maximum.
**/

/**
Returns the global maximum's index.
**/

/**
Returns the global minimum.
**/

/**
Returns the global minimum's index.
**/
}
