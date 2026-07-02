

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



}

/**
* Setup a bunch of important Flixel stuff.
*/
function setupShit():Void
{
{
//
//



















//
//



FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), tileData,
FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), tileData,

{
FlxTransitionableState.defaultTransIn = new TransitionData(FADE, FlxColor.BLACK, 1, new FlxPoint(0, -1), tileData,
FlxTransitionableState.defaultTransOut = new TransitionData(FADE, FlxColor.BLACK, 0.7, new FlxPoint(0, 1), tileData,

{
{

//
//
NewgroundsClient.instance.init();

//
//

{

//
//

//
//

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





}


function onLostFocus():Void
{
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
}

/**
* Start the game by moving to the title state and play the game as normal.
*/
function startGameNormally():Void
{

{
fnfcTargetPath: params.chart.chartPath,
}
else if (params.stage.shouldLoadStage)
{
fnfsTargetPath: params.stage.stagePath,
}
else if (params.song.shouldLoadSong && params.song.songPath != null)
{
}
else
{
funkin.mobile.util.FNFCProvider.onFNFCOpen.add(function(fnfcFile:String)
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

/**
* Start the game by directly loading into a specific song.
* @param songId
* @param difficultyId
*/
function startSong(songId:String, difficultyId:String = 'normal'):Void
{

{
}

switch (songId)
{
case 'tutorial' | 'bopeebo' | 'fresh' | 'dadbattle':
case 'spookeez' | 'south' | 'monster':
case 'pico' | 'philly-nice' | 'blammed':
case 'high' | 'satin-panties' | 'milf':
case 'cocoa' | 'eggnog' | 'winter-horrorland':
case 'senpai' | 'roses' | 'thorns':
case 'ugh' | 'guns' | 'stress':
case 'darnell' | 'lit-up' | '2hot' | 'blazin':
}

LoadingState.loadPlayState({
targetSong: songData,
targetDifficulty: difficultyId,
}

/**
* Start the game by directly loading into a specific story mode level.
* @param levelId
* @param difficultyId
*/
function startLevel(levelId:String, difficultyId:String = 'normal'):Void
{

{
}






{
}

LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: difficultyId,
}

function setupFlixelDebug():Void
{
//
//




{
{

for (snd in FlxG.sound.list)
{
}

}
else
{

for (snd in FlxG.sound.list)
{
}

}

{

for (snd in FlxG.sound.list)
{
}


{

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
