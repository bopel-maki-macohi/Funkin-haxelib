package funkin.ui.debug.charting.commands;


/**
* Command to deselect a specific set of notes and events in the chart editor.
*/
class DeselectItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
this.notes = notes;
this.events = events;
}

public function execute(state:ChartEditorState):Void
{
state.currentNoteSelection = SongDataUtils.subtractNotes(state.currentNoteSelection, this.notes);
state.currentEventSelection = SongDataUtils.subtractEvents(state.currentEventSelection, this.events);

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;
}

public function undo(state:ChartEditorState):Void
{
for (note in this.notes)
{
state.currentNoteSelection.push(note);
}

for (event in this.events)
{
state.currentEventSelection.push(event);
}

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;
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
