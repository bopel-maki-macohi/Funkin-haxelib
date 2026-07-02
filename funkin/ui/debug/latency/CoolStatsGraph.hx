package funkin.ui.debug.latency;


/**
* This is a helper function for the stats window to draw a graph with given values.
* SHAMELESSLY STOLEN FROM FLIXEL
* https://github.com/HaxeFlixel/flixel/blob/master/flixel/system/debug/stats/StatsGraph.hx
*/
class CoolStatsGraph extends Sprite
{
static inline var AXIS_COLOR:FlxColor = 0xffffff;
static inline var AXIS_ALPHA:Float = 0.5;
static inline var HISTORY_MAX:Int = 500;

/**
* How often to update the stats, in ms. The lower, the more performance-intense!
*/
static inline var UPDATE_DELAY:Int = 250;

/**
* The initial width of the stats window.
*/
static inline var INITIAL_WIDTH:Int = 160;

static inline var FPS_COLOR:FlxColor = 0xff96ff00;
static inline var MEMORY_COLOR:FlxColor = 0xff009cff;
static inline var DRAW_TIME_COLOR:FlxColor = 0xffA60004;
static inline var UPDATE_TIME_COLOR:FlxColor = 0xffdcd400;

public static inline var LABEL_COLOR:FlxColor = 0xaaffffff;
public static inline var TEXT_SIZE:Int = 11;
public static inline var DECIMALS:Int = 1;






public function new(X:Int, Y:Int, Width:Int, Height:Int, GraphColor:FlxColor, Unit:String, LabelWidth:Int = 45, ?Label:String)
{
super();

x = X;
y = Y;
_width = Width - LabelWidth;
_height = Height;
graphColor = GraphColor;
_unit = Unit;
_labelWidth = LabelWidth;
_label = (Label == null) ? "" : Label;

_axis = new Shape();
_axis.x = _labelWidth + 10;

maxLabel = DebuggerUtil.createTextField(0, 0, LABEL_COLOR, TEXT_SIZE);
curLabel = DebuggerUtil.createTextField(0, (_height / 2) - (TEXT_SIZE / 2), graphColor, TEXT_SIZE);
minLabel = DebuggerUtil.createTextField(0, _height - TEXT_SIZE, LABEL_COLOR, TEXT_SIZE);

avgLabel = DebuggerUtil.createTextField(_labelWidth + 20, (_height / 2) - (TEXT_SIZE / 2) - 10, LABEL_COLOR, TEXT_SIZE);
avgLabel.width = _width;
avgLabel.defaultTextFormat.align = TextFormatAlign.CENTER;
avgLabel.alpha = 0.5;

addChild(_axis);
addChild(maxLabel);
addChild(curLabel);
addChild(minLabel);
addChild(avgLabel);

drawAxes();
}

/**
* Redraws the axes of the graph.
*/
function drawAxes():Void
{
gfx.clear();
gfx.lineStyle(1, AXIS_COLOR, AXIS_ALPHA);

gfx.moveTo(0, 0);
gfx.lineTo(0, _height);

gfx.moveTo(0, _height);
gfx.lineTo(_width, _height);
}

/**
* Redraws the graph based on the values stored in the history.
*/
function drawGraph():Void
{
gfx.clear();
gfx.lineStyle(1, graphColor, 1);


for (i in 0...history.length)
{

gfx.lineTo(graphX + (i * inc), pointY);
}
}

public function update(Value:Float):Void
{
history.unshift(Value);

maxValue = Math.max(maxValue, Value);
minValue = Math.min(minValue, Value);

minLabel.text = formatValue(minValue);
curLabel.text = formatValue(Value);
maxLabel.text = formatValue(maxValue);

avgLabel.text = _label + "\nAvg: " + formatValue(average());

drawGraph();
}

function formatValue(value:Float):String
{
}

public function average():Float
{
for (value in history)
sum += value;
}

public function destroy():Void
{
_axis = FlxDestroyUtil.removeChild(this, _axis);
minLabel = FlxDestroyUtil.removeChild(this, minLabel);
curLabel = FlxDestroyUtil.removeChild(this, curLabel);
maxLabel = FlxDestroyUtil.removeChild(this, maxLabel);
avgLabel = FlxDestroyUtil.removeChild(this, avgLabel);
history = null;
}
}
