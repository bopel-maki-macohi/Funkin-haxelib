

class FlxAnimationUtil
{
/**
* Properly adds an animation to a sprite based on the provided animation data.
*/
public static function addAtlasAnimation(target:FlxSprite, anim:AnimationData):Void
{


{
}
else
{
}
}

/**
* Properly adds an animation to a texture atlas sprite based on the provided animation data.
*/
public static function addTextureAtlasAnimation(target:FunkinSprite, anim:AnimationData):Void
{


{
switch (animType)
{
case "framelabel":
case "symbol":
}
}
else
{
switch (animType)
{
case "framelabel":
case "symbol":
}
}
}

/**
* Properly adds multiple animations to a sprite based on the provided animation data.
*/
public static function addAtlasAnimations(target:FlxSprite, animations:Array<AnimationData>):Void
{
for (anim in animations)
{
}
}

/**
* Properly adds multiple animations to a texture atlas sprite based on the provided animation data.
*/
public static function addTextureAtlasAnimations(target:FunkinSprite, animations:Array<AnimationData>):Void
{
for (anim in animations)
{
}
}

/**
* Combine two FlxFramesCollection objects into one.
* @param a The first FlxFramesCollection
* @param b The second FlxFramesCollection
* @return FlxFramesCollection The combined FlxFramesCollection
*/
public static function combineFramesCollections(a:FlxFramesCollection, b:FlxFramesCollection):FlxFramesCollection
{

for (frame in a.frames)
{
}
for (frame in b.frames)
{
}

}
}
