package funkin.ui.debug.charting.components;


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

super.set_y(value);

updateMeasureNumbers();

}

public function new(chartEditorState:ChartEditorState)
{
super();

this.chartEditorState = chartEditorState;

add(measureTicksSprite);
add(measureNumbers);
add(measureDividers);

buildMeasureTicksSprite();
updateMeasureNumbers(true);
}

/**
* Set the overall height of the measure ticks.
* @param height The desired height in pixels.
*/
public function setHeight(height:Float):Void
{
measureTicksSprite.height = height;
}

public function updateTheme():Void
{
buildMeasureTicksSprite();
updateMeasureNumbers(true);
}

function buildMeasureTicksSprite():Void
{
{
case Light: ChartEditorThemeHandler.MEASTURE_TICKS_BACKING_COLOR_LIGHT;
case Dark: ChartEditorThemeHandler.MEASTURE_TICKS_BACKING_COLOR_DARK;
default: ChartEditorThemeHandler.MEASTURE_TICKS_BACKING_COLOR_LIGHT;
};
{
case Light: ChartEditorThemeHandler.GRID_MEASURE_DIVIDER_COLOR_LIGHT;
case Dark: ChartEditorThemeHandler.GRID_MEASURE_DIVIDER_COLOR_DARK;
default: ChartEditorThemeHandler.GRID_MEASURE_DIVIDER_COLOR_LIGHT;
};



measureTickBitmap.fillRect(new Rectangle(0, 0, ChartEditorState.GRID_SIZE, ChartEditorThemeHandler.MEASURE_TICKS_MEASURE_WIDTH / 2), dividerColor);
measureTickBitmap.fillRect(new Rectangle(0, bottomTickY, ChartEditorState.GRID_SIZE, ChartEditorThemeHandler.MEASURE_TICKS_MEASURE_WIDTH / 2),
dividerColor);

for (i in 1...stepsPerMeasure)
{
{
measureTickBitmap.fillRect(new Rectangle(0, beatTickY, beatTickLength, ChartEditorThemeHandler.MEASURE_TICKS_BEAT_WIDTH), dividerColor);
}
else
{
measureTickBitmap.fillRect(new Rectangle(0, stepTickY, stepTickLength, ChartEditorThemeHandler.MEASURE_TICKS_STEP_WIDTH), dividerColor);
}
}

measureTicksSprite.loadGraphic(measureTickBitmap);

measureNumbers.forEach(function(measureNumber:FlxText)
{
measureNumber.destroy();
});
measureNumbers.clear();
measureDividers.forEach(function(measureDivider:FlxSprite)
{
measureDivider.destroy();
});
measureDividers.clear();
}


function updateMeasureNumbers(force:Bool = false):Void
{

else
previousMeasure = currentMeasure;

measureNumbers.forEachAlive(function(measureNumber:FlxText)
{
measureNumber.kill();
});
measureDividers.forEachAlive(function(measureDivider:FlxSprite)
{
measureDivider.kill();
});


for (i in 0...ARBITRARY_LIMIT)
{







{
break;
}


{

measureNumber.text = '${targetMeasure + 1}';
measureNumber.y = relativeMeasureTimeInPixels + OFFSET;
measureNumber.x = this.x;
}

{
measureDivider.y = relativeMeasureTimeInPixels - (ChartEditorThemeHandler.MEASURE_TICKS_MEASURE_WIDTH / 2);
measureDivider.x = this.x + (measureTicksSprite.width);
}
}
}

function makeMeasureNumber():FlxText
{
measureNumber.setFormat(Paths.font('vcr.ttf'), 20, FlxColor.WHITE);
measureNumber.borderStyle = FlxTextBorderStyle.OUTLINE;
measureNumber.borderColor = FlxColor.BLACK;
}

function makeMeasureDivider():FlxSprite
{
{
case Light: ChartEditorThemeHandler.GRID_MEASURE_DIVIDER_COLOR_LIGHT;
case Dark: ChartEditorThemeHandler.GRID_MEASURE_DIVIDER_COLOR_DARK;
default: ChartEditorThemeHandler.GRID_MEASURE_DIVIDER_COLOR_LIGHT;
};

ChartEditorThemeHandler.MEASURE_TICKS_MEASURE_WIDTH, dividerColor);
}
}
