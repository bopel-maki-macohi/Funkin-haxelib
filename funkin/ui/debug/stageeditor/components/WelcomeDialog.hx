

class WelcomeDialog extends Dialog
{

override public function new(state:StageEditorState)
{


buttonNew.onClick = function(_)
{
}

for (file in Save.instance.stageEditorPreviousFiles.value)
{



fileText.onClick = function(_)
{



}

boxDrag.onClick = function(_) FileUtil.browseForBinaryFile("Open Stage Data", [FileUtil.FILE_EXTENSION_INFO_FNFS],


for (stage in defaultStages)
{



}

}

public function loadFromPreset(data:StageData)
{

{
Dialogs.messageBox("You will lose all of your unsaved work.\n\nAre you sure? This cannot be undone.", "Load Stage", MessageBoxType.TYPE_YESNO, true,
function(btn:DialogButton)
{
{
}

}

}

public function loadFromFilePath(file:String, state:String, x:Float, y:Float)
{
{
Dialogs.messageBox("You will lose all of your unsaved work.\n\nAre you sure? This cannot be undone.", "Load Stage", MessageBoxType.TYPE_YESNO, true,
function(btn:DialogButton)
{
{
}

}


{
}

}

function killDaDialog()
{

}
}
