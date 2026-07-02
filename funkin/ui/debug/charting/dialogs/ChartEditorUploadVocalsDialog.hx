


class ChartEditorUploadVocalsDialog extends ChartEditorBaseDialog
{



public function new(state2:ChartEditorState, charIds:Array<String>, params2:DialogParams)
{


dialogCancel.onClick = function(_)
{
}

dialogNoVocals.onClick = function(_)
{

dialogContinue.onClick = function(_)
{

}

function buildDropHandlers():Void
{
for (charKey in charIds)
{




{

{

}
else
{

chartEditorState.error('Failed to Load Vocals',

}

vocalsEntry.onClick = function(_event)
{
Dialogs.openBinaryFile('Open $charName Vocals', [{label: 'Audio File (.ogg)', extension: 'ogg'}], function(selectedFile)
{
{

{


}
else
{

chartEditorState.error('Failed to Load Vocals',

}
}
}



}
}

public static function build(state:ChartEditorState, charIds:Array<String>, ?closable:Bool, ?modal:Bool):ChartEditorUploadVocalsDialog
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

class ChartEditorUploadVocalsEntry extends Box
{


public function new(charName:String)
{



this.onMouseOver = function(_event)
{
}

this.onMouseOut = function(_event)
{
}
}
}
