package funkin.ui.debug.charting.handlers;


using Lambda;

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

dialog.zIndex = 1000;
state.isHaxeUIDialogOpen = true;

}

/**
* Builds and opens a dialog letting the user create a new chart, open a recent chart, or load from a template.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openWelcomeDialog(state:ChartEditorState, closable:Bool = true):Null<Dialog>
{

dialog.zIndex = 1000;
state.isHaxeUIDialogOpen = true;

state.stopAudioPlayback();

}

/**
* Builds and opens a dialog letting the user browse for a chart file to open.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openBrowseFNFC(state:ChartEditorState, closable:Bool):Null<Dialog>
{

dialog.zIndex = 1000;
state.isHaxeUIDialogOpen = true;

}

/**
* Builds and opens a dialog where the user uploads vocals for the current song.
* @param state The current chart editor state.
* @param closable Whether the dialog can be closed by the user.
* @return The dialog that was opened.
*/
public static function openUploadVocalsDialog(state:ChartEditorState, closable:Bool = true):Dialog
{




dialog.zIndex = 1000;
state.isHaxeUIDialogOpen = true;

}

/**
* Builds and opens the dialog for selecting a character.
*/
public static function openCharacterDropdown(state:ChartEditorState, charType:CharacterType, lockPosition:Bool = false):Null<Menu>
{

menu.zIndex = 1000;

}

/**
* Builds and opens a dialog letting the user know a backup is available, and prompting them to load it.
*/
public static function openBackupAvailableDialog(state:ChartEditorState, welcomeDialog:Null<Dialog>):Null<Dialog>
{
dialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
}
else
{
}
};

state.isHaxeUIDialogOpen = true;


{
backupTimeLabel.text = latestBackupInfo;
}

buttonCancel.onClick = function(_)
{
dialog.hideDialog(DialogButton.CANCEL);
}

buttonGoToFolder.onClick = function(_)
{
state.openBackupsFolder();
}

buttonOpenBackup.onClick = function(_)
{

{
{
state.success('Loaded Chart', 'Loaded chart (${latestBackupPath})');
}
else
{
state.warning('Loaded Chart', 'Loaded chart (${latestBackupPath})\n${result.join("\n")}');
}

dialog.hideDialog(DialogButton.APPLY);
}
else
{
state.error('Failed to Load Chart', 'Failed to load chart (${latestBackupPath})');

dialog.hideDialog(DialogButton.CANCEL);
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
state.isHaxeUIDialogOpen = false;
{
uploadInstDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadVocalsDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
state.currentWorkingFilePath = null; // Built from parts, so no .fnfc to save to.
state.switchToCurrentInstrumental();
state.postLoadInstrumental();
}
}
else
{
state.openWelcomeDialog(closable);
}
};
}
else
{
state.openWelcomeDialog(closable);
}
};
}

public static function openImportChartWizard(state:ChartEditorState, format:String, closable:Bool):Void
{
openChartDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadInstDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.isHaxeUIDialogOpen = false;
state.currentWorkingFilePath = null; // New file, so no path.
state.switchToCurrentInstrumental();
state.postLoadInstrumental();
}
}
else
{
state.openWelcomeDialog(closable);
}
};
}
else
{
state.openWelcomeDialog(closable);
}
};
}

public static function openCreateSongWizardBasicOnly(state:ChartEditorState, closable:Bool):Void
{
songMetadataDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadInstDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.isHaxeUIDialogOpen = false;
state.currentWorkingFilePath = null; // New file, so no path.
state.switchToCurrentInstrumental();
state.postLoadInstrumental();
}
}
else
{
state.openWelcomeDialog(closable);
}
};
}
else
{
state.openWelcomeDialog(closable);
}
};
}

public static function openCreateSongWizardErectOnly(state:ChartEditorState, closable:Bool):Void
{
songMetadataDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadInstDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.isHaxeUIDialogOpen = false;
state.currentWorkingFilePath = null; // New file, so no path.
state.switchToCurrentInstrumental();
state.postLoadInstrumental();
}
}
else
{
state.openWelcomeDialog(closable);
}
};
}
else
{
state.openWelcomeDialog(closable);
}
};
}

public static function openCreateSongWizardBasicErect(state:ChartEditorState, closable:Bool):Void
{
songMetadataDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadInstDialog.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadVocalsDialog.onDialogClosed = function(_)
{
state.switchToCurrentInstrumental();
songMetadataDialogErect.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
state.selectedVariation = 'erect';

uploadInstDialogErect.onDialogClosed = function(event)
{
state.isHaxeUIDialogOpen = false;
{
uploadVocalsDialogErect.onDialogClosed = function(_)
{
state.isHaxeUIDialogOpen = false;
state.currentWorkingFilePath = null; // New file, so no path.
state.switchToCurrentInstrumental();
state.postLoadInstrumental();
}
}
else
{
state.openWelcomeDialog(closable);
}
};
}
else
{
state.openWelcomeDialog(closable);
}
}
}
}
else
{
state.openWelcomeDialog(closable);
}
};
}
else
{
state.openWelcomeDialog(closable);
}
};
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
dialog.hideDialog(DialogButton.CANCEL);
}


instrumentalBox.onMouseOver = function(_)
{
instrumentalBox.swapClass('upload-bg', 'upload-bg-hover');
Cursor.cursorMode = Pointer;
}

instrumentalBox.onMouseOut = function(_)
{
instrumentalBox.swapClass('upload-bg-hover', 'upload-bg');
Cursor.cursorMode = Default;
}



instrumentalBox.onClick = function(_)
{
Dialogs.openBinaryFile('Open Instrumental', [{label: 'Audio File (.ogg)', extension: 'ogg'}], function(selectedFile:SelectedFileInfo)
{
{
{
state.success('Loaded Instrumental', 'Loaded instrumental track (${selectedFile.name}) for variation (${state.selectedVariation})');

state.switchToCurrentInstrumental();
dialog.hideDialog(DialogButton.APPLY);
state.removeDropHandler(dropHandler);
}
else
{
state.error('Failed to Load Instrumental', 'Failed to load instrumental track (${selectedFile.name}) for variation (${state.selectedVariation})');
}
}
});
}

{
{
state.success('Loaded Instrumental', 'Loaded instrumental track (${path.file}.${path.ext}) for variation (${state.selectedVariation})');

state.switchToCurrentInstrumental();
dialog.hideDialog(DialogButton.APPLY);
state.removeDropHandler(dropHandler);
}
else
{
{
'File format (${path.ext}) not supported for instrumental track (${path.file}.${path.ext})';
}
else
{
'Failed to load instrumental track (${path.file}.${path.ext}) for variation (${state.selectedVariation})';
}

state.error('Failed to Load Instrumental', message);
}
};

dropHandler.handler = onDropFile;

state.addDropHandler(dropHandler);

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
dialog.title = 'New Chart - Provide Song Metadata (${targetVariation.toTitleCase()})';
}

state.isHaxeUIDialogOpen = true;
buttonCancel.onClick = function(_)
{
state.isHaxeUIDialogOpen = false;
dialog.hideDialog(DialogButton.CANCEL);
}


newSongMetadata.variation = targetVariation;
newSongMetadata.playData.difficulties = (erect) ? ['erect', 'nightmare'] : ['easy', 'normal', 'hard'];

inputSongName.onChange = function(event:UIEvent)
{

{
inputSongName.removeClass('invalid-value');
newSongMetadata.songName = event.target.text;
}
else
{
newSongMetadata.songName = "";
}
};
inputSongName.text = "";

inputSongArtist.onChange = function(event:UIEvent)
{

{
inputSongArtist.removeClass('invalid-value');
newSongMetadata.artist = event.target.text;
}
else
{
newSongMetadata.artist = "";
}
};
inputSongArtist.text = "";

inputSongCharter.onChange = function(event:UIEvent)
{

{
inputSongCharter.removeClass('invalid-value');
newSongMetadata.charter = event.target.text;
}
else
{
newSongMetadata.charter = "";
}
};
inputSongCharter.text = "";

inputStage.onChange = function(event:UIEvent)
{
newSongMetadata.playData.stage = event.data.id;
};
inputStage.value = startingValueStage;

inputNoteStyle.onChange = function(event:UIEvent)
{
newSongMetadata.playData.noteStyle = event.data.id;
};
inputNoteStyle.value = startingValueNoteStyle;

inputCharacterPlayer.onChange = function(event:UIEvent)
{
newSongMetadata.playData.characters.player = event.data.id;
};
newSongMetadata.playData.characters.player);
inputCharacterPlayer.value = startingValuePlayer;

inputCharacterOpponent.onChange = function(event:UIEvent)
{
newSongMetadata.playData.characters.opponent = event.data.id;
};
newSongMetadata.playData.characters.opponent);
inputCharacterOpponent.value = startingValueOpponent;

inputCharacterGirlfriend.onChange = function(event:UIEvent)
{
newSongMetadata.playData.characters.girlfriend = event.data.id == "none" ? "" : event.data.id;
};
newSongMetadata.playData.characters.girlfriend);
inputCharacterGirlfriend.value = startingValueGirlfriend;

dialogBPM.onChange = function(event:UIEvent)
{

{
timeChanges = [new SongTimeChange(0, event.value)];
}
else
{
timeChanges[0].bpm = event.value;
}

newSongMetadata.timeChanges = timeChanges;
};

dialogContinue.onClick = (_) ->
{
{
state.songMetadata.clear();
state.songChartData.clear();
state._songManifestData = null;
}

state.songMetadata.set(targetVariation, newSongMetadata);

Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset; // Loads from the metadata.
Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);
state.updateTimeSignature();

state.selectedVariation = Constants.DEFAULT_VARIATION;
state.selectedDifficulty = state.availableDifficulties[0];

state.difficultySelectDirty = true;

dialog.hideDialog(DialogButton.APPLY);
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
dialog.hideDialog(DialogButton.CANCEL);
}



buttonContinue.onClick = function(_)
{
state.loadSong(songMetadata, songChartData);

dialog.hideDialog(DialogButton.APPLY);
}


{
{
chartContainerB.removeComponent(chartContainerB.getComponentAt(0));
}

songDefaultChartDataEntryLabel.text = 'Drag and drop <song>-chart.json file, or click to browse.';
songDefaultChartDataEntryLabel.text = 'Click to browse for <song>-chart.json file.';

songDefaultChartDataEntry.onClick = onClickChartDataVariation.bind(Constants.DEFAULT_VARIATION).bind(songDefaultChartDataEntryLabel);
state.addDropHandler({
component: songDefaultChartDataEntry,
handler: onDropFileChartDataVariation.bind(Constants.DEFAULT_VARIATION).bind(songDefaultChartDataEntryLabel)
});
chartContainerB.addComponent(songDefaultChartDataEntry);

for (variation in variations)
{
songVariationMetadataEntryLabel.text = 'Drag and drop <song>-metadata-${variation}.json file, or click to browse.';
songVariationMetadataEntryLabel.text = 'Click to browse for <song>-metadata-${variation}.json file.';

songVariationMetadataEntry.onMouseOver = function(_)
{
songVariationMetadataEntry.swapClass('upload-bg', 'upload-bg-hover');
Cursor.cursorMode = Pointer;
}
songVariationMetadataEntry.onMouseOut = function(_)
{
songVariationMetadataEntry.swapClass('upload-bg-hover', 'upload-bg');
Cursor.cursorMode = Default;
}
songVariationMetadataEntry.onClick = onClickMetadataVariation.bind(variation).bind(songVariationMetadataEntryLabel);
state.addDropHandler({
component: songVariationMetadataEntry,
handler: onDropFileMetadataVariation.bind(variation).bind(songVariationMetadataEntryLabel)
});
chartContainerB.addComponent(songVariationMetadataEntry);

songVariationChartDataEntryLabel.text = 'Drag and drop <song>-chart-${variation}.json file, or click to browse.';
songVariationChartDataEntryLabel.text = 'Click to browse for <song>-chart-${variation}.json file.';

songVariationChartDataEntry.onMouseOver = function(_)
{
songVariationChartDataEntry.swapClass('upload-bg', 'upload-bg-hover');
Cursor.cursorMode = Pointer;
}
songVariationChartDataEntry.onMouseOut = function(_)
{
songVariationChartDataEntry.swapClass('upload-bg-hover', 'upload-bg');
Cursor.cursorMode = Default;
}
songVariationChartDataEntry.onClick = onClickChartDataVariation.bind(variation).bind(songVariationChartDataEntryLabel);
state.addDropHandler({
component: songVariationChartDataEntry,
handler: onDropFileChartDataVariation.bind(variation).bind(songVariationChartDataEntryLabel)
});
chartContainerB.addComponent(songVariationChartDataEntry);
}
}

onDropFileMetadataVariation = function(variation:String, label:Label, pathStr:String)
{


{
state.error('Failure', 'Could not parse metadata file version (${path.file}.${path.ext})');
}

songMetadataVersion);

{
state.error('Failure', 'Could not load metadata file (${path.file}.${path.ext})');
}

songMetadata.set(variation, songMetadataVariation);

state.success('Loaded Metadata', 'Loaded metadata file (${path.file}.${path.ext})');

label.text = 'Metadata file (drag and drop, or click to browse)\nSelected file: ${path.file}.${path.ext}';
label.text = 'Metadata file (click to browse)\n${path.file}.${path.ext}';

};

onClickMetadataVariation = function(variation:String, label:Label, _:UIEvent)
{
Dialogs.openBinaryFile('Open Chart ($variation) Metadata', [{label: 'JSON File (.json)', extension: 'json'}], function(selectedFile)
{
{


{
state.error('Failure', 'Could not parse metadata file version (${selectedFile.name})');
}

songMetadataVersion);

{
songMetadata.set(variation, songMetadataVariation);

state.success('Loaded Metadata', 'Loaded metadata file (${selectedFile.name})');

label.text = 'Metadata file (drag and drop, or click to browse)\nSelected file: ${selectedFile.name}';
label.text = 'Metadata file (click to browse)\n${selectedFile.name}';

}
else
{
state.error('Failure', 'Failed to load metadata file (${selectedFile.name})');
}
}
});
}

onDropFileChartDataVariation = function(variation:String, label:Label, pathStr:String)
{


{
state.error('Failure', 'Could not parse chart data file version (${path.file}.${path.ext})');
}

songChartDataVersion);

{
songChartData.set(variation, songChartDataVariation);
state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;
state.noteDisplayDirty = true;

state.success('Loaded Chart Data', 'Loaded chart data file (${path.file}.${path.ext})');

label.text = 'Chart data file (drag and drop, or click to browse)\nSelected file: ${path.file}.${path.ext}';
label.text = 'Chart data file (click to browse)\n${path.file}.${path.ext}';
}
else
{
state.error('Failure', 'Failed to load chart data file (${path.file}.${path.ext})');
}
};

onClickChartDataVariation = function(variation:String, label:Label, _:UIEvent)
{
Dialogs.openBinaryFile('Open Chart ($variation) Metadata', [{label: 'JSON File (.json)', extension: 'json'}], function(selectedFile)
{
{


{
state.error('Failure', 'Could not parse chart data file version (${selectedFile.name})');
}

songChartDataVersion);

{
songChartData.set(variation, songChartDataVariation);
state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;
state.noteDisplayDirty = true;

state.success('Loaded Chart Data', 'Loaded chart data file (${selectedFile.name})');

label.text = 'Chart data file (drag and drop, or click to browse)\nSelected file: ${selectedFile.name}';
label.text = 'Chart data file (click to browse)\n${selectedFile.name}';
}
}
});
}


metadataEntryLabel.text = 'Drag and drop <song>-metadata.json file, or click to browse.';
metadataEntryLabel.text = 'Click to browse for <song>-metadata.json file.';

metadataEntry.onClick = onClickMetadataVariation.bind(Constants.DEFAULT_VARIATION).bind(metadataEntryLabel);
state.addDropHandler({component: metadataEntry, handler: onDropFileMetadataVariation.bind(Constants.DEFAULT_VARIATION).bind(metadataEntryLabel)});
metadataEntry.onMouseOver = function(_event)
{
metadataEntry.swapClass('upload-bg', 'upload-bg-hover');
Cursor.cursorMode = Pointer;
}
metadataEntry.onMouseOut = function(_)
{
metadataEntry.swapClass('upload-bg-hover', 'upload-bg');
Cursor.cursorMode = Default;
}

chartContainerA.addComponent(metadataEntry);

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
case 'legacy': 'FNF Legacy';
case 'stepmania': 'StepMania';
case 'osumania': 'osu!Mania';
default: 'Unknown';
}

{
case 'legacy':
[{label: 'JSON Data File (.json)', extension: 'json'}];
case 'stepmania':
[{label: 'StepMania File (.sm)', extension: 'sm'}];
case 'osumania':
[{label: 'OSU! Beatmap File (.osu)', extension: 'osu'}];
default: null;
}

{
case 'osumania':
"osu";
case 'stepmania':
"sm";
default: "json";
}

{
case 'json':
'JSON Data File';
case 'sm':
'StepMania File';
case 'osu':
'osu! Beatmap File';
default: "Unknown File Type";
};
fileFilterLabel += ' (.$fileExt)';

dialog.title = 'Import Chart - ${prettyFormat}';



{
}

state.isHaxeUIDialogOpen = true;
buttonCancel.onClick = function(_)
{
state.isHaxeUIDialogOpen = false;
dialog.hideDialog(DialogButton.CANCEL);
}


{
Cursor.cursorMode = Pointer;
}
{
Cursor.cursorMode = Default;
}


{


{
state.error('Failure', 'Given file extension ".${path.ext}" was not the requested extension ".$fileExt"');
}

switch (format)
{
case 'legacy':

{
state.error('Failure', 'Failed to parse FNF chart file (${path.file}.${path.ext})');
}

songMetadata = FNFLegacyImporter.migrateMetadata(fnfLegacyData);
songChartData = FNFLegacyImporter.migrateChartData(fnfLegacyData);

loadedText = 'Loaded chart file';
case 'stepmania':

{
state.error('Failure', 'Failed to parse StepMania step file (${path.file}.${path.ext})');
}

songMetadata = StepManiaImporter.migrateChartMetadata(stepmaniaData);
songChartData = StepManiaImporter.migrateChartData(stepmaniaData);

loadedText = 'Loaded step file';

case 'osumania':

{
state.error('Failure', 'Failed to parse osu!Mania beatmap file (${path.file}.${path.ext})');
}
else if (osuManiaData.General.Mode != 3)
{
state.error('Failure',
'Not a osu!mania beatmap!\nGiven beatmap seems to be a ${modes[osuManiaData.General.Mode]} beatmap (${path.file}.${path.ext})');
}

songMetadata = OsuManiaImporter.migrateMetadata(osuManiaData);
songChartData = OsuManiaImporter.migrateChartData(osuManiaData);

loadedText = 'Loaded beatmap file';
}

{
state.error('Failure', 'Failed to load song (${path.file}.${path.ext})');
}
state.loadSong([Constants.DEFAULT_VARIATION => songMetadata], [Constants.DEFAULT_VARIATION => songChartData]);

dialog.hideDialog(DialogButton.APPLY);
state.success('Success', '$loadedText (${path.file}.${path.ext})');
};

{
Dialogs.openBinaryFile('Import Chart - ${prettyFormat}', fileFilter ?? [], function(selectedFile:SelectedFileInfo)
{
{
onFileSelected(selectedFile.fullPath, selectedFile.bytes.toString());
}
});
}

onDropFile = function(pathStr:String)
{
onFileSelected(pathStr, selectedFileText);
};

state.addDropHandler({component: importBox, handler: onDropFile});

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
dialog.hideDialog(DialogButton.CANCEL);
}

buttonAdd.onClick = function(_)
{
}

dialogSongName.value = state.currentSongMetadata.songName;

dialogSongArtist.value = state.currentSongMetadata.artist;

dialogSongCharter.value = state.currentSongMetadata.charter;

dialogStage.value = startingValueStage;

dialogNoteStyle.value = startingValueNoteStyle;

dialogCharacterPlayer.value = ChartEditorDropdowns.populateDropdownWithCharacters(dialogCharacterPlayer, CharacterType.BF,
state.currentSongMetadata.playData.characters.player);

dialogCharacterOpponent.value = ChartEditorDropdowns.populateDropdownWithCharacters(dialogCharacterOpponent, CharacterType.DAD,
state.currentSongMetadata.playData.characters.opponent);

dialogCharacterGirlfriend.value = ChartEditorDropdowns.populateDropdownWithCharacters(dialogCharacterGirlfriend, CharacterType.GF,
state.currentSongMetadata.playData.characters.girlfriend);

dialogBPM.value = currentStartingBPM;


state.isHaxeUIDialogOpen = true;
{
state.isHaxeUIDialogOpen = false;


dialogVariationName.text.toLowerCase());

pendingVariation.playData.stage = dialogStage.value.id;
pendingVariation.playData.noteStyle = dialogNoteStyle.value.id;
pendingVariation.timeChanges[0].bpm = dialogBPM.value;

state.songMetadata.set(pendingVariation.variation, pendingVariation);
state.refreshPlayDataVariations();
state.difficultySelectDirty = true; // Force the Difficulty toolbox to update.


state.success('Add Variation', 'Added new variation "${pendingVariation.variation}"');

dialog.hideDialog(DialogButton.APPLY);
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
dialog.hideDialog(DialogButton.CANCEL);
}

buttonAdd.onClick = function(_)
{
difficultyForm.submit();
}

dialogVariation.value = ChartEditorDropdowns.populateDropdownWithVariations(dialogVariation, state, true);


inputScrollSpeed.onChange = function(event:UIEvent)
{
labelScrollSpeed.text = 'Scroll Speed: ${inputScrollSpeed.value}x';
};
inputScrollSpeed.value = state.currentSongChartScrollSpeed;
labelScrollSpeed.text = 'Scroll Speed: ${inputScrollSpeed.value}x';

difficultyForm.onSubmit = function(_)
{


state.createDifficulty(dialogVariation.value.id, dialogDifficultyName.text.toLowerCase(), inputScrollSpeed.value ?? 1.0);

state.success('Add Difficulty', 'Added new difficulty "${dialogDifficultyName.text.toLowerCase()}"');

dialog.hideDialog(DialogButton.APPLY);
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
dialog.hideDialog(DialogButton.CANCEL);
}

dialogClone.onClick = function(_)
{
difficultyForm.submit();
}

dialogVariation.value = ChartEditorDropdowns.populateDropdownWithVariations(dialogVariation, state, true);


inputScrollSpeed.onChange = function(event:UIEvent)
{
labelScrollSpeed.text = 'Scroll Speed: ${inputScrollSpeed.value}x';
};
inputScrollSpeed.value = state.currentSongChartScrollSpeed;
labelScrollSpeed.text = 'Scroll Speed: ${inputScrollSpeed.value}x';

difficultyForm.onSubmit = function(_)
{



state.cloneDifficulty(variationToClone, difficultyToClone, targetVariation, targetDifficulty, inputScrollSpeed.value ?? 1.0);

{
state.removeDifficulty(variationToClone, difficultyToClone);
state.selectedDifficulty = targetDifficulty;
state.selectedVariation = targetVariation;

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);

state.success('Move Difficulty', 'Moved difficulty "$difficultyToClone" to "${dialogDifficultyName.text.toLowerCase()}"');
}
else
{
state.success('Clone Difficulty', 'Cloned difficulty "$difficultyToClone" to "${dialogDifficultyName.text.toLowerCase()}"');
}

dialog.hideDialog(DialogButton.APPLY);
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
state.isHaxeUIDialogOpen = false;
{
state.quitChartEditor();
}
});

dialog.destroyOnClose = true;
state.isHaxeUIDialogOpen = true;

dialog.onDialogClosed = function(event:UIEvent)
{
state.isHaxeUIDialogOpen = false;
};

dialog.zIndex = 1000;

}

/**
* Builds and opens a dialog from a given layout path.
* @param modal Makes the background uninteractable while the dialog is open.
* @param closable Hides the close button on the dialog, preventing it from being closed unless the user interacts with the dialog.
*/
static function openDialog(state:ChartEditorState, key:String, modal:Bool = true, closable:Bool = true):Null<Dialog>
{

dialog.destroyOnClose = true;
dialog.closable = closable;
dialog.showDialog(modal);

state.isHaxeUIDialogOpen = true;
dialog.onDialogClosed = function(event:UIEvent)
{
state.isHaxeUIDialogOpen = false;
};

dialog.zIndex = 1000;

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

dropHandlers.push(dropTarget);
}

/**
* Remove a callback for when a file is dropped on a component.
*/
public static function removeDropHandler(state:ChartEditorState, dropTarget:DialogDropTarget):Void
{
dropHandlers.remove(dropTarget);
}

/**
* Clear ALL drop handlers, including the core handler.
* Call this only when leaving the chart editor entirely.
*/
public static function clearDropHandlers(state:ChartEditorState):Void
{
dropHandlers = [];
}


static function onDropFile(path:String, state:String, x:Float, y:Float):Void
{
new FlxTimer().start(EPSILON, function(_)
{
for (handler in dropHandlers)
{
{
handler.handler(path);
}
}
});
}
}
