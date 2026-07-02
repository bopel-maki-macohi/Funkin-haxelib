

/**
* Deletes the given events from the current chart in the chart editor.
* Use only when ONLY events are being deleted.
*/
class RemoveEventsCommand implements ChartEditorCommand
{

public function new(events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{




}

public function undo(state:ChartEditorState):Void
{

for (event in events)
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

}
}
