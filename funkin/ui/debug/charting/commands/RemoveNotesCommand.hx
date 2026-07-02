

/**
* Deletes the given notes from the current chart in the chart editor.
* Use only when ONLY notes are being deleted.
*/
class RemoveNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>)
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


}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
{
}

}
}
