

/**
* Move the given events by the given offset and shift them by the given number of columns in the chart editor.
*/
class MoveEventsCommand implements ChartEditorCommand
{

public function new(events:Array<SongEventData>, offset:Float, setPos:Bool = false, offsetInSteps:Bool = false)
{
else
}

public function execute(state:ChartEditorState):Void
{


for (event in events)
{
else
resultEvent.time = (resultEvent.time + offset).clamp(0, Conductor.instance.getStepTimeInMs(state.songLengthInSteps - (1 * state.noteSnapRatio)));

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
}
}
