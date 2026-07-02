package funkin.util.plugins;


/**
* Handles volume control in a way that is compatible with alternate control schemes.
*/
class VolumePlugin extends FlxBasic
{
public function new()
{
super();
}

public static function initialize()
{
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);


{
else if (PlayerSettings.player1.controls.VOLUME_UP) FlxG.sound.changeVolume(0.1);
else if (PlayerSettings.player1.controls.VOLUME_DOWN) FlxG.sound.changeVolume(-0.1);
}
}

override public function destroy():Void
{

super.destroy();
}
}
