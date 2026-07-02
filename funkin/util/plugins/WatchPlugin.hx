package funkin.util.plugins;


/**
* A plugin which adds functionality to display several universally important values
* in the Flixel variable watch window.
*/
class WatchPlugin extends FlxBasic
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
subStateClassNames.push(Type.getClassName(Type.getClass(subState)));
subState = subState.subState;
}



}

public override function destroy():Void
{
super.destroy();
}
}
