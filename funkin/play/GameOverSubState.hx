package funkin.play;


/**
* A substate which renders over the PlayState when the player dies.
* Displays the player death animation, plays the music, and handles restarting the song.
*
* The newest implementation uses a substate, which prevents having to reload the song and stage each reset.
*/
class GameOverSubState extends MusicBeatSubState
{
/**
* The currently active GameOverSubState.
* There should be only one GameOverSubState in existance at a time, we can use a singleton.
*/

/**
* Which alternate animation on the character to use.
* You can set this via script.
* For example, playing a different animation when BF dies in Week 4
* or Pico dies in Weekend 1.
*/

/**
* Which alternate game over music to use.
* You can set this via script.
* For example, the bf-pixel script sets this to `-pixel`
* and the pico-playable script sets this to `Pico`.
*/

/**
* Which alternate "blue ball" sound effect to use.
*/


/**
* The boyfriend character.
*/

/**
* The invisible object in the scene which the camera focuses on.
*/

/**
* The music playing in the background of the state.
*/

/**
* Whether the player has confirmed and prepared to restart the level or to go back to the freeplay menu.
* This means the animation and transition have already started.
*/

/**
* Whether the death music is on its first loop.
*/







public function new(params:GameOverParams)
{
super();

this.isChartingMode = params?.isChartingMode ?? false;
transparent = params.transparent;

cameraFollowPoint = new FlxObject(0, 0, 1, 1);
{
cameraFollowPoint.x = parentPlayState.cameraFollowPoint.x;
cameraFollowPoint.y = parentPlayState.cameraFollowPoint.y;
}
}

/**
* The PlayState that this GameOverSubState is displaying on top of.
*/

/**
* Reset the game over configuration to the default.
*/
public static function reset():Void
{
animationSuffix = '';
musicSuffix = '';
blueBallSuffix = '';
blueballed = false;
}

public override function create():Void
{
{
}
instance = this;

super.create();

parentPlayState = cast _parentState;

//
//

bg.alpha = transparent ? 0.25 : 1.0;
bg.scrollFactor.set();
bg.screenCenter();
add(bg);

{
}
else
{
boyfriend = parentPlayState?.currentStage?.getBoyfriend(true);
{
boyfriend.canPlayOtherAnims = true;
boyfriend.isDead = true;
add(boyfriend);
boyfriend.resetCharacter(false);
}
}

setCameraTarget();

//
//

Conductor.instance.update(0);

addBackButton(FlxG.width - 230, FlxG.height - 200, FlxColor.WHITE, goBack);

HapticUtil.vibrate(0, Constants.DEFAULT_VIBRATION_DURATION);

new FlxTimer().start(1, function(tmr:FlxTimer)
{
canInput = true;
});
}

function setCameraTarget():Void
{

cameraFollowPoint = new FlxObject(parentPlayState.cameraFollowPoint.x, parentPlayState.cameraFollowPoint.y, 1, 1);
cameraFollowPoint.x = boyfriend.cameraFocusPoint.x;
cameraFollowPoint.y = boyfriend.cameraFocusPoint.y;

{
cameraFollowPoint.x -= Std.int(boyfriend._data.cameraOffsets[0]);
cameraFollowPoint.y -= Std.int(boyfriend._data.cameraOffsets[1]);

cameraFollowPoint.x -= Std.int((parentPlayState?.currentStage?._data?.characters?.bf?.cameraOffsets ?? [0, 0])[0]);
cameraFollowPoint.y -= Std.int((parentPlayState?.currentStage?._data?.characters?.bf?.cameraOffsets ?? [0, 0])[1]);
}

cameraFollowPoint.x += offsets[0];
cameraFollowPoint.y += offsets[1];
add(cameraFollowPoint);

targetCameraZoom = (parentPlayState?.currentStage?.camZoom ?? 1.0) * boyfriend.getDeathCameraZoom();
}

/**
* Forcibly reset the camera zoom level to that of the current stage.
* This prevents camera zoom events from adversely affecting the game over state.
*/
public function resetCameraZoom():Void
{
}


override function update(elapsed:Float):Void
{
{
hasStartedAnimation = true;

{
playBlueBalledSFX();
}
else
{
{
boyfriend.playAnimation('fakeoutDeath', true, false);
}
else
{
boyfriend.playAnimation('firstDeath' + animationSuffix, true,
false); // ignoreOther is set to FALSE since you WANT to be able to mash and confirm game over!
playBlueBalledSFX();
}
}
}


//
//

&& blueballed
&& !mustNotExit)
{
blueballed = false;
confirmDeath();
}


{
Conductor.instance.update(gameOverMusic.time);
}
else if (boyfriend != null)
{
{
}
else
{

{
{
hasPlayedDeathQuote = true;
playDeathQuote();
}
}
else
{
{
startDeathMusic(1.0, false);
boyfriend.playAnimation('deathLoop' + animationSuffix);
}
}
}
}

super.update(elapsed);
}


function playDeathQuote():Void
{


{
deathQuoteSound.stop();
deathQuoteSound = null;
}

startDeathMusic(0.2, false);
boyfriend.playAnimation('deathLoop' + animationSuffix);
deathQuoteSound = FunkinSound.playOnce(deathQuote, function()
{
{
gameOverMusic.fadeIn(4, 0.2, 1);
}
});
}

/**
* Do behavior which occurs when you confirm and move to restart the level.
*/
function confirmDeath():Void
{
{
isEnding = true;

hasPlayedDeathQuote = true;
{
deathQuoteSound.stop();
deathQuoteSound = null;
}

startDeathMusic(1.0, true); // isEnding changes this function's behavior.

{
}
else
{
boyfriend.playAnimation('deathConfirm' + animationSuffix, true);
}


new FlxTimer().start(FADE_TIMER, function(tmr:FlxTimer)
{

{
else

{
}
else
{
boyfriend.isDead = false;
remove(boyfriend);
parentPlayState?.currentStage?.addCharacter(boyfriend, BF);
}

resetCameraZoom();

close();
};

{
RetroCameraFade.fadeToBlack(FlxG.camera, 10, 2);
new FlxTimer().start(2, _ ->
{
{
AdMobUtil.loadInterstitial(function():Void
{
AdMobUtil.PLAYING_COUNTER = 0;
resetPlaying(true);
});
}
else
resetPlaying(true);
resetPlaying(true);
});
}
else
{
{
{
AdMobUtil.loadInterstitial(function():Void
{
AdMobUtil.PLAYING_COUNTER = 0;
resetPlaying();
});
}
else
resetPlaying();
resetPlaying();
}, true);
}
});
}
}

public override function dispatchEvent(event:ScriptEvent):Void
{
super.dispatchEvent(event);

ScriptEventDispatcher.callEvent(boyfriend, event);
}

/**
* Rather than hardcoding stuff, we look for the presence of a music file
* with the given suffix, and strip it down until we find one that's valid.
*/
function resolveMusicPath(suffix:String, starting:Bool = false, ending:Bool = false):Null<String>
{
else if (starting) basePath += 'Start';

{
suffix = suffix.split('-').slice(0, -1).join('-');
musicPath = Paths.music(basePath + suffix);
}
}

/**
* Starts the death music at the appropriate volume.
* @param startingVolume The initial volume for the music.
* @param force Whether or not to force the music to restart.
*/
public function startDeathMusic(startingVolume:Float = 1, force:Bool = false):Void
{

{
{
isStarting = false;
musicPath = resolveMusicPath(musicSuffix, isStarting, isEnding);
}
else
{
onComplete = function()
{
isStarting = false;
startDeathMusic(1.0, true);
};
}
}

{
}
else if (gameOverMusic == null || !gameOverMusic.playing || force)
{

gameOverMusic = FunkinSound.load(musicPath);

gameOverMusic.volume = startingVolume;
gameOverMusic.looped = !(isEnding || isStarting);
gameOverMusic.onComplete = onComplete;
gameOverMusic.play();
}
else
{
}
}

/**
* Pressing BACK from the Game Over screen should return the player to the Story/Freeplay menu as appropriate.
*/
public function goBack():Void
{
isEnding = true;
blueballed = false;

hasPlayedDeathQuote = true;
{
deathQuoteSound.stop();
deathQuoteSound = null;
}

{
this.close();
parentPlayState = null;
}
else
{
new StoryMenuState(sticker) : (sticker) -> FreeplayState.build(sticker);

{
PlayStatePlaylist.reset();
}


{

{
stickerPackId = playerCharacter.getStickerPackID();
}
}

openSubState(new funkin.ui.transition.stickers.StickerSubState({targetState: targetState, stickerPack: stickerPackId}));
}
}

/**
* Play the sound effect that occurs when
* boyfriend's testicles get utterly annihilated.
*/
public static function playBlueBalledSFX():Void
{
blueballed = true;

{
FunkinSound.playOnce(Paths.sound('gameplay/gameover/fnf_loss_sfx' + blueBallSuffix));
}
else
{
}
}


public override function destroy():Void
{
super.destroy();
{
gameOverMusic.stop();
gameOverMusic = null;
}
blueballed = false;
instance = null;
}

public override function toString():String
{
}
}

/**
* Parameters used to instantiate a GameOverSubState.
*/
typedef GameOverParams =
{
}
