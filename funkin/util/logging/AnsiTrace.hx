package funkin.util.logging;


using StringTools;

/**
* Class that helps with some Ansi related logging functionality like some terminal color checking
*/
class AnsiTrace
{
private static final HEADER_REGEX = ~/^\s*\[(.*?)\]\s*(.*)$/;

private static final logFilePath:String = 'logs/log-${DateUtil.generateTimestamp()}.txt';

/**
* Output a message to the log.
* Called when using `trace()`, and modified from the default to support ANSI colors.
* @param v The value to print.
*/
public static function trace(v:Dynamic, ?info:haxe.PosInfos)
{

cpp.vm.tracy.TracyProfiler.message(str, flixel.util.FlxColor.WHITE);
untyped __define_feature__("use._hx_print", _hx_print(str));
{
try
{
FileUtil.createDirIfNotExists(Path.directory(logFilePath));
}
catch (_)
{
logFileClosed = true;
}


{
logFileClosed = true;
}, true, FlxMath.MIN_VALUE_INT);
}
throw new haxe.exceptions.NotImplementedException()
}

/**
* Returns our terminals support for color output
*/
|| Sys.getEnv("ANSICON") != null) #else false #end;

/**
* Format the output to use ANSI colors.
* Edited from the standard `trace()` implementation.
*/
static function formatOutput(v:Dynamic, ?infos:haxe.PosInfos):String
{

{
dirs[dirs.length - 1] = dirs[dirs.length - 1].bold();

infos.fileName = dirs.join("/");
}

str += ", " + Std.string(v);


{
header = ' ${HEADER_REGEX.matched(1)} ';
body = HEADER_REGEX.matched(2);
}

}

/**
* Print color pixel art of BF in ANSI format.
*/
public static function traceBF()
{
{
for (line in ansiBF)
}
}

/**
* Color pixel art of BF in ANSI format.
* Generated using https://dom111.github.io/image-to-ansi/
*/
}
