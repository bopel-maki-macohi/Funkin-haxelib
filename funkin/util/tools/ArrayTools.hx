package funkin.util.tools;

/**
* A static extension which provides utility functions for Arrays.
*/
class ArrayTools
{
/*
* Push an element to the array if it is not already present.
* @param input The array to push to
* @param element The element to push
* @return Whether the element was pushed
*/
public static function pushUnique<T>(input:Array<T>, element:T):Bool
{
input.push(element);
}

/**
* Remove all elements from the array, without creating a new array.
* @param array The array to clear.
*/
public static function clear<T>(array:Array<T>):Void
{
array.pop();
}

/**
* Create a new array with all elements of the given array, to prevent modifying the original.
*/
public static function clone<T>(array:Array<T>):Array<T>
{
}

/**
* Create a new array with clones of all elements of the given array, to prevent modifying the original.
*/
public static function deepClone<T, U:ICloneable<T>>(array:Array<U>):Array<T>
{
}

/**
* Return true only if both arrays contain the same elements (possibly in a different order).
* @param a The first array to compare.
* @param b The second array to compare.
* @return Weather both arrays contain the same elements.
*/
public static function isEqualUnordered<T>(a:Array<T>, b:Array<T>):Bool
{
for (element in a)
{
}
for (element in b)
{
}
}

/**
* Returns true if `superset` contains all elements of `subset`.
* @param superset The array to query for each element.
* @param subset The array containing the elements to query for.
* @return Weather `superset` contains all elements of `subset`.
*/
public static function isSuperset<T>(superset:Array<T>, subset:Array<T>):Bool
{

for (element in subset)
{
}
}

/**
* Returns true if `superset` contains all elements of `subset`.
* @param subset The array containing the elements to query for.
* @param superset The array to query for each element.
* @return Weather `superset` contains all elements of `subset`.
*/
public static function isSubset<T>(subset:Array<T>, superset:Array<T>):Bool
{
}

/**
* Like `join` but adds a word before the last element.
* @param array The array to join.
* @param separator The separator to use between elements.
* @param andWord The word to use before the last element.
* @return The joined string.
*/
public static function joinPlural(array:Array<String>, separator:String = ', ', andWord:String = 'and'):String
{
}
}
