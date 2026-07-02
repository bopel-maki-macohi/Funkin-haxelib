

/**
* Appends one or more items to the selection in the chart editor.
* This does not deselect any items that are already selected, if any.
*/
class SelectItemsCommand implements ChartEditorCommand
{

public function new(?notes:Array<SongNoteData>, ?events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{
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
