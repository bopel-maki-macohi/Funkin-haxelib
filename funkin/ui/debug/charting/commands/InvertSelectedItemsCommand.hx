

/**
* Command to deselect all items that are currently selected in the chart editor,
* then select all the items that were previously unselected.
*/
class InvertSelectedItemsCommand implements ChartEditorCommand
{

public function new()
{
}

public function execute(state:ChartEditorState):Void
{


}

public function undo(state:ChartEditorState):Void
{

}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
}
}
