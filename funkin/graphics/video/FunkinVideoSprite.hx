package funkin.graphics.video;


/**
* Not to be confused with FlxVideo, this is a hxvlc based video class.
*/
class FunkinVideoSprite extends FlxVideoSprite
{
public function new(x:Float = 0, y:Float = 0)
{
super(x, y);

{
bitmap.onOpening.add(function():Void
{
{
{
bitmap.rate = PlayState.instance.playbackRate;
}
}
});
}
}
}
