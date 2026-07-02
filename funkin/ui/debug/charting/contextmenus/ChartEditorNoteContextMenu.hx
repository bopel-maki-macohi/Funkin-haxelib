

class ChartEditorNoteContextMenu extends ChartEditorBaseContextMenu
{



public function new(chartEditorState2:ChartEditorState, xPos2:Float = 0, yPos2:Float = 0, data:SongNoteData, selectedUnit:Int = 0)
{
else

}

public function initialize():Void
{
{
else
}
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
{
}
}
case "STEPS":
{
{
data.time = Conductor.instance.getStepTimeInMs(newTime); // There isn't a function for this in the SongData sadly
}
}
default:
{
{
}
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

contextmenuFlip.onClick = function(_)
{
}

contextmenuMirrorX.onClick = function(_)
{
}

contextmenuAddHold.onClick = function(_)
{
}

contextmenuDelete.onClick = function(_)
{
}
}
}
