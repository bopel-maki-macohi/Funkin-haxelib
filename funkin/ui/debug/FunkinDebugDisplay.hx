package funkin.ui.debug;


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
super();

this.x = x;
this.y = y;

this.deltaTimeout = 0.0;
this.times = [];
this.color = color;

this.fps = 0;
this.fpsPeak = 0;
this.gcMem = 0.0;
this.gcMemPeak = 0.0;
this.taskMem = 0.0;
this.taskMemPeak = 0.0;

this.backgroundOpacity = 0;
this.isAdvanced = false;
}

function buildDebugDisplay(advanced:Bool):Void
{
removeChildren(0, numChildren);


{
BG_WIDTH_MULTIPLIER = 1;
}


{
BG_HEIGHT_MULTIPLIER = advanced ? 1 : 0.3;
}
else if (MemoryUtil.supportsGCMem() || MemoryUtil.supportsTaskMem())
{
BG_HEIGHT_MULTIPLIER = advanced ? 0.7 : 0.2;
}

background = new Shape();
background.graphics.beginFill(0x3d3f41, 1);
background.graphics.drawRect(0, 0, (OUTER_RECT_DIMENSIONS[0] * BG_WIDTH_MULTIPLIER) + (INNER_RECT_DIFF * 2),
(OUTER_RECT_DIMENSIONS[1] * BG_HEIGHT_MULTIPLIER) + (INNER_RECT_DIFF * 2));
background.graphics.endFill();
background.graphics.beginFill(0x2c2f30, 1);
background.graphics.drawRect(INNER_RECT_DIFF, INNER_RECT_DIFF, OUTER_RECT_DIMENSIONS[0] * BG_WIDTH_MULTIPLIER,
OUTER_RECT_DIMENSIONS[1] * BG_HEIGHT_MULTIPLIER);
background.graphics.endFill();
background.alpha = backgroundOpacity;
addChild(background);

{
createAdvancedElements();
updateAdvancedDisplay();
}
else
{
createSimpleElements();
updateSimpleDisplay();
}
}

function createAdvancedElements():Void
{

fpsGraph = new FunkinStatsGraph(OTHERS_OFFSET, OTHERS_OFFSET + 49, graphsWidth, graphsHeight, color);
fpsGraph.textDisplay.y = -49;
fpsGraph.minValue = 0;
addChild(fpsGraph);

{
gcMemGraph = new FunkinStatsGraph(OTHERS_OFFSET, Math.floor(OTHERS_OFFSET + (fpsGraph.y + fpsGraph.axisHeight) + 22), graphsWidth, graphsHeight, color);
gcMemGraph.minValue = 0;
addChild(gcMemGraph);
}

{
taskMemGraph = new FunkinStatsGraph(OTHERS_OFFSET, Math.floor(OTHERS_OFFSET + (gcMemGraph.y + gcMemGraph.axisHeight) + 22), graphsWidth, graphsHeight,
color);
taskMemGraph.minValue = 0;
addChild(taskMemGraph);
}
}

function createSimpleElements():Void
{
infoDisplay = new TextField();
infoDisplay.x = OTHERS_OFFSET;
infoDisplay.y = OTHERS_OFFSET;
infoDisplay.width = 500;
infoDisplay.selectable = false;
infoDisplay.mouseEnabled = false;
infoDisplay.defaultTextFormat = new TextFormat('Monsterrat', 12, color, JUSTIFY);
infoDisplay.antiAliasType = NORMAL;
infoDisplay.multiline = true;
addChild(infoDisplay);
}

override function __enterFrame(deltaTime:Float):Void
{

times.push(currentTime);

{
times.shift();
}

{
deltaTimeout += deltaTime;
}

fps = times.length;


{
gcMem = MemoryUtil.getGCMemory();

}

{
taskMem = MemoryUtil.getTaskMemory();

}

{
updateAdvancedDisplay();
}
else
{
updateSimpleDisplay();
}

deltaTimeout = 0.0;
}

function updateAdvancedDisplay():Void
{
updateFPSGraph();
updateGcMemGraph();
updateTaskMemGraph();

info.push('FPS: $fps');
info.push('AVG FPS: ${Math.floor(fpsGraph.average())}');
info.push('1% LOW FPS: ${Math.floor(fpsGraph.lowest())}');
fpsGraph.textDisplay.text = info.join('\n');

{
gcMemGraph.textDisplay.text = 'GC MEM: ${FlxStringUtil.formatBytes(gcMem).toLowerCase()} / ${FlxStringUtil.formatBytes(gcMemPeak).toLowerCase()}';
}

{
taskMemGraph.textDisplay.text = 'TASK MEM: ${FlxStringUtil.formatBytes(taskMem).toLowerCase()} / ${FlxStringUtil.formatBytes(taskMemPeak).toLowerCase()}';
}
}

function updateSimpleDisplay():Void
{
{

info.push('FPS: $fps');

{
info.push('GC MEM: ${FlxStringUtil.formatBytes(gcMem).toLowerCase()} / ${FlxStringUtil.formatBytes(gcMemPeak).toLowerCase()}');
}

{
info.push('TASK MEM: ${FlxStringUtil.formatBytes(taskMem).toLowerCase()} / ${FlxStringUtil.formatBytes(taskMemPeak).toLowerCase()}');
}

infoDisplay.text = info.join('\n');
}
}

function updateFPSGraph():Void
{
fpsGraph.maxValue = fpsPeak;
fpsGraph.update(fps);
}

function updateGcMemGraph():Void
{
{
gcMemGraph.maxValue = gcMemPeak;
gcMemGraph.update(gcMem);
}
}

function updateTaskMemGraph():Void
{
{
taskMemGraph.maxValue = taskMemPeak;
taskMemGraph.update(taskMem);
}
}

function set_isAdvanced(value:Bool):Bool
{
buildDebugDisplay(value);

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
