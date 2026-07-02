

class ChartEditorEventContextMenu extends ChartEditorBaseContextMenu
{



public function new(chartEditorState2:ChartEditorState, xPos2:Float = 0, yPos2:Float = 0, data:SongEventData, selectedUnit:Int = 0)
{

}

public function initialize()
{
contextmenuUnit.onChange = function(_)
{
{
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
{
}

case "STEPS":
{
}

default:
{
}
}
}

contextmenuPosition.onChange = function(_)
{
{
}
switch (contextmenuUnit.value.id)
{
case "MILLISECONDS":
{
}
case "STEPS":
{
{
data.time = Conductor.instance.getStepTimeInMs(newTime); // There isn't a function for this in the SongData sadly
}
}
default:
{
}
}
}
{
}
else if (id == "STEPS"
&& contextmenuPosition.value != (Math.round(data.getStepTime() / chartEditorState.noteSnapRatio) * chartEditorState.noteSnapRatio))
{
}

contextmenuEdit.onClick = function(_)
{
}

contextmenuDelete.onClick = function(_)
{
}
}
}
