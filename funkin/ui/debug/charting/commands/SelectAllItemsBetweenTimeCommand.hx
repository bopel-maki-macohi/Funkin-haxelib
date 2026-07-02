package funkin.ui.debug.charting.commands;


/**
* Command that selects all notes and/or events above or past the time given in the chart editor.
*/
class SelectAllItemsBetweenTimeCommand implements ChartEditorCommand
{



public function new(time:Float, above:Bool, shouldSelectNotes:Bool, shouldSelectEvents:Bool)
{
this.time = time;
this.above = above;

this.notes = [];
this.events = [];

this.shouldSelectNotes = shouldSelectNotes;
this.shouldSelectEvents = shouldSelectEvents;
}

public function execute(state:ChartEditorState):Void
{
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
notes.push(state.currentSongChartNoteData[i]);
else
//We've reached the end of the notes above this time,
break;
}
}
{
for (i in 0...state.currentSongChartEventData.length)
{
events.push(state.currentSongChartEventData[i]);

else
break;
}
}
}
else // Selecting below the time given
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
notes.push(state.currentSongChartNoteData[state.currentSongChartNoteData.length - i- 1]);
else
break;
}
}
{
for (i in 0...state.currentSongChartEventData.length)
{
events.push(state.currentSongChartEventData[state.currentSongChartEventData.length- i- 1]);
else
break;
}
}
}

for (note in this.notes)
{
state.currentNoteSelection.push(note);
}

for (event in this.events)
{
state.currentEventSelection.push(event);
}


{

state.eventKindToPlace = eventSelected.eventKind;

{
}
else
{
defaultKey = eventSchema.getFirstField()?.name;
}

state.eventDataToPlace = eventData;

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT);
}

{

state.noteKindToPlace = noteSelected.kind;

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT);
}

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
}

public function undo(state:ChartEditorState):Void
{
state.currentNoteSelection = SongDataUtils.subtractNotes(state.currentNoteSelection, this.notes);
state.currentEventSelection = SongDataUtils.subtractEvents(state.currentEventSelection, this.events);

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{

{
{
}
else
{
}
}
else if (events.length == 0)
{
{
}
else
{
}
}

}
}
