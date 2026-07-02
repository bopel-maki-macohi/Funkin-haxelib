package funkin.ui.debug.charting.commands;


/**
* Command to set the selection to all notes and events in the chart editor.
*/
class SelectAllItemsCommand implements ChartEditorCommand
{


public function new(shouldSelectNotes:Bool, shouldSelectEvents:Bool)
{
this.shouldSelectNotes = shouldSelectNotes;
this.shouldSelectEvents = shouldSelectEvents;
}

public function execute(state:ChartEditorState):Void
{
this.previousNoteSelection = state.currentNoteSelection;
this.previousEventSelection = state.currentEventSelection;

state.currentNoteSelection = shouldSelectNotes ? state.currentSongChartNoteData : [];
state.currentEventSelection = shouldSelectEvents ? state.currentSongChartEventData : [];

state.noteDisplayDirty = true;
state.editButtonsDirty = true;
}

public function undo(state:ChartEditorState):Void
{
state.currentNoteSelection = previousNoteSelection;
state.currentEventSelection = previousEventSelection;

state.noteDisplayDirty = true;
state.editButtonsDirty = true;
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
