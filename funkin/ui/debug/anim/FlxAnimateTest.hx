

/**
* A simple test of FlxAnimate.
* Delete this later?
*/
class FlxAnimateTest extends MusicBeatState implements ConsoleClass
{

public function new()
{
}

public override function create():Void
{

sprite = FunkinSprite.createTextureAtlas(0, 0, "charSelect/bfChill", {
swfMode: false, // If to render like in a SWF file, rather than the Animate editor.
cacheOnLoad: true, // If to precache all animation filters and masks at once, rather than at runtime.
filterQuality: MEDIUM // Level of quality used to render filters. (HIGH, MEDIUM, LOW, RUDY)

}

public override function update(elapsed:Float):Void
{



}
}
