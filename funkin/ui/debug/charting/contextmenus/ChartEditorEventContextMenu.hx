package funkin.ui.debug.charting.contextmenus;


class ChartEditorEventContextMenu extends ChartEditorBaseContextMenu
{



public function new(chartEditorState2:ChartEditorState, xPos2:Float = 0, yPos2:Float = 0, data:SongEventData, selectedUnit:Int = 0)
{
super(chartEditorState2, xPos2, yPos2);
this.data = data;
contextmenuEventKind.text = data.eventKind;
this.selectedUnit = selectedUnit;
contextmenuUnit.selectedIndex = selectedUnit;
contextmenuUnit.value = contextmenuUnit.dataSource.get(contextmenuUnit.selectedIndex);

initialize();
}

public function initialize()
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
contextmenuUnit.text = "Time (MS)";
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = data.time;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}

case "STEPS":
contextmenuUnit.text = "Time (Steps)";
{
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}

default:
contextmenuUnit.text = "Time (MS)";
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
contextmenuUnit.pauseEvent(UIEvent.CHANGE, true);
contextmenuUnit.selectedIndex = selectedUnit;
contextmenuUnit.resumeEvent(UIEvent.CHANGE, true, true);
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
{
data.time = newTime;
chartEditorState.performCommand(new MoveEventsCommand(chartEditorState.currentEventSelection, newTime, true));
}
case "STEPS":
{
newTime = Math.round(newTime / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
{
data.time = Conductor.instance.getStepTimeInMs(newTime); // There isn't a function for this in the SongData sadly
chartEditorState.performCommand(new MoveEventsCommand(chartEditorState.currentEventSelection, newTime, true, true));
contextmenuPosition.pauseEvent(UIEvent.CHANGE, true);
contextmenuPosition.value = Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio;
contextmenuPosition.resumeEvent(UIEvent.CHANGE, true, true);
}
}
default:
{
data.time = newTime;
chartEditorState.performCommand(new MoveEventsCommand(chartEditorState.currentEventSelection, newTime, true));
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

contextmenuEdit.onClick = function(_)
{
chartEditorState.showToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT);
}

contextmenuDelete.onClick = function(_)
{
chartEditorState.performCommand(new RemoveEventsCommand([data]));
}
}
}
