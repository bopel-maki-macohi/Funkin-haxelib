

/**
* Deletes the given notes from the current chart in the chart editor if any overlap another.
* Use when ONLY notes are being deleted.
*/
class RemoveStackedNotesCommand implements ChartEditorCommand
{

public function new(?notes:Array<SongNoteData>)
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

}
}
