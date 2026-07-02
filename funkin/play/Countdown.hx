package funkin.play;


class Countdown
{
/**
* The current step of the countdown.
*/

/**
* Which alternate graphic/sound on countdown to use.
* This is set via the current notestyle.
* For example, in Week 6 it is `pixel`.
*/

/**
* Which alternate graphic on countdown to use.
* You can set this via script.
* For example, in Week 6 it is `-pixel`.
*/



/**
* The currently running countdown. This will be null if there is no countdown running.
*/

/**
* Performs the countdown.
* Pauses the song, plays the countdown graphics/sound, and then starts the song.
* This will automatically stop and restart the countdown if it is already running.
* @returns `false` if the countdown was cancelled by a script.
*/
public static function performCountdown():Bool
{
countdownStep = BEFORE;
{
}

stopCountdown();

PlayState.instance.isInCountdown = true;
Conductor.instance.update(PlayState.instance.startTimestamp + Conductor.instance.beatLengthMs * -5);

countdownTimer = new FlxTimer();

countdownTimer.start(Conductor.instance.beatLengthMs / 1000, function(tmr:FlxTimer)
{
{
tmr.cancel();
}

countdownStep = decrement(countdownStep);


showCountdownGraphic(countdownStep);

playCountdownSound(countdownStep);


{
pauseCountdown();
}

{
stopCountdown();
}
}, 5); // Before, 3, 2, 1, GO!, After

}

/**
* @return TRUE if the event was cancelled.
*/
static function propagateCountdownEvent(index:CountdownStep):Bool
{

switch (index)
{
case BEFORE:
event = new CountdownScriptEvent(COUNTDOWN_START, index);
case THREE | TWO | ONE | GO: // I didn't know you could use `|` in a switch/case block!
event = new CountdownScriptEvent(COUNTDOWN_STEP, index);
case AFTER:
event = new CountdownScriptEvent(COUNTDOWN_END, index, false);
default:
}

PlayState.instance.dispatchEvent(event);

}

/**
* Pauses the countdown at the current step. You can start it up again later by calling resumeCountdown().
*
* If you want to call this from a module, it's better to use the event system and cancel the onCountdownStep event.
*/
public static function pauseCountdown():Void
{
{
countdownTimer.active = false;
}
}

/**
* Resumes the countdown at the current step. Only makes sense if you called pauseCountdown() first.
*
* If you want to call this from a module, it's better to use the event system and cancel the onCountdownStep event.
*/
public static function resumeCountdown():Void
{
{
countdownTimer.active = true;
}
}

/**
* Stops the countdown at the current step. You will have to restart it again later.
*
* If you want to call this from a module, it's better to use the event system and cancel the onCountdownStart event.
*/
public static function stopCountdown():Void
{
{
countdownTimer.cancel();
countdownTimer.destroy();
countdownTimer = null;
}
}

/**
* Stops the current countdown, then starts the song for you.
*/
public static function skipCountdown():Void
{
stopCountdown();
Conductor.instance.update(0);
}

/**
* Resets the countdown. Only works if it's already running.
*/
public static function resetCountdown()
{
{
countdownTimer.reset();
}
}

/**
* Reset the countdown configuration to the default.
*/
public static function reset()
{
noteStyle = null;
}

/**
* Retrieve the note style data (if we haven't already)
* @param noteStyleId The id of the note style to fetch. Defaults to the one used by the current PlayState.
* @param force Fetch the note style from the registry even if we've already fetched it.
*/
static function fetchNoteStyle(?noteStyleId:String, force:Bool = false):Void
{


noteStyle = NoteStyleRegistry.instance.fetchEntry(noteStyleId);
}

/**
* Retrieves the graphic to use for this step of the countdown.
*/
public static function showCountdownGraphic(index:CountdownStep):Void
{
fetchNoteStyle();



FlxTween.tween(countdownSprite, {alpha: 0}, Conductor.instance.beatLengthMs / 1000, {
ease: fadeEase,
onComplete: function(twn:FlxTween)
{
countdownSprite.destroy();
}
});

countdownSprite.cameras = [PlayState.instance.camHUD];
PlayState.instance.add(countdownSprite);
countdownSprite.screenCenter();

countdownSprite.x += offsets[0];
countdownSprite.y += offsets[1];
}

/**
* Retrieves the sound file to use for this step of the countdown.
*/
public static function playCountdownSound(step:CountdownStep):FunkinSound
{
fetchNoteStyle();

}

public static function decrement(step:CountdownStep):CountdownStep
{
switch (step)
{
case BEFORE:
case THREE:
case TWO:
case ONE:
case GO:

default:
}
}
}

/**
* The countdown step.
* This can't be an enum abstract because scripts may need it.
*/
enum CountdownStep
{
BEFORE;
THREE;
TWO;
ONE;
GO;
AFTER;
}
