package funkin.ui.debug.charting.dialogs;



class ChartEditorUploadVocalsDialog extends ChartEditorBaseDialog
{



public function new(state2:ChartEditorState, charIds:Array<String>, params2:DialogParams)
{
super(state2, params2);

this.charIds = charIds;
this.instId = chartEditorState.currentInstrumentalId;

dialogCancel.onClick = function(_)
{
hideDialog(DialogButton.CANCEL);
}

dialogNoVocals.onClick = function(_)
{
chartEditorState.wipeVocalData();
hideDialog(DialogButton.APPLY);
};

dialogContinue.onClick = function(_)
{
hideDialog(DialogButton.APPLY);
};

buildDropHandlers();
}

function buildDropHandlers():Void
{
for (charKey in charIds)
{




{

{
this.hasClearedVocals = true;
chartEditorState.success('Loaded Vocals', 'Loaded vocals for $charName (${path.file}.${path.ext}), variation ${chartEditorState.selectedVariation}');
vocalsEntry.vocalsEntryLabel.text = 'Voices for $charName (drag and drop, or click to browse)\nSelected file: ${path.file}.${path.ext}';
vocalsEntry.vocalsEntryLabel.text = 'Voices for $charName (click to browse)\n${path.file}.${path.ext}';

dialogNoVocals.hidden = true;
chartEditorState.removeDropHandler(dropHandler);
}
else
{

chartEditorState.error('Failed to Load Vocals',
'Failed to load vocal track (${path.file}.${path.ext}) for variation (${chartEditorState.selectedVariation})');

vocalsEntry.vocalsEntryLabel.text = 'Drag and drop vocals for $charName here, or click to browse.';
vocalsEntry.vocalsEntryLabel.text = 'Click to browse for vocals for $charName.';
}
};

vocalsEntry.onClick = function(_event)
{
Dialogs.openBinaryFile('Open $charName Vocals', [{label: 'Audio File (.ogg)', extension: 'ogg'}], function(selectedFile)
{
{

{
hasClearedVocals = true;
chartEditorState.success('Loaded Vocals', 'Loaded vocals for $charName (${selectedFile.name}), variation ${chartEditorState.selectedVariation}');

vocalsEntry.vocalsEntryLabel.text = 'Voices for $charName (drag and drop, or click to browse)\nSelected file: ${selectedFile.name}';
vocalsEntry.vocalsEntryLabel.text = 'Voices for $charName (click to browse)\n${selectedFile.name}';

dialogNoVocals.hidden = true;
}
else
{

chartEditorState.error('Failed to Load Vocals',
'Failed to load vocal track (${selectedFile.name}) for variation (${chartEditorState.selectedVariation})');

vocalsEntry.vocalsEntryLabel.text = 'Drag and drop vocals for $charName here, or click to browse.';
vocalsEntry.vocalsEntryLabel.text = 'Click to browse for vocals for $charName.';
}
}
});
}

dropHandler.handler = onDropFile;

dropHandlers.push(dropHandler);

vocalContainer.addComponent(vocalsEntry);
}
}

public static function build(state:ChartEditorState, charIds:Array<String>, ?closable:Bool, ?modal:Bool):ChartEditorUploadVocalsDialog
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

class ChartEditorUploadVocalsEntry extends Box
{


public function new(charName:String)
{
super();

this.charName = charName;

vocalsEntryLabel.text = 'Drag and drop vocals for $charName here, or click to browse.';
vocalsEntryLabel.text = 'Click to browse for vocals for $charName.';

this.onMouseOver = function(_event)
{
this.swapClass('upload-bg', 'upload-bg-hover');
Cursor.cursorMode = Pointer;
}

this.onMouseOut = function(_event)
{
this.swapClass('upload-bg-hover', 'upload-bg');
Cursor.cursorMode = Default;
}
}
}
