

/**
* Adds the given notes to the current chart in the chart editor.
*/
class AddNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, appendToSelection:Bool = false)
{
}

public function execute(state:ChartEditorState):Void
{
for (note in notes)
{
}

{
}
else
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
{
}

}
}
