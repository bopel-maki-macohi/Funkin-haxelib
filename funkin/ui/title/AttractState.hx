package funkin.ui.title;


/**
* After 40 seconds of inactivity on the title screen,
* the game will enter the Attract state, as a reference to physical arcade machines.
*
* In the current version, this just plays generic game/merch trailers,
* but this can be updated to include gameplay footage, or something more elaborate.
*/
class AttractState extends MusicBeatState
{
/**
* The videos that can be played by the Attract state.
* @param path The path to the video to play.
* This used
*/
{path:String}> = [{path: Paths.videos('riftCollabTrailer')}, {path: Paths.videos('mobileRelease')}, {path: Paths.videos('boyfriendEverywhere')}];


/**
* Duration you need to touch for to skip the video.
*/


public override function create():Void
{
{
}

playVideoHTML5(videoPath);

playVideoNative(videoPath);

pie = new FlxRadialGauge();
pie.makeShapeGraphic(CIRCLE, 40, 20, FlxColor.WHITE);
pie.replaceColor(FlxColor.BLACK, 0x8AC5C4C4);
pie.x = FlxG.width - ((pie.width * 1.5) + FullScreenScaleMode.gameNotchSize.x);
pie.y = FlxG.height - (pie.height * 1.5);
pie.amount = 0;
add(pie);
}

/**
* Get the path of a random video to display to the user.
* @return The video path to play.
*/
function getVideoPath():String
{

nextVideoToPlay = (nextVideoToPlay + 1) % VIDEO_PATHS.length;

result = Paths.stripLibrary(result);

}


function playVideoHTML5(filePath:String):Void
{
vid = new FlxVideo(filePath);
{
vid.zIndex = 0;

vid.finishCallback = onAttractEnd;

add(vid);
}
else
{
}
}


function playVideoNative(filePath:String):Void
{
vid = new FunkinVideoSprite(0, 0);

{
vid.zIndex = 0;
vid.active = false;
vid.bitmap.onEncounteredError.add(function(msg:String):Void
{

onAttractEnd();
});
vid.bitmap.onEndReached.add(onAttractEnd);
vid.bitmap.onFormatSetup.add(() ->
{
vid.setGraphicSize(FlxG.initialWidth, FlxG.initialHeight);
vid.updateHitbox();
vid.screenCenter();
});

add(vid);

}
else
{
}
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

|| TouchUtil.touch != null && TouchUtil.touch.pressed #end)
{
holdDelta += elapsed;
}
else
{
holdDelta = FlxMath.lerp(holdDelta, -0.1, (elapsed * 3).clamp(0, 1));
}
holdDelta = holdDelta.clamp(0, HOLD_TIME);
pie.amount = Math.min(1, Math.max(0, (holdDelta / HOLD_TIME) * 1.025));
pie.scale.x = pie.scale.y = FlxMath.lerp(1, 1.3, pie.amount).clamp(1, 1.3);
pie.alpha = FlxMath.lerp(0, 1, pie.amount).clamp(0, 1);

}

/**
* When the attraction state ends (after the video ends or the user presses any button),
* switch immediately to the title screen.
*/
function onAttractEnd():Void
{
{
remove(vid);
}

{
vid.stop();
remove(vid);
}

vid.destroy();
vid = null;

}
}
