package funkin.ui.debug.charting.commands;


/**
* A command which inserts the contents of the clipboard into the chart editor.
*/
class PasteItemsCommand implements ChartEditorCommand
{

{
valid: false,
notes: [],
events: []
};

public function new(targetTimestamp:Float)
{
this.targetTimestamp = targetTimestamp;
this.currentClipboard = SongDataUtils.readItemsFromClipboard();
}

public function execute(state:ChartEditorState):Void
{
{
state.error('Failed to Paste', 'Could not parse clipboard contents.');
state.clipboardDirty = true;
state.clipboardValid = false;
}


addedNotes = SongDataUtils.offsetSongNoteData(currentClipboard.notes, Std.int(targetTimestamp));
addedNotes = SongDataUtils.clampSongNoteData(addedNotes, 0.0, msCutoff);
addedEvents = SongDataUtils.offsetSongEventData(currentClipboard.events, Std.int(targetTimestamp));
addedEvents = SongDataUtils.clampSongEventData(addedEvents, 0.0, msCutoff);

removedNotes.clear();

state.currentSongChartNoteData = mergedNotes;
state.currentSongChartEventData = state.currentSongChartEventData.concat(addedEvents);
state.currentNoteSelection = addedNotes.copy();
state.currentEventSelection = addedEvents.copy();

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;

state.sortChartData();

{
'But 1 overlapped note was overwritten.';
}
else if (removedNotes.length > 1)
{
'But ${removedNotes.length} overlapped notes were overwritten.';
}
else if (isRedo)
{
'Successfully placed pasted note(s) back.';
}
else 'Successfully pasted clipboard contents.';

Reflect.callMethod(null, Reflect.field(ChartEditorNotificationHandler, msgType), [state, title, msg]);

isRedo = false;
}

public function undo(state:ChartEditorState):Void
{
state.playSound(Paths.sound('chartingSounds/undo'));

state.currentSongChartNoteData = SongDataUtils.subtractNotes(state.currentSongChartNoteData, addedNotes).concat(removedNotes);
state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, addedEvents);
state.currentEventSelection = [];
state.performCommand(new SelectItemsCommand(removedNotes.copy()), false);

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.editButtonsDirty = true;

state.sortChartData();

isRedo = true;
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{

else if (currentClipboard.events.length == 0) return 'Paste $len Notes';
else
}
}
