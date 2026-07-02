package funkin.graphics;


using funkin.graphics.framebuffer.BitmapDataUtil;

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
super(x, y, width, height, zoom);

this.id = id;

_backgroundFrame = new FlxFrame(new FlxGraphic('', null));
_backgroundFrame.frame = new FlxRect();

_blendShader = new RuntimeCustomBlendShader();

_backgroundRenderTexture = new RenderTexture(this.width, this.height);
_blendRenderTexture = new RenderTexture(this.width, this.height);

_cameraMatrix = new FlxMatrix();
_cameraTexture = FixedBitmapData.create(this.width, this.height);

crossCameraBlending = false;
}

override function drawPixels(?frame:FlxFrame, ?pixels:BitmapData, matrix:FlxMatrix, ?transform:ColorTransform, ?blend:BlendMode, ?smoothing:Bool = false,
?shader:FlxShader):Void
{

{
{

for (i in camerasUnderneath.length - 1...-1)
{
{
camerasUnderneath.remove(camerasUnderneath[i]);
}
}

_cameraTexture.drawCameraScreens(camerasUnderneath);

for (camera in camerasUnderneath)
{
camera.clearDrawStack();
camera.canvas.graphics.clear();
}
}
else
{
_cameraTexture.drawCameraScreen(this);
}

_backgroundFrame.frame.set(0, 0, this.width, this.height);

this.clearDrawStack();
this.canvas.graphics.clear();

_blendRenderTexture.init(this.width, this.height);
_blendRenderTexture.drawToCamera((camera, frameMatrix) ->
{

frameMatrix.copyFrom(matrix);
frameMatrix.translate(-pivotX, -pivotY);
frameMatrix.scale(this.scaleX, this.scaleY);
frameMatrix.translate(pivotX, pivotY);
camera.drawPixels(frame, pixels, frameMatrix, transform, null, smoothing, shader);
});
_blendRenderTexture.render();

_blendShader.sourceSwag = _blendRenderTexture.graphic.bitmap;
_blendShader.backgroundSwag = _cameraTexture;

_blendShader.blendSwag = blend;
_blendShader.updateViewInfo(width, height, this);

_backgroundFrame.parent.bitmap = _blendRenderTexture.graphic.bitmap;


_backgroundRenderTexture.init(Std.int(this.width * clampedScale), Std.int(this.height * clampedScale));
_backgroundRenderTexture.drawToCamera((camera, matrix) ->
{
camera.zoom = this.zoom;
matrix.scale(clampedScale, clampedScale);
camera.drawPixels(_backgroundFrame, null, matrix, canvas.transform.colorTransform, null, false, _blendShader);
});

_backgroundRenderTexture.render();

_cameraMatrix.identity();
_cameraMatrix.scale(1 / (this.scaleX * clampedScale), 1 / (this.scaleY * clampedScale));
_cameraMatrix.translate(((width - width / this.scaleX) * 0.5), ((height - height / this.scaleY) * 0.5));

super.drawPixels(_backgroundRenderTexture.graphic.imageFrame.frame, null, _cameraMatrix, null, null, smoothing, null);
}
else
{
super.drawPixels(frame, pixels, matrix, transform, blend, smoothing, shader);
}
}

override function startQuadBatch(graphic:FlxGraphic, colored:Bool, hasColorOffsets:Bool = false, ?blend:BlendMode, smooth:Bool = false,
?shader:FlxShader):FlxDrawQuadsItem
{
{

{
itemToReturn = FlxCamera._storageTilesHead;
itemToReturn.reset();
FlxCamera._storageTilesHead = newHead;
}
else
{
itemToReturn = new FlxDrawQuadsItem();
}


itemToReturn.graphics = graphic;
itemToReturn.antialiasing = smooth;
itemToReturn.colored = colored;
itemToReturn.hasColorOffsets = hasColorOffsets;
itemToReturn.blend = blend;
itemToReturn.shader = shader;

itemToReturn.nextTyped = _headTiles;
_headTiles = itemToReturn;

{
_headOfDrawStack = itemToReturn;
}

{
_currentDrawItem.next = itemToReturn;
}

_currentDrawItem = itemToReturn;

}

}

override function startTrianglesBatch(graphic:FlxGraphic, smoothing:Bool = false, isColored:Bool = false, ?blend:BlendMode, ?hasColorOffsets:Bool,
?shader:FlxShader):FlxDrawTrianglesItem
{
&& !(OpenGLRenderer.__coherentBlendsSupported ?? false)
&& KHR_BLEND_MODES.contains(blend)) return getNewDrawTrianglesItem(graphic, smoothing, isColored, blend, hasColorOffsets, shader);

}

override function destroy():Void
{
super.destroy();

_blendRenderTexture.destroy();
_backgroundRenderTexture.destroy();

_cameraTexture.dispose();
}
}
