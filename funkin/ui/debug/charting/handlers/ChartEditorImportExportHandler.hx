package funkin.ui.debug.charting.handlers;


/**
* Contains functions for importing, loading, saving, and exporting charts.
*/
class ChartEditorImportExportHandler
{
public static final BACKUPS_PATH:String = './backups/charts/';

/**
* Fetch's a song's existing chart and audio and loads it, replacing the current song.
*/
public static function loadSongAsTemplate(state:ChartEditorState, songId:String, targetSongDifficulty:String = null, targetSongVariation:String = null):Void
{




for (metadata in rawSongMetadata)
{

metadataClone.variation = variation;

}

loadSong(state, songMetadata, songChartData, new ChartManifestData(songId));

state.sortChartData();

ChartEditorAudioHandler.wipeInstrumentalData(state);
ChartEditorAudioHandler.wipeVocalData(state);

for (variation in state.availableVariations)
{
{
state.loadInstFromAsset(Paths.inst(songId));
}
else
{
state.loadInstFromAsset(Paths.inst(songId, '-$variation'), variation);
}

for (difficultyId in song.listDifficulties(variation, true, true))
{


for (voice in playerVoiceList)
{
state.loadVocalsFromAsset(voice, diff.characters.player, instId);
}

for (voice in opponentVoiceList)
{
state.loadVocalsFromAsset(voice, diff.characters.opponent, instId);
}

{
{
state.loadVocalsFromAsset(voiceFile, diff.characters.player, instId);
state.audioVocalTrackGroup.legacyVoiceSystem = true;
state.audioVocalTrackGroup.legacyVoiceUsesPlayer = true;
}
}

&& targetSongDifficulty != state.selectedDifficulty
&& targetSongDifficulty == diff.difficulty) state.selectedDifficulty = targetSongDifficulty;
&& targetSongVariation != state.selectedVariation
&& targetSongVariation == diff.variation) state.selectedVariation = targetSongVariation;
}
}

state.isHaxeUIDialogOpen = false;
state.currentWorkingFilePath = null; // New file, so no path.
state.switchToCurrentInstrumental();

state.postLoadInstrumental();

state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);

for (metadata in rawSongMetadata)
{
}

}

/**
* Loads a chart from parsed song metadata and chart data into the editor.
* @param newSongMetadata The song metadata to load.
* @param newSongChartData The song chart data to load.
*/
public static function loadSong(state:ChartEditorState, newSongMetadata:Map<String, SongMetadata>, newSongChartData:Map<String, SongChartData>,
?newSongManifestData:ChartManifestData):Void
{
state.songMetadata = newSongMetadata;
state.songChartData = newSongChartData;
{
state.songManifestData = newSongManifestData;
}

{
state.selectedVariation = Constants.DEFAULT_VARIATION;
}

for (variation => chart in state.songChartData)
{

for (diff => notes in chart.notes)
{


{
affectedDiffs.push(diff.toTitleCase());
stackedNotesCount += count;
}
}

{
affectedDiffs.sort(SortUtil.defaultsThenAlphabetically.bind(['Easy', 'Normal', 'Hard', 'Erect', 'Nightmare']));

flixel.util.FlxTimer.wait(delay, () ->
{
state.warning('Stacked Notes Detected',
'Found $stackedNotesCount stacked note(s) in \'${variation.toTitleCase()}\' variation, ' +
'on ${affectedDiffs.joinPlural()} difficult${affectedDiffs.length > 1 ? 'ies' : 'y'}.');
});
delay *= 1.5;
}
}

Conductor.instance.forceBPM(null); // Disable the forced BPM.
Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset; // Loads from the metadata.
Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);
state.updateTimeSignature();

state.notePreviewDirty = true;
state.notePreviewViewportBoundsDirty = true;
state.difficultySelectDirty = true;
state.opponentPreviewDirty = true;
state.playerPreviewDirty = true;

{
state.audioInstTrack.stop();
state.audioInstTrack = null;
}
state.audioVocalTrackGroup.stop();
state.audioVocalTrackGroup.clear();

state.undoHistory = [];
state.redoHistory = [];
state.commandHistoryDirty = true;
}

/**
* Load a chart's metadata, chart data, and audio from an FNFC file path.
* @param state
* @param path
* @return `null` on failure, `[]` on success, `[warnings]` on success with warnings.
*/
public static function loadFromFNFCPath(state:ChartEditorState, path:String):Null<Array<String>>
{


{
state.currentWorkingFilePath = path;
state.saveDataDirty = false; // Just loaded file!
}

}

/**
* Load a chart's metadata, chart data, and audio from an FNFC archive.
* @param state
* @param bytes
* @param instId
* @return `null` on failure, `[]` on success, `[warnings]` on success with warnings.
*/
public static function loadFromFNFC(state:ChartEditorState, bytes:Bytes):Null<Array<String>>
{



baseMetadataVersion) ?? throw 'Could not read metadata (default).';

songMetadatas.set(Constants.DEFAULT_VARIATION, baseMetadata);

baseChartDataVersion) ?? throw 'Could not read chart data (default).';

songChartDatas.set(Constants.DEFAULT_VARIATION, baseChartData);


for (variation in variationList)
{

songMetadatas.set(variation, variMetadata);

songChartDatas.set(variation, variChartData);
}
loadSong(state, songMetadatas, songChartDatas, manifest);

state.sortChartData();

ChartEditorAudioHandler.wipeInstrumentalData(state);
ChartEditorAudioHandler.wipeVocalData(state);

for (variation in state.availableVariations)
{



for (voice in playerVoiceList)
{
{
output.push('Could not find vocals ($playerVocalsFileName).');
}
else if (!ChartEditorAudioHandler.loadVocalsFromBytes(state, playerVocalsFileBytes, voice, instId))
{
output.push('Could not parse vocals ($playerCharId).');
}
}

for (voice in opponentVoiceList)
{
{
output.push('Could not find vocals ($opponentVocalsFileName).');
}
else if (!ChartEditorAudioHandler.loadVocalsFromBytes(state, opponentVocalsFileBytes, voice, instId))
{
output.push('Could not parse vocals ($opponentCharId).');
}
}
}


state.switchToCurrentInstrumental();
state.postLoadInstrumental();
state.refreshToolbox(ChartEditorState.CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);

}

/**
* Evaluates the list of backups,
* @return The file path to the latest chart backup, or null if no backups exist.
*/
public static function getLatestBackupPath():Null<String>
{
FileUtil.createDirIfNotExists(BACKUPS_PATH);

files = files.filter((file:String) ->
{
});

files.sort((a:String, b:String) ->
{
});



}

/**
* Retrieve the latest chart backup file, then return a string containing identifying info like the full filename and timestamp.
* @return The formatted info.
*/
public static function getLatestBackupInfo():Null<String>
{

latestBackupName = haxe.io.Path.withoutExtension(latestBackupName);


}

/**
* @param force Whether to export without prompting. `false` will prompt the user for a location.
* @param targetPath where to export if `force` is `true`. If `null`, will export to the `backups` folder.
* @param onSaveCb Callback for when the file is saved.
* @param onCancelCb Callback for when saving is cancelled.
*/
public static function exportAllSongData(state:ChartEditorState, force:Bool = false, targetPath:Null<String>, ?onSaveCb:String->Void,
?onCancelCb:Void->Void):Void
{


{
state.difficultySelectDirty = true;
}

for (variation in variations)
{
{
}

{
{
zipEntries.push(FileUtil.makeZIPEntry('${state.currentSongId}-metadata.json', variationMetadata.serialize()));
}
{
zipEntries.push(FileUtil.makeZIPEntry('${state.currentSongId}-chart.json', variationChart.serialize()));
}
}
else
{
{
zipEntries.push(FileUtil.makeZIPEntry('${state.currentSongId}-metadata-$variationId.json', variationMetadata.serialize()));
}
{
zipEntries.push(FileUtil.makeZIPEntry('${state.currentSongId}-chart-$variationId.json', variationChart.serialize()));
}
}
}


zipEntries.push(FileUtil.makeZIPEntry('manifest.json', state.songManifestData.serialize()));


{
{
targetMode = Skip;
targetPath = Path.join([BACKUPS_PATH, 'chart-editor-${state.currentSongId}-${DateUtil.generateTimestamp()}.${Constants.EXT_CHART}']);
try
{
FileUtil.saveFilesAsZIPToPath(zipEntries, targetPath, targetMode);
}
catch (e)
{
}
}
else
{
try
{
FileUtil.saveFilesAsZIPToPath(zipEntries, targetPath, targetMode);
state.saveDataDirty = false;
}
catch (e)
{
}
}
}
else
{
{
{
state.applyWindowTitle();
}
else
{
state.currentWorkingFilePath = paths[0];
state.applyWindowTitle();
}
};

{
};

try
{
FileUtil.saveChartAsFNFC(zipEntries, onSave, onCancel, '${state.currentSongId}.${Constants.EXT_CHART}');
state.saveDataDirty = false;
}
catch (e)
{
}
}
}
}
