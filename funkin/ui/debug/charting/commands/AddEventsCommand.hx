

/**
* Adds the given events to the current chart in the chart editor.
*/
class AddEventsCommand implements ChartEditorCommand
{

public function new(events:Array<SongEventData>, appendToSelection:Bool = false)
{
}

public function execute(state:ChartEditorState):Void
{
for (event in events)
{
}

{
}
else
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
}
}
