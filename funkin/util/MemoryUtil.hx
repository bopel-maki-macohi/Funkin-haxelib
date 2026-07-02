
/**
* Utilities for working with the garbage collector.
*
* HXCPP is built on Immix.
* HTML5 builds use the browser's built-in mark-and-sweep and JS has no APIs to interact with it.
* @see https://www.cs.cornell.edu/courses/cs6120/2019fa/blog/immix/
* @see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_management
* @see https://betterprogramming.pub/deep-dive-into-garbage-collection-in-javascript-6881610239a
* @see https://github.com/HaxeFoundation/hxcpp/blob/master/docs/build_xml/Defines.md
* @see cpp.vm.Gc
*/
class MemoryUtil
{
public static function buildGCInfo():String
{

}

public static function supportsTaskMem():Bool
{
}

public static function getTaskMemory():Float
{
try
{

do
{
{
}



{
}
}
catch (e:Dynamic)
{
}

}

public static function supportsGCMem():Bool
{
}

public static function getGCMemory():Float
{
}

/**
* Enable garbage collection if it was previously disabled.
*/
public static function enable():Void
{
}

/**
* Disable garbage collection entirely.
*/
public static function disable():Void
{
}

/**
* Manually perform garbage collection once.
* Should only be called from the main thread.
* @param major `true` to perform major collection, whatever that means.
*/
public static function collect(major:Bool = false):Void
{
}

/**
* Perform major garbage collection repeatedly until less than 16kb of memory is freed in one operation.
* Should only be called from the main thread.
*
* NOTE: This is DIFFERENT from actual compaction,
*/
public static function compact():Void
{
}
}
