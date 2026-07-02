package funkin.ui.debug.charting.handlers;


/**
* Static functions which handle building themed UI elements for a provided ChartEditorState.
*/
class ChartEditorThemeHandler
{

public static final GRID_COLOR_1_LIGHT:FlxColor = 0xFFE7E6E6;
public static final GRID_COLOR_1_DARK:FlxColor = 0xFF181919;

public static final GRID_COLOR_2_LIGHT:FlxColor = 0xFFF8F8F8;
public static final GRID_COLOR_2_DARK:FlxColor = 0xFF202020;

public static final GRID_COLOR_3_LIGHT:FlxColor = 0xFFD9D5D5;
public static final GRID_COLOR_3_DARK:FlxColor = 0xFF262A2A;

public static final GRID_STRUMLINE_DIVIDER_COLOR_LIGHT:FlxColor = 0xFF111111;
public static final GRID_STRUMLINE_DIVIDER_COLOR_DARK:FlxColor = 0xFFC4C4C4;

public static final GRID_MEASURE_DIVIDER_COLOR_LIGHT:FlxColor = 0xFF111111;
public static final GRID_MEASURE_DIVIDER_COLOR_DARK:FlxColor = 0xFFC4C4C4;

public static final MEASTURE_TICKS_BACKING_COLOR_LIGHT:FlxColor = 0xFFC1C1C1;
public static final MEASTURE_TICKS_BACKING_COLOR_DARK:FlxColor = 0xFF484848;


/**
* The width of the opaque border around the square highlighting selected notes.
*/
public static final SELECTION_SQUARE_BORDER_WIDTH:Int = 1;



public static final MEASURE_TICKS_MEASURE_WIDTH:Int = 6;
public static final MEASURE_TICKS_BEAT_WIDTH:Int = 4;
public static final MEASURE_TICKS_STEP_WIDTH:Int = 2;



public static final TOTAL_COLUMN_COUNT:Int = ChartEditorState.STRUMLINE_SIZE * 2 + 1;

/**
* When the theme is changed, this function updates all of the UI elements to match the new theme.
* @param state The ChartEditorState to update.
*/
public static function updateTheme(state:ChartEditorState):Void
{
updateBackground(state);
updateGridBitmap(state);
updateOffsetTicks(state);
updateSelectionSquare(state);
updateNotePreview(state);
updateMeasureTicks(state);
}

/**
* Updates the tint of the background sprite to match the current theme.
* @param state The ChartEditorState to update.
*/
static function updateBackground(state:ChartEditorState):Void
{
state.menuBG.color = switch (state.currentTheme)
{
case ChartEditorTheme.Light: BACKGROUND_COLOR_LIGHT;
case ChartEditorTheme.Dark: BACKGROUND_COLOR_DARK;
default: BACKGROUND_COLOR_LIGHT;
}
}

/**
* Builds the checkerboard background image of the chart editor, and adds dividing lines to it.
* @param state The ChartEditorState to update.
*/
static function updateGridBitmap(state:ChartEditorState):Void
{
{
case Light: GRID_COLOR_1_LIGHT;
case Dark: GRID_COLOR_1_DARK;
default: GRID_COLOR_1_LIGHT;
};

{
case Light: GRID_COLOR_2_LIGHT;
case Dark: GRID_COLOR_2_DARK;
default: GRID_COLOR_2_LIGHT;
};

{
case Light: GRID_STRUMLINE_DIVIDER_COLOR_LIGHT;
case Dark: GRID_STRUMLINE_DIVIDER_COLOR_DARK;
default: GRID_STRUMLINE_DIVIDER_COLOR_LIGHT;
}


state.gridBitmap = FlxGridOverlay.createGrid(ChartEditorState.GRID_SIZE, ChartEditorState.GRID_SIZE, gridWidth, gridHeight, true, gridColor1, gridColor2);

{
case Light: GRID_COLOR_3_LIGHT;
case Dark: GRID_COLOR_3_DARK;
default: GRID_COLOR_3_LIGHT;
};

state.gridBitmap.fillRect(new Rectangle(0, -(ChartEditorState.GRID_SELECTION_BORDER_WIDTH / 2), state.gridBitmap.width,
ChartEditorState.GRID_SELECTION_BORDER_WIDTH),
selectionBorderColor);

for (i in 1...(Conductor.instance.stepsPerMeasure))
{
state.gridBitmap.fillRect(new Rectangle(0, (ChartEditorState.GRID_SIZE * i) - (ChartEditorState.GRID_SELECTION_BORDER_WIDTH / 2),
state.gridBitmap.width, ChartEditorState.GRID_SELECTION_BORDER_WIDTH),
selectionBorderColor);
}

state.gridBitmap.fillRect(new Rectangle(0, state.gridBitmap.height - (ChartEditorState.GRID_SELECTION_BORDER_WIDTH / 2), state.gridBitmap.width,
ChartEditorState.GRID_SELECTION_BORDER_WIDTH),
selectionBorderColor);

state.gridBitmap.fillRect(new Rectangle(-(ChartEditorState.GRID_SELECTION_BORDER_WIDTH / 2), 0, ChartEditorState.GRID_SELECTION_BORDER_WIDTH,
state.gridBitmap.height),
selectionBorderColor);

for (i in 1...TOTAL_COLUMN_COUNT)
{

state.gridBitmap.fillRect(new Rectangle((ChartEditorState.GRID_SIZE * i) - (ChartEditorState.GRID_SELECTION_BORDER_WIDTH / 2), 0,
ChartEditorState.GRID_SELECTION_BORDER_WIDTH, state.gridBitmap.height),
isStrumlineColumn ? dividerColor : selectionBorderColor);
}

state.gridBitmap.fillRect(new Rectangle(state.gridBitmap.width - (ChartEditorState.GRID_SELECTION_BORDER_WIDTH / 2), 0,
ChartEditorState.GRID_SELECTION_BORDER_WIDTH, state.gridBitmap.height),
selectionBorderColor);

{
state.gridTiledSprite.loadGraphic(state.gridBitmap);
}
}

/**
* Horizontal offset ticks.
*/
static function updateOffsetTicks(state:ChartEditorState):Void
{

state.offsetTickBitmap = new BitmapData(ticksWidth, ticksHeight, true);
state.offsetTickBitmap.fillRect(new Rectangle(0, 0, ticksWidth, ticksHeight), 0xFFC4C4C4);

state.offsetTickBitmap.fillRect(new Rectangle(leftTickX, 0, majorTickWidth / 2, majorTickLength), GRID_MEASURE_DIVIDER_COLOR_LIGHT);
state.offsetTickBitmap.fillRect(new Rectangle(middleTickX, 0, majorTickWidth, majorTickLength), GRID_MEASURE_DIVIDER_COLOR_LIGHT);
state.offsetTickBitmap.fillRect(new Rectangle(rightTickX, 0, majorTickWidth / 2, majorTickLength), GRID_MEASURE_DIVIDER_COLOR_LIGHT);

for (i in 1...11)
{
{
continue;
}
state.offsetTickBitmap.fillRect(new Rectangle(minorTickX, 0, minorTickWidth, minorTickLength), GRID_MEASURE_DIVIDER_COLOR_LIGHT);
}

//
//// Draw the offset ticks.
}

static function updateSelectionSquare(state:ChartEditorState):Void
{
{
case Light: SELECTION_SQUARE_BORDER_COLOR_LIGHT;
case Dark: SELECTION_SQUARE_BORDER_COLOR_DARK;
default: SELECTION_SQUARE_BORDER_COLOR_LIGHT;
};

{
case Light: SELECTION_SQUARE_FILL_COLOR_LIGHT;
case Dark: SELECTION_SQUARE_FILL_COLOR_DARK;
default: SELECTION_SQUARE_FILL_COLOR_LIGHT;
};

state.selectionSquareBitmap = new BitmapData(ChartEditorState.GRID_SIZE, ChartEditorState.GRID_SIZE, true);

state.selectionSquareBitmap.fillRect(new Rectangle(0, 0, ChartEditorState.GRID_SIZE, ChartEditorState.GRID_SIZE), selectionSquareBorderColor);
state.selectionSquareBitmap.fillRect(new Rectangle(SELECTION_SQUARE_BORDER_WIDTH, SELECTION_SQUARE_BORDER_WIDTH,
ChartEditorState.GRID_SIZE - (SELECTION_SQUARE_BORDER_WIDTH * 2), ChartEditorState.GRID_SIZE - (SELECTION_SQUARE_BORDER_WIDTH * 2)),
selectionSquareFillColor);

state.selectionBoxSprite = new FlxSliceSprite(state.selectionSquareBitmap,
new FlxRect(SELECTION_SQUARE_BORDER_WIDTH
+ 4, SELECTION_SQUARE_BORDER_WIDTH
+ 4, ChartEditorState.GRID_SIZE
- (2 * SELECTION_SQUARE_BORDER_WIDTH + 8),
ChartEditorState.GRID_SIZE
- (2 * SELECTION_SQUARE_BORDER_WIDTH + 8)),
32, 32);

state.selectionBoxSprite.scrollFactor.set(0, 0);
state.selectionBoxSprite.zIndex = 30;
state.add(state.selectionBoxSprite);

state.setSelectionBoxBounds();
}

static function updateNotePreview(state:ChartEditorState):Void
{
{
case Light: NOTE_PREVIEW_VIEWPORT_BORDER_COLOR_LIGHT;
case Dark: NOTE_PREVIEW_VIEWPORT_BORDER_COLOR_DARK;
default: NOTE_PREVIEW_VIEWPORT_BORDER_COLOR_LIGHT;
};

{
case Light: NOTE_PREVIEW_VIEWPORT_FILL_COLOR_LIGHT;
case Dark: NOTE_PREVIEW_VIEWPORT_FILL_COLOR_DARK;
default: NOTE_PREVIEW_VIEWPORT_FILL_COLOR_LIGHT;
};

state.notePreviewViewportBitmap = new BitmapData(ChartEditorState.GRID_SIZE, ChartEditorState.GRID_SIZE, true);

state.notePreviewViewportBitmap.fillRect(new Rectangle(0, 0, ChartEditorState.GRID_SIZE, ChartEditorState.GRID_SIZE), viewportBorderColor);
state.notePreviewViewportBitmap.fillRect(new Rectangle(SELECTION_SQUARE_BORDER_WIDTH, SELECTION_SQUARE_BORDER_WIDTH,
ChartEditorState.GRID_SIZE - (SELECTION_SQUARE_BORDER_WIDTH * 2), ChartEditorState.GRID_SIZE - (SELECTION_SQUARE_BORDER_WIDTH * 2)),
viewportFillColor);

{
state.notePreviewViewport.loadGraphic(state.notePreviewViewportBitmap);
}
else
{
state.notePreviewViewport = new FlxSliceSprite(state.notePreviewViewportBitmap,
new FlxRect(SELECTION_SQUARE_BORDER_WIDTH
+ 1, SELECTION_SQUARE_BORDER_WIDTH
+ 1,
ChartEditorState.GRID_SIZE
- (2 * SELECTION_SQUARE_BORDER_WIDTH + 2), ChartEditorState.GRID_SIZE
- (2 * SELECTION_SQUARE_BORDER_WIDTH + 2)),
32, 32);
}
}

static function updateMeasureTicks(state:ChartEditorState):Void
{
state.measureTicks?.updateTheme();
}

public static function buildPlayheadBlock():FlxSprite
{


playheadBlockBitmap.fillRect(new Rectangle(0, 0, ChartEditorState.PLAYHEAD_SCROLL_AREA_WIDTH, ChartEditorState.PLAYHEAD_HEIGHT * 2),
PLAYHEAD_BLOCK_BORDER_COLOR);
playheadBlockBitmap.fillRect(new Rectangle(PLAYHEAD_BLOCK_BORDER_WIDTH, PLAYHEAD_BLOCK_BORDER_WIDTH,
ChartEditorState.PLAYHEAD_SCROLL_AREA_WIDTH - (2 * PLAYHEAD_BLOCK_BORDER_WIDTH),
ChartEditorState.PLAYHEAD_HEIGHT * 2 - (2 * PLAYHEAD_BLOCK_BORDER_WIDTH)),
PLAYHEAD_BLOCK_FILL_COLOR);

}
}
