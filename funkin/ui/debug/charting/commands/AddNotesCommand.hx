package funkin.ui.debug.charting.commands;


/**
* Adds the given notes to the current chart in the chart editor.
*/
class AddNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, appendToSelection:Bool = false)
{
this.notes = notes;
this.appendToSelection = appendToSelection;
}

public function execute(state:ChartEditorState):Void
{
for (note in notes)
{
state.currentSongChartNoteData.push(note);
}

{
state.currentNoteSelection = state.currentNoteSelection.concat(notes);
}
else
{
state.currentNoteSelection = notes;
state.currentEventSelection = [];
}

state.playSound(Paths.sound('chartingSounds/noteLay'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;

state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);
state.currentNoteSelection = [];
state.currentEventSelection = [];
state.playSound(Paths.sound('chartingSounds/undo'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;

state.sortChartData();
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
