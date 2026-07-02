package funkin.ui.debug.charting.commands;


/**
* A command which removes the given timechange from the current song's timechanges.
*/
class RemoveTimeChangeCommand implements ChartEditorCommand
{



public function new(timeChangeIndex:Int)
{
this.timeChangeIndex = timeChangeIndex;
}

public function execute(state:ChartEditorState):Void
{
previousTimeChanges = timeChanges.copy();
{
timeChanges = [new SongTimeChange(0, 100)];
}
else
{
removedTimeChange = timeChanges.splice(timeChangeIndex, 1);
}

state.currentSongMetadata.timeChanges = timeChanges;

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;


Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


state.updateSongTime();
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
'TimeChange ${timeChangeIndex} : ${removedTimeChange[0].timeStamp} ms : BPM: ${removedTimeChange[0].bpm} in ${removedTimeChange[0].timeSignatureNum}/${removedTimeChange[0].timeSignatureDen} removed'
else
}
}
