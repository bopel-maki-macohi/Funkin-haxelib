package funkin.ui.haxeui;


/**
* Receives button presses from the Flixel gamepad and emits HaxeUI events.
*/
class FlxGamepadActionInputSource extends FlxBasic
{

static function get_instance():FlxGamepadActionInputSource
{
}

public function new()
{
super();
}

public function start():Void
{
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
updateGamepad(elapsed, FlxG.gamepads.firstActive);
}
}

function updateGamepad(elapsed:Float, gamepad:FlxGamepad):Void
{
{
//
}
}

public override function destroy():Void
{
super.destroy();
}
}
