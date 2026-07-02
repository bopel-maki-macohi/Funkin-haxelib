


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






buttonGoToFolder.onClick = function(_)
{
}

buttonOpenBackup.onClick = function(_)
{
{
}
}

onDialogClosed = function(event)
{
{
}
}
}
