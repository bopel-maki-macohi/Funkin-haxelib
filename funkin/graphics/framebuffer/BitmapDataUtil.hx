package funkin.graphics.framebuffer;


/**
* A utility class for `BitmapData`s.
*/
class BitmapDataUtil
{

static inline function get_renderer():OpenGLRenderer
{
{
_renderer = new OpenGLRenderer(FlxG.stage.context3D);
_renderer.__worldTransform = new Matrix();
_renderer.__worldColorTransform = new ColorTransform();
}

}

/**
* Draws the contents of multiple cameras onto a `BitmapData` object.
*
* @param bitmap The bitmap to draw onto.
* @param cameras The cameras to grab the screens from.
*
* @return The combined camera screens as a `BitmapData`.
*/
public static function drawCameraScreens(bitmap:BitmapData, cameras:Array<FlxCamera>):BitmapData
{
bitmap.__fillRect(bitmap.rect, 0, true);

for (camera in cameras)
{
{
drawCameraScreen(bitmap, camera, false, true);
}
else
{
drawCameraScreen(bitmap, camera, false);
}
}

}

/**
* Draws the contents of a camera onto a `BitmapData` object.
*
* Mostly copied from flixel-animate's `RenderTexture`
* Shoutouts to ACrazyTown and MaybeMaru this is some crazy work
* https://github.com/MaybeMaru/flixel-animate/blob/main/src/animate/internal/RenderTexture.hx
*
* @param bitmap The bitmap to draw onto.
* @param camera The camera to grab the screen from.
* @param clearBitmap Whether to clear the bitmap before drawing.
* @param drawFlashSprite Whether to draw the camera's flash sprite instead of the canvas.
*
* @return The camera screen as a `BitmapData`.
*/
public static function drawCameraScreen(bitmap:BitmapData, camera:FlxCamera, clearBitmap:Bool = true, drawFlashSprite:Bool = false):BitmapData
{

matrix.setTo(1 / pivotX, 0, 0, 1 / pivotY, camera.flashSprite.x / pivotX, camera.flashSprite.y / pivotY);


camera.render();
camera.flashSprite.__update(false, true);

renderer.__cleanup();

renderer.setShader(renderer.__defaultShader);
renderer.__allowSmoothing = false;
renderer.__pixelRatio = Lib.current.stage.window.scale;
renderer.__worldAlpha = 1 / camera.flashSprite.__worldAlpha;
renderer.__worldTransform.copyFrom(camera.flashSprite.__renderTransform);
renderer.__worldTransform.invert();
renderer.__worldTransform.concat(matrix);
renderer.__worldColorTransform.__copyFrom(camera.flashSprite.__worldColorTransform);
renderer.__worldColorTransform.__invert();
renderer.__setRenderTarget(bitmap);

{
bitmap.__drawGL(camera.flashSprite, renderer);
}
else
{
bitmap.__drawGL(camera.canvas, renderer);
}

}

/**
* Applies a `BitmapFilter` to a bitmap.
* @param bitmap The `BitmapData` to apply the filter to.
* @param filter The filter to apply.
*
* @return The `BitmapData` with the filter applied.
*/
public static function applyFilter(bitmap:BitmapData, filter:BitmapFilter):BitmapData
{
}

/**
* Resizes the bitmap.
* @param bitmap The `BitmapData` to resize.
* @param width The new width.
* @param height The new height.
*/
public static function resize(bitmap:BitmapData, width:Int, height:Int):Void
{

bitmap.width = width;
bitmap.height = height;

{
resizeTexture(bitmap.__texture, width, height);
}
}

/**
* Resizes the hardware texture.
* @param texture The `TextureBase` to resize.
* @param width The new width.
* @param height The new height.
*/
public static function resizeTexture(texture:TextureBase, width:Int, height:Int):Void
{


texture.__width = width;
texture.__height = height;

context.__bindGLTexture2D(texture.__textureID);
context.gl.texImage2D(context.gl.TEXTURE_2D, 0, texture.__internalFormat, width, height, 0, texture.__format, context.gl.UNSIGNED_BYTE, null);

context.__bindGLTexture2D(null);
}

/**
* Copies the contents of `source` to `destination`. `destination` bitmap will be resized
* so that it has the same size as `source`.
* @param source The source `BitmapData`.
* @param destination The destination `BitmapData`.
*/
public static function copy(source:BitmapData, destination:BitmapData):Void
{
resize(destination, source.width, source.height);
destination.fillRect(destination.rect, 0);
destination.draw(source);
}
}
