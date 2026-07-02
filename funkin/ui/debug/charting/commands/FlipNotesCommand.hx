package funkin.ui.debug.charting.commands;


/**
* Command that flips a given array of notes from the player's side of the chart editor to the opponent's side, or vice versa.
*/
class FlipNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>)
{
this.notes = notes;
this.flippedNotes = SongDataUtils.flipNotes(notes);
}

public function execute(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);

state.currentSongChartNoteData = state.currentSongChartNoteData.concat(flippedNotes);

state.currentNoteSelection = flippedNotes;
state.currentEventSelection = [];

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, flippedNotes);
state.currentSongChartNoteData = state.currentSongChartNoteData.concat(notes);

state.currentNoteSelection = notes;
state.currentEventSelection = [];

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
}
}
