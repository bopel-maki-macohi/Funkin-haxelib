package funkin.graphics.framebuffer;


/**
* Manages frame buffers and gives access to each frame buffer.
*/
class FrameBufferManager
{

/**
* Creates a frame buffer manager that targets `camera`.
* @param camera the target camera.
*/
public function new(camera:FlxCamera)
{
this.camera = camera;
}

/**
* Creates a new frame buffer with a name.
* @param name the name
* @param bgColor the background color
* @return the bitmap data of the frame buffer. the bitmap data instance
* will not be changed through frame buffer updates.
*/
public function createFrameBuffer(name:String, bgColor:FlxColor):BitmapData
{
{
frameBufferMap[name].dispose();
frameBufferMap.remove(name);
}
fb.create(camera.width, camera.height, bgColor);
frameBufferMap[name] = fb;
}

/**
* Adds a copy of the sprite to the frame buffer.
* @param name the name of the frame buffer
* @param sprite the sprite
* @param color if this is not `null`, the sprite will be filled with the color.
* if this is `null`, the sprite will keep its original color.
*/
public function copySpriteTo(name:String, sprite:FlxSprite, color:Null<FlxColor> = null):Void
{
{
}
frameBufferMap[name].addSpriteCopy(new SpriteCopy(sprite, color));
}

/**
* Adds the sprite to the frame buffer. The sprite will only be seen from the frame buffer.
* @param name the name of the frame buffer
* @param sprite the sprite
*/
public function moveSpriteTo(name:String, sprite:FlxSprite):Void
{
{
}
frameBufferMap[name].moveSprite(sprite);
}

/**
* Call this before drawing anything.
*/
public function lock():Void
{
for (_ => fb in frameBufferMap)
{
fb.follow(camera);
fb.lock();
}
}

/**
* Unlocks the frame buffers. This updates the bitmap data of each frame buffer.
*/
public function unlock():Void
{
for (_ => fb in frameBufferMap)
{
fb.render();
}
for (_ => fb in frameBufferMap)
{
fb.unlock();
}
}

/**
* Returns the bitmap data of the frame buffer
* @param name the name of the frame buffer
* @return the bitmap data
*/
public function getFrameBuffer(name:String):BitmapData
{
}

/**
* Disposes all frame buffers. The instance can be reused.
*/
public function dispose():Void
{
for (_ => fb in frameBufferMap)
{
fb.dispose();
}
frameBufferMap.clear();
}
}
