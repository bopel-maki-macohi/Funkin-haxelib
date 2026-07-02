

/**
* Assumes you are in the PlayState.
*/
class VideoCutscene
{





/**
* Called when the video is started.
*/

/**
* Called if the video is paused.
*/

/**
* Called if the video is resumed.
*/

/**
* Called if the video is restarted. onVideoStarted is not called.
*/

/**
* Called when the video is ended or skipped.
*/

/**
* Play a video cutscene.
* TODO: Currently this is hardcoded to start the countdown after the video is done.
* @param path The path to the video file. Use Paths.file(path) to get the correct path.
* @param cutseneType The type of cutscene to play, determines what the game does after. Defaults to `CutsceneType.STARTING`.
*/
public static function play(filePath:String, ?cutsceneType:CutsceneType = STARTING):Void
{

{

}

PlayState.instance.isInCutscene = true;
PlayState.instance.camHUD.visible = false;

blackScreen.cameras = [PlayState.instance.camCutscene];
PlayState.instance.add(blackScreen);


{
PlayState.instance.togglePauseButton();
}

}

public static function isPlaying():Bool
{
}

static function playVideoHTML5(filePath:String):Void
{

{


vid.cameras = [PlayState.instance.camCutscene];

PlayState.instance.add(vid);

PlayState.instance.refresh();

}
else
{
}
}

static function playVideoNative(filePath:String):Void
{

{


vid.bitmap.onFormatSetup.add(function():Void
{
{

}

vid.bitmap.onEncounteredError.add(function(msg:String):Void
{


vid.cameras = [PlayState.instance.camCutscene];

PlayState.instance.add(vid);

PlayState.instance.refresh();


{
}
else
{
}


{
}
}
else
{
}
}

public static function restartVideo():Void
{
{
}

{
}
}

public static function pauseVideo():Void
{
{
}

{
}
}

public static function hideVideo():Void
{
{
}

{
}
}

public static function showVideo():Void
{
{
}

{
}
}

public static function resumeVideo():Void
{
{
}

{
}
}

/**
* Finish the active video cutscene. Done when the video is finished or when the player skips the cutscene.
* @param transitionTime The duration of the transition to the next state. Defaults to 0.5 seconds (this time is always used when cancelling the video).
* @param finishCutscene The callback to call when the transition is finished.
*/
public static function finishVideo(?transitionTime:Float = 0.5):Void
{


{
PlayState.instance.remove(vid);
}

{
PlayState.instance.remove(vid);
}


PlayState.instance.camHUD.visible = true;

FlxTween.tween(blackScreen, {alpha: 0}, transitionTime, {
ease: FlxEase.quadInOut,
onComplete: function(twn:FlxTween)
{
PlayState.instance.remove(blackScreen);
}
FlxTween.tween(FlxG.camera, {zoom: PlayState.instance.stageZoom}, transitionTime, {
ease: FlxEase.quadInOut,
onComplete: function(twn:FlxTween)
{
}
}

/**
* The default callback used when a cutscene is finished.
* You can specify your own callback when calling `VideoCutscene#play()`.
*/
static function onCutsceneFinish(cutsceneType:CutsceneType):Void
{
switch (cutsceneType)
{
case CutsceneType.STARTING:
PlayState.instance.startCountdown();
case CutsceneType.ENDING:
PlayState.instance.endSong(true); // true = right goddamn now
case CutsceneType.MIDSONG:
}
}

/**
* Destroy the active cutscene, if any. Separate from finishVideo() so that it doesn't trigger onCutsceneFinish().
*/
public static function destroyVideo()
{

{
PlayState.instance.remove(vid);
}

{
}

{
PlayState.instance.remove(blackScreen);
}
}
}

enum CutsceneType
{
STARTING; // The default cutscene type. Starts the countdown after the video is done.
MIDSONG; // Does nothing.
ENDING; // Ends the song after the video is done.
}
