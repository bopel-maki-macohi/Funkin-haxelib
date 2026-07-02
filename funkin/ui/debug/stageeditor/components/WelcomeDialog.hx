package funkin.ui.debug.stageeditor.components;


class WelcomeDialog extends Dialog
{

override public function new(state:StageEditorState)
{
super();

stageEditorState = state;

buttonNew.onClick = function(_)
{
stageEditorState.clearAssets();
stageEditorState.loadDummyData();
stageEditorState.currentFile = "";
killDaDialog();
}

for (file in Save.instance.stageEditorPreviousFiles.value)
{



fileText.percentWidth = 100;
fileText.text = patj.file + "." + patj.ext;
fileText.onClick = function(_)
{
fileText.hide();
loadFromFilePath(file, null, 0, 0);
};


fileText.tooltip = "Full Name: " + file + "\nLast Modified: " + stat.mtime.toString() + "\nSize: " + sizeInMB + " MB";

contentRecent.addComponent(fileText);
}

boxDrag.onClick = function(_) FileUtil.browseForBinaryFile("Open Stage Data", [FileUtil.FILE_EXTENSION_INFO_FNFS],
(fileInfo) -> loadFromFilePath(fileInfo.fullPath, null, 0, 0));

defaultStages.sort(funkin.util.SortUtil.alphabetically);

for (stage in defaultStages)
{

link.percentWidth = 100;
link.text = baseStage.name;

link.onClick = function(_) loadFromPreset(baseStage);

contentPresets.addComponent(link);
}

}

public function loadFromPreset(data:StageData)
{

{
Dialogs.messageBox("You will lose all of your unsaved work.\n\nAre you sure? This cannot be undone.", "Load Stage", MessageBoxType.TYPE_YESNO, true,
function(btn:DialogButton)
{
{
stageEditorState.saved = true;
loadFromPreset(data);
}
});

}

stageEditorState.clearAssets();
stageEditorState.currentFile = "";
stageEditorState.loadFromDataRaw(data);
killDaDialog();
}

public function loadFromFilePath(file:String, state:String, x:Float, y:Float)
{
{
Dialogs.messageBox("You will lose all of your unsaved work.\n\nAre you sure? This cannot be undone.", "Load Stage", MessageBoxType.TYPE_YESNO, true,
function(btn:DialogButton)
{
{
stageEditorState.saved = true;
loadFromFilePath(file, state, x, y);
}
});

}


{
stageEditorState.notifyChange("Problem Loading the Stage", "The Stage File could not be loaded.", true);
}

stageEditorState.clearAssets();
stageEditorState.currentFile = file;
stageEditorState.unpackShitFromZip(bytes);
killDaDialog();
}

function killDaDialog()
{
stageEditorState.updateDialog(StageEditorDialogType.OBJECT_GRAPHIC);
stageEditorState.updateDialog(StageEditorDialogType.OBJECT_PROPERTIES);
stageEditorState.updateDialog(StageEditorDialogType.CHARACTER);
stageEditorState.updateDialog(StageEditorDialogType.STAGE);

hide();
destroy();
}
}
