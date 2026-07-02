
/**
A view into an Array with an indexing offset.

Usages include 1-indexed sequences or zero-centered buffers with negative indexing.
**/
abstract OffsetArray<T>({
})
{





/**
Iterates through items in their original order while providing the altered indexes as keys.
**/



/**
Makes a shifted version of the given `array`, where elements are in the
same order but shifted by `n` positions (to the right if positive and to
the left if negative) in **circular** fashion (no elements discarded).
**/
public static function circShift<T>(array:Array<T>, n:Int):Array<T>
{


for (i in array.length - n...array.length)
for (i in 0...array.length - n)

}
}

private class OffsetArrayIterator<T>
{

public inline function new(array:Array<T>, offset:Int)
{
}

public inline function next():
{key:Int, value:T}
{
}

}
