package funkin.ui.debug.charting.commands;


/**
* Command that mirrors a given array of notes on either or strumline individually,
* along either the X (note direction) axis or Y (note time) axis.
* Flip middle will only work when the given notes are in both strumlines - it's incompatible with individually mirroring the selection.
*/
class MirrorNotesCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, mirrorIndividually:Bool = true, flipMiddle:Bool = false, mirrorX:Bool = true, mirrorY:Bool = true)
{
this.notes = notes;
this.mirrorX = mirrorX;
this.mirrorY = mirrorY;
{
for (note in notes)
{
{
playerNotes.push(note);
}
else if (note.data >= ChartEditorState.STRUMLINE_SIZE)
{
opponentNotes.push(note);
}
}
{
this.mirroredNotes = mirroredNotes.concat(SongDataUtils.mirrorNotes(playerNotes, ChartEditorState.STRUMLINE_SIZE, flipMiddle, mirrorX, mirrorY));
}
{
this.mirroredNotes = mirroredNotes.concat(SongDataUtils.mirrorNotes(opponentNotes, ChartEditorState.STRUMLINE_SIZE, flipMiddle, mirrorX, mirrorY));
}
}
else
this.mirroredNotes = SongDataUtils.mirrorNotes(notes, ChartEditorState.STRUMLINE_SIZE, flipMiddle, mirrorX, mirrorY);
}

public function execute(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);

state.currentSongChartNoteData = state.currentSongChartNoteData.concat(mirroredNotes);

state.currentNoteSelection = mirroredNotes;
state.currentEventSelection = [];

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, mirroredNotes);
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
