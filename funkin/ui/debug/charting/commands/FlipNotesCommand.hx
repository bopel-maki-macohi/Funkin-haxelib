

/**
* Command that flips a given array of notes from the player's side of the chart editor to the opponent's side, or vice versa.
*/
class FlipNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>)
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
