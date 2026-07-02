package funkin.ui.debug.charting.commands;


/**
* Command to set the current selection in the chart editor (rather than appending it).
* Deselects any notes that are not in the new selection.
*/
class SetItemSelectionCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
this.notes = notes;
this.events = events;
}

public function execute(state:ChartEditorState):Void
{
this.previousNoteSelection = state.currentNoteSelection;
this.previousEventSelection = state.currentEventSelection;

state.currentNoteSelection = notes;
state.currentEventSelection = events;

{

{
}
else
{
state.eventKindToPlace = eventSelected.eventKind;
}

{
}
else
{
defaultKey = eventSchema.getFirstField()?.name;
}


{
state.eventDataToPlace = eventDataClone;
}

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT);
}

{

state.noteKindToPlace = noteSelected.kind;

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT);
}

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
