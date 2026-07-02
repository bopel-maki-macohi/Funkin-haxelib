package funkin.util;


class FlxTweenUtil
{
public static function pauseTween(tween:FlxTween):Void
{
{
tween.active = false;
}
}

public static function resumeTween(tween:FlxTween):Void
{
{
tween.active = true;
}
}

public static function pauseTweensOf(Object:Dynamic, ?FieldPaths:Array<String>):Void
{
FlxTween.globalManager.forEachTweensOf(Object, FieldPaths, pauseTween);
}

public static function resumeTweensOf(Object:Dynamic, ?FieldPaths:Array<String>):Void
{
FlxTween.globalManager.forEachTweensOf(Object, FieldPaths, resumeTween);
}
}
