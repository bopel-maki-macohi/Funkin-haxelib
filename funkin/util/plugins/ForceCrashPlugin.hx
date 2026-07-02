package funkin.util.plugins;


/**
* A plugin which forcibly crashes the application.
* TODO: Should we disable this in release builds?
*/
class ForceCrashPlugin extends FlxBasic
{
public function new()
{
super();
}

public static function initialize():Void
{
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
throw "DEBUG: Crashing the game via debug keybind!";
}
}

public override function destroy():Void
{
super.destroy();
}
}
