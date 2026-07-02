

/**
* Command that sets the start time or end time of the Freeplay preview.
*/
class SetFreeplayPreviewCommand implements ChartEditorCommand
{

public function new(newStartTime:Null<Float>, newEndTime:Null<Float>)
{
}

public function execute(state:ChartEditorState):Void
{

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
}
else if (setEnd && !setStart)
{
}
else
{
}
}
}
