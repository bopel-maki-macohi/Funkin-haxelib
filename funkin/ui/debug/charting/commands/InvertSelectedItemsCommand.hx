package funkin.ui.debug.charting.commands;


/**
* Command to deselect all items that are currently selected in the chart editor,
* then select all the items that were previously unselected.
*/
class InvertSelectedItemsCommand implements ChartEditorCommand
{

public function new()
{
}

public function execute(state:ChartEditorState):Void
{
this.previousNoteSelection = state.currentNoteSelection;
this.previousEventSelection = state.currentEventSelection;

state.currentNoteSelection = SongDataUtils.subtractNotes(state.currentSongChartNoteData, previousNoteSelection);
state.currentEventSelection = SongDataUtils.subtractEvents(state.currentSongChartEventData, previousEventSelection);

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
}
}
