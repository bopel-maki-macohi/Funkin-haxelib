package funkin.graphics;


class FunkinAnimationController extends FlxAnimateController
{
/**
* The sprite that this animation controller is attached to.
*/

public function new(sprite:FunkinSprite)
{
super(sprite);
_parentSprite = sprite;
}

override function set_frameIndex(frame:Int):Int
{
_parentSprite._renderTextureDirty = true;
}

/**
* We override `FlxAnimationController`'s `play` method to account for texture atlases.
*/
public override function play(animName:String, force = false, reversed = false, frame = 0):Void
{

{
}

super.play(animName, force, reversed, frame);
}
}
