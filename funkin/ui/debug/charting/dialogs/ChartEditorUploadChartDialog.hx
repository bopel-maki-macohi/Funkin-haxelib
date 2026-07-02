package funkin.ui.debug.charting.dialogs;


class ChartEditorUploadChartDialog extends ChartEditorBaseDialog
{

public function new(state2:ChartEditorState, params2:DialogParams)
{
super(state2, params2);

this.dialogCancel.onClick = (_) -> this.hideDialog(DialogButton.CANCEL);

this.chartBox.onClick = (_) -> this.onClickChartBox();

this.chartBox.onMouseOver = function(_event)
{
this.chartBox.swapClass('upload-bg', 'upload-bg-hover');
Cursor.cursorMode = Pointer;
}

this.chartBox.onMouseOut = function(_event)
{
this.chartBox.swapClass('upload-bg-hover', 'upload-bg');
Cursor.cursorMode = Default;
}

dropHandlers.push({component: this.chartBox, handler: this.onDropFileChartBox});
}

public static function build(state:ChartEditorState, ?closable:Bool, ?modal:Bool):ChartEditorUploadChartDialog
{
closable: closable ?? false,
modal: modal ?? true
});

for (dropTarget in dialog.dropHandlers)
{
state.addDropHandler(dropTarget);
}

dialog.showDialog(modal ?? true);

}

public override function onClose(event:DialogEvent):Void
{
super.onClose(event);

{
chartEditorState.openWelcomeDialog(this.closable);
}

for (dropTarget in dropHandlers)
{
chartEditorState.removeDropHandler(dropTarget);
}
}

public override function lock():Void
{
super.lock();
this.dialogCancel.disabled = true;
}

public override function unlock():Void
{
super.unlock();
this.dialogCancel.disabled = false;
}

/**
* Called when clicking the Upload Chart box.
*/
public function onClickChartBox():Void
{

this.lock();

FileUtil.browseForBinaryFile('Open Chart', [FileUtil.FILE_EXTENSION_INFO_FNFC], onSelectFile, onCancelBrowse);
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
result.length == 0 ? 'Loaded chart (${path.toString()})' : 'Loaded chart (${path.toString()})\n${result.join("\n")}');
this.hideDialog(DialogButton.APPLY);
}
else
{
chartEditorState.failure('Failed to Load Chart', 'Failed to load chart (${path.toString()})');
}
}
catch (err)
{
chartEditorState.failure('Failed to Load Chart', 'Failed to load chart (${path.toString()}): ${err}');
}
}

/**
* Called when a file is selected by the dialog displayed when clicking the Upload Chart box.
*/
function onSelectFile(selectedFile:SelectedFileInfo):Void
{
this.unlock();

{
try
{
{
chartEditorState.success('Loaded Chart',
result.length == 0 ? 'Loaded chart (${selectedFile.name})' : 'Loaded chart (${selectedFile.name})\n${result.join("\n")}');

this.hideDialog(DialogButton.APPLY);
}
}
catch (err)
{
chartEditorState.failure('Failed to Load Chart', 'Failed to load chart (${selectedFile.name}): ${err}');
}
}
}

function onCancelBrowse():Void
{
this.unlock();
}
}
