

/**
* This is a data structure managing information about the current song.
* This structure is created when the game starts, and includes all the data
* from the `metadata.json` file.
* It also includes the chart data, but only when this is the currently loaded song.
*
* It also receives script events; scripted classes which extend this class
* can be used to perform custom gameplay behaviors only on specific songs.
*/
class Song implements IPlayStateScriptedClass implements IRegistryEntry<SongMetadata>
{
/**
* The default value for the song's name
*/

/**
* The default value for the song's artist
*/

/**
* The default value for the song's time format
*/

/**
* The default value for the song's divisions
*/

/**
* The default value for whether the song loops.
*/

/**
* The default value for the song's playable stage.
*/

/**
* The default value for the song's scroll speed.
*/


/**
* holds the difficulties (as in SongDifficulty) for each variation
* difficulties.get('default').get('easy') would return the easy difficulty for the default variation
*/

/**
* The list of variations a song has.
*/

function get_variations():Array<String>
{
}

public function isSongNew(currentDifficulty:String, currentVariation:String):Bool
{
}

/**
* Set to false if the song was edited in the charter and should not be saved as a high score.
*/

/**
* The readable name of the song.
*/

function get_songName():String
{
}

/**
* The artist of the song.
*/

function get_songArtist():String
{
}

/**
* The artist of the song.
*/

function get_charter():String
{
}


/**
* @param id The ID of the song to load.
* @param targetVariation The variation to load, optional.
*/
public function new(id:String, ?params:SongParams)
{




{
for (vari in _data.playData.songVariations)
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

{
}

}

/**
* Build a song from existing metadata rather than loading it from the `assets` folder.
* Used by the Chart Editor.
*
* @param songId The ID of the song.
* @param metadata The metadata of the song.
* @param variations The list of variations this song has.
* @param charts The chart data for each variation.
* @param includeScript Whether to initialize the scripted class tied to the song, if it exists.
* @param validScore Whether the song is elegible for highscores.
* @return The constructed song object.
*/
public static function buildRaw(songId:String, metadata:Array<SongMetadata>, variation:String, charts:Map<String, SongChartData>, includeScript:Bool = true,
validScore:Bool = false):Song
{

{
}
else
{
result = SongRegistry.instance.createEntry(songId);
}


for (meta in metadata)
{
}


for (variation => chartData in charts)
{
}


}

/**
* Retrieve a list of the raw metadata for the song.
* @return The metadata JSON objects for the song's variations.
*/
public function getRawMetadata():Array<SongMetadata>
{
}

/**
* List the album IDs for each variation of the song.
* @return A map of variation IDs to album IDs.
*/
public function listAlbums(variation:String):Map<String, String>
{

for (variationMap in difficulties)
{
for (difficultyId in variationMap.keys())
{
{
}
}
}

}

/**
* Input a difficulty ID and a variation ID, and get the album ID.
* @param diffId
* @param variation
* @return String
*/
public function getAlbumId(diffId:String, variation:String):String
{

}

public function getStickerPackId(diffId:String, variation:String):Null<String>
{

}

/**
* Populate the difficulty data from the provided metadata.
* Does not load chart data (that is triggered later when we want to play the song).
*/
function populateDifficulties():Void
{

for (metadata in _metadata.values())
{

{
}


for (diffId in metadata.playData.difficulties)
{




}
}
}

/**
* Parse and cache the chart for all difficulties of this song.
* @param force Whether to forcibly clear the list of charts first.
*/
public function cacheCharts(force:Bool = false):Void
{
{
}

for (vari in variations)
{
}
}

function applyChartData(chartData:SongChartData, vari:String):Void
{

for (diffId in chartNotes.keys())
{


{

{


}
}

}
}

/**
* Retrieve the metadata for a specific difficulty, including the chart if it is loaded.
* @param diffId The difficulty ID, such as `easy` or `hard`.
* @param variation The variation ID to fetch the difficulty for. Or you can use `variations`.
* @param variations A list of variations to fetch the difficulty for. Looks for the first variation that exists.
* @return The difficulty data.
*/
public function getDifficulty(?diffId:String, ?variation:String, ?variations:Array<String>):Null<SongDifficulty>
{

for (currentVariation in variations)
{
{
}
}

}

/**
* Returns the first valid variation that matches both the difficulty id, and the current character / possible input variations
* @param diffId
* @param currentCharacter
* @param possibleVariations
* @return Null<String>
*/
public function getFirstValidVariation(?diffId:String, ?currentCharacter:PlayableCharacter, ?possibleVariations:Array<String>):Null<String>
{
{
}


for (variationId in possibleVariations)
{
}

}

/**
* Given that this character is selected in the Freeplay menu,
* which variations should be available?
* @param char The playable character to query.
* @return An array of available variations.
*/
public function getVariationsByCharacter(?char:PlayableCharacter):Array<String>
{
{
}

for (variation in variations)
{


{
}
}


}

/**
* Nearly the same thing as getVariationsByCharacter, but takes a character ID instead.
* @param charId
* @return Array<String>
* @see getVariationsByCharacter
*/
public function getVariationsByCharacterId(?charId:String):Array<String>
{

}

/**
* List all the difficulties in this song.
*
* @param variationId Optionally filter by a single variation.
* @param variationIds Optionally filter by multiple variations.
* @param showLocked Include charts which are not unlocked
* @param showHidden Include charts which are not accessible to the player.
*
* @return The list of difficulties.
*/
public function listDifficulties(?variationId:String, ?variationIds:Array<String>, showLocked:Bool = false, showHidden:Bool = false):Array<String>
{


{
})
.flatten()
.filterNull()

diffFiltered = diffFiltered.filter(function(diffId:String):Bool
{
for (targetVariation in variationIds)
{
}


}

/**
* TODO: This line of code makes me sad, but you can't really fix it without a breaking migration.
* @return `easy`, `erect`, `normal-pico`, etc.
* @deprecated This function is deprecated, Funkin no longer uses suffixed difficulties.
*/
public function listSuffixedDifficulties(variationIds:Array<String>, ?showLocked:Bool, ?showHidden:Bool):Array<String>
{

for (variation in variationIds)
{
for (difficulty in difficulties)
{
}
}


}

public function hasDifficulty(diffId:String, ?variationId:String, ?variationIds:Array<String>):Bool
{

for (targetVariation in variationIds)
{
}
}

public function isDifficultyVisible(diffId:String, variationId:String):Bool
{
}

/**
* Return the list of available alternate instrumentals.
* Scripts can override this, fun.
* @param variationId
* @param difficultyId
*/
public function listAltInstrumentalIds(difficultyId:String, variationId:String):Array<String>
{

}

public function getBaseInstrumentalId(difficultyId:String, variationId:String):String
{

}

/**
* Purge the cached chart data for each difficulty/variation of this song.
*/
public function clearCharts():Void
{
for (variationMap in difficulties)
{
for (diff in variationMap)
{
}
}
}

public function onPause(event:PauseScriptEvent):Void
{

public function onResume(event:ScriptEvent):Void
{

public function onSongLoaded(event:SongLoadScriptEvent):Void
{

public function onSongStart(event:ScriptEvent):Void
{

public function onSongEnd(event:ScriptEvent):Void
{

public function onGameOver(event:ScriptEvent):Void
{

public function onSongRetry(event:SongRetryEvent):Void
{

public function onNoteIncoming(event:NoteScriptEvent)
{

public function onNoteHit(event:HitNoteScriptEvent)
{

public function onNoteMiss(event:NoteScriptEvent):Void
{

public function onNoteHoldDrop(event:HoldNoteScriptEvent)
{
}

public function onNoteGhostMiss(event:GhostMissNoteScriptEvent):Void
{

public function onSongEvent(event:SongEventScriptEvent):Void
{

public function onStepHit(event:SongTimeScriptEvent):Void
{

public function onBeatHit(event:SongTimeScriptEvent):Void
{

public function onCountdownStart(event:CountdownScriptEvent):Void
{

public function onCountdownStep(event:CountdownScriptEvent):Void
{

public function onCountdownEnd(event:CountdownScriptEvent):Void
{

public function onScriptEvent(event:ScriptEvent):Void
{

public function onCreate(event:ScriptEvent):Void
{

public function onDestroy(event:ScriptEvent):Void
{

public function onUpdate(event:UpdateScriptEvent):Void
{

static function _fetchData(id:String):Null<SongMetadata>
{
}

function fetchVariationMetadata(id:String, vari:String):Null<SongMetadata>
{
}


/**
* Validate that the variation ID is valid.
* Auto-accept if it's one of the base game default variations.
* Reject if the ID starts with a number, or contains invalid characters.
*/
static function validateVariationId(variation:String):Bool
{

}

static function log(message:String):Void
{
}
}

class SongDifficulty
{
/**
* The parent song for this difficulty.
*/

/**
* The difficulty ID, such as `easy` or `hard`.
*/

/**
* The metadata file that contains this difficulty.
*/

/**
* The note chart for this difficulty.
*/

/**
* The event chart for this difficulty.
*/






public function new(song:Song, diffId:String, variation:String)
{
}

public function clearChart():Void
{
}

public function getStartingBPM():Float
{
{
}

}

public function getEvents():Array<SongEventData>
{
}

public function getInstPath(instrumental = ''):String
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

public function cacheInst(instrumental = ''):Void
{
}

public function playInst(volume:Float = 1.0, instId:String = '', looped:Bool = false):Void
{


}

/**
* Cache the vocals for a given character.
* @param id The character we are about to play.
*/
public function cacheVocals():Void
{
for (voice in buildVoiceList())
{
}
}

/**
* Build a list of vocal files for the given character.
* Automatically resolves suffixed character IDs (so bf-car will resolve to bf if needed).
*
* @param id The character we are about to play.
*/
public function buildVoiceList():Array<String>
{
{
}
}

public function buildPlayerVoiceList():Array<String>
{

{

for (voice in playerVoices)
{
}
}


{
}
{
{
}
}

}

public function buildOpponentVoiceList():Array<String>
{

{

for (voice in opponentVoices)
{
}
}


{
}
{
{
}
}

}

/**
* Create a VoicesGroup, an audio object that can play the vocals for all characters.
* @param charId The player ID.
* @return The generated vocal group.
*/
public function buildVocals(?instId:String = ''):VoicesGroup
{


for (playerVoice in playerVoiceList)
{
}

for (opponentVoice in opponentVoiceList)
{
}

{
{
}
}

{
}



}
}

typedef SongParams =
{
/**
* The variation to use for this song.
*/
}
