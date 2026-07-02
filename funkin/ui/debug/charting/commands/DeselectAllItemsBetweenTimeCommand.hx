

/**
* Command that deselects all selected notes and/or events above or past the time given in the chart editor.
*/
class DeselectAllItemsBetweenTimeCommand implements ChartEditorCommand
{



public function new(time:Float, above:Bool, shouldDeselectNotes:Bool, shouldDeselectEvents:Bool)
{


}

public function execute(state:ChartEditorState):Void
{
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
else
}
}
{
for (i in 0...state.currentSongChartEventData.length)
{
else
}
}
}
else // Deselecting below the time given
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
else
}
}
{
for (i in 0...state.currentSongChartEventData.length)
{
else
}
}
}


}

public function undo(state:ChartEditorState):Void
{
for (note in this.notes)
{
}

for (event in this.events)
{
}

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
