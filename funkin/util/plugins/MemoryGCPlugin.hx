package funkin.util.plugins;


/**
* A plugin which adds functionality to press `Ins` to immediately perform memory garbage collection.
*/
class MemoryGCPlugin extends FlxBasic
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
funkin.util.MemoryUtil.collect(true);
perf.print();
}
}

public override function destroy():Void
{
super.destroy();
}
}
