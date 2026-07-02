


/**
* Handles dialogs for the new Chart Editor.
*/
class ChartEditorDialogHandler
{

/**
* Builds and opens a dialog giving brief credits for the chart editor.
* @param state The current chart editor state.
* @return The dialog that was opened.
*/
public static function openAboutDialog(state:ChartEditorState):Null<Dialog>
{


}

/**
* Builds and opens a dialog letting the user create a new chart, open a recent chart, or load from a template.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openWelcomeDialog(state:ChartEditorState, closable:Bool = true):Null<Dialog>
{



}

/**
* Builds and opens a dialog letting the user browse for a chart file to open.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openBrowseFNFC(state:ChartEditorState, closable:Bool):Null<Dialog>
{


}

/**
* Builds and opens a dialog where the user uploads vocals for the current song.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openUploadVocalsDialog(state:ChartEditorState, closable:Bool = true):Dialog
{





}

/**
* Builds and opens the dialog for selecting a character.
*/
public static function openCharacterDropdown(state:ChartEditorState, charType:CharacterType, lockPosition:Bool = false):Null<Menu>
{


}

/**
* Builds and opens a dialog letting the user know a backup is available, and prompting them to load it.
*/
public static function openBackupAvailableDialog(state:ChartEditorState, welcomeDialog:Null<Dialog>):Null<Dialog>
{
dialog.onDialogClosed = function(event)
{
{
}
else
{
}



{
}

buttonCancel.onClick = function(_)
{
}

buttonGoToFolder.onClick = function(_)
{
}

buttonOpenBackup.onClick = function(_)
{

{
{
}
else
{
}

}
else
{

}
}

}

/**
* Open the wizard for opening an existing chart from individual files.
* @param state
* @param closable
*/
public static function openBrowseWizard(state:ChartEditorState, closable:Bool):Void
{
openChartDialog.onDialogClosed = function(event)
{
{
uploadInstDialog.onDialogClosed = function(event)
{
{
uploadVocalsDialog.onDialogClosed = function(event)
{
state.currentWorkingFilePath = null; // Built from parts, so no .fnfc to save to.
}
}
else
{
}
}
else
{
}
}

public static function openImportChartWizard(state:ChartEditorState, format:String, closable:Bool):Void
{
openChartDialog.onDialogClosed = function(event)
{
{
uploadInstDialog.onDialogClosed = function(event)
{
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.currentWorkingFilePath = null; // New file, so no path.
}
}
else
{
}
}
else
{
}
}

public static function openCreateSongWizardBasicOnly(state:ChartEditorState, closable:Bool):Void
{
songMetadataDialog.onDialogClosed = function(event)
{
{
uploadInstDialog.onDialogClosed = function(event)
{
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.currentWorkingFilePath = null; // New file, so no path.
}
}
else
{
}
}
else
{
}
}

public static function openCreateSongWizardErectOnly(state:ChartEditorState, closable:Bool):Void
{
songMetadataDialog.onDialogClosed = function(event)
{
{
uploadInstDialog.onDialogClosed = function(event)
{
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.currentWorkingFilePath = null; // New file, so no path.
}
}
else
{
}
}
else
{
}
}

public static function openCreateSongWizardBasicErect(state:ChartEditorState, closable:Bool):Void
{
songMetadataDialog.onDialogClosed = function(event)
{
{
uploadInstDialog.onDialogClosed = function(event)
{
{
uploadVocalsDialog.onDialogClosed = function(_)
{
songMetadataDialogErect.onDialogClosed = function(event)
{
{

uploadInstDialogErect.onDialogClosed = function(event)
{
{
uploadVocalsDialogErect.onDialogClosed = function(_)
{
state.currentWorkingFilePath = null; // New file, so no path.
}
}
else
{
}
}
else
{
}
}
}
}
else
{
}
}
else
{
}
}

/**
* Builds and opens a dialog where the user uploads an instrumental for the current song.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openUploadInstDialog(state:ChartEditorState, closable:Bool = true):Dialog
{


buttonCancel.onClick = function(_)
{
}


instrumentalBox.onMouseOver = function(_)
{
}

instrumentalBox.onMouseOut = function(_)
{
}



instrumentalBox.onClick = function(_)
{
Dialogs.openBinaryFile('Open Instrumental', [{label: 'Audio File (.ogg)', extension: 'ogg'}], function(selectedFile:SelectedFileInfo)
{
{
{

}
else
{
}
}
}

{
{

}
else
{
{
}
else
{
}

}



}

/**
* Opens the dialog in the wizard where the user can set song metadata like name and artist and BPM.
* @param state The ChartEditorState instance.
* @param erect Whether to create erect difficulties or normal ones.
* @param targetVariation The variation to create difficulties for.
* @param clearExistingMetadata Whether to clear existing metadata when confirming.
* @return The dialog to open.
*/
public static function openSongMetadataDialog(state:ChartEditorState, erect:Bool, targetVariation:String, clearExistingMetadata:Bool):Dialog
{

{
}

buttonCancel.onClick = function(_)
{
}



inputSongName.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputSongArtist.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputSongCharter.onChange = function(event:UIEvent)
{

{
}
else
{
}

inputStage.onChange = function(event:UIEvent)
{

inputNoteStyle.onChange = function(event:UIEvent)
{

inputCharacterPlayer.onChange = function(event:UIEvent)
{

inputCharacterOpponent.onChange = function(event:UIEvent)
{

inputCharacterGirlfriend.onChange = function(event:UIEvent)
{

dialogBPM.onChange = function(event:UIEvent)
{

{
}
else
{
}


dialogContinue.onClick = (_) ->
{
{
}


Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset; // Loads from the metadata.
Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);



}

}

/**
* Builds and opens a dialog where the user upload the JSON files for a song.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openChartDialog(state:ChartEditorState, closable:Bool = true):Dialog
{

buttonCancel.onClick = function(_)
{
}



buttonContinue.onClick = function(_)
{

}


{
{
}


state.addDropHandler({
component: songDefaultChartDataEntry,
handler: onDropFileChartDataVariation.bind(Constants.DEFAULT_VARIATION).bind(songDefaultChartDataEntryLabel)

for (variation in variations)
{

songVariationMetadataEntry.onMouseOver = function(_)
{
}
songVariationMetadataEntry.onMouseOut = function(_)
{
}
state.addDropHandler({
component: songVariationMetadataEntry,
handler: onDropFileMetadataVariation.bind(variation).bind(songVariationMetadataEntryLabel)


songVariationChartDataEntry.onMouseOver = function(_)
{
}
songVariationChartDataEntry.onMouseOut = function(_)
{
}
state.addDropHandler({
component: songVariationChartDataEntry,
handler: onDropFileChartDataVariation.bind(variation).bind(songVariationChartDataEntryLabel)
}
}

onDropFileMetadataVariation = function(variation:String, label:Label, pathStr:String)
{


{
}


{
}





onClickMetadataVariation = function(variation:String, label:Label, _:UIEvent)
{
Dialogs.openBinaryFile('Open Chart ($variation) Metadata', [{label: 'JSON File (.json)', extension: 'json'}], function(selectedFile)
{
{


{
}


{



}
else
{
}
}
}

onDropFileChartDataVariation = function(variation:String, label:Label, pathStr:String)
{


{
}


{


}
else
{
}

onClickChartDataVariation = function(variation:String, label:Label, _:UIEvent)
{
Dialogs.openBinaryFile('Open Chart ($variation) Metadata', [{label: 'JSON File (.json)', extension: 'json'}], function(selectedFile)
{
{


{
}


{


}
}
}



metadataEntry.onMouseOver = function(_event)
{
}
metadataEntry.onMouseOut = function(_)
{
}


}

/**
* Builds and opens a dialog where the user can import a chart from an existing file format.
* @param state The current chart editor state.
* @param format The format to import from.
* @param closable
* @return Dialog
*/
public static function openImportChartDialog(state:ChartEditorState, format:String, closable:Bool = true):Null<Dialog>
{

{
}

{
case 'legacy':
case 'stepmania':
case 'osumania':
}

{
case 'osumania':
case 'stepmania':
}

{
case 'json':
case 'sm':
case 'osu':




{
}

buttonCancel.onClick = function(_)
{
}


{
}
{
}


{


{
}

switch (format)
{
case 'legacy':

{
}


case 'stepmania':

{
}



case 'osumania':

{
}
else if (osuManiaData.General.Mode != 3)
{
state.error('Failure',
}


}

{
}


{
Dialogs.openBinaryFile('Import Chart - ${prettyFormat}', fileFilter ?? [], function(selectedFile:SelectedFileInfo)
{
{
}
}

onDropFile = function(pathStr:String)
{


}

/**
* Builds and opens a dialog displaying the user guide, providing guidance and help on how to use the chart editor.
*
* @param state The current chart editor state.
* @return The dialog that was opened.
*/
public static function openUserGuideDialog(state:ChartEditorState):Null<Dialog>
{
}

/**
* Builds and opens a dialog where the user can add a new variation for a song.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openAddVariationDialog(state:ChartEditorState, closable:Bool = true):Dialog
{


buttonCancel.onClick = function(_)
{
}

buttonAdd.onClick = function(_)
{
}






dialogCharacterPlayer.value = ChartEditorDropdowns.populateDropdownWithCharacters(dialogCharacterPlayer, CharacterType.BF,

dialogCharacterOpponent.value = ChartEditorDropdowns.populateDropdownWithCharacters(dialogCharacterOpponent, CharacterType.DAD,

dialogCharacterGirlfriend.value = ChartEditorDropdowns.populateDropdownWithCharacters(dialogCharacterGirlfriend, CharacterType.GF,



{




state.difficultySelectDirty = true; // Force the Difficulty toolbox to update.



}

}

/**
* Builds and opens a dialog where the user can add a new difficulty for a song.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openAddDifficultyDialog(state:ChartEditorState, closable:Bool = true):Dialog
{


buttonCancel.onClick = function(_)
{
}

buttonAdd.onClick = function(_)
{
}



inputScrollSpeed.onChange = function(event:UIEvent)
{

difficultyForm.onSubmit = function(_)
{




}

}

/**
* Builds and opens a dialog where the user can copy an existing difficulty for a song.
* @param state The current chart editor state.
* @param deleteOriginal Whether to delete the original difficulty after copying.
*                       This essentially turns the copy into a move.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openCloneDifficultyDialog(state:ChartEditorState, deleteOriginal:Bool, closable:Bool = true):Dialog
{


buttonCancel.onClick = function(_)
{
}

dialogClone.onClick = function(_)
{
}



inputScrollSpeed.onChange = function(event:UIEvent)
{

difficultyForm.onSubmit = function(_)
{




{


}
else
{
}

}

}

/**
* Builds and opens a dialog where the user can confirm to leave the chart editor if they have unsaved changes.
* @param state The current chart editor state.
* @return The dialog that was opened.
*/
public static function openLeaveConfirmationDialog(state:ChartEditorState):Dialog
{
MessageBoxType.TYPE_YESNO, true, function(button:DialogButton)
{
{
}


dialog.onDialogClosed = function(event:UIEvent)
{


}

/**
* Builds and opens a dialog from a given layout path.
* @param modal Makes the background uninteractable while the dialog is open.
* @param closable Hides the close button on the dialog, preventing it from being closed unless the user interacts with the dialog.
*/
static function openDialog(state:ChartEditorState, key:String, modal:Bool = true, closable:Bool = true):Null<Dialog>
{


dialog.onDialogClosed = function(event:UIEvent)
{


}


/**
* Add a callback for when a file is dropped on a component.
*
* On OS X you can’t drop on the application window, but rather only the app icon
* (either in the dock while running or the icon on the hard drive) so this must be disabled
* and UI updated appropriately.
*/
public static function addDropHandler(state:ChartEditorState, dropTarget:DialogDropTarget):Void
{

}

/**
* Remove a callback for when a file is dropped on a component.
*/
public static function removeDropHandler(state:ChartEditorState, dropTarget:DialogDropTarget):Void
{
}

/**
* Clear ALL drop handlers, including the core handler.
* Call this only when leaving the chart editor entirely.
*/
public static function clearDropHandlers(state:ChartEditorState):Void
{
}


static function onDropFile(path:String, state:String, x:Float, y:Float):Void
{
new FlxTimer().start(EPSILON, function(_)
{
for (handler in dropHandlers)
{
{
}
}
}
}
