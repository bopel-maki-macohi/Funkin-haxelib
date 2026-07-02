

/**
* A utility class for `BitmapData`s.
*/
class BitmapDataUtil
{

static inline function get_renderer():OpenGLRenderer
{
{
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

for (camera in cameras)
{
{
}
else
{
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






{
}
else
{
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


{
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




}

/**
* Copies the contents of `source` to `destination`. `destination` bitmap will be resized
* so that it has the same size as `source`.
* @param source The source `BitmapData`.
* @param destination The destination `BitmapData`.
*/
public static function copy(source:BitmapData, destination:BitmapData):Void
{
}
}
