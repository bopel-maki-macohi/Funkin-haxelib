package funkin.ui.debug.charting.commands;


/**
* Command that copies a given set of notes and song events to the clipboard,
* and then deletes them from the chart editor.
*/
class CutItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
this.notes = notes;
this.events = events;
}

public function execute(state:ChartEditorState):Void
{
SongDataUtils.writeItemsToClipboard({
notes: SongDataUtils.buildNoteClipboard(notes),
events: SongDataUtils.buildEventClipboard(events)
});

state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, notes);
state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, events);
state.currentNoteSelection = [];
state.currentEventSelection = [];

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;
state.clipboardDirty = true;
state.clipboardValid = true;
state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.currentSongChartNoteData = state.currentSongChartNoteData.concat(notes);
state.currentSongChartEventData = state.currentSongChartEventData.concat(events);

state.currentNoteSelection = notes;
state.currentEventSelection = events;

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

else if (events.length == 0) return 'Cut $len Notes to Clipboard';
else
}
}
