package funkin.ui.debug.charting.commands;


/**
* Adds the given events to the current chart in the chart editor.
*/
class AddEventsCommand implements ChartEditorCommand
{

public function new(events:Array<SongEventData>, appendToSelection:Bool = false)
{
this.events = events;
this.appendToSelection = appendToSelection;
}

public function execute(state:ChartEditorState):Void
{
for (event in events)
{
state.currentSongChartEventData.push(event);
}

{
state.currentEventSelection = state.currentEventSelection.concat(events);
}
else
{
state.currentNoteSelection = [];
state.currentEventSelection = events;
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
state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, events);

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
}
}
