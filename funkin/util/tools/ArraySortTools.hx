
/**
* Contains code for sorting arrays using various algorithms.
* @see https://algs4.cs.princeton.edu/20sorting/
*/
class ArraySortTools
{
/**
* Sorts the input array using the merge sort algorithm.
* Stable and guaranteed to run in linearithmic time `O(n log n)`,
* but less efficient in "best-case" situations.
*
* @param input The array to sort in-place.
* @param compare The comparison function to use.
*/
public static function mergeSort<T>(input:Array<T>, compare:CompareFunction<T>):Void
{

}

/**
* Sorts the input array using the quick sort algorithm.
* More efficient on smaller arrays, but is inefficient `O(n^2)` in "worst-case" situations.
* Not stable; relative order of equal elements is not preserved.
*
* @see https://stackoverflow.com/questions/33884057/quick-sort-stackoverflow-error-for-large-arrays
*      Fix for stack overflow issues.
* @param input The array to sort in-place.
* @param compare The comparison function to use.
*/
public static function quickSort<T>(input:Array<T>, compare:CompareFunction<T>):Void
{

}

/**
* Internal recursive function for the quick sort algorithm.
* Written with ChatGPT!
*/
static function quickSortInner<T>(input:Array<T>, low:Int, high:Int, compare:CompareFunction<T>):Void
{

{

{
}
else
{
}
}
}

/**
* Internal function for sorting a partition of an array in the quick sort algorithm.
* Written with ChatGPT!
*/
static function quickSortPartition<T>(input:Array<T>, low:Int, high:Int, compare:CompareFunction<T>):Int
{

{
do
{

do
{


}

}

/**
* Sorts the input array using the insertion sort algorithm.
* Stable and is very fast on nearly-sorted arrays,
* but is inefficient `O(n^2)` in "worst-case" situations.
*
* @param input The array to sort in-place.
* @param compare The comparison function to use.
*/
public static function insertionSort<T>(input:Array<T>, compare:CompareFunction<T>):Void
{

for (i in 1...input.length)
{

{
}

}
}
}

/**
* A comparison function.
* Returns a negative number if the first argument is less than the second,
* a positive number if the first argument is greater than the second,
* or zero if the two arguments are equal.
*/
