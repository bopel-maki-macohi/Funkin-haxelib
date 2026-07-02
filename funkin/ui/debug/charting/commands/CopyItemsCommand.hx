

/**
* Command that copies a given set of notes and song events to the clipboard,
* without deleting them from the chart editor.
*/
class CopyItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
}

public function execute(state:ChartEditorState):Void
{
{
{
}
}

SongDataUtils.writeItemsToClipboard({
notes: SongDataUtils.buildNoteClipboard(state.currentNoteSelection, timeOffset),
events: SongDataUtils.buildEventClipboard(state.currentEventSelection, timeOffset),

}

function performVisuals(state:ChartEditorState):Void
{

{

for (note in state.renderedNotes.members)
{
{



FlxTween.tween(note.scale, {"y": prevX, "x": prevY}, 0.7, {
ease: FlxEase.elasticOut,
onComplete: function(_)
{
}
}
}
}

{

for (event in state.renderedEvents.members)
{
{



FlxTween.tween(event.scale, {"y": prevX, "x": prevY}, 0.7, {
ease: FlxEase.elasticOut,
onComplete: function(_)
{
}
}
}
}

{
{

}
{
}


FlxTween.tween(state.txtCopyNotif, {y: state.txtCopyNotif.y - 32}, 0.5, {
type: FlxTweenType.ONESHOT,
ease: FlxEase.quadOut,
onComplete: function(_)
{
}
}
}

public function undo(state:ChartEditorState):Void
{
}

public function shouldAddToHistory(state:ChartEditorState):Bool
{
}

public function toString():String
{

else
}
}
