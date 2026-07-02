

class ChartEditorUploadChartDialog extends ChartEditorBaseDialog
{

public function new(state2:ChartEditorState, params2:DialogParams)
{



this.chartBox.onMouseOver = function(_event)
{
}

this.chartBox.onMouseOut = function(_event)
{
}

}

public static function build(state:ChartEditorState, ?closable:Bool, ?modal:Bool):ChartEditorUploadChartDialog
{
closable: closable ?? false,
modal: modal ?? true

for (dropTarget in dialog.dropHandlers)
{
}


}

public override function onClose(event:DialogEvent):Void
{

{
}

for (dropTarget in dropHandlers)
{
}
}

public override function lock():Void
{
}

public override function unlock():Void
{
}

/**
* Called when clicking the Upload Chart box.
*/
public function onClickChartBox():Void
{


}

/**
* Called when a file is selected by dropping a file onto the Upload Chart box.
*/
function onDropFileChartBox(pathStr:String):Void
{

try
{
{
chartEditorState.success('Loaded Chart',
}
else
{
}
}
catch (err)
{
}
}

/**
* Called when a file is selected by the dialog displayed when clicking the Upload Chart box.
*/
function onSelectFile(selectedFile:SelectedFileInfo):Void
{

{
try
{
{
chartEditorState.success('Loaded Chart',

}
}
catch (err)
{
}
}
}

function onCancelBrowse():Void
{
}
}
