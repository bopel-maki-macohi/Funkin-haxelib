

class ChartEditorSelectionContextMenu extends ChartEditorBaseContextMenu
{


public function new(chartEditorState2:ChartEditorState, xPos2:Float = 0, yPos2:Float = 0, selectedUnit:Int = 0)
{


}

public function initialize():Void
{
contextmenuUnit.onChange = function(_)
{
{
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
{
contextmenuOffset.value = Conductor.instance.getStepTimeInMs(contextmenuOffset.value);
}

case "STEPS":
{
contextmenuOffset.value = Conductor.instance.getTimeInSteps(contextmenuOffset.value);
}

default:
{
contextmenuOffset.value = Conductor.instance.getStepTimeInMs(contextmenuOffset.value);
}
}
}

contextmenuOffsetMove.onClick = (_) ->
{
{
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
{
chartEditorState.performCommand(new MoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection,
}
case "STEPS":
{
chartEditorState.performCommand(new MoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection,
}
default:
{
chartEditorState.performCommand(new MoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection,
}
}
}

contextmenuCut.onClick = (_) ->
{
contextmenuCopy.onClick = (_) ->
{
contextmenuDelete.onClick = (_) ->
{
{
}
else if (chartEditorState.currentNoteSelection.length > 0)
{
}
else if (chartEditorState.currentEventSelection.length > 0)
{
}
else
{
}

contextmenuFlip.onClick = function(_)
{
}

contextmenuMirrorX.onClick = function(_)
{
chartEditorState.performCommand(new MirrorNotesCommand(chartEditorState.currentNoteSelection, contextmenuMirrorFlipWithinStrumline.selected,
}

contextmenuMirrorY.onClick = function(_)
{
chartEditorState.performCommand(new MirrorNotesCommand(chartEditorState.currentNoteSelection, contextmenuMirrorFlipWithinStrumline.selected,
}

contextmenuMirrorXY.onClick = function(_)
{
chartEditorState.performCommand(new MirrorNotesCommand(chartEditorState.currentNoteSelection, contextmenuMirrorFlipWithinStrumline.selected,
}

contextmenuSelectAll.onClick = function(_)
{
}
contextmenuSelectInverse.onClick = function(_)
{
}
contextmenuSelectNone.onClick = function(_)
{
}
}
}
