

/**
* This is a helper function for the stats window to draw a graph with given values.
* SHAMELESSLY STOLEN FROM FLIXEL
* https://github.com/HaxeFlixel/flixel/blob/master/flixel/system/debug/stats/StatsGraph.hx
*/
class CoolStatsGraph extends Sprite
{

/**
* How often to update the stats, in ms. The lower, the more performance-intense!
*/

/**
* The initial width of the stats window.
*/








public function new(X:Int, Y:Int, Width:Int, Height:Int, GraphColor:FlxColor, Unit:String, LabelWidth:Int = 45, ?Label:String)
{






}

/**
* Redraws the axes of the graph.
*/
function drawAxes():Void
{


}

/**
* Redraws the graph based on the values stored in the history.
*/
function drawGraph():Void
{


for (i in 0...history.length)
{

}
}

public function update(Value:Float):Void
{




}

function formatValue(value:Float):String
{
}

public function average():Float
{
for (value in history)
}

public function destroy():Void
{
}
}
