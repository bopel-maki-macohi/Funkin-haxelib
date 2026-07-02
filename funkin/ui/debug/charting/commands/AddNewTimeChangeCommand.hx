

/**
* A command which adds a new timechange to the current song's timechanges, after the index value given, at the given timestamp.
* Will clamp the target timestamp to a valid value.
*/
class AddNewTimeChangeCommand implements ChartEditorCommand
{



public function new(timeChangeIndex:Int, targetTimeStamp:Float)
{
}

public function execute(state:ChartEditorState):Void
{
{
}
else
{
timeChanges.insert(timeChangeIndex + 1,
new SongTimeChange(targetTimeStamp, timeChanges[timeChangeIndex].bpm, timeChanges[timeChangeIndex].timeSignatureNum,
}




Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


state.updateSongTime(); // basically will update the time signature for the editor if necessary.
}

public function undo(state:ChartEditorState):Void
{
{
}




Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
}
}
