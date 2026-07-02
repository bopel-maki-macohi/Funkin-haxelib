

/**
* A command which removes the given timechange from the current song's timechanges.
*/
class RemoveTimeChangeCommand implements ChartEditorCommand
{



public function new(timeChangeIndex:Int)
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




Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
'TimeChange ${timeChangeIndex} : ${removedTimeChange[0].timeStamp} ms : BPM: ${removedTimeChange[0].bpm} in ${removedTimeChange[0].timeSignatureNum}/${removedTimeChange[0].timeSignatureDen} removed'
else
}
}
