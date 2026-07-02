package funkin.ui.debug.charting.contextmenus;


class ChartEditorBaseContextMenu extends Menu
{

public function new(chartEditorState:ChartEditorState, xPos:Float = 0, yPos:Float = 0)
{
super();

this.chartEditorState = chartEditorState;

this.left = xPos;
this.top = yPos;
}
}
