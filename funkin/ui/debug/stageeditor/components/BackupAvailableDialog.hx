package funkin.ui.debug.stageeditor.components;


using StringTools;

<dialog id="backupAvailableDialog" width="475" height="200" title="Hey! Listen!">
<vbox width="100%" height="100%">
<label text="There is a stage backup available, would you like to load it?\n" width="100%" textAlign="center" />
<spacer height="6" />
<label id="backupTimeLabel" text="Jan 1, 1970 0:00" width="100%" textAlign="center" />
<spacer height="100%" />
<hbox width="100%">
<button text="No Thanks" id="dialogCancel" />
<spacer width="100%" />
<button text="Open In Folder" id="buttonGoToFolder" />
<spacer width="100%" />
<button text="Load Backup" id="buttonOpenBackup" />
</hbox>
</vbox>
</dialog>
')
class BackupAvailableDialog extends Dialog
{
override public function new(state:StageEditorState, filePath:String)
{
super();




backupTimeLabel.text = "Full Name: " + file + "\nLast Modified: " + stat.mtime.toString() + "\nSize: " + sizeInMB + " MB";

dialogCancel.onClick = function(_) hideDialog(DialogButton.CANCEL);

buttonGoToFolder.onClick = function(_)
{
FileUtil.openFolder(absoluteBackupsPath);
}

buttonOpenBackup.onClick = function(_)
{
{
state.welcomeDialog.loadFromFilePath(filePath, null, 0, 0);
}
hideDialog(DialogButton.APPLY);
}

onDialogClosed = function(event)
{
{
}
};
}
}
