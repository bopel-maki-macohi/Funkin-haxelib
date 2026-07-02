

/**
* Parameters used to initialize the PlayState.
*/
typedef PlayStateParams =
{
/**
* The song to play.
*/
targetSong:Song,

/**
* The difficulty to play the song on.
* @default `Constants.DEFAULT_DIFFICULTY`
*/
?targetDifficulty:String,
/**
* The variation to play on.
* @default `Constants.DEFAULT_VARIATION`
*/
?targetVariation:String,
/**
* The instrumental to play with.
* Significant if the `targetSong` supports alternate instrumentals.
* @default `null`
*/
?targetInstrumental:String,
/**
* Whether the song should start in Practice Mode.
* @default `false`
*/
?practiceMode:Bool,
/**
* Whether the song should start in Bot Play Mode.
* @default `false`
*/
?botPlayMode:Bool,
/**
* Whether the results screen should show up before returning to the chart editor.
* @default `false`
*/
?playtestResults:Bool,
/**
* Whether the song should be in minimal mode.
* @default `false`
*/
?minimalMode:Bool,
/**
* If specified, the game will jump to the specified timestamp after the countdown ends.
* @default `0.0`
*/
?startTimestamp:Float,
/**
* If specified, the game will play the song with the given speed.
* @default `1.0` for 100% speed.
*/
?playbackRate:Float,
/**
* If specified, the game will not load the instrumental or vocal tracks,
* and must be loaded externally.
*/
?overrideMusic:Bool,
/**
* The initial camera follow point.
* Used to persist the position of the `cameraFollowPosition` between levels.
*/
?cameraFollowPoint:FlxPoint,
/**
* Whether the note data should be mirrored horizontally.
* @default `false`
*/
?mirrored:Bool
}

/**
* The gameplay state, where all the rhythm gaming happens.
* SubState so it can be loaded as a child of the chart editor.
*/
class PlayState extends MusicBeatSubState
{
/**
* STATIC VARIABLES
* Static variables should be used for information that must be persisted between states or between resets,
* such as the active song or song playlist.
*/
/**
* The currently active PlayState.
* There should be only one PlayState in existance at a time, we can use a singleton.
*/

/**
* This sucks. We need this because FlxG.resetState(); assumes the constructor has no arguments.
* @see https://github.com/HaxeFlixel/flixel/issues/2541
*/

/**
* PUBLIC INSTANCE VARIABLES
* Public instance variables should be used for information that must be reset or dereferenced
* every time the state is changed, but may need to be accessed externally.
*/
/**
* The currently selected stage.
*/

/**
* The currently selected difficulty.
*/

/**
* The currently selected variation.
*/

/**
* The currently selected instrumental ID.
* @default `''`
*/

/**
* The currently active Stage. This is the object containing all the props.
*/

/**
* Gets set to true when the PlayState needs to reset (player opted to restart or died).
* Gets disabled once resetting happens.
*/

/**
* A timer that gets active once resetting happens. Used to vwoosh in notes.
*/

/**
* The current 'Blueball Counter' to display in the pause menu.
* Resets when you beat a song or go back to the main menu.
*/

/**
* The player's current health.
*/

/**
* The player's current score.
* This needs to be a float because you gain partial points as you hold a hold note,
* possibly less than one point each update depending on your framerate.
*/

/**
* Start at this point in the song once the countdown is done.
* For example, if `startTimestamp` is `30000`, the song will start at the 30 second mark.
* Used for chart playtesting or practice.
*/

/**
* Play back the song at this speed.
* @default `1.0` for normal speed.
*/

/**
* The volume of the instrumental track.
* @default `1.0` for 100%.
*/

/**
* The volume of the player vocals track.
* @default `1.0` for 100%.
*/

/**
* The volume of the opponent vocals track.
* @default `1.0` for 100%.
*/

/**
* An empty FlxObject contained in the scene.
* The current gameplay camera will always follow this object. Tween its position to move the camera smoothly.
*
* It needs to be an object in the scene for the camera to be configured to follow it.
* We optionally make this a sprite so we can draw a debug graphic with it.
*/

/**
* An FlxTween that tweens the camera to the follow point.
* Only used when tweening the camera manually, rather than tweening via follow.
*/

/**
* An FlxTween that zooms the camera to the desired amount.
*/

/**
* An FlxTween that changes the additive speed to the desired amount.
*/

/**
* The camera follow point from the last stage.
* Used to persist the position of the `cameraFollowPosition` between levels.
*/

/**
* The current camera zoom level without any modifiers applied.
*/

/**
* Multiplier for currentCameraZoom for camera bops.
* Lerped back to 1.0x every frame.
*/

/**
* Default camera zoom for the current stage.
* If we aren't in a stage, just use the default zoom (1.05x).
*/

function get_stageZoom():Float
{
else
}

/**
* The current HUD camera zoom level.
*
* The camera zoom is increased every beat, and lerped back to this value every frame, creating a smooth 'zoom-in' effect.
*/

/**
* Camera bop intensity multiplier.
* Applied to cameraBopMultiplier on camera bops (usually every beat).
* @default `101.5%`
*/

/**
* Intensity of the HUD camera zoom.
* Need to make this a multiplier later. Just shoving in 0.015 for now so it doesn't break.
* @default `3.0%`
*/

/**
* How many beats (quarter notes) between camera zooms.
* @default One camera zoom per measure (four beats).
*/

/**
* How many beats (quarter notes) the zoom rate is offset.
* For if you want the zoom to happen off-beat.
* @default Zero beats (on-beat).
*/

/**
* Whether the game is currently in the countdown before the song resumes.
*/

/**
* Determines whether opening a substate over this causes the game to pause.
* Enable it before opening a Pause menu or Game Over screen, and disable it
* for stuff like editors and overlays.
*/

/**
* Whether the game is currently in the Game Over state.
*/

/**
* Whether the game is currently in Practice Mode.
* If true, player will not gain or lose score from notes.
*/

/**
* Whether the game is currently in Bot Play Mode.
* If true, player will not gain or lose score from notes.
*/

/**
* Whether the results screen should show up before returning to the chart editor.
*/

/**
* Whether the player has dropped below zero health,
* and we are just waiting for an animation to play out before transitioning.
*/

/**
* In Minimal Mode, the stage and characters are not loaded and a standard background is used.
*/

/**
* Whether the game is currently in an animated cutscene, and gameplay should be stopped.
*/

/**
* Whether the inputs should be disabled for whatever reason...
* Used after the song ends, and in the Stage Editor.
*/

/**
* The previous difficulty the player was playing on.
*/


function get_isSubState():Bool
{
}


function get_isChartingMode():Bool
{
}

/**
* The current dialogue.
*/

/**
* Key press inputs which have been received but not yet processed.
* These are encoded with an OS timestamp, so we can account for input latency.
**/

/**
* Key release inputs which have been received but not yet processed.
* These are encoded with an OS timestamp, so we can account for input latency.
**/

/**
* If we just unpaused the game, we shouldn't be able to pause again for one frame.
*/

/**
* The current note style used by the song.
*/

/**
* PRIVATE INSTANCE VARIABLES
* Private instance variables should be used for information that must be reset or dereferenced
* every time the state is reset, but should not be accessed externally.
*/
/**
* The Array containing the upcoming song events.
* The `update()` function regularly shifts these out to trigger events.
*/

/**
* If true, the player is allowed to pause the game.
* Disabled during the ending of a song.
*/

/**
* The displayed value of the player's health.
* Used to provide smooth animations based on linear interpolation of the player's health.
*/

/**
* How long the user has held the "Skip Video Cutscene" button for.
*/

/**
* Whether the PlayState was started with instrumentals and vocals already provided.
* Used by the chart editor to prevent replacing the music.
*/

/**
* Forcibly disables all update logic while the game moves back to the Menu state.
* This is used only when a critical error occurs and the game absolutely cannot continue.
*/

/**
* False as long as the countdown has not finished yet.
*/

/**
* Track if we currently have the music paused for a Pause substate, so we can unpause it when we return.
*/

/**
* Track any camera tweens we've paused for a Pause substate, so we can unpause them when we return.
*/

/**
* Track any sounds we've paused for a Pause substate, so we can unpause them when we return.
*/

/**
* False until `create()` has completed.
*/

/**
* A group of audio tracks, used to play the song's vocals.
*/


/**
* RENDER OBJECTS
*/
/**
* The FlxBitmapText which displays the current score.
*/

/**
* The bar which displays the player's health.
* Dynamically updated based on the value of `healthLerp` (which is based on `health`).
*/

/**
* The background image used for the health bar.
* Emma says the image is slightly skewed so I'm leaving it as an image instead of a `createGraphic`.
*/

/**
* A sprite group for subtitle display.
*/

/**
* The health icon representing the player.
*/

/**
* The health icon representing the opponent.
*/

/**
* The sprite group containing active player's strumline notes.
*/

/**
* The sprite group containing opponent's strumline notes.
*/

/**
* The camera which contains, and controls visibility of, the user interface elements.
*/

/**
* The camera which contains, and controls visibility of, the stage and characters.
*/

/**
* Simple helper debug variable, to be able to move the camera around for debug purposes
* without worrying about the camera tweening back to the follow point.
*/

/**
* The camera which contains, and controls visibility of, a video cutscene, dialogue.
*/

/**
* The camera which contains, and controls visibility of menus when there are fake cutouts added.
*/

/**
* The camera which contains, and controls visibility of, the subtitles.
*/

/**
* The camera which contains, and controls visibility of, pause menu.
*/

/**
* The camera which contains, and controls visibility of, the fade out to the results screen.
*/

/**
* The combo popups. Includes the real-time combo counter and the rating.
*/


/**
* The pause button for the game, only appears in Mobile targets.
*/

/**
* The pause circle for the game, only appears in Mobile targets.
*/

/**
* PROPERTIES
*/
/**
* If a substate is rendering over the PlayState, it is paused and normal update logic is skipped.
* Examples include:
* - The Pause screen is open.
* - The Game Over screen is open.
* - The Chart Editor screen is open.
*/

function get_isGamePaused():Bool
{
}


function get_isExitingViaPauseMenu():Bool
{

}

/**
* Data for the current difficulty for the current song.
* Includes chart data, scroll speed, and other information.
*/

function get_currentChart():Null<SongDifficulty>
{
}

/**
* The internal ID of the currently active Stage.
* Used to retrieve the data required to build the `currentStage`.
*/

function get_currentStageId():String
{
}

/**
* The length of the current song, in milliseconds.
*/

function get_currentSongLengthMs():Float
{
}

/**
* The threshold for resyncing the song.
* If the vocals deviate from the instrumental by more than this amount, then `resyncVocals()` will be called.
*/

/**
* The threshold for how much the conductor lerp can drift from the music.
* If the conductor song position deviate from the music by more than this amount, then a normal conductor update is triggered.
*/

/**
* The ratio for easing the song positon for smoother notes scrolling.
*/





/**
* Instantiate a new PlayState.
* @param params The parameters used to initialize the PlayState.
*   Includes information about what song to play and more.
*/
public function new(?params:PlayStateParams)
{

}



{
}
else
{
}







}

/**
* Called when the PlayState is switched to.
*/
public override function create():Void
{
{
}
instance = this;





{

}

Conductor.instance.forceBPM(null);

{
Conductor.instance.instrumentalOffset = currentChart.offsets.getInstrumentalOffset(currentInstrumental);
}

Conductor.instance.mapTimeChanges(currentChart.timeChanges);


Conductor.instance.update(pre);

{
}
else
{
}

{
{

{
for (direction in Strumline.DIRECTIONS)
{
}
}
}
}
else
{
}














}

public function togglePauseButton(visible:Bool = false):Void
{
}

function assertChartExists():Bool
{
{

{
}
else if (currentDifficulty == null)
{
}
else if (currentChart == null)
{
}
else if (currentChart?.notes == null)
{
}


{
}
else
{
}
}

}

public override function update(elapsed:Float):Void
{



{










{
}

{

{
}
}


{
vocals.time = startTimestamp - Conductor.instance.instrumentalOffset;

}

{
}





Conductor.instance.update(-vwooshDelay * 1000 + startTimestamp + Conductor.instance.beatLengthMs * -5);

vwooshTimer.start(vwooshDelay, function(_)
{



}

{
{
Conductor.instance.update(Conductor.instance.songPosition + elapsed * 1000, false);
{
}
}
}
else
{
{
Conductor.instance.formatOffset = Constants.MP3_DELAY_MS;
}
else
{
Conductor.instance.formatOffset = 0.0;
}

{
{
Conductor.instance.update(FlxMath.lerp(Conductor.instance.songPosition, FlxG.sound.music.time + Conductor.instance.combinedOffset, easeRatio), false);
}
else
{
Conductor.instance.update();
}
}
}




{
}



{


}

{
}

{
{
}

{
health += 0.25 * Constants.HEALTH_MAX; // +25% health.
}

{





{
}
else
{
}



{
new FlxTimer().start(deathPreTransitionDelay, function(_)
{
}
else
{
}

details: 'Game Over - ${buildDiscordRPCDetails()}',
state: buildDiscordRPCState(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}
else if (isPlayerDying)
{
}
}





}

/**
* Pause the game.
* @param mode Which set of pause menu options to display (distinguishes between standard, charting, and cutscene)
* @param lostFocus Whether the game paused because the window lost focus
*/
function pause(mode:PauseMode = Standard, lostFocus:Bool = false):Void
{

switch (mode)
{
case Conversation:



case Cutscene:



default: // also known as standard



{

{
}
else
{

{
}

}

details: 'Paused - ${buildDiscordRPCDetails()}',
state: buildDiscordRPCState(),
largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}
}
}

function preparePauseUI():Void
{
}

function openPauseSubState(mode:PauseMode, cam:FlxCamera, lostFocus:Bool = false, ?onPause:Void->Void):Void
{
}

function moveToGameOver():Void
{





{
}

isChartingMode: isChartingMode,
transparent: persistentDraw
}

function processSongEvents():Void
{
{

{
for (event in songEventsToActivate)
{
{
{
}


{
}
}
}
}
}

public override function dispatchEvent(event:ScriptEvent):Void
{






}

/**
* Function called before opening a new substate.
* @param subState The substate to open.
*/
public override function openSubState(subState:FlxSubState):Void
{
{
{
{
}

{
{
{
}

vocals?.forEach(function(voice:FunkinSound)
{
}
else
{
}
}


{
}

{
}



for (tween in scrollSpeedTweens)
{
{
}
}
}

}

/**
* Function called before closing the current substate.
* @param subState
*/
public override function closeSubState():Void
{
{



{
{
{
}

vocals?.forEach(function(voice:FunkinSound)
{
}
else
{
}


{
}


for (camTween in cameraTweensPausedBySubState)
{
}



{
}



{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}
else
{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}

}

}

/**
* Function called when the game window gains focus.
*/
public override function onFocus():Void
{

{
{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}
else
{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}
}

}

/**
* Function called when the game window loses focus.
*/
public override function onFocusLost():Void
{

{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}

{
{
}
else if (VideoCutscene.isPlaying())
{
}
else
{
}
}
}

/**
* Call this by pressing F5 on a debug build.
*/
override function reloadAssets():Void
{

instance = this;

{
}
lastParams.targetSong = SongRegistry.instance.fetchEntry(currentSong.id,
}

override function stepHit():Bool
{



iconP1?.onStepHit(Std.int(Conductor.instance.currentStep));
iconP2?.onStepHit(Std.int(Conductor.instance.currentStep));


&& camHUD.zoom < (MAX_RELATIVE_CAM_ZOOM * defaultHUDCameraZoom)
&& cameraZoomRate > 0
&& (Conductor.instance.currentStep + cameraZoomRateOffset * Constants.STEPS_PER_BEAT) % (cameraZoomRate * Constants.STEPS_PER_BEAT) == 0)
{
}


}

override function beatHit():Bool
{



{
}

{
{
{
vocals.playerVoices?.forEachAlive(function(voice:FunkinSound)
{

vocals.opponentVoices?.forEachAlive(function(voice:FunkinSound)
{
}
}

&& (Math.abs(FlxG.sound.music.time - correctSync) > RESYNC_THRESHOLD
|| Math.abs(playerVoicesError) > RESYNC_THRESHOLD
|| Math.abs(opponentVoicesError) > RESYNC_THRESHOLD))
{
{
}
}
}


}

public override function destroy():Void
{



}

public override function initConsoleHelpers():Void
{
{

/**
* Initializes the game and HUD cameras.
*/
function initCameras():Void
{
camGame.bgColor = BACKGROUND_COLOR; // Show a pink background behind the stage.
camHUD.bgColor.alpha = 0; // Show the game scene behind the camera.
camCutscene.bgColor.alpha = 0; // Show the game scene behind the camera.
camCutouts.bgColor.alpha = 0; // Show the game scene behind the camera.
camPause.bgColor.alpha = 0; // Show the game scene behind the camera.


{
}
}

/**
* Initializes the health bar on the HUD.
*/
function initHealthBar():Void
{
&& !ControlsHandler.hasExternalInputDevice)






{
&& !ControlsHandler.hasExternalInputDevice)


}
}

/**
* Generates the stage and all its props.
*/
function initStage():Void
{
}

function initMinimalMode():Void
{
}

/**
* Loads stage data from cache, assembles the props,
* and adds it to the state.
* @param id
*/
function loadStage(id:String):Void
{
currentStage = StageRegistry.instance.fetchEntry(id);

{
currentStage.revive(); // Stages are killed and props destroyed when the PlayState is destroyed to save memory.




}
else
{
}
}

public function resetCameraZoom():Void
{

}

/**
* Generates the character sprites and adds them to the stage.
*/
function initCharacters():Void
{
{
}

{
}

//
//

{
}
else if (currentCharacterData.girlfriend != '')
{
}
else
{
}

//
//

{
//
//
dad.initHealthIcon(true); // Apply the character ID here

}

//
//

{
//
//
boyfriend.initHealthIcon(false); // Apply the character ID here
}

//
//

{
{

}

{

}

{

}

}
}

/**
* Constructs the strumlines for each player.
*/
function initStrumlines():Void
{

playerStrumline.x = (FlxG.width / 2 + Constants.STRUMLINE_X_OFFSET) + (cutoutSize / 2.0); // Classic style





{
}

}

/**
* Configures the position of strumline for the default control scheme
*/
function initNoteHitbox()
{

for (strum in playerStrumline)
{
}

{
}
else
{
}
}

function initPauseSprites()
{
pauseButton.animation.addByIndices('confirm', 'back',


hitbox?.forEachAlive(function(hint:FunkinHint)
{

}

function tweenPauseButtonIn():Void
{

}

/**
* Configures the judgement and combo popups.
*/
function initPopups():Void
{
}

/**
* Initializes the Discord Rich Presence.
*/
function initDiscord():Void
{

state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon

state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),
largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
}

function buildDiscordRPCDetails():String
{
{
}
else
{
{
}
else if (isPracticeMode)
{
}
else if (isBotPlayMode)
{
}
else
{
}
}
}

function buildDiscordRPCState():String
{
{
}
}

function initPreciseInputs():Void
{
PreciseInputManager.instance.onInputPressed.add(onKeyPress);
PreciseInputManager.instance.onInputReleased.add(onKeyRelease);
}

/**
* Initializes the song (applying the chart, generating the notes, etc.)
* Should be done before the countdown starts.
*/
function generateSong():Void
{
{
}


{

{
}
}



}

/**
* Read note data from the chart and generate the notes.
*/
function regenNoteData(startTime:Float = 0):Void
{
{
}







for (songNote in builtNoteData)
{

{
}


switch (songNote.getStrumlineIndex())
{
case 0:

case 1:
}
}

}

function onStrumlineNoteIncoming(noteSprite:NoteSprite):Void
{

}

/**
* Prepares to start the countdown.
* Ends any running cutscenes, creates the strumlines, and starts the countdown.
* This is public so that scripts can call it.
*/
public function startCountdown():Void
{


}

/**
* Displays a dialogue cutscene with the given ID.
* This is used by song scripts to display dialogue.
*/
public function startConversation(conversationId:String):Void
{

currentConversation = ConversationRegistry.instance.fetchEntry(conversationId);


}

/**
* Handler function called when a conversation ends.
*/
function onConversationComplete():Void
{

{
}

{
}
}

/**
* Starts playing the song after the countdown has completed.
*/
function startSong():Void
{


{
}

{
}

{


{
{
}
}


{

vocals.time = startTimestamp - Conductor.instance.instrumentalOffset;


}


state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon

{
}



}

/**
* Resynchronize the vocal tracks if they have become offset from the instrumental.
*/
function resyncVocals():Void
{


Math.max(Math.min(Conductor.instance.combinedOffset, 0), Conductor.instance.songPosition) - Conductor.instance.combinedOffset);



}

/**
* Updates the position and contents of the score display.
*/
function updateScoreText():Void
{
{
}
else
{
}
}

/**
* Updates the values of the health bar.
*/
function updateHealthBar():Void
{
{
}
else
{
}
}

/**
* Callback executed when one of the note keys is pressed.
*/
function onKeyPress(event:PreciseInputEvent):Void
{

}

/**
* Callback executed when one of the note keys is released.
*/
function onKeyRelease(event:PreciseInputEvent):Void
{
}

/**
* Handles opponent note hits and player note misses.
*/
function processNotes(elapsed:Float):Void
{

for (note in opponentStrumline.notes.members)
{
{


{
{
else
}
}


{
}
}
}

for (holdNote in opponentStrumline.holdNotes.members)
{

{
{
}
}

{

{
}
}
}

for (note in playerStrumline.notes.members)
{
{




{
}
}

{


{
}

}
}

for (holdNote in playerStrumline.holdNotes.members)
{

{
{
}

{
}
}

{


{
{





{
{
}
}
}
else
{
}
}
}
}
}

function handleSkippedNotes():Void
{
for (note in playerStrumline.notes.members)
{

{
}
}

}

/**
* PreciseInputEvents are put into a queue between update() calls,
* and then processed here.
*/
function processInputQueue():Void
{

{
}



for (note in notesInRange)

{





{

}
else if (notesInDirection.length == 0)
{

}
else
{



}
}

{


}

}

function goodNoteHit(note:NoteSprite, input:PreciseInputEvent):Void
{


else



switch (daRating)
{
case 'sick':
case 'good':
case 'bad':
case 'shit':
}


{
}

{
}
}

/**
* Called when a note leaves the screen and is considered missed by the player.
* @param note
*/
function onNoteMiss(note:NoteSprite, playSound:Bool = false, healthChange:Float):Void
{

{

for (i in 0...pressArray.length)
{
}
}


{
}
}

/**
* Called when a player presses a key with no note present.
* Scripts can modify the amount of health/score lost, whether player animations or sounds are used,
* or even cancel the event entirely.
*
* @param direction
* @param hasPossibleNotes
*/
function ghostNoteMiss(direction:NoteDirection, hasPossibleNotes:Bool = true):Void
{
hasPossibleNotes, // Whether there was a note you could have hit.
Constants.HEALTH_GHOST_MISS_PENALTY, // How much health to add (negative).
Constants.SCORE_GHOST_MISS_PENALTY // Amount of score to add (negative).



{

for (i in 0...pressArray.length)
{
}
}

{
}
}

/**
* Debug keys. Disabled while in cutscenes.
*/
function debugKeyShit():Void
{
{
targetStageId: currentStageId,
targetBfChar: bf,
targetGfChar: gf,
targetDadChar: dad
}

{
{
}
else
{
targetSongId: currentSong.id,
targetSongDifficulty: currentDifficulty,
targetSongVariation: currentVariation,
targetSongPosition: Conductor.instance.songPosition
}
}






{
{
}

{
}
}
}

/**
* Handles applying health, score, and ratings.
*/
function applyScore(score:Float, daRating:String, healthChange:Float, isComboBreak:Bool)
{
switch (daRating)
{
case 'sick':
case 'good':
case 'bad':
case 'shit':
case 'miss':
default:
}
{
}
else
{
}
}

/**
* Handles rating popups when a note is hit.
*/
function popUpScore(daRating:String, ?combo:Int):Void
{
{
}

{

for (i in 0...pressArray.length)
{
}
}

}

/**
* Handle keyboard inputs during cutscenes.
* This includes advancing conversations and skipping videos.
* @param elapsed Time elapsed since last game update.
*/
function handleCutsceneKeys(elapsed:Float):Void
{




{
{
}
else if ((controls.PAUSE_P || androidPause || pauseButtonCheck) && !justUnpaused)
{
}
}
else if (VideoCutscene.isPlaying())
{
{
}
}
}

/**
* Handle logic for actually skipping a video cutscene after it has been held.
*/
function skipVideoCutscene():Void
{
}

/**
* End the song. Handle saving high scores and transitioning to the results screen.
*
* Broadcasts an `onSongEnd` event, which can be cancelled to prevent the song from ending (for a cutscene or something).
* Remember to call `endSong` again when the song should actually end!
* @param rightGoddamnNow If true, don't play the fancy animation where you zoom onto Girlfriend. Used after a cutscene.
*/
public function endSong(rightGoddamnNow:Bool = false):Void
{







{
score: Std.int(songScore),
tallies: {
sick: Highscore.tallies.sick,
good: Highscore.tallies.good,
bad: Highscore.tallies.bad,
shit: Highscore.tallies.shit,
missed: Highscore.tallies.missed,
combo: Highscore.tallies.combo,
maxCombo: Highscore.tallies.maxCombo,
totalNotesHit: Highscore.tallies.totalNotesHit,
totalNotes: Highscore.tallies.totalNotes,
},



{

isNewHighscore = Save.instance.isSongHighScore(currentSong.id, suffixedDifficulty, data);

Save.instance.applySongRank(currentSong.id, suffixedDifficulty, data);

{
}
}
}

{

score: Std.int(songScore),
tallies: {
sick: Highscore.tallies.sick,
good: Highscore.tallies.good,
bad: Highscore.tallies.bad,
shit: Highscore.tallies.shit,
missed: Highscore.tallies.missed,
combo: Highscore.tallies.combo,
maxCombo: Highscore.tallies.maxCombo,
totalNotesHit: Highscore.tallies.totalNotesHit,
totalNotes: Highscore.tallies.totalNotes,
}


}


{



{
{
score: PlayStatePlaylist.campaignScore,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
},

{



{
Save.instance.setLevelScore(PlayStatePlaylist.campaignId, PlayStatePlaylist.campaignDifficulty, data);
}
}
}

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
else
{




{

FunkinSound.playOnce(Paths.sound('Lights_Shut_off'), function()
{
{
}
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: PlayStatePlaylist.campaignDifficulty,
targetVariation: targetVariation,
cameraFollowPoint: cameraFollowPoint.getPosition(),
}
else
{
{
}
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: PlayStatePlaylist.campaignDifficulty,
targetVariation: targetVariation,
cameraFollowPoint: cameraFollowPoint.getPosition(),
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
}

public override function close():Void
{
criticalFailure = true; // Stop game updates.
}

/**
* Perform necessary cleanup before leaving the PlayState.
*/
function performCleanup():Void
{


{
}

{
}


{
{
}
}
else
{
{
}
}




{
}


instance = null;
}

/**
* Play the camera zoom animation and then move to the results screen once it's done.
*/
function zoomIntoResultsScreen(isNewHighscore:Bool, ?prevScoreData:SaveScoreData):Void
{





{
}
else if (targetDad && dad != null)
{
}
else if (girlfriend != null)
{
}



camTransition.fade(FlxColor.BLACK, 0.6, false, function()
{

new FlxTimer().start(0.8, function(_)
{
{
}
else if (targetDad)
{
}
else
{
}

/*
FlxTween.tween(FlxG.camera, {zoom: 1200}, 1.1,
{
ease: FlxEase.expoIn,
*/
}

/**
* Move to the results screen right goddamn now.
*/
function moveToResultsScreen(isNewHighscore:Bool, ?prevScoreData:SaveScoreData):Void
{
}


storyMode: PlayStatePlaylist.isStoryMode,
songId: currentChart.song.id,
difficultyId: currentDifficulty,
characterId: currentChart.characters.player,
title: PlayStatePlaylist.isStoryMode ? ('${PlayStatePlaylist.campaignTitle}') : ('${currentChart.songName} by ${currentChart.songArtist}'),
prevScoreData: prevScoreData,
scoreData: {
score: PlayStatePlaylist.isStoryMode ? PlayStatePlaylist.campaignScore : Std.int(songScore),
tallies: {
sick: talliesToUse.sick,
good: talliesToUse.good,
bad: talliesToUse.bad,
shit: talliesToUse.shit,
missed: talliesToUse.missed,
combo: talliesToUse.combo,
maxCombo: talliesToUse.maxCombo,
totalNotesHit: talliesToUse.totalNotesHit,
totalNotes: talliesToUse.totalNotes,
},
},
isNewHighscore: isNewHighscore,
isPracticeMode: isPracticeMode,
isBotPlayMode: isBotPlayMode,
}

/**
* Pauses music and vocals easily.
*/
public function pauseMusic():Void
{
}

/**
* Resets the camera's zoom level and focus point.
*/
public function resetCamera(resetZoom:Bool = true, cancelTweens:Bool = true, snap:Bool = true):Void
{
{
}


{
}

}

/**
* Sets the camera follow point's position and tweens the camera there.
*/
public function tweenCameraToPosition(x:Float = 0, y:Float = 0, duration:Float = 0, ?ease:Null<Float->Float>):Void
{
}

/**
* Disables camera following and tweens the camera to the follow point manually.
*/
public function tweenCameraToFollowPoint(duration:Float = 0, ?ease:Null<Float->Float>):Void
{

{
}
else
{


cameraFollowTween = FlxTween.tween(FlxG.camera.scroll, {x: followPos.x, y: followPos.y}, adjustedDuration, {
ease: ease,
onComplete: function(_)
{
resetCamera(false, false); // Re-enable camera following when the tween is complete.
}
}
}

public function cancelCameraFollowTween()
{
{
}
}

/**
* Tweens the camera zoom to the desired amount.
*/
public function tweenCameraZoom(zoom:Float = 1, duration:Float = 0, direct:Bool = false, ?ease:Null<Float->Float>):Void
{


{
}
else
{
}
}

public function cancelCameraZoomTween():Void
{
{
}
}

/**
* Cancel all active camera tweens simultaneously.
*/
public function cancelAllCameraTweens()
{
}


/**
* The magical function that shall tween the scroll speed.
*/
public function tweenScrollSpeed(?speed:Float, duration:Float = 0, ?ease:Null<Float->Float>, strumlines:Array<String>):Void
{

for (i in prevScrollTargets)
{
}


for (i in strumlines)
{

{
}
else
{

scrollSpeedTweens.push(FlxTween.tween(strum, {
'scrollSpeed': value
}
}
}

public function cancelScrollSpeedTweens()
{
for (tween in scrollSpeedTweens)
{
{
}
}
}

function forEachPausedSound(f:FlxSound->Void):Void
{
for (sound in soundsPausedBySubState)
{
}
}

/**
* Jumps forward or backward a number of sections in the song.
* Accounts for BPM changes.
* @param sections The number of sections to jump, negative to go backwards.
* @param preventDeath Decides if time skip should prevent player from dying.
*/
function changeSection(sections:Int, preventDeath:Bool = false):Void
{



{
}

SongEventRegistry.handleSkippedEvents(songEvents, Conductor.instance.songPosition);

Conductor.instance.update(FlxG.sound?.music?.time ?? 0.0);

}
}
