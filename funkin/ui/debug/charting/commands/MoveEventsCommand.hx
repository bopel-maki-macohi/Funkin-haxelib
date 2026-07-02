package funkin.ui.debug.charting.commands;


/**
* Move the given events by the given offset and shift them by the given number of columns in the chart editor.
*/
class MoveEventsCommand implements ChartEditorCommand
{

public function new(events:Array<SongEventData>, offset:Float, setPos:Bool = false, offsetInSteps:Bool = false)
{
this.events = [for (event in events) event.clone()];
else
this.offset = offset;
this.setPos = setPos;
this.movedEvents = [];
}

public function execute(state:ChartEditorState):Void
{
state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, events);

movedEvents = [];

for (event in events)
{
else
resultEvent.time = (resultEvent.time + offset).clamp(0, Conductor.instance.getStepTimeInMs(state.songLengthInSteps - (1 * state.noteSnapRatio)));

movedEvents.push(resultEvent);
}

state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, events);
state.currentSongChartEventData = state.currentSongChartEventData.concat(movedEvents);
state.currentEventSelection = movedEvents;

state.playSound(Paths.sound('chartingSounds/noteLay'));

state.saveDataDirty = true;
state.noteDisplayDirty = true;
state.notePreviewDirty = true;

state.sortChartData();
}

public function undo(state:ChartEditorState):Void
{
state.currentSongChartEventData = SongDataUtils.subtractEvents(state.currentSongChartEventData, movedEvents);
state.currentSongChartEventData = state.currentSongChartEventData.concat(events);

state.currentEventSelection = events;

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
