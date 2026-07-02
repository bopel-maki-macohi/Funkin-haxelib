package funkin.ui.debug.charting.commands;


/**
* A command which modifies the give time change in the current song's time changes.
* Annoyingly, due to the way haxe works, every value of the time change has to be passed into this.
* Will clamp the target timestamp to a valid value.
*/
class ModifyTimeChangeCommand implements ChartEditorCommand
{





public function new(timeChangeIndex:Int, targetTimeStamp:Float, targetBPM:Float, targetNumerator:Int, targetDenominator:Int)
{
this.timeChangeIndex = timeChangeIndex;
this.targetTimeStamp = thx.Floats.ceilTo(targetTimeStamp, 4);
this.targetBPM = thx.Floats.ceilTo(targetBPM, 3);
this.targetNumerator = targetNumerator;
this.targetDenominator = targetDenominator;
}

public function execute(state:ChartEditorState):Void
{
{
previousBPM = 100;
previousTimeStamp = 0;
timeChanges = [new SongTimeChange(previousTimeStamp, targetBPM)];
}
else
{
previousBPM = timeChanges[timeChangeIndex].bpm;
previousTimeStamp = timeChanges[timeChangeIndex].timeStamp;
previousNumerator = timeChanges[timeChangeIndex].timeSignatureNum;
previousDenominator = timeChanges[timeChangeIndex].timeSignatureDen;
timeChanges[timeChangeIndex].bpm = targetBPM;
targetTimeStamp.clamp((timeChanges[timeChangeIndex - 1]?.timeStamp ?? 0) + 1, (timeChanges[timeChangeIndex + 1]?.timeStamp ?? state.songLengthInMs) - 1);
timeChanges[timeChangeIndex].timeStamp = targetTimeStamp;
timeChanges[timeChangeIndex].timeSignatureNum = targetNumerator;
timeChanges[timeChangeIndex].timeSignatureDen = targetDenominator;
}

state.currentSongMetadata.timeChanges = timeChanges;

state.noteDisplayDirty = true;
state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;
state.scrollPositionInPixels = 0;


Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


state.updateSongTime();
state.updateGridHeight();
state.updateTimeSignature();
}

public function undo(state:ChartEditorState):Void
{
{
timeChanges = [new SongTimeChange(previousTimeStamp, targetBPM)];
}
else
{
timeChanges[timeChangeIndex].bpm = previousBPM;
timeChanges[timeChangeIndex].timeStamp = previousTimeStamp;
timeChanges[timeChangeIndex].timeSignatureNum = previousNumerator;
timeChanges[timeChangeIndex].timeSignatureDen = previousDenominator;
}

state.currentSongMetadata.timeChanges = timeChanges;

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
|| targetTimeStamp != previousTimeStamp
|| previousNumerator != targetNumerator
|| previousDenominator != targetDenominator);
}

public function toString():String
{
}
}
