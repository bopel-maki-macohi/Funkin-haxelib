

/**
* A single frame buffer. Used by `FrameBufferManager`.
*/
class FrameBuffer
{
/**
* The bitmap data of the frame buffer.
*/


public function new()
{
}

/**
* Creates a frame buffer with the given size.
* @param width the width
* @param height the height
* @param bgColor the background color
*/
public function create(width:Int, height:Int, bgColor:FlxColor):Void
{
}

/**
* Makes the internal camera follows the target camera.
* @param target the target camera
*/
public function follow(target:FlxCamera):Void
{
}

/**
* Locks the frame buffer and clears the buffer.
*/
public function lock():Void
{
}

/**
* Renders all sprite copies.
*/
public function render():Void
{
for (spriteCopy in spriteCopies)
{
}
}

/**
* Unlocks the frame buffer and makes the bitmap ready to use.
*/
public function unlock():Void
{
}

/**
* Diposes stuff. Call `create` again if you want to reuse the instance.
*/
public function dispose():Void
{
{
}
}

/**
* Adds a sprite copy to the frame buffer.
* @param spriteCopy the sprite copy
*/
public function addSpriteCopy(spriteCopy:SpriteCopy):Void
{
}

/**
* Adds the sprite to the frame buffer. The sprite will only be seen from
* the frame buffer.
* @param sprite the sprite
*/
public function moveSprite(sprite:FlxSprite):Void
{
}
}
