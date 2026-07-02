

/**
* A sprite that can be used to display a square over a selected note or event in the chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorSelectionSquareSprite extends FlxSliceSprite
{

public function new(chartEditorState:ChartEditorState)
{
super(chartEditorState.selectionSquareBitmap,
new FlxRect(ChartEditorThemeHandler.SELECTION_SQUARE_BORDER_WIDTH
+ 4, ChartEditorThemeHandler.SELECTION_SQUARE_BORDER_WIDTH
+ 4,
ChartEditorState.GRID_SIZE
- (2 * ChartEditorThemeHandler.SELECTION_SQUARE_BORDER_WIDTH + 8),
ChartEditorState.GRID_SIZE
- (2 * ChartEditorThemeHandler.SELECTION_SQUARE_BORDER_WIDTH + 8)),
}
}
