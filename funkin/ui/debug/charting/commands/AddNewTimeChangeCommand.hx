package funkin.ui.debug.charting.commands;


/**
* A command which adds a new timechange to the current song's timechanges, after the index value given, at the given timestamp.
* Will clamp the target timestamp to a valid value.
*/
class AddNewTimeChangeCommand implements ChartEditorCommand
{



public function new(timeChangeIndex:Int, targetTimeStamp:Float)
{
this.timeChangeIndex = timeChangeIndex;
this.targetTimeStamp = thx.Floats.ceilTo(targetTimeStamp, 4);
}

public function execute(state:ChartEditorState):Void
{
previousTimeChanges = timeChanges.copy();
{
timeChanges = [new SongTimeChange(0, 100)];
}
else
{
targetTimeStamp.clamp((timeChanges[timeChangeIndex - 1]?.timeStamp ?? 0) + 1, (timeChanges[timeChangeIndex + 1]?.timeStamp ?? state.songLengthInMs) - 1);
timeChanges.insert(timeChangeIndex + 1,
new SongTimeChange(targetTimeStamp, timeChanges[timeChangeIndex].bpm, timeChanges[timeChangeIndex].timeSignatureNum,
timeChanges[timeChangeIndex].timeSignatureDen));
}

state.currentSongMetadata.timeChanges = timeChanges;

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;
state.scrollPositionInPixels = 0;


Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


state.updateSongTime(); // basically will update the time signature for the editor if necessary.
state.updateGridHeight();
state.updateTimeSignature();
}

public function undo(state:ChartEditorState):Void
{
{
previousTimeChanges = [new SongTimeChange(0, 100)];
}

state.currentSongMetadata.timeChanges = previousTimeChanges;

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;
state.scrollPositionInPixels = 0;


Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


state.updateSongTime();
state.updateGridHeight();
state.updateTimeSignature();
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
}
}
