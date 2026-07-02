package funkin.ui.debug.stats;


class FunkinStatsGraph extends Sprite
{
static inline var AXIS_COLOR:FlxColor = 0xffffff;
static inline var AXIS_ALPHA:Float = 0.5;
static inline var HISTORY_MAX:Int = 100;









public function new(x:Int, y:Int, width:Int, height:Int, graphColor:FlxColor):Void
{
super();

this.x = x;
this.y = y;
this.graphColor = graphColor;
this.axisWidth = width;
this.axisHeight = height;

textDisplay = new TextField();
textDisplay.width = 500;
textDisplay.y -= 22;
textDisplay.selectable = false;
textDisplay.mouseEnabled = false;
textDisplay.defaultTextFormat = new TextFormat('Monsterrat', 12, graphColor, JUSTIFY);
textDisplay.antiAliasType = NORMAL;
textDisplay.sharpness = 100;
textDisplay.multiline = true;
addChild(textDisplay);

axis = new Shape();
axis.x += 4;
addChild(axis);

drawAxes();
}

function drawAxes():Void
{
axis.graphics.clear();

axis.graphics.lineStyle(1, AXIS_COLOR, AXIS_ALPHA, false, null, null, MITER, 255);

axis.graphics.moveTo(0, 0);

axis.graphics.lineTo(0, axisHeight);

axis.graphics.moveTo(0, axisHeight);

axis.graphics.lineTo(axisWidth, axisHeight);
}

function drawGraph():Void
{
graphics.clear();

graphics.lineStyle(1, graphColor, 1, false, null, null, MITER, 255);

{
}


for (i in 0...history.length)
{


graphics.lineTo(axis.x + 1 + (i * inc), pointY);
}
}

public function update(value:Float):Void
{
history.push(value);

{
history.shift();
}

maxValue = Math.max(maxValue, value);
minValue = Math.min(minValue, value);

drawGraph();
}

public function average():Float
{
{
}


for (v in history)
{
sum += v;
}

}

public function lowest():Float
{
{
}


for (v in history)
{
{
val = v;
}
}

}

public function destroy():Void
{
{
removeChild(axis);
axis = null;
}

history = null;
}
}
