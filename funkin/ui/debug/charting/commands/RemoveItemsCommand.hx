package funkin.ui.debug.charting.commands;


/**
* Deletes the given notes and events from the current chart in the chart editor.
* Use only when BOTH notes and events are being deleted.
*/
class RemoveItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
this.notes = notes;
this.events = events;
}

public function execute(state:ChartEditorState):Void
{

state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);
state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, events);

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

for (event in events)
{
state.currentSongChartEventData.push(event);
}

state.currentNoteSelection = notes;
state.currentEventSelection = events;

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
}
}
