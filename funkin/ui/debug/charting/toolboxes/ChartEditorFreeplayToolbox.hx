package funkin.ui.debug.charting.toolboxes;


/**
* The toolbox which allows modifying information like Song Title, Scroll Speed, Characters/Stages, and starting BPM.
*/
class ChartEditorFreeplayToolbox extends ChartEditorBaseToolbox
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


function get_previewBoxStartPosAbsolute():Float
{
}

function set_previewBoxStartPosAbsolute(value:Float):Float
{
}


function get_previewBoxEndPosAbsolute():Float
{
}

function set_previewBoxEndPosAbsolute(value:Float):Float
{
}


function get_previewBoxStartPosRelative():Float
{
}

function set_previewBoxStartPosRelative(value:Float):Float
{
}


function get_previewBoxEndPosRelative():Float
{
}

function set_previewBoxEndPosRelative(value:Float):Float
{
}

/**
* The amount you need to multiply the zoom by such that, at the base zoom level, one tick is equal to `MAGIC_SCALE_BASE_TIME` seconds.
*/




function get_freeplayPreviewVolume():Float
{
}


public function new(chartEditorState2:ChartEditorState)
{
super(chartEditorState2);

initialize();

this.onDialogClosed = onClose;
}

function onClose(event:UIEvent)
{
chartEditorState.menubarItemToggleToolboxFreeplay.selected = false;
}

function initialize():Void
{
this.x = 150;
this.y = 250;

freeplayMusicVolume.onChange = (_) ->
{
setTrackVolume(freeplayPreviewVolume);
};
freeplayMusicMute.onClick = (_) ->
{
toggleMuteTrack();
};
freeplayButtonZoomIn.onClick = (_) ->
{
zoomWaveformIn();
};
freeplayButtonZoomOut.onClick = (_) ->
{
zoomWaveformOut();
};
freeplayButtonPause.onClick = (_) ->
{
pauseAudioPreview();
};
freeplayButtonPlay.onClick = (_) ->
{
playAudioPreview();
};
freeplayButtonStop.onClick = (_) ->
{
stopAudioPreview();
};
testPreview.onClick = (_) ->
{
performPreview();
};
freeplayPreviewStart.onChange = (event:UIEvent) ->
{

chartEditorState.performCommand(new SetFreeplayPreviewCommand(event.value, null));
refresh();
}
freeplayPreviewEnd.onChange = (event:UIEvent) ->
{

chartEditorState.performCommand(new SetFreeplayPreviewCommand(null, event.value));
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

chartEditorState.resetPreviewTimes();
freeplayPreviewStart.value = chartEditorState.currentSongFreeplayPreviewStart;
freeplayPreviewEnd.value = chartEditorState.currentSongFreeplayPreviewEnd;

refreshAudioPreview();
refresh();
refreshTicks();

waveformMusic.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
onStartDragWaveform();
});

freeplayTicksContainer.registerEvent(MouseEvent.MOUSE_DOWN, (_) ->
{
onStartDragPlayhead();
});
}

function initializeTicks():Void
{
tickTiledSprite = new FlxTiledSprite(chartEditorState.offsetTickBitmap, 100, chartEditorState.offsetTickBitmap.height, true, false);
freeplayTicksSprite.sprite = tickTiledSprite;
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




waveformMusic.waveform.waveformData = waveformData;
waveformMusic.waveform.duration = instTrack.length / Constants.MS_PER_SEC;

addOffsetsToAudioPreview();
}

public function refreshTicks():Void
{
{
freeplayTicksContainer.removeComponent(label);
}



for (index in 0...numberOfTicks)
{

tickLabel.text = formatTime(tickTime);
tickLabel.styleNames = "offset-ticks-label";
tickLabel.height = labelHeight;
tickLabel.top = labelYPos;
tickLabel.left = tickPos + TICK_LABEL_X_OFFSET;

freeplayTicksContainer.addComponent(tickLabel);
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



public function onStartDragWaveform():Void
{
waveformDragStartPos = FlxG.mouse.x;

Screen.instance.registerEvent(MouseEvent.MOUSE_MOVE, onDragWaveform);
Screen.instance.registerEvent(MouseEvent.MOUSE_UP, onStopDragWaveform);
}

public function onDragWaveform(event:MouseEvent):Void
{




{
{
waveformDragPreviewStartPos = relativeStartPos;
waveformDragPreviewEndPos = currentRelativeMousePos;
}
else
{
waveformDragPreviewStartPos = currentRelativeMousePos;
waveformDragPreviewEndPos = relativeStartPos;
}
}

refresh();
}

public function onStopDragWaveform(event:MouseEvent):Void
{
Screen.instance.unregisterEvent(MouseEvent.MOUSE_MOVE, onDragWaveform);
Screen.instance.unregisterEvent(MouseEvent.MOUSE_UP, onStopDragWaveform);



chartEditorState.performCommand(new SetFreeplayPreviewCommand(previewStartPosMs, previewEndPosMs));

waveformDragStartPos = null;
waveformDragPreviewStartPos = 0;
waveformDragPreviewEndPos = 0;

refresh();
addOffsetsToAudioPreview();
}

public function playAudioPreview():Void
{

audioPreviewTracks.volume = freeplayPreviewVolume;
audioPreviewTracks.play(false, audioPreviewTracks.time);
}

public function addOffsetsToAudioPreview():Void
{
{
trackInst.time -= chartEditorState.currentInstrumentalOffset;
}

{
trackPlayer.time -= chartEditorState.currentVocalOffsetPlayer;
}

{
trackOpponent.time -= chartEditorState.currentVocalOffsetOpponent;
}
}

public function pauseAudioPreview():Void
{

audioPreviewTracks.pause();
}

public function stopAudioPreview():Void
{

audioPreviewTracks.stop();

audioPreviewTracks.time = 0;

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

public function setTrackVolume(volume:Float):Void
{
audioPreviewTracks.volume = volume;
}

public function muteTrack():Void
{
audioPreviewTracks.muted = true;
}

public function unmuteTrack():Void
{
audioPreviewTracks.muted = false;
}

public function toggleMuteTrack():Void
{
audioPreviewTracks.muted = !audioPreviewTracks.muted;
}


public function performPreview():Void
{
isPerformingPreview = true;
isFadingOutPreview = false;
audioPreviewTracks.play(true, chartEditorState.currentSongFreeplayPreviewStart);
audioPreviewTracks.fadeIn(FreeplayState.FADE_IN_DURATION, FreeplayState.FADE_IN_START_VOLUME * freeplayPreviewVolume,
FreeplayState.FADE_IN_END_VOLUME * freeplayPreviewVolume, null);
}

public function stopPerformingPreview():Void
{
isPerformingPreview = false;
isFadingOutPreview = false;
audioPreviewTracks.volume = freeplayPreviewVolume;
audioPreviewTracks.pause();
}

public override function update(elapsed:Float)
{
super.update(elapsed);

{
stopPerformingPreview();
}

{
{
isFadingOutPreview = true;
audioPreviewTracks.fadeOut(FreeplayState.FADE_OUT_DURATION, FreeplayState.FADE_OUT_END_VOLUME * freeplayPreviewVolume, (_) ->
{
stopPerformingPreview();
});
}
}

{
playheadAbsolutePos = targetScrollPos;

{
waveformScrollview.hscrollPos -= waveformScrollview.width;
}
{
waveformScrollview.hscrollPos += waveformScrollview.width;
}
}
freeplayLabelTime.text = formatTime(audioPreviewTracks.time / Constants.MS_PER_SEC);
{


freeplayPreviewStart.value = previewStartPosMs;
freeplayPreviewEnd.value = previewEndPosMs;

previewBoxStartPosAbsolute = previewStartPosAbsolute;
previewBoxEndPosAbsolute = previewEndPosAbsolute;
}
else
{
previewBoxStartPosAbsolute = waveformMusic.waveform.waveformData.secondsToIndex(chartEditorState.currentSongFreeplayPreviewStart / Constants.MS_PER_SEC) / (waveformScale / BASE_SCALE * waveformMagicFactor);
previewBoxEndPosAbsolute = waveformMusic.waveform.waveformData.secondsToIndex(chartEditorState.currentSongFreeplayPreviewEnd / Constants.MS_PER_SEC) / (waveformScale / BASE_SCALE * waveformMagicFactor);

freeplayPreviewStart.value = chartEditorState.currentSongFreeplayPreviewStart;
freeplayPreviewEnd.value = chartEditorState.currentSongFreeplayPreviewEnd;
}
}

public override function refresh():Void
{
super.refresh();

waveformMagicFactor = MAGIC_SCALE_BASE_TIME / (chartEditorState.offsetTickBitmap.width / waveformMusic.waveform.waveformData.pointsPerSecond());



waveformMusic.waveform.time = -chartEditorState.currentInstrumentalOffset / Constants.MS_PER_SEC;
waveformMusic.waveform.width = (waveformMusic.waveform.waveformData?.length ?? 1000) / currentZoomFactor;
waveformMusic.waveform.height = 65;
waveformMusic.waveform.markDirty();

waveformContainer.width = maxWidth;
tickTiledSprite.width = maxWidth;
}

public static function build(chartEditorState:ChartEditorState):ChartEditorFreeplayToolbox
{
}
}
