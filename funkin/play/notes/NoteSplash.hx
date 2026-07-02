package funkin.play.notes;


class NoteSplash extends FlxSprite
{


public function new(noteStyle:NoteStyle)
{
super(0, 0);

setupSplashGraphic(noteStyle);

this.animation.onFinish.add(this.onAnimationFinished);
}

/**
* Add ALL the animations to this sprite. We will recycle and reuse the FlxSprite multiple times.
*/
function setupSplashGraphic(noteStyle:NoteStyle):Void
{

{
}
}

public function playAnimation(name:String, force:Bool = false, reversed:Bool = false, startFrame:Int = 0):Void
{
this.animation.play(name, force, reversed, startFrame);
}

public function play(direction:NoteDirection, variant:Int = null):Void
{
{
- 1;
}

this.playAnimation('splash${direction.nameUpper}${variant}');


animation.curAnim.frameRate = splashFramerate + FlxG.random.int(-splashFramerateVariance, splashFramerateVariance);

offset.set(width * 0.3, height * 0.3);
}

public function onAnimationFinished(animationName:String):Void
{
this.kill();
}
}
