package funkin.graphics.framebuffer;


/**
* A copy of a `FlxSprite` with a specified color. Used to render the sprite to a frame buffer.
*/
class SpriteCopy
{

public function new(sprite:FlxSprite, color:Null<FlxColor>)
{
this.sprite = sprite;
this.color = color;
}

/**
* Renders the copy to the camera.
* @param camera the camera
*/
public function render(camera:FlxCamera):Void
{
{
sprite._cameras = [camera];
sprite.draw();
sprite._cameras = tmpCameras;
}
else
{

sprite._cameras = [camera];
sprite.shader = null;

sprite.setColorTransform(0, 0, 0, 1, color.red, color.green, color.blue, 0);
sprite.draw();

sprite._cameras = tmpCameras;
sprite.shader = tmpShader;
sprite.setColorTransform(rMult, gMult, bMult, aMult, rOff, gOff, bOff, aOff);
}
}
}
