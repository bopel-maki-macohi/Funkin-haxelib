package funkin.ui.debug.charting.contextmenus;


class ChartEditorHoldNoteContextMenu extends ChartEditorBaseContextMenu
{



public function new(chartEditorState2:ChartEditorState, xPos2:Float = 0, yPos2:Float = 0, data:SongNoteData, selectedUnit:Int = 0)
{
super(chartEditorState2, xPos2, yPos2);
this.data = data;
contextmenuPosition.value = data.time;
else
contextmenuNoteKind.text = data.kind;
this.selectedUnit = selectedUnit;
contextmenuPosUnit.selectedIndex = selectedUnit;
contextmenuPosUnit.value = contextmenuPosUnit.dataSource.get(contextmenuPosUnit.selectedIndex);
contextmenuLengthUnit.selectedIndex = selectedUnit;
contextmenuLengthUnit.value = contextmenuLengthUnit.dataSource.get(contextmenuLengthUnit.selectedIndex);
contextmenuLength.value = data.length;

initialize();
}

public function initialize():Void
{
{
else
contextmenuNoteKind.text = data.kind;
}
contextmenuPosUnit.onChange = function(_)
{
{
contextmenuPosUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosUnit.selectedIndex = selectedUnit;
contextmenuPosUnit.resumeEvent(UIEvent.CHANGE, true, true);
}
switch (contextmenuPosUnit.value.id)
{
case "MILLISECONDS":
contextmenuPosUnit.text = "Time (MS)";
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = data.time;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}
case "STEPS":
contextmenuPosUnit.text = "Time (Steps)";
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}
default:
contextmenuPosUnit.text = "Time (MS)";
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = data.time;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}
}
}

contextmenuPosition.onChange = function(_)
{
{
contextmenuPosUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosUnit.selectedIndex = selectedUnit;
contextmenuPosUnit.resumeEvent(UIEvent.CHANGE, true);
}
switch (contextmenuPosUnit.value.id)
{
case "MILLISECONDS":
{
data.time = newTime;
chartEditorState.performCommand(new MoveNotesCommand(chartEditorState.currentNoteSelection, newTime, 0, true));
}
case "STEPS":
{
newTime = Math.round(newTime / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
{
data.time = Conductor.instance.getStepTimeInMs(newTime); // There isn't a function for this in the SongData sadly
chartEditorState.performCommand(new MoveNotesCommand(chartEditorState.currentNoteSelection, newTime, 0, true, true));
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}
}
default:
{
data.time = newTime;
chartEditorState.performCommand(new MoveNotesCommand(chartEditorState.currentNoteSelection, newTime, 0, true));
}
}
}
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = data.time;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}
else if (id == "STEPS"
&& contextmenuPosition.value != (Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio))
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}

contextmenuLengthUnit.onChange = function(_)
{
{
contextmenuLengthUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuLengthUnit.selectedIndex = selectedUnit;
contextmenuLengthUnit.resumeEvent(UIEvent.CHANGE, true, true);
}
switch (contextmenuLengthUnit.value.id)
{
case "MILLISECONDS":
contextmenuLengthUnit.text = "Length (MS)";
{
contextmenuLength.pauseEvent(UIEvent.CHANGE, true);
contextmenuLength.value = data.length;
contextmenuLength.resumeEvent(UIEvent.CHANGE, true, true);
}
case "STEPS":
contextmenuLengthUnit.text = "Length (Steps)";
{
contextmenuLength.pauseEvent(UIEvent.CHANGE, true);
contextmenuLength.value = Math.round(data.getStepLength() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuLength.resumeEvent(UIEvent.CHANGE, true, true);
}
default:
contextmenuLengthUnit.text = "Length (MS)";
{
contextmenuLength.pauseEvent(UIEvent.CHANGE, true);
contextmenuLength.value = data.length;
contextmenuLength.resumeEvent(UIEvent.CHANGE, true, true);
}
}
}
id = contextmenuLengthUnit.dataSource.get(contextmenuLengthUnit.selectedIndex).id;

contextmenuLength.onChange = function(_)
{
{
contextmenuLengthUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuLengthUnit.selectedIndex = selectedUnit;
contextmenuLengthUnit.resumeEvent(UIEvent.CHANGE, true, true);
}
switch (contextmenuLengthUnit.value.id)
{
case "MILLISECONDS":
{
data.length = newLength;
chartEditorState.performCommand(new ExtendNoteLengthCommand(data, data.length, MILLISECONDS));
}
case "STEPS":
{
newLength = Math.round(newLength / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
{
data.setStepLength(newLength);
chartEditorState.performCommand(new ExtendNoteLengthCommand(data, newLength, STEPS));
contextmenuLength.pauseEvent(UIEvent.CHANGE, true);
contextmenuLength.value = Math.round(data.getStepLength() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuLength.resumeEvent(UIEvent.CHANGE, true, true);
}
}
default:
{
data.length = newLength;
chartEditorState.performCommand(new ExtendNoteLengthCommand(data, data.length, MILLISECONDS));
}
}
}
{
contextmenuLength.pauseEvent(UIEvent.CHANGE, true);
contextmenuLength.value = data.length;
contextmenuLength.resumeEvent(UIEvent.CHANGE, true, true);
}
else if (id == "STEPS"
&& contextmenuLength.value != (Math.round(data.getStepLength() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio))
{
contextmenuLength.pauseEvent(UIEvent.CHANGE, true);
contextmenuLength.value = Math.round(data.getStepLength() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuLength.resumeEvent(UIEvent.CHANGE, true, true);
}

contextmenuEdit.onClick = function(_)
{
chartEditorState.showToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT);
}

contextmenuFlip.onClick = function(_)
{
chartEditorState.performCommand(new FlipNotesCommand([data]));
}

contextmenuRemoveHold.onClick = function(_)
{
chartEditorState.performCommand(new ExtendNoteLengthCommand(data, 0));
}

contextmenuDelete.onClick = function(_)
{
chartEditorState.performCommand(new RemoveNotesCommand([data]));
}
}
}
