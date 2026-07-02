


/**
* A FlxCamera with additional powerful features:
* - Added the ability to grab the camera screen as a `BitmapData` and use it as a texture.
* - Added support for the following blend modes for a sprite through shaders:
*   - DARKEN
*   - HARDLIGHT
*   - LIGHTEN
*   - OVERLAY
*   - DIFFERENCE
*   - INVERT
*   - COLORDODGE
*   - COLORBURN
*   - SOFTLIGHT
*   - EXCLUSION
*   - HUE
*   - SATURATION
*   - COLOR
*   - LUMINOSITY
*/
class FunkinCamera extends FlxCamera
{
/**
* Whether or not the device supports the OpenGL extension `KHR_blend_equation_advanced`.
* If `false`, a shader implementation will be used to render certain blend modes.
*/

static inline function get_hasKhronosExtension():Bool
{
}

/**
* A list of blend modes that require the OpenGL extension `KHR_blend_equation_advanced`.
*
* NOTE:
*  - `LIGHTEN` is supported natively on desktop, but not other platforms.
*  - While `DARKEN` is supported natively on desktop, it causes issues with transparency.
*/

/**
* A list of blend modes that require the shader no matter what.
* This is due to these blend modes not being supported on any platform.
*/

/**
* The ID of this camera, used for debugging.
*/

/**
* If `true` the blend shader will try to blend with the cameras underneath it.
* This is useful for, say, making a strumline note have a shader-only blend mode like `INVERT`.
*
* Defaults to `false` since this can impact performance.
*/




public function new(id:String = 'unknown', x:Int = 0, y:Int = 0, width:Int = 0, height:Int = 0, zoom:Float = 0)
{






}

override function drawPixels(?frame:FlxFrame, ?pixels:BitmapData, matrix:FlxMatrix, ?transform:ColorTransform, ?blend:BlendMode, ?smoothing:Bool = false,
?shader:FlxShader):Void
{

{
{

for (i in camerasUnderneath.length - 1...-1)
{
{
}
}


for (camera in camerasUnderneath)
{
}
}
else
{
}



_blendRenderTexture.drawToCamera((camera, frameMatrix) ->
{






_backgroundRenderTexture.drawToCamera((camera, matrix) ->
{



}
else
{
}
}

override function startQuadBatch(graphic:FlxGraphic, colored:Bool, hasColorOffsets:Bool = false, ?blend:BlendMode, smooth:Bool = false,
?shader:FlxShader):FlxDrawQuadsItem
{
{

{
}
else
{
}




{
}

{
}


}

}

override function startTrianglesBatch(graphic:FlxGraphic, smoothing:Bool = false, isColored:Bool = false, ?blend:BlendMode, ?hasColorOffsets:Bool,
?shader:FlxShader):FlxDrawTrianglesItem
{
&& !(OpenGLRenderer.__coherentBlendsSupported ?? false)

}

override function destroy():Void
{


}
}
