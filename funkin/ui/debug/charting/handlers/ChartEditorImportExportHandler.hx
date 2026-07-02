

/**
* Contains functions for importing, loading, saving, and exporting charts.
*/
class ChartEditorImportExportHandler
{

/**
* Fetch's a song's existing chart and audio and loads it, replacing the current song.
*/
public static function loadSongAsTemplate(state:ChartEditorState, songId:String, targetSongDifficulty:String = null, targetSongVariation:String = null):Void
{




for (metadata in rawSongMetadata)
{


}




for (variation in state.availableVariations)
{
{
}
else
{
}

for (difficultyId in song.listDifficulties(variation, true, true))
{


for (voice in playerVoiceList)
{
}

for (voice in opponentVoiceList)
{
}

{
{
}
}

&& targetSongDifficulty != state.selectedDifficulty
&& targetSongVariation != state.selectedVariation
}
}

state.currentWorkingFilePath = null; // New file, so no path.



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
{
}

{
}

for (variation => chart in state.songChartData)
{

for (diff => notes in chart.notes)
{


{
}
}

{

flixel.util.FlxTimer.wait(delay, () ->
{
state.warning('Stacked Notes Detected',
'Found $stackedNotesCount stacked note(s) in \'${variation.toTitleCase()}\' variation, ' +
}
}

Conductor.instance.forceBPM(null); // Disable the forced BPM.
Conductor.instance.instrumentalOffset = state.currentInstrumentalOffset; // Loads from the metadata.
Conductor.instance.mapTimeChanges(state.currentSongMetadata.timeChanges);


{
}

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








for (variation in variationList)
{


}



for (variation in state.availableVariations)
{



for (voice in playerVoiceList)
{
{
}
else if (!ChartEditorAudioHandler.loadVocalsFromBytes(state, playerVocalsFileBytes, voice, instId))
{
}
}

for (voice in opponentVoiceList)
{
{
}
else if (!ChartEditorAudioHandler.loadVocalsFromBytes(state, opponentVocalsFileBytes, voice, instId))
{
}
}
}



}

/**
* Evaluates the list of backups,
* @return The file path to the latest chart backup, or null if no backups exist.
*/
public static function getLatestBackupPath():Null<String>
{

files = files.filter((file:String) ->
{

files.sort((a:String, b:String) ->
{



}

/**
* Retrieve the latest chart backup file, then return a string containing identifying info like the full filename and timestamp.
* @return The formatted info.
*/
public static function getLatestBackupInfo():Null<String>
{



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
}

for (variation in variations)
{
{
}

{
{
}
{
}
}
else
{
{
}
{
}
}
}




{
{
try
{
}
catch (e)
{
}
}
else
{
try
{
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
}
else
{
}

{

try
{
}
catch (e)
{
}
}
}
}
