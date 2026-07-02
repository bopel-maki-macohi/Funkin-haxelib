


/**
* A Bopper is a stage prop which plays a dance animation.
* Y'know, a thingie that bops. A bopper.
*/
class Bopper extends StageProp implements IPlayStateScriptedClass
{
/**
* The bopper plays the dance animation once every `danceEvery` beats.
* Set to 0 to disable idle animation.
* Supports up to 0.25 precision.
* @default 0.0 on props, 1.0 on characters
*/

/**
* Whether the bopper should dance left and right.
* - If true, alternate playing `danceLeft` and `danceRight`.
* - If false, play `idle` every time.
*
* You can manually set this value, or you can leave it as `null` to determine it automatically.
*/

/**
* Offset the character's sprite by this much when playing each animation.
*/

/**
* Add a suffix to the `idle` animation (or `danceLeft` and `danceRight` animations)
* that this bopper will play.
*/

/**
* If this bopper is rendered with pixel art, disable anti-aliasing.
* @default `false`
*/

function set_isPixel(value:Bool):Bool
{
}

/**
* Whether this bopper should bop every beat. By default it's true, but when used
* for characters/players, it should be false so it doesn't cut off their animations!!!!!
*/

function set_idleSuffix(value:String):String
{
}

/**
* The offset of the character relative to the position specified by the stage.
*/

function set_globalOffsets(value:Array<Float>):Array<Float>
{

}



function set_animOffsets(value:Array<Float>):Array<Float>
{

}

/**
* Whether to play `danceRight` next iteration.
* Only used when `shouldAlternate` is true.
*/

public function new(danceEvery:Float = 0.0)
{

{
}
}

/**
* Called when an animation finishes.
* @param name The name of the animation that just finished.
*/
function onAnimationFinished(name:String)
{
{
}
}

/**
* Called when the current animation's frame changes.
* @param name The name of the current animation.
* @param frameNumber The number of the current frame.
* @param frameIndex The index of the current frame.
*
* For example, if an animation was defined as having the indexes [3, 0, 1, 2],
* then the first callback would have frameNumber = 0 and frameIndex = 3.
*/
function onAnimationFrame(name:String = "", frameNumber:Int = -1, frameIndex:Int = -1)
{

}

/**
* If this Bopper was defined by the stage, return the prop to its original position.
*/
public function resetPosition()
{
}

function update_shouldAlternate():Void
{
}

/**
* Called once every step of the song.
*/
public function onStepHit(event:SongTimeScriptEvent)
{
{
}
}

public function onBeatHit(event:SongTimeScriptEvent):Void
{
}

/**
* Called every `danceEvery` beats of the song.
*/
public function dance(forceRestart:Bool = false):Void
{
{
}

{
}

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

/**
* Ensure that a given animation exists before playing it.
* Will gracefully check for name, then name with stripped suffixes, then fail to play.
* @param name The animation name to attempt to correct.
* @param fallback Instead of failing to play, try to play this animation instead.
*/
function correctAnimationName(name:String, ?fallback:String):String
{

{
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
}
}
}



/**
* @param name The name of the animation to play.
* @param restart Whether to restart the animation if it is already playing.
* @param ignoreOther Whether to ignore all other animation inputs, until this one is done playing
* @param reversed If true, play the animation backwards, from the last frame to the first.
*/
public function playAnimation(name:String, restart:Bool = false, ignoreOther:Bool = false, reversed:Bool = false):Void
{
{
{
}
else if (ignoreExclusionPref != null && ignoreExclusionPref.length > 0)
{
for (entry in ignoreExclusionPref)
{
{
}
}
}
else
}



{
}

}


/**
* @param name The animation to play.
* @param duration The duration in which other (non-forced) animations will be skipped, in seconds (NOT MILLISECONDS).
*/
public function forceAnimationForDuration(name:String, duration:Float):Void
{




forceAnimationTimer.start(duration, (timer) ->
{
}

function applyAnimationOffsets(name:String):Void
{
}

public function setAnimationOffsets(name:String, xOffset:Float, yOffset:Float):Void
{
}

override function getScreenPosition(?result:FlxPoint, ?camera:FlxCamera):FlxPoint
{
}

public function onPause(event:PauseScriptEvent)
{
}

public function onResume(event:ScriptEvent)
{
}

public function onSongStart(event:ScriptEvent)
{
}

public function onSongEnd(event:ScriptEvent)
{
}

public function onGameOver(event:ScriptEvent)
{
}

public function onNoteIncoming(event:NoteScriptEvent)
{
}

public function onNoteHit(event:HitNoteScriptEvent)
{
}

public function onNoteHoldDrop(event:HoldNoteScriptEvent)
{
}

public function onNoteMiss(event:NoteScriptEvent)
{
}

public function onSongEvent(event:SongEventScriptEvent)
{
}

public function onNoteGhostMiss(event:GhostMissNoteScriptEvent)
{
}

public function onCountdownStart(event:CountdownScriptEvent)
{
}

public function onCountdownStep(event:CountdownScriptEvent)
{
}

public function onCountdownEnd(event:CountdownScriptEvent)
{
}

public function onSongLoaded(event:SongLoadScriptEvent)
{
}

public function onSongRetry(event:SongRetryEvent)
{
}
}
