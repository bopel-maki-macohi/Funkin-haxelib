

/**
* An offshoot of FlxTrail, but accomodates the way Funkin
* does offsets for characters. example, fixes Spirits trail
*/
class FunkTrail extends FlxTrail
{
/**
* Creates a new FunkTrail effect for a specific FlxSprite.
*
* @param	target		The FlxSprite the trail is attached to.
* @param graphic		The image to use for the trailsprites. Optional, uses the sprite's graphic if null.
* @param	length		The amount of trailsprites to create.
* @param	delay		How often to update the trail. 0 updates every frame.
* @param	alpha		The alpha value for the very first trailsprite.
* @param	diff		How much lower the alpha of the next trailsprite is.
*/
public function new(target:FlxSprite, ?graphic:FlxGraphicAsset, length:Int = 10, delay:Float = 0.1, alpha:Float = 0.4, diff:Float = 0.05)
{
}

/**
* An offset applied to the target position whenever a new frame is saved.
*/

override function destroy():Void
{

}

override function addTrailFrame():Void
{

{

}
}
}
