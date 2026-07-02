package funkin.util;

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
result += '\n- Memory Used: ${cpp.vm.Gc.memInfo64(cpp.vm.Gc.MEM_INFO_USAGE)} bytes';
result += '\n- Memory Reserved: ${cpp.vm.Gc.memInfo64(cpp.vm.Gc.MEM_INFO_RESERVED)} bytes';
result += '\n- Memory Current Pool: ${cpp.vm.Gc.memInfo64(cpp.vm.Gc.MEM_INFO_CURRENT)} bytes';
result += '\n- Memory Large Pool: ${cpp.vm.Gc.memInfo64(cpp.vm.Gc.MEM_INFO_LARGE)} bytes';
result += '\n- HXCPP Debugger: ${#if HXCPP_DEBUGGER 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Exp Generational Mode: ${#if HXCPP_GC_GENERATIONAL 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Exp Moving GC: ${#if HXCPP_GC_MOVING 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Exp Moving GC: ${#if HXCPP_GC_DYNAMIC_SIZE 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Exp Moving GC: ${#if HXCPP_GC_BIG_BLOCKS 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Debug Link: ${#if HXCPP_DEBUG_LINK 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Stack Trace: ${#if HXCPP_STACK_TRACE 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Stack Trace Line Numbers: ${#if HXCPP_STACK_LINE 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Pointer Validation: ${#if HXCPP_CHECK_POINTER 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Profiler: ${#if HXCPP_PROFILER 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP Local Telemetry: ${#if HXCPP_TELEMETRY 'Enabled' #else 'Disabled' #end}';
result += '\n- HXCPP C++11: ${#if HXCPP_CPP11 'Enabled' #else 'Disabled' #end}';
result += '\n- Source Annotation: ${#if annotate_source 'Enabled' #else 'Disabled' #end}';
result += '\n- Memory Used: ${getGCMemory()} bytes';
result += '\n- Memory Used: ${hl.Gc.stats().currentMemory} bytes';
result += '\n- Memory Allocated: ${hl.Gc.stats().totalAllocated} bytes';
result += '\n- Memory Allocation Count: ${hl.Gc.stats().allocationCount}';

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
input.close();
}
line = input.readLine();
} while (!regex.match(line));

input.close();


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
cpp.vm.Gc.enable(true);
hl.Gc.enable(true);
throw 'Not implemented!';
}

/**
* Disable garbage collection entirely.
*/
public static function disable():Void
{
cpp.vm.Gc.enable(false);
hl.Gc.enable(false);
throw 'Not implemented!';
}

/**
* Manually perform garbage collection once.
* Should only be called from the main thread.
* @param major `true` to perform major collection, whatever that means.
*/
public static function collect(major:Bool = false):Void
{
cpp.vm.Gc.run(major);
hl.Gc.major();
throw 'Not implemented!';
}

/**
* Perform major garbage collection repeatedly until less than 16kb of memory is freed in one operation.
* Should only be called from the main thread.
*
* NOTE: This is DIFFERENT from actual compaction,
*/
public static function compact():Void
{
cpp.vm.Gc.compact();
throw 'Not implemented!';
}
}
