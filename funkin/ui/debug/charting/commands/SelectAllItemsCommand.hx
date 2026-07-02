

/**
* Command to set the selection to all notes and events in the chart editor.
*/
class SelectAllItemsCommand implements ChartEditorCommand
{


public function new(shouldSelectNotes:Bool, shouldSelectEvents:Bool)
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
{
}
else if (shouldSelectEvents && !shouldSelectNotes)
{
}
else if (shouldSelectNotes && shouldSelectEvents)
{
}
else
{
}
}
}
