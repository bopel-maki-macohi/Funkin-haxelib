

/**
* Command to deselect a specific set of notes and events in the chart editor.
*/
class DeselectItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{

}

public function undo(state:ChartEditorState):Void
{
for (note in this.notes)
{
}

for (event in this.events)
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
else if (eventsOnly)
{
}

}
}
