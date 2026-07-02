package funkin.audio.visualize.dsp;

/**
A view into an Array with an indexing offset.

Usages include 1-indexed sequences or zero-centered buffers with negative indexing.
**/
abstract OffsetArray<T>({
})
{
public inline function new(array:Array<T>, offset:Int) this = {array: array, offset: offset};


inline function get_length() return this.array.length;

public inline function get(index:Int):T return this.array[index - this.offset];

public inline function set(index:Int, value:T):Void this.array[index - this.offset] = value;

/**
Iterates through items in their original order while providing the altered indexes as keys.
**/
public inline function keyValueIterator():KeyValueIterator<Int, T> return new OffsetArrayIterator(this.array, this.offset);

static inline function fromArray<T>(array:Array<T>) return new OffsetArray(array, 0);

inline function toArray() return this.array;

/**
Makes a shifted version of the given `array`, where elements are in the
same order but shifted by `n` positions (to the right if positive and to
the left if negative) in **circular** fashion (no elements discarded).
**/
public static function circShift<T>(array:Array<T>, n:Int):Array<T>
{


n = n % array.length;
for (i in array.length - n...array.length)
shifted.push(array[i]);
for (i in 0...array.length - n)
shifted.push(array[i]);

}
}

private class OffsetArrayIterator<T>
{

public inline function new(array:Array<T>, offset:Int)
{
this.array = array;
this.offset = offset;
this.enumeration = 0;
}

public inline function next():
{key:Int, value:T}
{
}

public inline function hasNext():Bool return this.enumeration < this.array.length;
}
