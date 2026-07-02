

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


{
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
}

public override function create():Void
{
{
}
instance = this;



//
//


{
}
else
{
{
}
}


//
//

Conductor.instance.update(0);



new FlxTimer().start(1, function(tmr:FlxTimer)
{
}

function setCameraTarget():Void
{


{

}


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

{
}
else
{
{
}
else
{
boyfriend.playAnimation('firstDeath' + animationSuffix, true,
false); // ignoreOther is set to FALSE since you WANT to be able to mash and confirm game over!
}
}
}


//
//

&& blueballed
&& !mustNotExit)
{
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
}
}
else
{
{
}
}
}
}

}


function playDeathQuote():Void
{


{
}

deathQuoteSound = FunkinSound.playOnce(deathQuote, function()
{
{
}
}

/**
* Do behavior which occurs when you confirm and move to restart the level.
*/
function confirmDeath():Void
{
{

{
}

startDeathMusic(1.0, true); // isEnding changes this function's behavior.

{
}
else
{
}


new FlxTimer().start(FADE_TIMER, function(tmr:FlxTimer)
{

{
else

{
}
else
{
}



{
new FlxTimer().start(2, _ ->
{
{
AdMobUtil.loadInterstitial(function():Void
{
}
else
}
else
{
{
{
AdMobUtil.loadInterstitial(function():Void
{
}
else
}
}
}

public override function dispatchEvent(event:ScriptEvent):Void
{

}

/**
* Rather than hardcoding stuff, we look for the presence of a music file
* with the given suffix, and strip it down until we find one that's valid.
*/
function resolveMusicPath(suffix:String, starting:Bool = false, ending:Bool = false):Null<String>
{

{
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
}
else
{
onComplete = function()
{
}
}

{
}
else if (gameOverMusic == null || !gameOverMusic.playing || force)
{


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

{
}

{
}
else
{

{
}


{

{
}
}

}
}

/**
* Play the sound effect that occurs when
* boyfriend's testicles get utterly annihilated.
*/
public static function playBlueBalledSFX():Void
{

{
}
else
{
}
}


public override function destroy():Void
{
{
}
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
