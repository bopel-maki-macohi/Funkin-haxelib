package funkin.ui.debug.charting.commands;


/**
* Deletes the given notes from the current chart in the chart editor.
* Use only when ONLY notes are being deleted.
*/
class RemoveNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>)
{
this.notes = notes;
}

public function execute(state:ChartEditorState):Void
{

state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);
state.currentNoteSelection = [];
state.currentEventSelection = [];

state.playSound(Paths.sound('chartingSounds/noteErase'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;

state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{

for (note in notes)
{
state.currentSongChartNoteData.push(note);
}
state.currentNoteSelection = notes;
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
