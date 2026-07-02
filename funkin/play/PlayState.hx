package funkin.play;


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
super();

lastParams ?? throw 'PlayState constructor called with no available parameters.';
}
lastParams = params;

currentSong = params.targetSong ?? throw "targetSong should not be null";
previousDifficulty = currentDifficulty;
isPracticeMode = params.practiceMode ?? false;
isBotPlayMode = params.botPlayMode ?? false;
isPlaytestResults = params.playtestResults ?? false;
isMinimalMode = params.minimalMode ?? false;
startTimestamp = params.startTimestamp ?? 0.0;
playbackRate = params.playbackRate ?? 1.0;
overrideMusic = params.overrideMusic ?? false;
previousCameraFollowPoint = params.cameraFollowPoint;
mirrorSongData = params.mirrored ?? false;


{
cameraFollowPoint.makeSolidColor(8, 8, 0xFF00FF00);
cameraFollowPoint.visible = false;
cameraFollowPoint.zIndex = 1000000;
this.cameraFollowPoint = cameraFollowPoint;
}
else
{
cameraFollowPoint = new FlxObject(0, 0);
}

camGame = new FunkinCamera('playStateCamGame');
camHUD = new FunkinCamera('playStateCamHUD');
camCutscene = new FunkinCamera('playStateCamCutscene');
camCutouts = new FunkinCamera('playStateCamCutouts');
camSubtitles = new FunkinCamera('playStateCamSubtitles');
camPause = new FunkinCamera('playStateCamPause');
camTransition = new FunkinCamera('playStateCamTransition');

noteStyle = nulNoteStyle;

playerStrumline = new Strumline(noteStyle, !isBotPlayMode, currentChart?.scrollSpeed);
opponentStrumline = new Strumline(noteStyle, false, currentChart?.scrollSpeed);

healthBarBG = FunkinSprite.create(0, 0, 'healthBar');
healthBar = new FlxBar(0, 0, RIGHT_TO_LEFT, Std.int(healthBarBG.width - 8), Std.int(healthBarBG.height - 8), null, 0, 2);
scoreText = new FlxBitmapText(0, 0, '', FlxBitmapFont.fromAngelCode(Paths.font("vcr-bmp.png"), Paths.font("vcr-bmp.fnt")));

comboPopUps = new PopUpStuff(noteStyle);

pauseButton = FunkinSprite.createSparrow(0, 0, "pauseButton");
pauseCircle = FunkinSprite.create(0, 0, 'pauseCircle');

}

/**
* Called when the PlayState is switched to.
*/
public override function create():Void
{
{
}
instance = this;



this.persistentUpdate = true;
this.persistentDraw = true;

justUnpaused = isChartingMode && !FlxG.game._lostFocus;

{

currentChart.cacheInst(currentInstrumental);
currentChart.cacheVocals();
}

Conductor.instance.forceBPM(null);

{
Conductor.instance.instrumentalOffset = currentChart.offsets.getInstrumentalOffset(currentInstrumental);
}

Conductor.instance.mapTimeChanges(currentChart.timeChanges);


Conductor.instance.update(pre);

initCameras();
initHealthBar();
{
initStage();
initCharacters();
}
else
{
initMinimalMode();
}
initStrumlines();
initPopups();

{
addHitbox(false);
{
hitbox.isPixel = currentChart.noteStyle == "pixel";

{
for (direction in Strumline.DIRECTIONS)
{
hitbox.getFirstHintByDirection(direction).follow(playerStrumline.getByDirection(direction));
}
}
}
}
else
{
camControls = new FunkinCamera('camControls');
camControls.bgColor = 0x0;
}

initDiscord();

generateSong();

resetCamera();

initPreciseInputs();


startingSong = true;

startCountdown();

initPauseSprites();

super.create();

leftWatermarkText.cameras = [camHUD];
rightWatermarkText.cameras = [camHUD];

this.rightWatermarkText.text = Constants.VERSION;


initialized = true;

refresh();
}

public function togglePauseButton(visible:Bool = false):Void
{
pauseCircle.alpha = visible ? 0.1 : 0;
pauseButton.alpha = visible ? 1 : 0;
}

function assertChartExists():Bool
{
{
criticalFailure = true;

{
message = 'There was a critical error loading this song\'s chart. Click OK to return to the main menu.';
}
else if (currentDifficulty == null)
{
message = 'There was a critical error selecting a difficulty for this song. Click OK to return to the main menu.';
}
else if (currentChart == null)
{
message = 'There was a critical error retrieving data for this song on "$currentDifficulty" difficulty with variation "$currentVariation". Click OK to return to the main menu.';
}
else if (currentChart?.notes == null)
{
message = 'There was a critical error retrieving note data for this song on "$currentDifficulty" difficulty with variation "$currentVariation". Click OK to return to the main menu.';
}

funkin.util.WindowUtil.showError('Error loading PlayState', message);

{
this.close();
}
else
{
}
}

}

public override function update(elapsed:Float):Void
{

super.update(elapsed);

updateHealthBar();
updateScoreText();

{

prevScrollTargets = [];


previousDifficulty = currentDifficulty;

currentStage?.resetStage();

dispatchEvent(retryEvent);

resetCamera();


persistentUpdate = true;
persistentDraw = true;

startingSong = true;
isPlayerDying = false;

{
}

{
vocals.stop();
vocals = currentChart?.buildVocals(currentInstrumental);

{
}
}


{
vocals.pause();
vocals.time = startTimestamp - Conductor.instance.instrumentalOffset;

vocals.playerVolume = playerVocalsVolume;
vocals.opponentVolume = opponentVocalsVolume;
}

{
playerStrumline.vwooshNotes();
opponentStrumline.vwooshNotes();
}

playerStrumline.clean();
opponentStrumline.clean();

regenNoteData(startTimestamp);

cameraBopIntensity = Constants.DEFAULT_BOP_INTENSITY;
hudCameraZoomIntensity = (cameraBopIntensity - 1.0) * 2.0;
cameraZoomRate = Constants.DEFAULT_ZOOM_RATE;

health = Constants.HEALTH_STARTING;
songScore = 0.0;
Highscore.tallies.combo = 0;

Conductor.instance.update(-vwooshDelay * 1000 + startTimestamp + Conductor.instance.beatLengthMs * -5);

vwooshTimer.start(vwooshDelay, function(_)
{
playerStrumline.vwooshInNotes();
opponentStrumline.vwooshInNotes();
Countdown.performCountdown();
});

Countdown.stopCountdown();

currentStage?.getBoyfriend()?.initHealthIcon(false);
currentStage?.getDad()?.initHealthIcon(true);

needsReset = false;
}

{
{
Conductor.instance.update(Conductor.instance.songPosition + elapsed * 1000, false);
{
startSong();
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

pauseButtonCheck = TouchUtil.pressAction(pauseButton);

androidPause = FlxG.android.justReleased.BACK;


{
tweenPauseButtonIn();
}



{
cameraBopMultiplier = FlxMath.lerp(1.0, cameraBopMultiplier, Math.pow(decayRate, dt));


camHUD.zoom = FlxMath.lerp(defaultHUDCameraZoom, camHUD.zoom, Math.pow(decayRate, dt));
}

{
}

{
{
health = Constants.HEALTH_MIN;
}

{
health += 0.25 * Constants.HEALTH_MAX; // +25% health.
}

{
vocals?.pause();


deathCounter += 1;
Events.logFailSong(currentSong.id, currentVariation);

dispatchEvent(event);


persistentUpdate = false;
{
persistentDraw = true;
}
else
{
persistentDraw = false;
}

isPlayerDying = true;


{
new FlxTimer().start(deathPreTransitionDelay, function(_)
{
moveToGameOver();
});
}
else
{
moveToGameOver();
}

details: 'Game Over - ${buildDiscordRPCDetails()}',
state: buildDiscordRPCState(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
}
else if (isPlayerDying)
{
}
}

processSongEvents();

processInputQueue();


pauseCircle.visible = pauseButton.visible;

justUnpaused = false;
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
preparePauseUI();

dispatchEvent(event);


case Cutscene:
preparePauseUI();

dispatchEvent(event);


default: // also known as standard

Countdown.pauseCountdown();
preparePauseUI();

dispatchEvent(event);

{
persistentUpdate = false;
persistentDraw = true;

{
}
else
{

{
boyfriendPos = currentStage.getBoyfriend().getScreenPosition();
}

openPauseSubState(isChartingMode ? Charting : Standard, camPause, lostFocus);
}

details: 'Paused - ${buildDiscordRPCDetails()}',
state: buildDiscordRPCState(),
largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
}
}
}

function preparePauseUI():Void
{
FlxTween.cancelTweensOf(pauseButton);
FlxTween.cancelTweensOf(pauseCircle);
pauseButton.alpha = 0;
pauseCircle.alpha = 0;
}

function openPauseSubState(mode:PauseMode, cam:FlxCamera, lostFocus:Bool = false, ?onPause:Void->Void):Void
{
FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;
pauseSubState.camera = cam;
persistentUpdate = false;
shouldSubstatePause = true;
openSubState(pauseSubState);
}

function moveToGameOver():Void
{
playerStrumline.clean();
opponentStrumline.clean();

vwooshTimer.cancel();

songScore = 0.0;
updateScoreText();

health = Constants.HEALTH_STARTING;
healthLerp = health;

healthBar.value = healthLerp;

{
iconP1?.updatePosition();
iconP2?.updatePosition();
}

isGameOverState = true;
shouldSubstatePause = true;
isChartingMode: isChartingMode,
transparent: persistentDraw
});
FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;
openSubState(gameOverSubState);
}

function processSongEvents():Void
{
{

{
for (event in songEventsToActivate)
{
{
{
event.activated = true;
continue;
}
};

dispatchEvent(eventEvent);

{
SongEventRegistry.handleEvent(event);
}
}
}
}
}

public override function dispatchEvent(event:ScriptEvent):Void
{

super.dispatchEvent(event);
ScriptEventDispatcher.callEvent(currentSong, event);


NoteKindManager.callEvent(event);

ScriptEventDispatcher.callEvent(currentStage, event);

ScriptEventDispatcher.callEvent(currentConversation, event);

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
musicPausedBySubState = true;
}

{
{
{
}
sound.pause();
soundsPausedBySubState.add(sound);
});

vocals?.forEach(function(voice:FunkinSound)
{
soundsPausedBySubState.remove(voice);
});
}
else
{
vocals?.pause();
}
}


{
cameraFollowTween.active = false;
cameraTweensPausedBySubState.add(cameraFollowTween);
}

{
cameraZoomTween.active = false;
cameraTweensPausedBySubState.add(cameraZoomTween);
}



for (tween in scrollSpeedTweens)
{
{
tween.active = false;
cameraTweensPausedBySubState.add(tween);
}
}
}

super.openSubState(subState);
}

/**
* Function called before closing the current substate.
* @param subState
*/
public override function closeSubState():Void
{
{
shouldSubstatePause = false;

dispatchEvent(event);


{
{
{
}
sound.pause();
soundsPausedBySubState.add(sound);
});

vocals?.forEach(function(voice:FunkinSound)
{
soundsPausedBySubState.remove(voice);
});
}
else
{
vocals?.pause();
}


{
musicPausedBySubState = false;
}

forEachPausedSound(s -> needsReset ? (s.autoDestroy ? s.destroy() : s.stop()) : s.resume());

for (camTween in cameraTweensPausedBySubState)
{
camTween.active = true;
}
cameraTweensPausedBySubState.clear();



{
currentConversation.resumeMusic();
}


Countdown.resumeCountdown();

{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
}
else
{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
}

justUnpaused = true;
}
isGameOverState = false;

super.closeSubState();
}

/**
* Function called when the game window gains focus.
*/
public override function onFocus():Void
{
else if (Preferences.autoPause) VideoCutscene.resumeVideo();

{
{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
}
else
{
state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
}
}

super.onFocus();
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
});
}

{
{
pause(Conversation, true);
}
else if (VideoCutscene.isPlaying())
{
pause(Cutscene, true);
}
else
{
pause(true);
}
}
super.onFocusLost();
}

/**
* Call this by pressing F5 on a debug build.
*/
override function reloadAssets():Void
{
performCleanup();

instance = this;

funkin.modding.PolymodHandler.forceReloadAssets();
{
throw "No lastParams to refer to";
}
lastParams.targetSong = SongRegistry.instance.fetchEntry(currentSong.id,
{variation: currentVariation}) ?? throw "Could not load current song from ID. This shouldn't happen!";
LoadingState.loadPlayState(lastParams);
}

override function stepHit():Bool
{



iconP1?.onStepHit(Std.int(Conductor.instance.currentStep));
iconP2?.onStepHit(Std.int(Conductor.instance.currentStep));


&& camHUD.zoom < (MAX_RELATIVE_CAM_ZOOM * defaultHUDCameraZoom)
&& cameraZoomRate > 0
&& (Conductor.instance.currentStep + cameraZoomRateOffset * Constants.STEPS_PER_BEAT) % (cameraZoomRate * Constants.STEPS_PER_BEAT) == 0)
{
cameraBopMultiplier = cameraBopIntensity;
camHUD.zoom += hudCameraZoomIntensity * defaultHUDCameraZoom;
}

playerStrumline.noteVibrations.tryHoldNoteVibration();

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
});

vocals.opponentVoices?.forEachAlive(function(voice:FunkinSound)
{
});
}
}

&& (Math.abs(FlxG.sound.music.time - correctSync) > RESYNC_THRESHOLD
|| Math.abs(playerVoicesError) > RESYNC_THRESHOLD
|| Math.abs(opponentVoicesError) > RESYNC_THRESHOLD))
{
{
}
resyncVocals();
}
}


}

public override function destroy():Void
{
performCleanup();



super.destroy();
}

public override function initConsoleHelpers():Void
{
{
debugUnbindCameraZoom = !debugUnbindCameraZoom;
});
};

/**
* Initializes the game and HUD cameras.
*/
function initCameras():Void
{
camGame.bgColor = BACKGROUND_COLOR; // Show a pink background behind the stage.
camHUD.bgColor.alpha = 0; // Show the game scene behind the camera.
camCutscene.bgColor.alpha = 0; // Show the game scene behind the camera.
camCutouts.setPosition((FlxG.width - FlxG.initialWidth) / 2, (FlxG.height - FlxG.initialHeight) / 2);
camCutouts.setSize(FlxG.initialWidth, FlxG.initialHeight);
camCutouts.bgColor.alpha = 0; // Show the game scene behind the camera.
camPause.bgColor.alpha = 0; // Show the game scene behind the camera.
camTransition.bgColor.alpha = 0;


{
cameraFollowPoint.setPosition(previousCameraFollowPoint.x, previousCameraFollowPoint.y);
previousCameraFollowPoint = null;
}
add(cameraFollowPoint);
}

/**
* Initializes the health bar on the HUD.
*/
function initHealthBar():Void
{
&& !ControlsHandler.hasExternalInputDevice)
|| #end Preferences.downscroll;


healthBarBG.y = healthBarYPos;
healthBarBG.screenCenter(X);
healthBarBG.scrollFactor.set(0, 0);
healthBarBG.zIndex = 800;
add(healthBarBG);

healthBar.x = healthBarBG.x + 4;
healthBar.y = healthBarBG.y + 4;
healthBar.parent = this;
healthBar.parentVariable = 'healthLerp';
healthBar.scrollFactor.set();
healthBar.createFilledBar(Constants.COLOR_HEALTH_BAR_RED, Constants.COLOR_HEALTH_BAR_GREEN);
healthBar.zIndex = 801;
add(healthBar);

scoreText.x = healthBarBG.x + healthBarBG.width - 190;
scoreText.y = healthBarBG.y + 30;
scoreText.alignment = RIGHT;
scoreText.borderStyle = OUTLINE;
scoreText.borderColor = FlxColor.BLACK;
scoreText.letterSpacing = -1;
scoreText.scrollFactor.set();
scoreText.zIndex = 802;
add(scoreText);

healthBar.cameras = [camHUD];
healthBarBG.cameras = [camHUD];
scoreText.cameras = [camHUD];

{
&& !ControlsHandler.hasExternalInputDevice)
|| #end Preferences.downscroll;

subtitles = new Subtitles(0, 139, subtitlesAlignment);
subtitles.zIndex = 10000;
add(subtitles);

subtitles.cameras = [camSubtitles];
}
}

/**
* Generates the stage and all its props.
*/
function initStage():Void
{
loadStage(currentStageId);
}

function initMinimalMode():Void
{
menuBG.color = 0xFF4CAF50;
menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
menuBG.updateHitbox();
menuBG.screenCenter();
menuBG.scrollFactor.set(0, 0);
menuBG.zIndex = -1000;
add(menuBG);
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

ScriptEventDispatcher.callEvent(currentStage, event);

resetCameraZoom();

this.add(currentStage);

}
else
{
funkin.util.WindowUtil.showError('Stage Error', 'Unable to load stage $id, is its data corrupted?.');
}
}

public function resetCameraZoom():Void
{
currentCameraZoom = stageZoom;

cameraBopMultiplier = 1.0;
}

/**
* Generates the character sprites and adds them to the stage.
*/
function initCharacters():Void
{
{
throw 'Song difficulty could not be loaded.';
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
iconP2 = new HealthIcon('dad', 1);
iconP2.y = healthBar.y - (iconP2.height / 2);
dad.initHealthIcon(true); // Apply the character ID here
iconP2.zIndex = 850;
add(iconP2);
iconP2.cameras = [camHUD];

discordRPCAlbum = 'album-${currentChart?.album}';
discordRPCIcon = 'icon-${currentCharacterData.opponent}';
}

//
//

{
//
//
iconP1 = new HealthIcon('bf', 0);
iconP1.y = healthBar.y - (iconP1.height / 2);
boyfriend.initHealthIcon(false); // Apply the character ID here
iconP1.zIndex = 850;
add(iconP1);
iconP1.cameras = [camHUD];
}

//
//

{
{
currentStage.addCharacter(girlfriend, GF);

}

{
currentStage.addCharacter(boyfriend, BF);

}

{
currentStage.addCharacter(dad, DAD);
cameraFollowPoint.setPosition(dad.cameraFocusPoint.x, dad.cameraFocusPoint.y);

}

currentStage.refresh();
}
}

/**
* Constructs the strumlines for each player.
*/
function initStrumlines():Void
{
playerStrumline.onNoteIncoming.add(onStrumlineNoteIncoming);
opponentStrumline.onNoteIncoming.add(onStrumlineNoteIncoming);
add(playerStrumline);
add(opponentStrumline);

playerStrumline.x = (FlxG.width / 2 + Constants.STRUMLINE_X_OFFSET) + (cutoutSize / 2.0); // Classic style

playerStrumline.y = Preferences.downscroll ? FlxG.height - playerStrumline.height - Constants.STRUMLINE_Y_OFFSET - noteStyle.getStrumlineOffsets()[1] : Constants.STRUMLINE_Y_OFFSET;

playerStrumline.zIndex = 1001;
playerStrumline.cameras = [camHUD];

opponentStrumline.x = Constants.STRUMLINE_X_OFFSET + cutoutSize;
opponentStrumline.y = Preferences.downscroll ? FlxG.height - opponentStrumline.height - Constants.STRUMLINE_Y_OFFSET - noteStyle.getStrumlineOffsets()[1] : Constants.STRUMLINE_Y_OFFSET;

opponentStrumline.zIndex = 1000;
opponentStrumline.cameras = [camHUD];

{
initNoteHitbox();
}

playerStrumline.fadeInArrows();
opponentStrumline.fadeInArrows();
}

/**
* Configures the position of strumline for the default control scheme
*/
function initNoteHitbox()
{

playerStrumline.strumlineScale.set(playerStrumlineScale, playerStrumlineScale);
playerStrumline.setNoteSpacing(playerNoteSpacing);
for (strum in playerStrumline)
{
strum.width *= 2;
}
opponentStrumline.enterMiniMode(0.4 * amplification);

playerStrumline.x = (FlxG.width - playerStrumline.width) / 2 + Constants.STRUMLINE_X_OFFSET;
playerStrumline.y = (FlxG.height - playerStrumline.height) * 0.95 - Constants.STRUMLINE_Y_OFFSET;
{
}
else
{
playerStrumline.y -= 10;
}
opponentStrumline.y = Constants.STRUMLINE_Y_OFFSET * 0.3;
opponentStrumline.x -= 30;
}

function initPauseSprites()
{
pauseButton.animation.addByIndices('idle', 'back', [0], "", 24, false);
pauseButton.animation.addByIndices('hold', 'back', [5], "", 24, false);
pauseButton.animation.addByIndices('confirm', 'back',
[6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], "", 24, false);
pauseButton.scale.set(0.8, 0.8);
pauseButton.updateHitbox();
pauseButton.animation.play("idle");
pauseButton.setPosition((FlxG.width - pauseButton.width) - 35, 35);

pauseCircle.scale.set(0.84, 0.8);
pauseCircle.updateHitbox();
pauseCircle.x = ((pauseButton.x + (pauseButton.width / 2)) - (pauseCircle.width / 2));
pauseCircle.y = ((pauseButton.y + (pauseButton.height / 2)) - (pauseCircle.height / 2));
pauseCircle.alpha = 0.1;

add(pauseCircle);
add(pauseButton);
hitbox?.forEachAlive(function(hint:FunkinHint)
{
hint.deadZones.push(pauseButton);
});

VideoCutscene.onVideoEnded.add(tweenPauseButtonIn);
VideoCutscene.onVideoResumed.add(tweenPauseButtonIn);
VideoCutscene.onVideoRestarted.add(tweenPauseButtonIn);
}

function tweenPauseButtonIn():Void
{
FlxTween.cancelTweensOf(pauseButton);
FlxTween.cancelTweensOf(pauseCircle);

FlxTween.tween(pauseButton, {alpha: 1}, 0.25, {ease: FlxEase.quartOut});
FlxTween.tween(pauseCircle, {alpha: 0.1}, 0.25, {ease: FlxEase.quartOut});
}

/**
* Configures the judgement and combo popups.
*/
function initPopups():Void
{
comboPopUps.zIndex = 900;
add(comboPopUps);
comboPopUps.cameras = [camHUD];
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
});

state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),
largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});
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
throw 'Song difficulty could not be loaded.';
}


{
vocals?.stop();
vocals = currentChart?.buildVocals(currentInstrumental);

{
}
}

regenNoteData(startTimestamp);

ScriptEventDispatcher.callEvent(currentSong, event);

generatedMusic = true;
}

/**
* Read note data from the chart and generate the notes.
*/
function regenNoteData(startTime:Float = 0):Void
{
{
}

Highscore.tallies.combo = 0;
Highscore.tallies = new Tallies();


dispatchEvent(event);


songEvents = builtEventData;
SongEventRegistry.resetEvents(songEvents);


for (songNote in builtNoteData)
{

{
}


switch (songNote.getStrumlineIndex())
{
case 0:

playerNoteData.push(songNote);
case 1:
opponentNoteData.push(songNote);
}
}

playerStrumline.applyNoteData(playerNoteData);
opponentStrumline.applyNoteData(opponentNoteData);
}

function onStrumlineNoteIncoming(noteSprite:NoteSprite):Void
{

dispatchEvent(event);
}

/**
* Prepares to start the countdown.
* Ends any running cutscenes, creates the strumlines, and starts the countdown.
* This is public so that scripts can call it.
*/
public function startCountdown():Void
{

isInCutscene = false;

camHUD.visible = true;
}

/**
* Displays a dialogue cutscene with the given ID.
* This is used by song scripts to display dialogue.
*/
public function startConversation(conversationId:String):Void
{
isInCutscene = true;

currentConversation = ConversationRegistry.instance.fetchEntry(conversationId);

currentConversation.completeCallback = onConversationComplete;
currentConversation.cameras = [camCutscene];
currentConversation.zIndex = 1000;
add(currentConversation);
refresh();

ScriptEventDispatcher.callEvent(currentConversation, event);
}

/**
* Handler function called when a conversation ends.
*/
function onConversationComplete():Void
{
isInCutscene = false;

{
currentConversation.kill();
remove(currentConversation);
currentConversation = null;
}

{
startCountdown();
}
}

/**
* Starts playing the song after the countdown has completed.
*/
function startSong():Void
{
startingSong = false;


{
currentChart?.playInst(1.0, currentInstrumental, false);
}

{
}

{
};


{
{
subtitlesFile += '-${currentVariation}';
}
}


{
add(vocals);

vocals.time = startTimestamp - Conductor.instance.instrumentalOffset;
vocals.pitch = playbackRate;
vocals.playerVolume = playerVocalsVolume;
vocals.opponentVolume = opponentVocalsVolume;


vocals.play();
}


state: buildDiscordRPCState(),
details: buildDiscordRPCDetails(),

largeImageKey: discordRPCAlbum,
smallImageKey: discordRPCIcon
});

{
handleSkippedNotes();
}

dispatchEvent(new ScriptEvent(SONG_START));

Events.logStartSong(currentSong.id, currentVariation);

resyncVocals();
}

/**
* Resynchronize the vocal tracks if they have become offset from the instrumental.
*/
function resyncVocals():Void
{


Math.max(Math.min(Conductor.instance.combinedOffset, 0), Conductor.instance.songPosition) - Conductor.instance.combinedOffset);

vocals.pause();


vocals.time = timeToPlayAt;
vocals.play(false, timeToPlayAt);
}

/**
* Updates the position and contents of the score display.
*/
function updateScoreText():Void
{
{
scoreText.text = 'Bot Play Enabled';
}
else
{
scoreText.text = 'Score: ${FlxStringUtil.formatMoney(songScore, SHOW_DECIMALS, COMMA_SEPARATED)}';
}
}

/**
* Updates the values of the health bar.
*/
function updateHealthBar():Void
{
{
healthLerp = Constants.HEALTH_MAX;
}
else
{
healthLerp = FlxMath.lerp(healthLerp, health, 0.15);
}
}

/**
* Callback executed when one of the note keys is pressed.
*/
function onKeyPress(event:PreciseInputEvent):Void
{

inputPressQueue.push(event);
}

/**
* Callback executed when one of the note keys is released.
*/
function onKeyRelease(event:PreciseInputEvent):Void
{
inputReleaseQueue.push(event);
}

/**
* Handles opponent note hits and player note misses.
*/
function processNotes(elapsed:Float):Void
{

for (note in opponentStrumline.notes.members)
{
{
dispatchEvent(event);


{
{
else
vocals.opponentVolume = opponentVocalsVolume;
}
}

opponentStrumline.hitNote(note);

{
opponentStrumline.playNoteHoldCover(note.holdNoteSprite);
}
}
}

for (holdNote in opponentStrumline.holdNotes.members)
{

{
{
currentStage.getDad().holdTimer = 0;
}
}

{
holdNote.handledMiss = true;

{
}
}
}

for (note in playerStrumline.notes.members)
{
{

dispatchEvent(event);


playerStrumline.hitNote(note);

{
playerStrumline.playNoteHoldCover(note.holdNoteSprite);
}
}

{
dispatchEvent(event);


{
onNoteMiss(note, event.playSound, event.healthChange);
}

note.handledMiss = true;
}
}

for (holdNote in playerStrumline.holdNotes.members)
{

{
{
health += Constants.HEALTH_HOLD_BONUS_PER_SECOND * elapsed;
songScore += Constants.SCORE_HOLD_BONUS_PER_SECOND * elapsed;
}

{
currentStage.getBoyfriend().holdTimer = 0;
}
}

{
holdNote.handledMiss = true;


{
{


dispatchEvent(event);


applyScore(event.score, '', event.healthChange, event.isComboBreak);

{
{
vocals.playerVolume = 0;
}
FunkinSound.playOnce(Paths.soundRandom('missnote', 1, 3), FlxG.random.float(0.5, 0.6));
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
note.handledMiss = true;
}
}

playerStrumline.handleSkippedNotes();
opponentStrumline.handleSkippedNotes();
}

/**
* PreciseInputEvents are put into a queue between update() calls,
* and then processed here.
*/
function processInputQueue():Void
{

{
inputPressQueue = [];
inputReleaseQueue = [];
}



for (note in notesInRange)
notesByDirection[note.direction].push(note);

{


playerStrumline.pressKey(input.noteDirection, input.keyCode);



{
ghostNoteMiss(input.noteDirection, notesInRange.length > 0);

playerStrumline.playPress(input.noteDirection);
}
else if (notesInDirection.length == 0)
{

playerStrumline.playPress(input.noteDirection);
}
else
{

goodNoteHit(targetNote, input);

notesInDirection.remove(targetNote);

playerStrumline.playConfirm(input.noteDirection);
}
}

{

playerStrumline.playStatic(input.noteDirection);

playerStrumline.releaseKey(input.noteDirection, input.keyCode);
}

playerStrumline.noteVibrations.tryNoteVibration();
}

function goodNoteHit(note:NoteSprite, input:PreciseInputEvent):Void
{


else
totalDiff = diff - inputLatencyMs;



switch (daRating)
{
case 'sick':
healthChange = Constants.HEALTH_SICK_BONUS;
isComboBreak = Constants.JUDGEMENT_SICK_COMBO_BREAK;
case 'good':
healthChange = Constants.HEALTH_GOOD_BONUS;
isComboBreak = Constants.JUDGEMENT_GOOD_COMBO_BREAK;
case 'bad':
healthChange = Constants.HEALTH_BAD_BONUS;
isComboBreak = Constants.JUDGEMENT_BAD_COMBO_BREAK;
case 'shit':
healthChange = Constants.HEALTH_SHIT_BONUS;
isComboBreak = Constants.JUDGEMENT_SHIT_COMBO_BREAK;
}

note.scoreable ? Highscore.tallies.combo + 1 : Highscore.tallies.combo, noteDiff, daRating == 'sick');
dispatchEvent(event);

playerStrumline.hitNote(note, !event.isComboBreak);
{
vocals.playerVolume = playerVocalsVolume;
}

{
Highscore.tallies.totalNotesHit++;
applyScore(event.score, event.judgement, event.healthChange, event.isComboBreak);
popUpScore(event.judgement);
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

applyScore(Scoring.getMissScore(), 'miss', healthChange, true);

{
FunkinSound.playOnce(Paths.soundRandom('missnote', 1, 3), FlxG.random.float(0.5, 0.6));
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
);
dispatchEvent(event);


health += event.healthChange;
songScore += event.scoreChange;

{

for (i in 0...pressArray.length)
{
}
}

{
FunkinSound.playOnce(Paths.soundRandom('missnote', 1, 3), FlxG.random.float(0.1, 0.2));
}
}

/**
* Debug keys. Disabled while in cutscenes.
*/
function debugKeyShit():Void
{
{
disableKeys = true;
persistentUpdate = false;
targetStageId: currentStageId,
targetBfChar: bf,
targetGfChar: gf,
targetDadChar: dad
}));
}

{
disableKeys = true;
persistentUpdate = false;
{
this.close();
}
else
{
targetSongId: currentSong.id,
targetSongDifficulty: currentDifficulty,
targetSongVariation: currentVariation,
targetSongPosition: Conductor.instance.songPosition
}));
}
}





&& iconP1 != null) iconP1.toggleOldIcon();

{
{
changeSection(FlxG.keys.pressed.SHIFT ? 20 : 2, true);
}

{
changeSection(FlxG.keys.pressed.SHIFT ? -20 : -2, true);
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
Highscore.tallies.sick += 1;
case 'good':
Highscore.tallies.good += 1;
case 'bad':
Highscore.tallies.bad += 1;
case 'shit':
Highscore.tallies.shit += 1;
case 'miss':
Highscore.tallies.missed += 1;
default:
}
health += healthChange;
{
Highscore.tallies.combo = 0;
}
else
{
Highscore.tallies.combo++;
}
songScore += score;
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
comboPopUps.displayRating(daRating);

}

/**
* Handle keyboard inputs during cutscenes.
* This includes advancing conversations and skipping videos.
* @param elapsed Time elapsed since last game update.
*/
function handleCutsceneKeys(elapsed:Float):Void
{


androidPause = FlxG.android.justPressed.BACK;

pauseButtonCheck = TouchUtil.overlapsComplex(pauseButton);

{
{
currentConversation.advanceConversation();
}
else if ((controls.PAUSE_P || androidPause || pauseButtonCheck) && !justUnpaused)
{
pause(Conversation);
}
}
else if (VideoCutscene.isPlaying())
{
{
pause(Cutscene);
}
}
}

/**
* Handle logic for actually skipping a video cutscene after it has been held.
*/
function skipVideoCutscene():Void
{
VideoCutscene.finishVideo();
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
mayPauseGame = false;
isSongEnd = true;

disableKeys = true;

pauseButton.visible = false;
pauseCircle.visible = false;

dispatchEvent(event);

deathCounter = 0;

&& currentVariation != 'erect') ? '$currentDifficulty-${currentVariation}' : currentDifficulty;


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
};

Highscore.talliesLevel = Highscore.combineTallies(Highscore.tallies, Highscore.talliesLevel);

Leaderboards.submitSongScore(currentSong.id, suffixedDifficulty, Std.int(songScore));

{
Events.logCompleteSong(currentSong.id, currentVariation);

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
});


}


{
isNewHighscore = false;

PlayStatePlaylist.campaignScore += Std.int(songScore);


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
};

{
Medals.awardStoryLevel(PlayStatePlaylist.campaignId);

Leaderboards.submitLevelScore(PlayStatePlaylist.campaignId, PlayStatePlaylist.campaignDifficulty, PlayStatePlaylist.campaignScore);

Events.logCompleteLevel(PlayStatePlaylist.campaignId);

{
Save.instance.setLevelScore(PlayStatePlaylist.campaignId, PlayStatePlaylist.campaignDifficulty, data);
isNewHighscore = true;
}
}
}

{
this.close();
}
else
{
{
moveToResultsScreen(isNewHighscore);
}
else
{
zoomIntoResultsScreen(isNewHighscore);
}
}
}
else
{


FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;

vocals?.stop();

{
blackBG.makeSolidColor(FlxG.width * 3, FlxG.height * 3, FlxColor.BLACK);
blackBG.scrollFactor.set();
add(blackBG);
camHUD.visible = false;
isInCutscene = true;

FunkinSound.playOnce(Paths.sound('Lights_Shut_off'), function()
{
{
targetVariation = targetSong.getFirstValidVariation(PlayStatePlaylist.campaignDifficulty) ?? Constants.DEFAULT_VARIATION;
}
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: PlayStatePlaylist.campaignDifficulty,
targetVariation: targetVariation,
cameraFollowPoint: cameraFollowPoint.getPosition(),
});
});
}
else
{
{
targetVariation = targetSong.getFirstValidVariation(PlayStatePlaylist.campaignDifficulty) ?? Constants.DEFAULT_VARIATION;
}
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: PlayStatePlaylist.campaignDifficulty,
targetVariation: targetVariation,
cameraFollowPoint: cameraFollowPoint.getPosition(),
});
}
}
}
else
{
{
{
moveToResultsScreen(false, prevScoreData);
}
else
{
this.close();
}
}
else
{
{
moveToResultsScreen(isNewHighscore, prevScoreData);
}
else
{
zoomIntoResultsScreen(isNewHighscore, prevScoreData);
}
}
}
}

public override function close():Void
{
criticalFailure = true; // Stop game updates.
performCleanup();
super.close();
}

/**
* Perform necessary cleanup before leaving the PlayState.
*/
function performCleanup():Void
{
cancelAllCameraTweens();

dispatchEvent(new ScriptEvent(DESTROY, false));

{
remove(currentConversation);
currentConversation.kill();
}

{
}

vwooshTimer.cancel();

{
{
vocals.pause();
remove(vocals);
}
}
else
{
{
vocals.destroy();
remove(vocals);
}
}

forEachPausedSound((s) -> s.destroy());


FlxTween.globalManager.clear();
FlxTimer.globalManager.clear();

{
remove(currentStage);
currentStage.kill();
currentStage = null;
}

GameOverSubState.reset();
PauseSubState.reset();
Countdown.reset();

instance = null;
}

/**
* Play the camera zoom animation and then move to the results screen once it's done.
*/
function zoomIntoResultsScreen(isNewHighscore:Bool, ?prevScoreData:SaveScoreData):Void
{

cameraZoomRate = 0;

cancelAllCameraTweens();
cancelScrollSpeedTweens();



{
}
else if (targetDad && dad != null)
{
}
else if (girlfriend != null)
{
}


FlxTween.tween(camHUD, {alpha: 0}, 0.6);

camTransition.fade(FlxColor.BLACK, 0.6, false, function()
{
moveToResultsScreen(isNewHighscore, prevScoreData);
});

new FlxTimer().start(0.8, function(_)
{
{
boyfriend?.animation.play('hey');
}
else if (targetDad)
{
dad?.animation.play('cheer');
}
else
{
girlfriend?.animation.play('cheer');
}

/*
FlxTween.tween(FlxG.camera, {zoom: 1200}, 1.1,
{
ease: FlxEase.expoIn,
});
*/
});
}

/**
* Move to the results screen right goddamn now.
*/
function moveToResultsScreen(isNewHighscore:Bool, ?prevScoreData:SaveScoreData):Void
{
}

persistentUpdate = false;
vocals?.stop();
camHUD.alpha = 1;

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
});
this.persistentDraw = false;
openSubState(res);
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
cancelAllCameraTweens();
}


{
resetCameraZoom();
}

}

/**
* Sets the camera follow point's position and tweens the camera there.
*/
public function tweenCameraToPosition(x:Float = 0, y:Float = 0, duration:Float = 0, ?ease:Null<Float->Float>):Void
{
cameraFollowPoint.setPosition(x, y);
tweenCameraToFollowPoint(duration, ease);
}

/**
* Disables camera following and tweens the camera to the follow point manually.
*/
public function tweenCameraToFollowPoint(duration:Float = 0, ?ease:Null<Float->Float>):Void
{
cancelCameraFollowTween();

{
resetCamera(false, false);
}
else
{


cameraFollowTween = FlxTween.tween(FlxG.camera.scroll, {x: followPos.x, y: followPos.y}, adjustedDuration, {
ease: ease,
onComplete: function(_)
{
resetCamera(false, false); // Re-enable camera following when the tween is complete.
}
});
}
}

public function cancelCameraFollowTween()
{
{
cameraFollowTween.cancel();
}
}

/**
* Tweens the camera zoom to the desired amount.
*/
public function tweenCameraZoom(zoom:Float = 1, duration:Float = 0, direct:Bool = false, ?ease:Null<Float->Float>):Void
{
cancelCameraZoomTween();


{
currentCameraZoom = targetZoom;
}
else
{
cameraZoomTween = FlxTween.tween(this, {currentCameraZoom: targetZoom}, adjustedDuration, {ease: ease});
}
}

public function cancelCameraZoomTween():Void
{
{
cameraZoomTween.cancel();
}
}

/**
* Cancel all active camera tweens simultaneously.
*/
public function cancelAllCameraTweens()
{
cancelCameraFollowTween();
cancelCameraZoomTween();
}


/**
* The magical function that shall tween the scroll speed.
*/
public function tweenScrollSpeed(?speed:Float, duration:Float = 0, ?ease:Null<Float->Float>, strumlines:Array<String>):Void
{
cancelScrollSpeedTweens();

for (i in prevScrollTargets)
{
strum.scrollSpeed = value;
}

prevScrollTargets = [];

for (i in strumlines)
{

{
strum.scrollSpeed = value;
}
else
{

scrollSpeedTweens.push(FlxTween.tween(strum, {
'scrollSpeed': value
}, adjustedDuration, {ease: ease}));
}
prevScrollTargets.push([value, i]);
}
}

public function cancelScrollSpeedTweens()
{
for (tween in scrollSpeedTweens)
{
{
tween.cancel();
}
}
scrollSpeedTweens = [];
}

function forEachPausedSound(f:FlxSound->Void):Void
{
for (sound in soundsPausedBySubState)
{
f(sound);
}
soundsPausedBySubState.clear();
}

/**
* Jumps forward or backward a number of sections in the song.
* Accounts for BPM changes.
* @param sections The number of sections to jump, negative to go backwards.
* @param preventDeath Decides if time skip should prevent player from dying.
*/
function changeSection(sections:Int, preventDeath:Bool = false):Void
{


targetTimeMs = Math.max(0, targetTimeMs);

{
}

handleSkippedNotes();
SongEventRegistry.handleSkippedEvents(songEvents, Conductor.instance.songPosition);

Conductor.instance.update(FlxG.sound?.music?.time ?? 0.0);

resyncVocals();
}
}
