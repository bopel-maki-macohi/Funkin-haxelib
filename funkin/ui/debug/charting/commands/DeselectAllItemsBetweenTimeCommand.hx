package funkin.ui.debug.charting.commands;


/**
* Command that deselects all selected notes and/or events above or past the time given in the chart editor.
*/
class DeselectAllItemsBetweenTimeCommand implements ChartEditorCommand
{



public function new(time:Float, above:Bool, shouldDeselectNotes:Bool, shouldDeselectEvents:Bool)
{
this.time = time;
this.above = above;

this.notes = [];
this.events = [];

this.shouldDeselectNotes = shouldDeselectNotes;
this.shouldDeselectEvents = shouldDeselectEvents;
}

public function execute(state:ChartEditorState):Void
{
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
notes.push(state.currentSongChartNoteData[i]);
else
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
else // Deselecting below the time given
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
notes.push(state.currentSongChartNoteData[state.currentSongChartNoteData.length - i - 1]);
else
break;
}
}
{
for (i in 0...state.currentSongChartEventData.length)
{
events.push(state.currentSongChartEventData[state.currentSongChartEventData.length- i - 1]);
else
break;
}
}
}

state.currentNoteSelection = SongDataUtils.subtractNotes(state.currentNoteSelection, this.notes);
state.currentEventSelection = SongDataUtils.subtractEvents(state.currentEventSelection, this.events);

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
}

public function undo(state:ChartEditorState):Void
{
for (note in this.notes)
{
state.currentNoteSelection.push(note);
}

for (event in this.events)
{
state.currentEventSelection.push(event);
}

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{

{
}
else if (eventsOnly)
{
}

}
}
