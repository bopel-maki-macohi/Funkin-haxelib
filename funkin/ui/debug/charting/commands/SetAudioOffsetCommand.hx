
/**
* Command that copies a given set of notes and song events to the clipboard,
* without deleting them from the chart editor.
*/
class SetAudioOffsetCommand implements ChartEditorCommand
{

public function new(type:AudioOffsetType, newOffset:Float, refreshOffsetsToolbox:Bool = true)
{
}

public function execute(state:ChartEditorState):Void
{
switch (type)
{
case INSTRUMENTAL:

Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset;
state.songLengthInMs = (state.audioInstTrack?.length ?? 1000.0) + Conductor.instance.instrumentalOffset;
case PLAYER:

case OPPONENT:

}

{
}
}

public function undo(state:ChartEditorState):Void
{
switch (type)
{
case INSTRUMENTAL:

Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset;
state.songLengthInMs = (state.audioInstTrack?.length ?? 1000.0) + Conductor.instance.instrumentalOffset;
case PLAYER:

case OPPONENT:

}

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
}
