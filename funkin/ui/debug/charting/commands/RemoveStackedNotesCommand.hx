package funkin.ui.debug.charting.commands;


/**
* Deletes the given notes from the current chart in the chart editor if any overlap another.
* Use when ONLY notes are being deleted.
*/
class RemoveStackedNotesCommand implements ChartEditorCommand
{

public function new(?notes:Array<SongNoteData>)
{
this.notes = notes;
this.overlappedNotes = [];
this.removedNotes = [];
}

public function execute(state:ChartEditorState):Void
{


overlappedNotes.clear();
removedNotes = SongNoteDataUtils.listStackedNotes(notes, ChartEditorState.stackedNoteThreshold, false, overlappedNotes);

state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, removedNotes);
state.currentNoteSelection = isSelection ? overlappedNotes.copy() : [];
state.currentEventSelection = [];

state.playSound(Paths.sound('chartingSounds/noteErase'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;

state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{

state.currentSongChartNoteData = state.currentSongChartNoteData.concat(removedNotes);
state.currentNoteSelection = overlappedNotes.concat(removedNotes).copy();
state.currentEventSelection = [];
state.playSound(Paths.sound('chartingSounds/undo'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;

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
