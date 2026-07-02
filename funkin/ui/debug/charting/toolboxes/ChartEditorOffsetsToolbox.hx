

/**
* The toolbox which allows modifying information like Song Title, Scroll Speed, Characters/Stages, and starting BPM.
*/

class ChartEditorOffsetsToolbox extends ChartEditorBaseToolbox
{







function get_playheadAbsolutePos():Float
{
}

function set_playheadAbsolutePos(value:Float):Float
{
}


function get_playheadRelativePos():Float
{
}

function set_playheadRelativePos(value:Float):Float
{
}

/**
* The amount you need to multiply the zoom by such that, at the base zoom level, one tick is equal to `MAGIC_SCALE_BASE_TIME` seconds.
*/





public function new(chartEditorState2:ChartEditorState)
{


}

function onClose(event:UIEvent)
{
stopAudioPreview(); // Pause it instead, maybe?
}

function initialize():Void
{

offsetPlayerVolume.onChange = (_) ->
{
offsetPlayerMute.onClick = (_) ->
{
offsetPlayerSolo.onClick = (_) ->
{
offsetOpponentVolume.onChange = (_) ->
{
offsetOpponentMute.onClick = (_) ->
{
offsetOpponentSolo.onClick = (_) ->
{
offsetInstrumentalVolume.onChange = (_) ->
{
offsetInstrumentalMute.onClick = (_) ->
{
offsetInstrumentalSolo.onClick = (_) ->
{
offsetButtonZoomIn.onClick = (_) ->
{
offsetButtonZoomOut.onClick = (_) ->
{
offsetButtonPause.onClick = (_) ->
{
offsetButtonPlay.onClick = (_) ->
{
offsetButtonStop.onClick = (_) ->
{
offsetStepperPlayer.onChange = (event:UIEvent) ->
{

}
offsetStepperOpponent.onChange = (event:UIEvent) ->
{

}
offsetStepperInstrumental.onChange = (event:UIEvent) ->
{

}
waveformScrollview.onScroll = (_) ->
{
{

{
}

}
else
{
}




waveformPlayer.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
waveformOpponent.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
waveformInstrumental.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{

offsetTicksContainer.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
}

function initializeTicks():Void
{
}

/**
* Pull the audio tracks from the chart editor state and create copies of them to play in the Offsets Toolbox.
* These must be DEEP CLONES or else the editor will affect the audio preview!
*/
public function refreshAudioPreview():Void
{
{
}
else
{
}







}

public function refreshTicks():Void
{
{
}



for (index in 0...numberOfTicks)
{


}
}

function formatTime(seconds:Float):String
{


{
}
else
{

}
}

function buildTickLabel():Void
{
}

public function onStartDragPlayhead():Void
{
Screen.instance.registerEvent(MouseEvent.MOUSE_MOVE, onDragPlayhead);
Screen.instance.registerEvent(MouseEvent.MOUSE_UP, onStopDragPlayhead);

}

public function onDragPlayhead(event:MouseEvent):Void
{
}

public function onStopDragPlayhead(event:MouseEvent):Void
{
Screen.instance.unregisterEvent(MouseEvent.MOUSE_MOVE, onDragPlayhead);
Screen.instance.unregisterEvent(MouseEvent.MOUSE_UP, onStopDragPlayhead);
}

function movePlayheadToMouse():Void
{



}

public function onStartDragWaveform(waveform:Waveform):Void
{

Screen.instance.registerEvent(MouseEvent.MOUSE_MOVE, onDragWaveform);
Screen.instance.registerEvent(MouseEvent.MOUSE_UP, onStopDragWaveform);
}


public function onDragWaveform(event:MouseEvent):Void
{


{
case PLAYER:
case OPPONENT:
case INSTRUMENTAL:

switch (dragWaveform)
{
case PLAYER:
case OPPONENT:
case INSTRUMENTAL:
}


}

public function onStopDragWaveform(event:MouseEvent):Void
{
Screen.instance.unregisterEvent(MouseEvent.MOUSE_MOVE, onDragWaveform);
Screen.instance.unregisterEvent(MouseEvent.MOUSE_UP, onStopDragWaveform);

{
switch (dragWaveform)
{
case PLAYER:
case OPPONENT:
case INSTRUMENTAL:
}
}


}

public function playAudioPreview():Void
{
}

public function addOffsetsToAudioPreview():Void
{
{
}

{
}

{
}
}

public function pauseAudioPreview():Void
{
}

public function stopAudioPreview():Void
{


{
}

{
}

{
}

}

public function zoomWaveformIn():Void
{
{



}
else
{
}
}

public function zoomWaveformOut():Void
{



}

public function setTrackVolume(target:Waveform, volume:Float):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
}
case Waveform.PLAYER:
{
}
case Waveform.OPPONENT:
{
}
}
}

public function muteTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
}
case Waveform.PLAYER:
{
}
case Waveform.OPPONENT:
{
}
}
}

public function unmuteTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
}
case Waveform.PLAYER:
{
}
case Waveform.OPPONENT:
{
}
}
}

public function toggleMuteTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
}
case Waveform.PLAYER:
{
}
case Waveform.OPPONENT:
{
}
}
}

/**
* Clicking the solo button will unmute the track and mute all other tracks.
* @param target
*/
public function soloTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.PLAYER:
case Waveform.OPPONENT:
case Waveform.INSTRUMENTAL:
}
}

public override function update(elapsed:Float)
{

{





{
}
{
}
}

{
{
}
}
{
{
}
}
{
{
}
}
}

public override function refresh():Void
{





waveformPlayer.waveform.time = -chartEditorState.currentVocalOffsetPlayer / Constants.MS_PER_SEC; // Negative offsets make the song start early.



{
case PLAYER:
case OPPONENT:
case INSTRUMENTAL:
default:
}


}

public static function build(chartEditorState:ChartEditorState):ChartEditorOffsetsToolbox
{
}
}

enum Waveform
{
}
