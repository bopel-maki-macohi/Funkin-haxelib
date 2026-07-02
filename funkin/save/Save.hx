package funkin.save;


class Save implements ConsoleClass
{
public static final SAVE_DATA_VERSION:thx.semver.Version = "2.1.1";
public static final SAVE_DATA_VERSION_RULE:thx.semver.VersionRule = ">=2.1.0 <2.2.0";


/**
* Singleton for our Save class
*/


static function get_instance():Save
{
}


public static function load():Save
{

_instance ??= loadedSave;

}

public static function clearData():Void
{
_instance = Save.system.clearSlot(Constants.BASE_SAVE_SLOT);
}

/**
* Constructing a new Save will load the default values.
*/
public function new(?data:RawSaveData)
{
this.data = data ??= Save.getDefaultData();

updateVersionToLatest();
}

public static function getDefaultData():RawSaveData
{
version: thx.Dynamics.clone(Save.SAVE_DATA_VERSION),
volume: 1.0,
mute: false,
api: {
newgrounds: {
sessionId: null,
}
},
scores: {
levels: [],
songs: [],
},
favoriteSongs: [],
options: {
framerate: #if mobile refreshRate #else 60 #end,
naughtyness: true,
downscroll: false,
flashingLights: true,
zoomCamera: true,
debugDisplay: 'Off',
debugDisplayBGOpacity: 50,
subtitles: true,
hapticsMode: 'All',
hapticsIntensityMultiplier: 1,
autoPause: true,
vsyncMode: 'Off',
strumlineBackgroundOpacity: 0,
autoFullscreen: false,
globalOffset: 0,
audioVisualOffset: 0,
unlockedFramerate: false,
screenshot: {
shouldHideMouse: true,
fancyPreview: true,
previewOnSave: true,
},
controls: {
p1: {
keyboard: {
},
gamepad: {
},
},
p2: {
keyboard: {
},
gamepad: {
},
},
},
},
mobileOptions: {
screenTimeout: false,
controlsScheme: FunkinHitboxControlSchemes.Arrows,
noAds: false
},
mods: {
enabledMods: [],
modOptions: [],
},
unlocks: {
charactersSeen: ["bf"],
oldChar: false
},
optionsChartEditor: {
previousFiles: [],
noteQuant: 3,
chartEditorLiveInputStyle: ChartEditorLiveInputStyle.None,
theme: ChartEditorTheme.Light,
playtestStartTime: false,
playtestAudioSettings: false,
playtestResultsSettings: false,
downscroll: false,
showNoteKinds: true,
metronomeVolume: 1.0,
hitsoundVolumePlayer: 1.0,
hitsoundVolumeOpponent: 1.0,
instVolume: 1.0,
playerVoiceVolume: 1.0,
opponentVoiceVolume: 1.0,
playbackSpeed: 0.5,
themeMusic: true
},
optionsStageEditor: {
previousFiles: [],
moveStep: "1px",
angleStep: 5,
theme: StageEditorTheme.Light,
bfChar: "bf",
gfChar: "gf",
dadChar: "dad"
}
};
}

/**
* NOTE: Modifications will not be saved without calling `Save.flush()`!
*/

function get_options():SaveDataOptions
{
}

/**
* NOTE: Modifications will not be saved without calling `Save.flush()`!
*/

function get_mobileOptions():SaveDataMobileOptions
{
}

/**
* NOTE: Modifications will not be saved without calling `Save.flush()`!
*/

function get_modOptions():Map<String, Dynamic>
{
}

/**
* The user's current volume setting.
*/

/**
* Whether the user's volume is currently muted.
*/

///
/// API
///

/**
* The current session ID for the logged-in Newgrounds user, or null if the user is cringe.
*/

///
/// MODS
///

///
/// CHART EDITOR OPTIONS
///



















/**
* Marks whether a character has been introduced in the Character Select screen.
*/

/**
* Marks whether the player has seen the spotlight animation, which should only display once per save file ever.
*/

///
/// STAGE EDITOR
///


function get_stageBoyfriendChar():String
{
|| CharacterDataParser.fetchCharacterData(data.optionsStageEditor.bfChar) == null) data.optionsStageEditor.bfChar = "bf";
}

function set_stageBoyfriendChar(value:String):String
{
data.optionsStageEditor.bfChar = value;
Save.system.flush();
}


function get_stageGirlfriendChar():String
{
|| CharacterDataParser.fetchCharacterData(data.optionsStageEditor.gfChar ?? "") == null) data.optionsStageEditor.gfChar = "gf";
}

function set_stageGirlfriendChar(value:String):String
{
data.optionsStageEditor.gfChar = value;
Save.system.flush();
}


function get_stageDadChar():String
{
|| CharacterDataParser.fetchCharacterData(data.optionsStageEditor.dadChar ?? "") == null) data.optionsStageEditor.dadChar = "dad";
}

function set_stageDadChar(value:String):String
{
data.optionsStageEditor.dadChar = value;
Save.system.flush();
}

/// UTIL FUNCTIONS

/**
* Call this to make sure the save data is written to disk.
*/
public function flush():Void
{
Save.system.flush();
}

/**
* When we've seen a character unlock, add it to the list of characters seen.
* @param character
*/
public function addCharacterSeen(character:String):Void
{
{
data.unlocks.charactersSeen.push(character);
Save.system.flush();
}
}

/**
* Return the score the user achieved for a given level on a given difficulty.
*
* @param levelId The ID of the level/week.
* @param difficultyId The difficulty to check.
* @return A data structure containing score, judgement counts, and accuracy. Returns `null` if no score is saved.
*/
public function getLevelScore(levelId:String, difficultyId:String = 'normal'):Null<SaveScoreData>
{
{
{
data.scores = {
songs: [],
levels: []
};
}
else
{
data.scores.levels = [];
}
}
{
level = [];
data.scores.levels.set(levelId, level);
}
}

/**
* Apply the score the user achieved for a given level on a given difficulty.
*/
public function setLevelScore(levelId:String, difficultyId:String, score:SaveScoreData):Void
{
{
level = [];
data.scores.levels.set(levelId, level);
}
level.set(difficultyId, score);
Save.system.flush();
}

public function isLevelHighScore(levelId:String, difficultyId:String = 'normal', score:SaveScoreData):Bool
{
{
level = [];
data.scores.levels.set(levelId, level);
}
{
}
}

public function hasBeatenLevel(levelId:String, ?difficultyList:Array<String>):Bool
{
{
difficultyList = ['easy', 'normal', 'hard'];
}
for (difficulty in difficultyList)
{
{
{
}
else
{
continue;
}
}
}
}

/**
* Return the score the user achieved for a given song on a given difficulty.
*
* @param songId The ID of the song.
* @param difficultyId The difficulty to check.
* @param variation The variation to check. Defaults to empty string. Appended to difficulty with `-`, e.g. `easy-pico`.
* @return A data structure containing score, judgement counts, and accuracy. Returns `null` if no score is saved.
*/
public function getSongScore(songId:String, difficultyId:String = 'normal', ?variation:String):Null<SaveScoreData>
{
{
song = [];
data.scores.songs.set(songId, song);
}
{
difficultyId = '${difficultyId}-${variation}';
}
}

public function getSongRank(songId:String, difficultyId:String = 'normal', ?variation:String):Null<ScoringRank>
{
}

/**
* Directly set the score the user achieved for a given song on a given difficulty.
*/
public function setSongScore(songId:String, difficultyId:String, score:SaveScoreData):Void
{
{
song = [];
data.scores.songs.set(songId, song);
}
song.set(difficultyId, score);
Save.system.flush();
}

/**
* Only replace the ranking data for the song, because the old score is still better.
*/
public function applySongRank(songId:String, difficultyId:String, newScoreData:SaveScoreData):Void
{
{
song = [];
data.scores.songs.set(songId, song);
}
{
setSongScore(songId, difficultyId, newScoreData);
}
score: (previousScoreData.score > newScoreData.score) ? previousScoreData.score : newScoreData.score,
tallies: (previousRank > newRank
|| Scoring.tallyCompletion(previousScoreData.tallies) > Scoring.tallyCompletion(newScoreData.tallies)) ? previousScoreData.tallies : newScoreData.tallies
};
song.set(difficultyId, newScore);
Save.system.flush();
}

/**
* Is the provided score data better than the current high score for the given song?
* @param songId The song ID to check.
* @param difficultyId The difficulty to check.
* @param score The score to check.
* @return Whether the score is better than the current high score.
*/
public function isSongHighScore(songId:String, difficultyId:String = 'normal', score:SaveScoreData):Bool
{
{
song = [];
data.scores.songs.set(songId, song);
}
{
}
}

/**
* Is the provided score data better than the current rank for the given song?
* @param songId The song ID to check.
* @param difficultyId The difficulty to check.
* @param score The score to check the rank for.
* @return Whether the score's rank is better than the current rank.
*/
public function isSongHighRank(songId:String, difficultyId:String = 'normal', score:SaveScoreData):Bool
{
{
}
{
song = [];
data.scores.songs.set(songId, song);
}
{
}
}

/**
* Has the provided song been beaten on one of the listed difficulties?
* Note: This function can still take in the 'difficulty-variation' format for the difficultyList parameter
* as it is used in the old save data format. However inputting a variation will append it to the difficulty
* so you can do `hasBeatenSong('dadbattle', ['easy-pico'])` to check if you've beaten the Pico mix on easy.
* or you can do `hasBeatenSong('dadbattle', ['easy'], 'pico')` to check if you've beaten the Pico mix on easy.
* however you should not mix the two as it will append '-pico' to the 'easy-pico' if it's inputted into the array.
* @param songId The song ID to check.
* @param difficultyList The difficulties to check. Defaults to `easy`, `normal`, and `hard`.
* @param variation The variation to check. Defaults to empty string. Appended to difficulty list with `-`, e.g. `easy-pico`.
*                  This is our old format for getting difficulty/variation information, however we don't want to mess around with
*                  save migration just yet.
* @return Whether the song has been beaten on any of the listed difficulties.
*/
public function hasBeatenSong(songId:String, ?difficultyList:Array<String>, ?variation:String):Bool
{
{
difficultyList = ['easy', 'normal', 'hard'];
}
for (difficulty in difficultyList)
{
{
{
}
else
{
continue;
}
}
}
}

public function isSongFavorited(id:String):Bool
{
{
data.favoriteSongs = [];
Save.system.flush();
};
}

public function favoriteSong(id:String):Void
{
{
data.favoriteSongs.push(id);
Save.system.flush();
}
}

public function unfavoriteSong(id:String):Void
{
{
data.favoriteSongs.remove(id);
Save.system.flush();
}
}

public function getControls(playerId:Int, inputType:Device):Null<SaveControlsData>
{
switch (inputType)
{
case Keys:
case Gamepad(_):
}
}

public function hasControls(playerId:Int, inputType:Device):Bool
{
}

public function setControls(playerId:Int, inputType:Device, controls:SaveControlsData):Void
{
switch (inputType)
{
case Keys:
getPlayer(playerId).keyboard = controls;
case Gamepad(_):
getPlayer(playerId).gamepad = controls;
}
}

public function isCharacterUnlocked(characterId:String):Bool
{
switch (characterId)
{
case 'bf':
case 'pico':
default:
}
}

/**
* Retrieve the mod options object for a given mod ID.
* This is a dynamic object that mods can write any values they like to.
*
* @param modId The mod ID to retrieve
* @return The mod options for the given mod ID.
*/
public function getModOptions(modId:String):Dynamic
{
{
data.mods.modOptions.set(modId, {
});
}

}

/**
* Store the mod options object for a given mod ID.
* Call this function to ensure your changes get written to the user's save file.
*
* @param modId The mod ID to store data for.
* @param options The mod options object.
*/
public function setModOptions(modId:String, options:Dynamic):Void
{
data.mods.modOptions.set(modId, options);
Save.system.flush();
}

/**
* If you set slot to `2`, it will load an independent save file from slot 2.
* @param slot
*/
static function loadFromSlot(slot:Int):Save
{
switch (FlxG.save.status)
{
case EMPTY:
switch (Save.system.fetchLegacySaveData())
{
case None:
case Some(legacySaveData):
}
case ERROR(_): // DEPRECATED: Unused
case SAVE_ERROR(_):
case LOAD_ERROR(_):
case BOUND(_, _):
}
}

/**
* Call this when there is an error loading the save data in slot X.
*/
static function handleSaveDataError(slot:Int):Save
{
msg += '\nPlease report this issue to the developers.';
funkin.util.WindowUtil.showError("Save Data Failure", msg);
}

public static function debug_queryBadSaveData():Void
{
{
}
}

static function fetchFromSlotRaw(slot:Int):Null<Dynamic>
{
targetSaveData.bind(Constants.SAVE_NAME + slot, Constants.SAVE_PATH);
}

/**
* Return true if the given save slot is not empty.
* @param slot The slot number to check.
* @return Whether the slot is not empty.
*/
static function querySlot(slot:Int):Bool
{
targetSaveData.bind(Constants.SAVE_NAME + slot, Constants.SAVE_PATH);
switch (targetSaveData.status)
{
case EMPTY:
case ERROR(_): // DEPRECATED: Unused
case LOAD_ERROR(_):
case SAVE_ERROR(_):
case BOUND(_, _):
}
}

/**
* Return true if any of the slots in the given range is not empty.
* @param start The starting slot number to check.
* @param end The ending slot number to check.
* @return The first slot in the range that is not empty, or `-1` if none are.
*/
static function querySlotRange(start:Int, end:Int):Int
{
for (i in start...end)
{
}
}

/**
* Serialize this Save into a JSON string.
* @param pretty Whether the JSON should be big ol string (false),
*        or pretty printed formatted with tabs (true)
* @return The JSON string.
*/
public function serializeJson(pretty:Bool = true):String
{
}

public function updateVersionToLatest():Void
{
this.data.version = Save.SAVE_DATA_VERSION;
}

public function debug_dumpSaveJsonSave():Void
{
FileUtil.saveFile(haxe.io.Bytes.ofString(this.serializeJson()), [FileUtil.FILE_FILTER_JSON], null, null, './save.json', 'Write save data as JSON...');
}

public function debug_dumpSaveJsonPrint():Void
{
}

public static function saveToNewgrounds():Void
{
funkin.api.newgrounds.NGSaveSlot.instance.save(_instance.data);
}

public static function loadFromNewgrounds(onFinish:Void->Void):Void
{

funkin.api.newgrounds.NGSaveSlot.instance.load((data:Dynamic) ->
{

{
}


_instance = gameSave;
onFinish();
}, (error:io.newgrounds.Call.CallError) ->
{

msg += '\n${errorMsg}';
msg += '\nAre you sure you are connected to the internet?';
funkin.util.WindowUtil.showError("Newgrounds Save Slot Failure", msg);
});
}
}

/**
* An anonymous structure containingg all the user's save data.
* Isn't stored with JSON, stored with some sort of Haxe built-in serialization?
*/
typedef RawSaveData =
{

/**
* A semantic versioning string for the save data format.
*/


/**
* The user's saved scores.
*/

/**
* The user's preferences.
*/


/**
* The user's preferences for mobile.
*/

/**
* The user's favorited songs in the Freeplay menu,
* as a list of song IDs.
*/


/**
* The user's preferences specific to the Chart Editor.
*/

/**
* The user's preferences specific to the Stage Editor.
*/
};

typedef SaveApiData =
{
}

typedef SaveApiNewgroundsData =
{
}

typedef SaveDataUnlocks =
{
/**
* Every time we see the unlock animation for a character,
* add it to this list so that we don't show it again.
*/

/**
* This is a conditional when the player enters the character state
* For the first time ever
*/
}

/**
* An anoymous structure containing options about the user's high scores.
*/
typedef SaveHighScoresData =
{
/**
* Scores for each level (or week).
*/

/**
* Scores for individual songs.
*/
};

typedef SaveDataMods =
{
}

/**
* Key is the level ID, value is the SaveScoreLevelData.
*/
typedef SaveScoreLevelsData = Map<String, SaveScoreDifficultiesData>;

/**
* Key is the song ID, value is the data for each difficulty.
*/
typedef SaveScoreSongsData = Map<String, SaveScoreDifficultiesData>;

/**
* Key is the difficulty ID, value is the score.
*/
typedef SaveScoreDifficultiesData = Map<String, SaveScoreData>;

/**
* An individual score. Contains the score, accuracy, and count of each judgement hit.
*/
typedef SaveScoreData =
{
/**
* The score achieved.
*/

/**
* The count of each judgement hit.
*/
}

typedef SaveScoreTallyData =
{
}

/**
* An anonymous structure containing all the user's options and preferences for the main game.
* Every time you add a new option, it needs to be added here.
*/
typedef SaveDataOptions =
{
/**
* FPS
* @default `60`
*/

/**
* Whether some particularly foul language is displayed.
* @default `true`
*/

/**
* If enabled, the strumline is at the bottom of the screen rather than the top.
* @default `false`
*/

/**
* If disabled, flashing lights in the main menu and other areas will be less intense.
* @default `true`
*/

/**
* If disabled, the camera bump synchronized to the beat.
* @default `false`
*/

/**
* If enabled, an FPS and memory counter will be displayed even if this is not a debug build.
* @default `Off`
*/

/**
* Opacity of the debug display's background.
* @default `50`
*/

/**
* If enabled, subtitles will appear.
* @default `true`
*/

/**
* If enabled, haptic feedback will be enabled.
* @default `All`
*/

/**
* Multiplier of intensity for all the haptic feedback effects.
* @default `1`
*/

/**
* If enabled, the game will automatically pause when tabbing out.
* @default `true`
*/

/**
* If enabled, the game will utilize VSync (or adaptive VSync) on startup.
* @default `Off`
*/

/**
* If >0, the game will display a semi-opaque background under the notes.
* `0` for no background, `100` for solid black if you're freaky like that
* @default `0`
*/

/**
* If enabled, the game will automatically launch in fullscreen on startup.
* @default `true`
*/

/**
* Offset the user's inputs by this many ms.
* @default `0`
*/

/**
* Unused !!
* Affects the delay between the audio and the visuals during gameplay.
* @default `0`
*/

/**
* If we want the framerate to be unlocked.
* @default `false`
*/

/**
* Screenshot options
* @param shouldHideMouse Should the mouse be hidden when taking a screenshot? Default: `true`
* @param fancyPreview Show a fancy preview? Default: `true`
* @param previewOnSave Only show the fancy preview after a screenshot is saved? Default: `true`
*/
{
};

{
};
}

typedef PlayerControlData =
{
}

typedef SaveDataMobileOptions =
{
/**
* If enabled, device will be able to sleep on its own.
* @default `false`
*/

/**
* Controls scheme for the hitbox.
* @default `Arrows`
*/

/**
* If bought, the game will not show any ads.
* @default `false`
*/
}

/**
* An anonymous structure containing a specific player's bound keys.
* Each key is an action name and each value is an array of keycodes.
*
* If a keybind is `null`, it needs to be reinitialized to the default.
* If a keybind is `[]`, it is UNBOUND by the user and should not be rebound.
*/
typedef SaveControlsData =
{
/**
* Keybind for navigating in the menu.
* @default `Up Arrow`
*/

/**
* Keybind for navigating in the menu.
* @default `Left Arrow`
*/

/**
* Keybind for navigating in the menu.
* @default `Right Arrow`
*/

/**
* Keybind for navigating in the menu.
* @default `Down Arrow`
*/

/**
* Keybind for hitting notes.
* @default `A` and `Left Arrow`
*/

/**
* Keybind for hitting notes.
* @default `W` and `Up Arrow`
*/

/**
* Keybind for hitting notes.
* @default `S` and `Down Arrow`
*/

/**
* Keybind for hitting notes.
* @default `D` and `Right Arrow`
*/

/**
* Keybind for continue/OK in menus.
* @default `Enter` and `Space`
*/

/**
* Keybind for back/cancel in menus.
* @default `Escape`
*/

/**
* Keybind for pausing the game.
* @default `Escape`
*/

/**
* Keybind for advancing cutscenes.
* @default `Z` and `Space` and `Enter`
*/

/**
* Keybind for increasing volume.
* @default `Plus`
*/

/**
* Keybind for decreasing volume.
* @default `Minus`
*/

/**
* Keybind for muting/unmuting volume.
* @default `Zero`
*/

/**
* Keybind for restarting a song.
* @default `R`
*/
}

/**
* An anonymous structure containing all the user's options and preferences, specific to the Chart Editor.
*/
typedef SaveDataChartEditorOptions =
{
/**
* Whether the Chart Editor created a backup the last time it closed.
* Prompt the user to load it, then set this back to `false`.
* @default `false`
*/

/**
* Previous files opened in the Chart Editor.
* @default `[]`
*/

/**
* Note snapping level in the Chart Editor.
* @default `3`
*/

/**
* Live input style in the Chart Editor.
* @default `ChartEditorLiveInputStyle.None`
*/

/**
* Theme in the Chart Editor.
* @default `ChartEditorTheme.Light`
*/

/**
* Downscroll in the Chart Editor.
* @default `false`
*/

/**
* Show Note Kind Indicator in the Chart Editor.
* @default `true`
*/

/**
* Show Subtitles in the Chart Editor.
* @default `true`
*/

/**
* Metronome volume in the Chart Editor.
* @default `1.0`
*/

/**
* Hitsound volume (player) in the Chart Editor.
* @default `1.0`
*/

/**
* Hitsound volume (opponent) in the Chart Editor.
* @default `1.0`
*/

/**
* If true, playtest songs from the current position in the Chart Editor.
* @default `false`
*/

/**
* If true, playtest songs with the current audio settings in the Chart Editor.
* @default `false`
*/

/**
* If true, playtest songs will play the results screen on completion.
* @default `false`
*/

/**
* Theme music in the Chart Editor.
* @default `true`
*/

/**
* Instrumental volume in the Chart Editor.
* @default `1.0`
*/

/**
* Player voice volume in the Chart Editor.
* @default `1.0`
*/

/**
* Opponent voice volume in the Chart Editor.
* @default `1.0`
*/

/**
* Playback speed in the Chart Editor.
* @default `1.0`
*/
}

typedef SaveDataStageEditorOptions =
{

/**
* Whether the Stage Editor created a backup the last time it closed.
* Prompt the user to load it, then set this back to `false`.
* @default `false`
*/

/**
* Previous files opened in the Stage Editor.
* @default `[]`
*/

/**
* The Step at which an Object or Character is moved.
* @default `1px`
*/

/**
* The Step at which an Object is rotated.
* @default `5`
*/

/**
* Theme in the Stage Editor.
* @default `StageEditorTheme.Light`
*/

/**
* The BF character ID used in testing stages.
* @default bf
*/

/**
* The GF character ID used in testing stages.
* @default gf
*/

/**
* The Dad character ID used in testing stages.
* @default dad
*/
}
