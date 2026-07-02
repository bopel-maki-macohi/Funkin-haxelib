package funkin.ui.debug.charting.commands;

/**
* Command that copies a given set of notes and song events to the clipboard,
* without deleting them from the chart editor.
*/
class SetAudioOffsetCommand implements ChartEditorCommand
{

public function new(type:AudioOffsetType, newOffset:Float, refreshOffsetsToolbox:Bool = true)
{
this.type = type;
this.newOffset = newOffset;
this.refreshOffsetsToolbox = refreshOffsetsToolbox;
}

public function execute(state:ChartEditorState):Void
{
switch (type)
{
case INSTRUMENTAL:
oldOffset = state.currentInstrumentalOffset;
state.currentInstrumentalOffset = newOffset;

Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset;
state.songLengthInMs = (state.audioInstTrack?.length ?? 1000.0) + Conductor.instance.instrumentalOffset;
case PLAYER:
oldOffset = state.currentVocalOffsetPlayer;
state.currentVocalOffsetPlayer = newOffset;

state.audioVocalTrackGroup.playerVoicesOffset = state.currentVocalOffsetPlayer;
case OPPONENT:
oldOffset = state.currentVocalOffsetOpponent;
state.currentVocalOffsetOpponent = newOffset;

state.audioVocalTrackGroup.opponentVoicesOffset = state.currentVocalOffsetOpponent;
}

{
state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT);
state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_FREEPLAY_LAYOUT);
}
}

public function undo(state:ChartEditorState):Void
{
switch (type)
{
case INSTRUMENTAL:
state.currentInstrumentalOffset = oldOffset;

Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset;
state.songLengthInMs = (state.audioInstTrack?.length ?? 1000.0) + Conductor.instance.instrumentalOffset;
case PLAYER:
state.currentVocalOffsetPlayer = oldOffset;

state.audioVocalTrackGroup.playerVoicesOffset = state.currentVocalOffsetPlayer;
case OPPONENT:
state.currentVocalOffsetOpponent = oldOffset;

state.audioVocalTrackGroup.opponentVoicesOffset = state.currentVocalOffsetOpponent;
}

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT);
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{
switch (type)
{
case INSTRUMENTAL:
case PLAYER:
case OPPONENT:
}
}
}

enum AudioOffsetType
{
INSTRUMENTAL;
PLAYER;
OPPONENT;
}
