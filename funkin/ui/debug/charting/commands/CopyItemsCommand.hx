package funkin.ui.debug.charting.commands;


/**
* Command that copies a given set of notes and song events to the clipboard,
* without deleting them from the chart editor.
*/
class CopyItemsCommand implements ChartEditorCommand
{

public function new(notes:Array<SongNoteData>, events:Array<SongEventData>)
{
this.notes = notes;
this.events = events;
}

public function execute(state:ChartEditorState):Void
{
{
{
timeOffset = Std.int(state.currentEventSelection[0].time);
}
}

SongDataUtils.writeItemsToClipboard({
notes: SongDataUtils.buildNoteClipboard(state.currentNoteSelection, timeOffset),
events: SongDataUtils.buildEventClipboard(state.currentEventSelection, timeOffset),
});

performVisuals(state);
state.clipboardDirty = true;
state.clipboardValid = true;
}

function performVisuals(state:ChartEditorState):Void
{

{
hasNotes = true;

for (note in state.renderedNotes.members)
{
{
FlxTween.globalManager.cancelTweensOf(note);
FlxTween.globalManager.cancelTweensOf(note.scale);
note.playNoteAnimation();

note.scale.x *= 1.2;
note.scale.y *= 1.2;

note.angle = FlxG.random.bool() ? -10 : 10;
FlxTween.tween(note, {"angle": 0}, 0.8, {ease: FlxEase.elasticOut});

FlxTween.tween(note.scale, {"y": prevX, "x": prevY}, 0.7, {
ease: FlxEase.elasticOut,
onComplete: function(_)
{
note.playNoteAnimation();
}
});
}
}
}

{
hasEvents = true;

for (event in state.renderedEvents.members)
{
{
FlxTween.globalManager.cancelTweensOf(event);
FlxTween.globalManager.cancelTweensOf(event.scale);
event.playAnimation();

event.scale.x *= 1.2;
event.scale.y *= 1.2;

event.angle = FlxG.random.bool() ? -10 : 10;
FlxTween.tween(event, {"angle": 0}, 0.8, {ease: FlxEase.elasticOut});

FlxTween.tween(event.scale, {"y": prevX, "x": prevY}, 0.7, {
ease: FlxEase.elasticOut,
onComplete: function(_)
{
event.playAnimation();
}
});
}
}
}

{
{
copiedString += '${copiedNotes} note';

}
{
copiedString += '${state.currentEventSelection.length} event';
}

FlxTween.globalManager.cancelTweensOf(state.txtCopyNotif);

state.txtCopyNotif.visible = true;
state.txtCopyNotif.text = 'Copied ${copiedString} to clipboard';
state.txtCopyNotif.x = FlxG.mouse.x - (state.txtCopyNotif.width / 2);
state.txtCopyNotif.y = FlxG.mouse.y - 16;
FlxTween.tween(state.txtCopyNotif, {y: state.txtCopyNotif.y - 32}, 0.5, {
type: FlxTweenType.ONESHOT,
ease: FlxEase.quadOut,
onComplete: function(_)
{
state.txtCopyNotif.visible = false;
}
});
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

else if (events.length == 0) return 'Copy $len Notes to Clipboard';
else
}
}
