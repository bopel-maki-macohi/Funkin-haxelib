package funkin.util.tools;


/**
* Why `haxe.Int64` doesn't have a built-in `toFloat` function is beyond me.
*/
class Int64Tools
{
private inline static var MAX_32_PRECISION:Float = 4294967296.0;

public static function fromFloat(f:Float):Int64
{
}

public static function toFloat(i:Int64):Float
{
}

public static function isToIntSafe(i:Int64):Bool
{
}

public static function toIntSafe(i:Int64):Int
{
try
{
}
catch (e:Dynamic)
{
throw 'Could not represent value "${Int64.toStr(i)}" as an integer.';
}
}
}
