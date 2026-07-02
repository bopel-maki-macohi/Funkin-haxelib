

/**
* Command to set the current selection in the chart editor (rather than appending it).
* Deselects any notes that are not in the new selection.
*/
class SetItemSelectionCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{


{

{
}
else
{
}

{
}
else
{
}


{
}

}

{


}

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
