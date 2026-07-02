

/**
* Command that deselects all selected notes and events in the chart editor.
*/
class DeselectAllItemsCommand implements ChartEditorCommand
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
