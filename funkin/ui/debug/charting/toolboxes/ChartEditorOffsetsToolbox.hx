package funkin.ui.debug.charting.toolboxes;


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
super(chartEditorState2);

initialize();

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
stopAudioPreview(); // Pause it instead, maybe?
chartEditorState.menubarItemToggleToolboxOffsets.selected = false;
}

function initialize():Void
{
this.x = 150;
this.y = 250;

offsetPlayerVolume.onChange = (_) ->
{
setTrackVolume(PLAYER, targetVolume);
};
offsetPlayerMute.onClick = (_) ->
{
toggleMuteTrack(PLAYER);
};
offsetPlayerSolo.onClick = (_) ->
{
soloTrack(PLAYER);
};
offsetOpponentVolume.onChange = (_) ->
{
setTrackVolume(OPPONENT, targetVolume);
};
offsetOpponentMute.onClick = (_) ->
{
toggleMuteTrack(OPPONENT);
};
offsetOpponentSolo.onClick = (_) ->
{
soloTrack(OPPONENT);
};
offsetInstrumentalVolume.onChange = (_) ->
{
setTrackVolume(INSTRUMENTAL, targetVolume);
};
offsetInstrumentalMute.onClick = (_) ->
{
toggleMuteTrack(INSTRUMENTAL);
};
offsetInstrumentalSolo.onClick = (_) ->
{
soloTrack(INSTRUMENTAL);
};
offsetButtonZoomIn.onClick = (_) ->
{
zoomWaveformIn();
};
offsetButtonZoomOut.onClick = (_) ->
{
zoomWaveformOut();
};
offsetButtonPause.onClick = (_) ->
{
pauseAudioPreview();
};
offsetButtonPlay.onClick = (_) ->
{
playAudioPreview();
};
offsetButtonStop.onClick = (_) ->
{
stopAudioPreview();
};
offsetStepperPlayer.onChange = (event:UIEvent) ->
{

chartEditorState.performCommand(new SetAudioOffsetCommand(PLAYER, event.value));
refresh();
}
offsetStepperOpponent.onChange = (event:UIEvent) ->
{

chartEditorState.performCommand(new SetAudioOffsetCommand(OPPONENT, event.value));
refresh();
}
offsetStepperInstrumental.onChange = (event:UIEvent) ->
{

chartEditorState.performCommand(new SetAudioOffsetCommand(INSTRUMENTAL, event.value));
refresh();
}
waveformScrollview.onScroll = (_) ->
{
{
playheadRelativePos = playheadRelativePos.clamp(0, waveformScrollview.width - PLAYHEAD_RIGHT_PAD);

{
audioPreviewTracks.time = targetSongTimeSeconds * Constants.MS_PER_SEC;
}

addOffsetsToAudioPreview();
}
else
{
}

refresh();
};

initializeTicks();

refreshAudioPreview();
refresh();
refreshTicks();

waveformPlayer.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
onStartDragWaveform(PLAYER);
});
waveformOpponent.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
onStartDragWaveform(OPPONENT);
});
waveformInstrumental.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
onStartDragWaveform(INSTRUMENTAL);
});

offsetTicksContainer.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
onStartDragPlayhead();
});
}

function initializeTicks():Void
{
tickTiledSprite = new FlxTiledSprite(chartEditorState.offsetTickBitmap, 100, chartEditorState.offsetTickBitmap.height, true, false);
offsetTicksSprite.sprite = tickTiledSprite;
tickTiledSprite.width = 5000;
}

/**
* Pull the audio tracks from the chart editor state and create copies of them to play in the Offsets Toolbox.
* These must be DEEP CLONES or else the editor will affect the audio preview!
*/
public function refreshAudioPreview():Void
{
{
audioPreviewTracks = new SoundGroup();
chartEditorState.add(audioPreviewTracks);
}
else
{
audioPreviewTracks.stop();
audioPreviewTracks.clear();
}

audioPreviewTracks.add(instTrack);



waveformPlayer.waveform.waveformData = playerVoice?.waveformData;
waveformPlayer.waveform.duration = (playerVoice?.length ?? 1000.0) / Constants.MS_PER_SEC;

waveformOpponent.waveform.waveformData = opponentVoice?.waveformData;
waveformOpponent.waveform.duration = (opponentVoice?.length ?? 1000.0) / Constants.MS_PER_SEC;

waveformInstrumental.waveform.waveformData = chartEditorState.audioInstTrack.waveformData;
waveformInstrumental.waveform.duration = (instTrack?.length ?? 1000.0) / Constants.MS_PER_SEC;

addOffsetsToAudioPreview();
}

public function refreshTicks():Void
{
{
offsetTicksContainer.removeComponent(label);
}



for (index in 0...numberOfTicks)
{

tickLabel.text = formatTime(tickTime);
tickLabel.styleNames = "offset-ticks-label";
tickLabel.height = labelHeight;
tickLabel.top = labelYPos;
tickLabel.left = tickPos + TICK_LABEL_X_OFFSET;

offsetTicksContainer.addComponent(tickLabel);
tickLabels.push(tickLabel);
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

movePlayheadToMouse();
}

public function onDragPlayhead(event:MouseEvent):Void
{
movePlayheadToMouse();
}

public function onStopDragPlayhead(event:MouseEvent):Void
{
Screen.instance.unregisterEvent(MouseEvent.MOUSE_MOVE, onDragPlayhead);
Screen.instance.unregisterEvent(MouseEvent.MOUSE_UP, onStopDragPlayhead);
}

function movePlayheadToMouse():Void
{


playheadAbsolutePos = targetPlayheadPos;

audioPreviewTracks.time = targetSongTimeSeconds * Constants.MS_PER_SEC;
}

public function onStartDragWaveform(waveform:Waveform):Void
{
dragMousePosition = FlxG.mouse.x;
dragWaveform = waveform;

Screen.instance.registerEvent(MouseEvent.MOUSE_MOVE, onDragWaveform);
Screen.instance.registerEvent(MouseEvent.MOUSE_UP, onStopDragWaveform);
}


public function onDragWaveform(event:MouseEvent):Void
{


{
case PLAYER:
deltaPixels / waveformPlayer.waveform.waveformData.pointsPerSecond() * Constants.MS_PER_SEC;
case OPPONENT:
deltaPixels / waveformOpponent.waveform.waveformData.pointsPerSecond() * Constants.MS_PER_SEC;
case INSTRUMENTAL:
deltaPixels / waveformInstrumental.waveform.waveformData.pointsPerSecond() * Constants.MS_PER_SEC;
};

switch (dragWaveform)
{
case PLAYER:
dragOffsetMs += deltaMilliseconds;
offsetStepperPlayer.value += deltaMilliseconds;
case OPPONENT:
dragOffsetMs += deltaMilliseconds;
offsetStepperOpponent.value += deltaMilliseconds;
case INSTRUMENTAL:
dragOffsetMs += deltaMilliseconds;
offsetStepperInstrumental.value += deltaMilliseconds;
}

dragMousePosition = newDragMousePosition;

refresh();
}

public function onStopDragWaveform(event:MouseEvent):Void
{
Screen.instance.unregisterEvent(MouseEvent.MOUSE_MOVE, onDragWaveform);
Screen.instance.unregisterEvent(MouseEvent.MOUSE_UP, onStopDragWaveform);

{
switch (dragWaveform)
{
case PLAYER:
chartEditorState.performCommand(new SetAudioOffsetCommand(PLAYER, chartEditorState.currentVocalOffsetPlayer + dragOffsetMs, false));
case OPPONENT:
chartEditorState.performCommand(new SetAudioOffsetCommand(OPPONENT, chartEditorState.currentVocalOffsetOpponent + dragOffsetMs, false));
case INSTRUMENTAL:
chartEditorState.performCommand(new SetAudioOffsetCommand(INSTRUMENTAL, chartEditorState.currentInstrumentalOffset + dragOffsetMs, false));
}
}

dragOffsetMs = 0;
dragMousePosition = 0;
dragWaveform = null;

refresh();
addOffsetsToAudioPreview();
}

public function playAudioPreview():Void
{
chartEditorState.stopAudioPlayback(false);
chartEditorState.stopWelcomeMusic();
audioPreviewTracks.play(false, audioPreviewTracks.time);
}

public function addOffsetsToAudioPreview():Void
{
{
audioPreviewInstrumentalOffset = chartEditorState.currentInstrumentalOffset;
trackInst.time -= audioPreviewInstrumentalOffset;
}

{
audioPreviewPlayerOffset = chartEditorState.currentVocalOffsetPlayer;
trackPlayer.time -= audioPreviewPlayerOffset;
}

{
audioPreviewOpponentOffset = chartEditorState.currentVocalOffsetOpponent;
trackOpponent.time -= audioPreviewOpponentOffset;
}
}

public function pauseAudioPreview():Void
{
audioPreviewTracks.pause();
chartEditorState.fadeInWelcomeMusic(ChartEditorState.WELCOME_MUSIC_FADE_IN_DELAY, ChartEditorState.WELCOME_MUSIC_FADE_IN_DURATION);
}

public function stopAudioPreview():Void
{
audioPreviewTracks.stop();
chartEditorState.fadeInWelcomeMusic(ChartEditorState.WELCOME_MUSIC_FADE_IN_DELAY, ChartEditorState.WELCOME_MUSIC_FADE_IN_DURATION);

audioPreviewTracks.time = 0;

{
audioPreviewInstrumentalOffset = chartEditorState.currentInstrumentalOffset;
trackInst.time = -audioPreviewInstrumentalOffset;
}

{
audioPreviewPlayerOffset = chartEditorState.currentVocalOffsetPlayer;
trackPlayer.time = -audioPreviewPlayerOffset;
}

{
audioPreviewOpponentOffset = chartEditorState.currentVocalOffsetOpponent;
trackOpponent.time = -audioPreviewOpponentOffset;
}

waveformScrollview.hscrollPos = 0;
playheadAbsolutePos = 0 + playheadSprite.width;
refresh();
addOffsetsToAudioPreview();
}

public function zoomWaveformIn():Void
{
{
waveformScale = waveformScale / WAVEFORM_ZOOM_MULT;

playheadAbsolutePos = playheadAbsolutePos * WAVEFORM_ZOOM_MULT;

waveformScrollview.hscrollPos = playheadAbsolutePos - vaguelyCenterPlayheadOffset;

refresh();
refreshTicks();
}
else
{
waveformScale = MIN_SCALE;
}
}

public function zoomWaveformOut():Void
{
waveformScale = waveformScale * WAVEFORM_ZOOM_MULT;

playheadAbsolutePos = playheadAbsolutePos / WAVEFORM_ZOOM_MULT;

waveformScrollview.hscrollPos = playheadAbsolutePos - vaguelyCenterPlayheadOffset;

refresh();
refreshTicks();
}

public function setTrackVolume(target:Waveform, volume:Float):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
trackInst.volume = volume;
}
case Waveform.PLAYER:
{
trackPlayer.volume = volume;
}
case Waveform.OPPONENT:
{
trackOpponent.volume = volume;
}
}
}

public function muteTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
trackInst.muted = true;
offsetInstrumentalMute.text = trackInst.muted ? "Unmute" : "Mute";
}
case Waveform.PLAYER:
{
trackPlayer.muted = true;
offsetPlayerMute.text = trackPlayer.muted ? "Unmute" : "Mute";
}
case Waveform.OPPONENT:
{
trackOpponent.muted = true;
offsetOpponentMute.text = trackOpponent.muted ? "Unmute" : "Mute";
}
}
}

public function unmuteTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
trackInst.muted = false;
offsetInstrumentalMute.text = trackInst.muted ? "Unmute" : "Mute";
}
case Waveform.PLAYER:
{
trackPlayer.muted = false;
offsetPlayerMute.text = trackPlayer.muted ? "Unmute" : "Mute";
}
case Waveform.OPPONENT:
{
trackOpponent.muted = false;
offsetOpponentMute.text = trackOpponent.muted ? "Unmute" : "Mute";
}
}
}

public function toggleMuteTrack(target:Waveform):Void
{
switch (target)
{
case Waveform.INSTRUMENTAL:
{
trackInst.muted = !trackInst.muted;
offsetInstrumentalMute.text = trackInst.muted ? "Unmute" : "Mute";
}
case Waveform.PLAYER:
{
trackPlayer.muted = !trackPlayer.muted;
offsetPlayerMute.text = trackPlayer.muted ? "Unmute" : "Mute";
}
case Waveform.OPPONENT:
{
trackOpponent.muted = !trackOpponent.muted;
offsetOpponentMute.text = trackOpponent.muted ? "Unmute" : "Mute";
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
muteTrack(Waveform.OPPONENT);
muteTrack(Waveform.INSTRUMENTAL);
unmuteTrack(Waveform.PLAYER);
case Waveform.OPPONENT:
muteTrack(Waveform.PLAYER);
muteTrack(Waveform.INSTRUMENTAL);
unmuteTrack(Waveform.OPPONENT);
case Waveform.INSTRUMENTAL:
muteTrack(Waveform.PLAYER);
muteTrack(Waveform.OPPONENT);
unmuteTrack(Waveform.INSTRUMENTAL);
}
}

public override function update(elapsed:Float)
{
super.update(elapsed);

{

playheadAbsolutePos = targetScrollPos;




{
waveformScrollview.hscrollPos -= waveformScrollview.width;
}
{
waveformScrollview.hscrollPos += waveformScrollview.width;
}
}

{
{
track.time += audioPreviewInstrumentalOffset;
track.time -= chartEditorState.currentInstrumentalOffset;
audioPreviewInstrumentalOffset = chartEditorState.currentInstrumentalOffset;
}
}
{
{
track.time += audioPreviewPlayerOffset;
track.time -= chartEditorState.currentVocalOffsetPlayer;
audioPreviewPlayerOffset = chartEditorState.currentVocalOffsetPlayer;
}
}
{
{
track.time += audioPreviewOpponentOffset;
track.time -= chartEditorState.currentVocalOffsetOpponent;
audioPreviewOpponentOffset = chartEditorState.currentVocalOffsetOpponent;
}
}
offsetLabelTime.text = formatTime(audioPreviewTracks.time / Constants.MS_PER_SEC);
}

public override function refresh():Void
{
super.refresh();

waveformMagicFactor = MAGIC_SCALE_BASE_TIME / (chartEditorState.offsetTickBitmap.width / waveformInstrumental.waveform.waveformData.pointsPerSecond());



offsetStepperPlayer.value = chartEditorState.currentVocalOffsetPlayer;
offsetStepperOpponent.value = chartEditorState.currentVocalOffsetOpponent;
offsetStepperInstrumental.value = chartEditorState.currentInstrumentalOffset;

waveformPlayer.waveform.time = -chartEditorState.currentVocalOffsetPlayer / Constants.MS_PER_SEC; // Negative offsets make the song start early.
waveformPlayer.waveform.width = (waveformPlayer.waveform.waveformData?.length ?? 1000) / currentZoomFactor;
waveformPlayer.waveform.height = 65;

waveformOpponent.waveform.time = -chartEditorState.currentVocalOffsetOpponent / Constants.MS_PER_SEC;
waveformOpponent.waveform.width = (waveformOpponent.waveform.waveformData?.length ?? 1000) / currentZoomFactor;
waveformOpponent.waveform.height = 65;

waveformInstrumental.waveform.time = -chartEditorState.currentInstrumentalOffset / Constants.MS_PER_SEC;
waveformInstrumental.waveform.width = (waveformInstrumental.waveform.waveformData?.length ?? 1000) / currentZoomFactor;
waveformInstrumental.waveform.height = 65;

{
case PLAYER:
waveformPlayer.waveform.time -= dragOffsetMs / Constants.MS_PER_SEC;
offsetStepperPlayer.value += dragOffsetMs;
case OPPONENT:
waveformOpponent.waveform.time -= dragOffsetMs / Constants.MS_PER_SEC;
offsetStepperOpponent.value += dragOffsetMs;
case INSTRUMENTAL:
waveformInstrumental.waveform.time -= dragOffsetMs / Constants.MS_PER_SEC;
offsetStepperInstrumental.value += dragOffsetMs;
default:
}

waveformPlayer.waveform.markDirty();
waveformOpponent.waveform.markDirty();
waveformInstrumental.waveform.markDirty();

waveformContainer.width = maxWidth;
tickTiledSprite.width = maxWidth;
}

public static function build(chartEditorState:ChartEditorState):ChartEditorOffsetsToolbox
{
}
}

enum Waveform
{
PLAYER;
OPPONENT;
INSTRUMENTAL;
}
