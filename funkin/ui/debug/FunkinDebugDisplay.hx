

/**
* A debug overlay showing useful info.
*/
class FunkinDebugDisplay extends Sprite
{

/**
* Indicates whether the debug display is in advanced mode.
*/

/**
* The opacity of the debug display's background.
*/






public function new(x:Float = 10, y:Float = 10, color:Int = 0x000000):Void
{




}

function buildDebugDisplay(advanced:Bool):Void
{


{
}


{
}
else if (MemoryUtil.supportsGCMem() || MemoryUtil.supportsTaskMem())
{
}

background.graphics.drawRect(0, 0, (OUTER_RECT_DIMENSIONS[0] * BG_WIDTH_MULTIPLIER) + (INNER_RECT_DIFF * 2),
background.graphics.drawRect(INNER_RECT_DIFF, INNER_RECT_DIFF, OUTER_RECT_DIMENSIONS[0] * BG_WIDTH_MULTIPLIER,

{
}
else
{
}
}

function createAdvancedElements():Void
{


{
}

{
taskMemGraph = new FunkinStatsGraph(OTHERS_OFFSET, Math.floor(OTHERS_OFFSET + (gcMemGraph.y + gcMemGraph.axisHeight) + 22), graphsWidth, graphsHeight,
}
}

function createSimpleElements():Void
{
}

override function __enterFrame(deltaTime:Float):Void
{


{
}

{
}



{

}

{

}

{
}
else
{
}

}

function updateAdvancedDisplay():Void
{


{
}

{
}
}

function updateSimpleDisplay():Void
{
{


{
}

{
}

}
}

function updateFPSGraph():Void
{
}

function updateGcMemGraph():Void
{
{
}
}

function updateTaskMemGraph():Void
{
{
}
}

function set_isAdvanced(value:Bool):Bool
{

}

function set_backgroundOpacity(value:Float):Float
{

}
}

enum abstract DebugDisplayMode(String) from String to String
{
/**
* Debug display is disabled.
*/

/**
* Simple debug display.
* FPS and Memory counters only.
*/

/**
* Advanced debug display.
* Full FPS and Memory info.
*/
}
