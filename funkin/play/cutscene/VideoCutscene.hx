package funkin.play.cutscene;


/**
* Assumes you are in the PlayState.
*/
class VideoCutscene
{





/**
* Called when the video is started.
*/
public static final onVideoStarted:FlxSignal = new FlxSignal();

/**
* Called if the video is paused.
*/
public static final onVideoPaused:FlxSignal = new FlxSignal();

/**
* Called if the video is resumed.
*/
public static final onVideoResumed:FlxSignal = new FlxSignal();

/**
* Called if the video is restarted. onVideoStarted is not called.
*/
public static final onVideoRestarted:FlxSignal = new FlxSignal();

/**
* Called when the video is ended or skipped.
*/
public static final onVideoEnded:FlxSignal = new FlxSignal();

/**
* Play a video cutscene.
* TODO: Currently this is hardcoded to start the countdown after the video is done.
* @param path The path to the video file. Use Paths.file(path) to get the correct path.
* @param cutseneType The type of cutscene to play, determines what the game does after. Defaults to `CutsceneType.STARTING`.
*/
public static function play(filePath:String, ?cutsceneType:CutsceneType = STARTING):Void
{

{
funkin.util.WindowUtil.showError('Error playing video', 'Video file does not exist: ${filePath}');

}

PlayState.instance.isInCutscene = true;
PlayState.instance.camHUD.visible = false;

blackScreen = new FlxSprite(-200, -200).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
blackScreen.scrollFactor.set(0, 0);
blackScreen.cameras = [PlayState.instance.camCutscene];
PlayState.instance.add(blackScreen);

VideoCutscene.cutsceneType = cutsceneType;

{
PlayState.instance.togglePauseButton();
}

finishVideo();
playVideoHTML5(Paths.stripLibrary(filePath));
playVideoNative(filePath);
throw "No video support for this platform!";
}

public static function isPlaying():Bool
{
}

static function playVideoHTML5(filePath:String):Void
{
vid = new FlxVideo(filePath);

{
vid.zIndex = 0;

vid.finishCallback = finishVideo.bind(0.5);

vid.cameras = [PlayState.instance.camCutscene];

PlayState.instance.add(vid);

PlayState.instance.refresh();

onVideoStarted.dispatch();
}
else
{
}
}

static function playVideoNative(filePath:String):Void
{
vid = new FunkinVideoSprite(0, 0);

{
vid.zIndex = 0;

vid.active = false;

vid.bitmap.onFormatSetup.add(function():Void
{
{

vid.setGraphicSize(vid.bitmap.bitmapData.width * scale, vid.bitmap.bitmapData.height * scale);
vid.updateHitbox();
vid.screenCenter();
}
});

vid.bitmap.onEncounteredError.add(function(msg:String):Void
{
finishVideo(0.5);
});

vid.bitmap.onEndReached.add(finishVideo.bind(0.5));

vid.cameras = [PlayState.instance.camCutscene];

PlayState.instance.add(vid);

PlayState.instance.refresh();


{
fileOptions.push(':sub-language=$DEFAULT_LANGUAGE');
}
else
{
fileOptions.push(':sub-language=none');
}

fileOptions.push(':audio-language=$DEFAULT_LANGUAGE');

{
onVideoStarted.dispatch();
}
}
else
{
}
}

public static function restartVideo():Void
{
{
vid.restartVideo();
vid.resumeVideo();
onVideoRestarted.dispatch();
}

{
vid.bitmap.time = 0;
vid.resume();
onVideoRestarted.dispatch();
}
}

public static function pauseVideo():Void
{
{
vid.pauseVideo();
onVideoPaused.dispatch();
}

{
vid.pause();
onVideoPaused.dispatch();
}
}

public static function hideVideo():Void
{
{
vid.visible = false;
blackScreen.visible = false;
}

{
vid.visible = false;
blackScreen.visible = false;
}
}

public static function showVideo():Void
{
{
vid.visible = true;
blackScreen.visible = false;
}

{
vid.visible = true;
blackScreen.visible = false;
}
}

public static function resumeVideo():Void
{
{
vid.resumeVideo();
onVideoResumed.dispatch();
}

{
vid.resume();
onVideoResumed.dispatch();
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
vid.stop();
PlayState.instance.remove(vid);
}

vid.destroy();
vid = null;

PlayState.instance.camHUD.visible = true;

FlxTween.tween(blackScreen, {alpha: 0}, transitionTime, {
ease: FlxEase.quadInOut,
onComplete: function(twn:FlxTween)
{
PlayState.instance.remove(blackScreen);
blackScreen = null;
}
});
FlxTween.tween(FlxG.camera, {zoom: PlayState.instance.stageZoom}, transitionTime, {
ease: FlxEase.quadInOut,
onComplete: function(twn:FlxTween)
{
onVideoEnded.dispatch();
onCutsceneFinish(cutsceneType);
}
});
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
vid.stop();
PlayState.instance.remove(vid);
}

{
vid?.destroy();
vid = null;
}

{
PlayState.instance.remove(blackScreen);
blackScreen = null;
}
}
}

enum CutsceneType
{
STARTING; // The default cutscene type. Starts the countdown after the video is done.
MIDSONG; // Does nothing.
ENDING; // Ends the song after the video is done.
}
