

/**
* A command which modifies the give time change in the current song's time changes.
* Annoyingly, due to the way haxe works, every value of the time change has to be passed into this.
* Will clamp the target timestamp to a valid value.
*/
class ModifyTimeChangeCommand implements ChartEditorCommand
{





public function new(timeChangeIndex:Int, targetTimeStamp:Float, targetBPM:Float, targetNumerator:Int, targetDenominator:Int)
{
}

public function execute(state:ChartEditorState):Void
{
{
}
else
{
}




Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


}

public function undo(state:ChartEditorState):Void
{
{
}
else
{
}




Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
|| targetTimeStamp != previousTimeStamp
|| previousNumerator != targetNumerator
}

public function toString():String
{
}
}
