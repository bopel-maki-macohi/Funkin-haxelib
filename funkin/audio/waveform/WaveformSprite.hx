

/**
* A sprite which displays the waveform of audio data.
* Generate a WaveformData and provide it to this sprite.
*/
class WaveformSprite extends MeshRender
{


/**
* Set this to true to tell the waveform to rebuild itself.
* Do this any time the data or drawable area of the waveform changes.
* This often (but not always) needs to be done every frame.
*/

/**
* If true, force the waveform to redraw every frame.
* Useful if the waveform's clipRect is constantly changing.
*/

/**
* The data to render the waveform with.
*/

function set_waveformData(value:Null<WaveformData>):Null<WaveformData>
{

}

/**
* The color to render the waveform with.
*/

function set_waveformColor(value:FlxColor):FlxColor
{

}

/**
* Whether the Waveform is horizontal or vertical.
*/

function set_orientation(value:WaveformOrientation):WaveformOrientation
{

}

/**
* Time, in seconds, at which the waveform starts.
*/

function set_time(value:Float):Float
{

}

override function set_visible(value:Bool):Bool
{

}

/**
* The duration, in seconds, that the waveform represents.
* The section of waveform from `time` to `time + duration` and `width` are used to determine how many samples each pixel represents.
*/

function set_duration(value:Float):Float
{

}

/**
* Set the physical size of the waveform with `this.height = value`.
*/
override function set_height(value:Float):Float
{

}

/**
* Set the physical size of the waveform with `this.width = value`.
*/
override function set_width(value:Float):Float
{

}

/**
* The minimum size, in pixels, that a waveform will display with.
* Useful for preventing the waveform from becoming too small to see.
*
* NOTE: This is technically doubled since it's applied above and below the center of the waveform.
*/

/**
* A multiplier on the size of the waveform.
* Still capped at the width and height set for the sprite.
*/

public function new(?waveformData:WaveformData, ?orientation:WaveformOrientation, ?color:FlxColor, ?duration:Float)
{



}

/**
* Manually tell the waveform to rebuild itself, even if none of its properties have changed.
*/
public function markDirty():Void
{
}

public override function update(elapsed:Float):Void
{

{
}
}

function rebuildGraphic():Void
{
}

public override function draw():Void
{
}

/**
* @param offsetX Horizontal offset to draw the waveform at, in samples.
*/
function drawWaveform():Void
{









{
}

{
for (i in startIndex...endIndex)
{


{
}


{




{
{
vertexBottomIndex = buildClippedVertex(pixelPos, vertexBottomY, topLeftVertexIndex, topRightVertexIndex, bottomLeftVertexIndex,
}
else
{
vertexBottomIndex = buildClippedVertex(vertexBottomY, pixelPos, topLeftVertexIndex, topRightVertexIndex, bottomLeftVertexIndex,
}
}
else
{
{
}
else
{
}
}

&& prevVertexBottomIndex != -1
&& prevVertexTopIndex != vertexTopIndex
&& prevVertexBottomIndex != vertexBottomIndex)
{
switch (orientation) // the line of code that makes you gay
{
case HORIZONTAL:
case VERTICAL:
}
}

}
}
else
{
for (i in 0...waveformLengthPixels)
{




{




{
{
vertexBottomIndex = buildClippedVertex(pixelPos, vertexBottomY, topLeftVertexIndex, topRightVertexIndex, bottomLeftVertexIndex,
}
else
{
vertexBottomIndex = buildClippedVertex(vertexBottomY, pixelPos, topLeftVertexIndex, topRightVertexIndex, bottomLeftVertexIndex,
}
}
else
{
{
}
else
{
}
}

{
switch (orientation)
{
case HORIZONTAL:
case VERTICAL:
}
}
}
}
}

function buildClippedVertex(x:Int, y:Int, topLeftVertexIndex:Int, topRightVertexIndex:Int, bottomLeftVertexIndex:Int, bottomRightVertexIndex:Int):Int
{

{
}
else if (shouldClipXRight && shouldClipYTop)
{
}
else if (shouldClipXLeft && shouldClipYBottom)
{
}
else if (shouldClipXRight && shouldClipYBottom)
{
}
else if (shouldClipXLeft)
{
}
else if (shouldClipXRight)
{
}
else if (shouldClipYTop)
{
}
else if (shouldClipYBottom)
{
}
else
{
}
}

/**
* Build a WaveformSprite from waveform data.
* @param data The data for the waveform to use.
* @param orientation Whether the waveform should be horizontal or vertical.
* @param color The color of the waveform.
* @param duration The width of the waveform, in seconds.
*
* @return The resulting WaveformSprite.
*/
public static function buildFromWaveformData(data:WaveformData, ?orientation:WaveformOrientation, ?color:FlxColor, ?duration:Float):WaveformSprite
{
}

/**
* Build a WaveformSprite from a FunkinSound's waveform data.
* @param sound The audio for the waveform to use.
* @param orientation Whether the waveform should be horizontal or vertical.
* @param color The color of the waveform.
* @param duration The width of the waveform, in seconds.
*
* @return The resulting WaveformSprite.
*/
public static function buildFromFunkinSound(sound:FunkinSound, ?orientation:WaveformOrientation, ?color:FlxColor, ?duration:Float):WaveformSprite
{

}
}

/**
* The possible orientations of a waveform.
*/
enum WaveformOrientation
{
}
