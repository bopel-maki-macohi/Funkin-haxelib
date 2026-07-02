package funkin.ui.debug.charting.commands;


/**
* Command that deselects all selected notes and events in the chart editor.
*/
class DeselectAllItemsCommand implements ChartEditorCommand
{

public function new()
{
}

public function execute(state:ChartEditorState):Void
{
this.previousNoteSelection = state.currentNoteSelection;
this.previousEventSelection = state.currentEventSelection;

state.currentNoteSelection = [];
state.currentEventSelection = [];

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
