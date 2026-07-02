package funkin.ui.debug.charting.commands;


/**
* Move the given notes by the given offset and shift them by the given number of columns in the chart editor.
*/
class MoveNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, offset:Float, columns:Int, setPos:Bool = false, offsetInSteps:Bool = false)
{
this.notes = [for (note in notes) note.clone()];
else
this.offset = offset;
this.columns = columns;
this.setPos = setPos;
this.movedNotes = [];
}

public function execute(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);

movedNotes = [];

for (note in notes)
{
else
resultNote.time = (resultNote.time + offset).clamp(0, Conductor.instance.getStepTimeInMs(state.songLengthInSteps - (1 * state.noteSnapRatio)));
resultNote.data = ChartEditorState.gridColumnToNoteData((ChartEditorState.noteDataToGridColumn(resultNote.data) + columns).clamp(0,
ChartEditorState.STRUMLINE_SIZE * 2 - 1));

movedNotes.push(resultNote);
}

state.currentSongChartNoteData = state.currentSongChartNoteData.concat(movedNotes);
state.currentNoteSelection = movedNotes;

state.playSound(Paths.sound('chartingSounds/noteLay'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;

state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, movedNotes);
state.currentSongChartNoteData = state.currentSongChartNoteData.concat(notes);

state.currentNoteSelection = notes;

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
