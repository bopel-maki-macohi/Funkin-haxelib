package funkin;


/**
* A core class which performs initialization of the game.
* The initialization state has several functions:
* - Calls code to set up the game, including loading saves and parsing game data.
* - Chooses whether to start via debug or via launching normally.
*
* It should not contain any sprites or rendering.
*/
class InitState extends FlxState
{
/**
* Simply states whether the "core stuff" is ready or not.
* This is used to prevent re-initialization of specific core features.
*/

/**
* Perform a bunch of game setup, then immediately transition to the title screen.
*/
public override function create():Void
{
setupShit();

Preferences.init();

PlayerSettings.init();

startGame();
}

/**
* Setup a bunch of important Flixel stuff.
*/
function setupShit():Void
{
{
//
//

WindowUtil.initWindowEvents();

funkin.util.WindowUtil.initTracy();

extension.haptics.Haptic.initialize();

funkin.mobile.util.AdMobUtil.init();

funkin.mobile.util.InAppPurchasesUtil.init();

funkin.mobile.util.InAppReviewUtil.init();

funkin.mobile.util.WebViewUtil.init();

funkin.external.android.CallbackUtil.init();

funkin.external.apple.AudioSession.initialize();

funkin.mobile.util.FNFCProvider.init();

SongEventHelper.generateEaseGraphsBitmaps();

FlxSprite.defaultAntialiasing = true;






setupFlixelDebug();

//
//

diamond.persist = true;
diamond.destroyOnNoUse = false;


FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), tileData,
new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), tileData,
new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));

{
FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), tileData,
new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), tileData,
new FlxRect(-200, -200, FlxG.width * 1.4, FlxG.height * 1.4));
});

{
WindowUtil.setVSyncMode(lime.ui.WindowVSyncMode.OFF);
});
{
WindowUtil.setVSyncMode(lime.ui.WindowVSyncMode.OFF);
});

//
//
NewgroundsClient.instance.init();

//
//

{
});

//
//

//
//
funkin.util.plugins.MemoryGCPlugin.initialize();
funkin.util.plugins.ScreenshotPlugin.initialize();
funkin.util.plugins.NewgroundsMedalPlugin.initialize();
funkin.util.plugins.EvacuateDebugPlugin.initialize();
funkin.util.plugins.ForceCrashPlugin.initialize();
funkin.util.plugins.ReloadAssetsDebugPlugin.initialize();
funkin.util.plugins.VolumePlugin.initialize();
funkin.util.plugins.WatchPlugin.initialize();
funkin.util.plugins.TouchPointerPlugin.initialize();
funkin.mobile.input.ControlsHandler.initInputTrackers();

_coreInitialized = true;
}

//
//

SongEventRegistry.loadEventCache(); // SongEventRegistry is structured differently so it's not a BaseRegistry.
SongRegistry.instance.loadEntries();
LevelRegistry.instance.loadEntries();
NoteStyleRegistry.instance.loadEntries();
PlayerRegistry.instance.loadEntries();
ConversationRegistry.instance.loadEntries();
DialogueBoxRegistry.instance.loadEntries();
SpeakerRegistry.instance.loadEntries();
FreeplayStyleRegistry.instance.loadEntries();
AlbumRegistry.instance.loadEntries();
StageRegistry.instance.loadEntries();
StickerRegistry.instance.loadEntries();

CharacterDataParser.loadCharacterCache();

NoteKindManager.initialize();

ModuleHandler.buildModuleCallbacks();
ModuleHandler.loadModuleCache();
ModuleHandler.callOnCreate();

funkin.input.Cursor.hide();

funkin.FunkinMemory.initialCache();
}


function onLostFocus():Void
{
_lastFocusVolume = FlxG.sound.volume;
}

function onGainFocus():Void
{
{
}
else
{
}

}

/**
* Start the game.
*
* By default, moves to the `TitleState`.
* But based on compile defines, the game can start immediately on a specific song,
* or immediately in a specific debug menu.
*/
function startGame():Void
{
FlxTransitionableState.skipNextTransIn = true;

startSong(defineSong(), defineDifficulty());
startLevel(defineLevel(), defineDifficulty());
storyMode: true,
title: "Cum Song Erect by Kawai Sprite",
songId: "cum",
characterId: "pico",
difficultyId: "hard",
isNewHighscore: true,
scoreData: {
score: 1_234_567,
tallies: {
sick: 130,
good: 60,
bad: 69,
shit: 69,
missed: 69,
combo: 69,
maxCombo: 69,
totalNotesHit: 140,
totalNotes: 240
}
},
}));
startGameNormally();
}

/**
* Start the game by moving to the title state and play the game as normal.
*/
function startGameNormally():Void
{

{
fnfcTargetPath: params.chart.chartPath,
}));
}
else if (params.stage.shouldLoadStage)
{
fnfsTargetPath: params.stage.stagePath,
}));
}
else if (params.song.shouldLoadSong && params.song.songPath != null)
{
}
else
{
funkin.mobile.util.FNFCProvider.onFNFCOpen.add(function(fnfcFile:String)
{
flixel.tweens.FlxTween.globalManager.clear();
flixel.util.FlxTimer.globalManager.clear();
{
}

});

{
}
else
{
}
}
}

/**
* Start the game by directly loading into a specific song.
* @param songId
* @param difficultyId
*/
function startSong(songId:String, difficultyId:String = 'normal'):Void
{

{
startGameNormally();
}

switch (songId)
{
case 'tutorial' | 'bopeebo' | 'fresh' | 'dadbattle':
Paths.setCurrentLevel('week1');
PlayStatePlaylist.campaignId = 'week1';
case 'spookeez' | 'south' | 'monster':
Paths.setCurrentLevel('week2');
PlayStatePlaylist.campaignId = 'week2';
case 'pico' | 'philly-nice' | 'blammed':
Paths.setCurrentLevel('week3');
PlayStatePlaylist.campaignId = 'week3';
case 'high' | 'satin-panties' | 'milf':
Paths.setCurrentLevel('week4');
PlayStatePlaylist.campaignId = 'week4';
case 'cocoa' | 'eggnog' | 'winter-horrorland':
Paths.setCurrentLevel('week5');
PlayStatePlaylist.campaignId = 'week5';
case 'senpai' | 'roses' | 'thorns':
Paths.setCurrentLevel('week6');
PlayStatePlaylist.campaignId = 'week6';
case 'ugh' | 'guns' | 'stress':
Paths.setCurrentLevel('week7');
PlayStatePlaylist.campaignId = 'week7';
case 'darnell' | 'lit-up' | '2hot' | 'blazin':
Paths.setCurrentLevel('weekend1');
PlayStatePlaylist.campaignId = 'weekend1';
}

LoadingState.loadPlayState({
targetSong: songData,
targetDifficulty: difficultyId,
});
}

/**
* Start the game by directly loading into a specific story mode level.
* @param levelId
* @param difficultyId
*/
function startLevel(levelId:String, difficultyId:String = 'normal'):Void
{

{
startGameNormally();
}

Paths.setCurrentLevel(levelId);
PlayStatePlaylist.campaignId = levelId;

PlayStatePlaylist.playlistSongIds = currentLevel.getSongs();
PlayStatePlaylist.isStoryMode = true;
PlayStatePlaylist.campaignScore = 0;




{
startGameNormally();
}

LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: difficultyId,
});
}

function setupFlixelDebug():Void
{
//
//

LogStyle.ERROR.openConsole = false;
LogStyle.ERROR.errorSound = null;

LogStyle.WARNING.openConsole = false;
LogStyle.WARNING.errorSound = null;

TrackerUtil.initTrackers();

{
{

for (snd in FlxG.sound.list)
{
snd.resume();
}

}
else
{

for (snd in FlxG.sound.list)
{
snd.pause();
}

}
});

{

for (snd in FlxG.sound.list)
{
snd.pause();
snd.time += FlxG.elapsed * 1000;
}

});

{

LogStyle.ERROR.openConsole = false;
LogStyle.ERROR.errorSound = null;
LogStyle.WARNING.openConsole = false;
LogStyle.WARNING.errorSound = null;
});
}

function defineSong():Null<String>
{
}

function defineLevel():Null<String>
{
}

function defineDifficulty():Null<String>
{
}
}
