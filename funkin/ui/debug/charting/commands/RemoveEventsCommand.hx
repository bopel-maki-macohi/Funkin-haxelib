package funkin.ui.debug.charting.commands;


/**
* Deletes the given events from the current chart in the chart editor.
* Use only when ONLY events are being deleted.
*/
class RemoveEventsCommand implements ChartEditorCommand
{

public function new(events:Array<SongEventData>)
{
this.events = events;
}

public function execute(state:ChartEditorState):Void
{

state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, events);
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

for (event in events)
{
state.currentSongChartEventData.push(event);
}
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
{
}

}
}
