

/**
* Handles the display of the measure ticks and numbers on the left side.
*/
class ChartEditorMeasureTicks extends FlxTypedSpriteGroup<FlxSprite>
{
/**
* The owning ChartEditorState.
*/

/**
* The measure ticks underneath the numbers.
*/

/**
* The numbers that display the current measure number.
* This is a group so we can kill and recycle its members.
*/

/**
* The horizontal bars over the grid at each measure tick.
*/

/**
* The positions of each measure tick, in pixels, relative to the start of the song.
*/

/**
* A map of the
* @param value
* @return Float
*/
override function set_y(value:Float):Float
{



}

public function new(chartEditorState:ChartEditorState)
{



}

/**
* Set the overall height of the measure ticks.
* @param height The desired height in pixels.
*/
public function setHeight(height:Float):Void
{
}

public function updateTheme():Void
{
}

function buildMeasureTicksSprite():Void
{
{
{



measureTickBitmap.fillRect(new Rectangle(0, bottomTickY, ChartEditorState.GRID_SIZE, ChartEditorThemeHandler.MEASURE_TICKS_MEASURE_WIDTH / 2),

for (i in 1...stepsPerMeasure)
{
{
}
else
{
}
}


measureNumbers.forEach(function(measureNumber:FlxText)
{
measureDividers.forEach(function(measureDivider:FlxSprite)
{
}


function updateMeasureNumbers(force:Bool = false):Void
{

else

measureNumbers.forEachAlive(function(measureNumber:FlxText)
{
measureDividers.forEachAlive(function(measureDivider:FlxSprite)
{


for (i in 0...ARBITRARY_LIMIT)
{







{
}


{

}

{
}
}
}

function makeMeasureNumber():FlxText
{
}

function makeMeasureDivider():FlxSprite
{
{

}
}
