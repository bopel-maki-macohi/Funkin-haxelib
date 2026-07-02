package funkin.util.tools;

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

haxe.ds.ArraySort.sort(input, compare);
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

quickSortInner(input, 0, input.length - 1, compare);
}

/**
* Internal recursive function for the quick sort algorithm.
* Written with ChatGPT!
*/
static function quickSortInner<T>(input:Array<T>, low:Int, high:Int, compare:CompareFunction<T>):Void
{

{

{
quickSortInner(input, low, pivot, compare);
low = pivot + 1;
}
else
{
quickSortInner(input, pivot + 1, high, compare);
high = pivot;
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
i++;
} while (compare(input[i], pivot) < 0);

do
{
j--;
} while (compare(input[j], pivot) > 0);


input[i] = input[j];
input[j] = temp;
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
input[j + 1] = input[j];
j--;
}

input[j + 1] = current;
}
}
}

/**
* A comparison function.
* Returns a negative number if the first argument is less than the second,
* a positive number if the first argument is greater than the second,
* or zero if the two arguments are equal.
*/
typedef CompareFunction<T> = T->T->Int;
