

/**
* Deletes the given notes and events from the current chart in the chart editor.
* Use only when BOTH notes and events are being deleted.
*/
class RemoveItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{





}

public function undo(state:ChartEditorState):Void
{

for (note in notes)
{
}

for (event in events)
{
}




}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
}
}
