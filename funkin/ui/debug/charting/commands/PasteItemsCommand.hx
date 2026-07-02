

/**
* A command which inserts the contents of the clipboard into the chart editor.
*/
class PasteItemsCommand implements ChartEditorCommand
{

{
valid: false,
notes: [],
events: []

public function new(targetTimestamp:Float)
{
}

public function execute(state:ChartEditorState):Void
{
{
}







{
}
else if (removedNotes.length > 1)
{
}
else if (isRedo)
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

else
}
}
