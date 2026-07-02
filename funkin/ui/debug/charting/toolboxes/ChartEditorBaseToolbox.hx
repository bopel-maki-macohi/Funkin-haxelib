package funkin.ui.debug.charting.toolboxes;


/**
* The base class for the Toolboxes (manipulatable, arrangeable control windows) in the Chart Editor.
*/
class ChartEditorBaseToolbox extends CollapsibleDialog
{

private function new(chartEditorState:ChartEditorState)
{
super();

this.chartEditorState = chartEditorState;
}

/**
* Override to implement this.
*/
public function refresh()
{
}
}
