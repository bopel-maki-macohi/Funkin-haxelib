package funkin.ui.debug.charting.contextmenus;


class ChartEditorSelectionContextMenu extends ChartEditorBaseContextMenu
{


public function new(chartEditorState2:ChartEditorState, xPos2:Float = 0, yPos2:Float = 0, selectedUnit:Int = 0)
{
super(chartEditorState2, xPos2, yPos2);

contextmenuOffset.value = 0;
this.selectedUnit = selectedUnit;
contextmenuUnit.selectedIndex = selectedUnit;
contextmenuUnit.value = contextmenuUnit.dataSource.get(contextmenuUnit.selectedIndex);

initialize();
}

public function initialize():Void
{
contextmenuUnit.onChange = function(_)
{
{
contextmenuUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuUnit.selectedIndex = selectedUnit;
contextmenuUnit.resumeEvent(UIEvent.CHANGE, true, true);
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
contextmenuUnit.text = "Offset (MS)";
{
contextmenuOffset.value = Conductor.instance.getStepTimeInMs(contextmenuOffset.value);
}

case "STEPS":
contextmenuUnit.text = "Offset (Steps)";
{
contextmenuOffset.value = Conductor.instance.getTimeInSteps(contextmenuOffset.value);
}

default:
contextmenuUnit.text = "Offset (MS)";
{
contextmenuOffset.value = Conductor.instance.getStepTimeInMs(contextmenuOffset.value);
}
}
}

contextmenuOffsetMove.onClick = (_) ->
{
{
contextmenuUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuUnit.selectedIndex = selectedUnit;
contextmenuUnit.resumeEvent(UIEvent.CHANGE, true, true);
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
{
chartEditorState.performCommand(new MoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection,
contextmenuOffset.value, 0));
}
case "STEPS":
{
chartEditorState.performCommand(new MoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection,
contextmenuOffset.value, 0, true));
}
default:
{
chartEditorState.performCommand(new MoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection,
contextmenuOffset.value, 0));
}
}
}

contextmenuCut.onClick = (_) ->
{
chartEditorState.performCommand(new CutItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection));
};
contextmenuCopy.onClick = (_) ->
{
chartEditorState.copySelection();
};
contextmenuDelete.onClick = (_) ->
{
{
chartEditorState.performCommand(new RemoveItemsCommand(chartEditorState.currentNoteSelection, chartEditorState.currentEventSelection));
}
else if (chartEditorState.currentNoteSelection.length > 0)
{
chartEditorState.performCommand(new RemoveNotesCommand(chartEditorState.currentNoteSelection));
}
else if (chartEditorState.currentEventSelection.length > 0)
{
chartEditorState.performCommand(new RemoveEventsCommand(chartEditorState.currentEventSelection));
}
else
{
}
};

contextmenuFlip.onClick = function(_)
{
chartEditorState.performCommand(new FlipNotesCommand(chartEditorState.currentNoteSelection));
}

contextmenuMirrorX.onClick = function(_)
{
chartEditorState.performCommand(new MirrorNotesCommand(chartEditorState.currentNoteSelection, contextmenuMirrorFlipWithinStrumline.selected,
!contextmenuMirrorFlipWithinStrumline.selected, true, false));
}

contextmenuMirrorY.onClick = function(_)
{
chartEditorState.performCommand(new MirrorNotesCommand(chartEditorState.currentNoteSelection, contextmenuMirrorFlipWithinStrumline.selected,
!contextmenuMirrorFlipWithinStrumline.selected, false, true));
}

contextmenuMirrorXY.onClick = function(_)
{
chartEditorState.performCommand(new MirrorNotesCommand(chartEditorState.currentNoteSelection, contextmenuMirrorFlipWithinStrumline.selected,
!contextmenuMirrorFlipWithinStrumline.selected, true, true));
}

contextmenuSelectAll.onClick = function(_)
{
chartEditorState.performCommand(new SelectAllItemsCommand(true, false));
}
contextmenuSelectInverse.onClick = function(_)
{
chartEditorState.performCommand(new InvertSelectedItemsCommand());
}
contextmenuSelectNone.onClick = function(_)
{
chartEditorState.performCommand(new DeselectAllItemsCommand());
}
}
}
