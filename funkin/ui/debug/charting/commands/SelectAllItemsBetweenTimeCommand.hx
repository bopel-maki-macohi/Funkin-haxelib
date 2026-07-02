

/**
* Command that selects all notes and/or events above or past the time given in the chart editor.
*/
class SelectAllItemsBetweenTimeCommand implements ChartEditorCommand
{



public function new(time:Float, above:Bool, shouldSelectNotes:Bool, shouldSelectEvents:Bool)
{


}

public function execute(state:ChartEditorState):Void
{
{
{
for (i in 0...state.currentSongChartNoteData.length)
{
else
//We've reached the end of the notes above this time,
}
}
{
for (i in 0...state.currentSongChartEventData.length)
{

else
}
}
}
else // Selecting below the time given
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

for (note in this.notes)
{
}

for (event in this.events)
{
}


{


{
}
else
{
}


}

{


}

}

public function undo(state:ChartEditorState):Void
{

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
