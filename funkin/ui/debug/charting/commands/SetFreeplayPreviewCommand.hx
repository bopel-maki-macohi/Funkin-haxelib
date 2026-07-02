package funkin.ui.debug.charting.commands;


/**
* Command that sets the start time or end time of the Freeplay preview.
*/
class SetFreeplayPreviewCommand implements ChartEditorCommand
{

public function new(newStartTime:Null<Float>, newEndTime:Null<Float>)
{
this.newStartTime = newStartTime;
this.newEndTime = newEndTime;
}

public function execute(state:ChartEditorState):Void
{
this.previousStartTime = state.currentSongFreeplayPreviewStart;
this.previousEndTime = state.currentSongFreeplayPreviewEnd;

}

public function undo(state:ChartEditorState):Void
{
state.currentSongFreeplayPreviewStart = previousStartTime;
state.currentSongFreeplayPreviewEnd = previousEndTime;
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
