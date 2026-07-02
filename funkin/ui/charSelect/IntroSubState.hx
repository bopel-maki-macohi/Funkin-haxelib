package funkin.ui.charSelect;


/**
* When you first enter the character select state, it will play an introductory video opening up the lights
*/
class IntroSubState extends MusicBeatSubState
{


public override function create():Void
{
{
onLightsEnd();
}
{
}

playVideoHTML5(LIGHTS_VIDEO_PATH);

playVideoNative(LIGHTS_VIDEO_PATH);

onLightsEnd();

}


function playVideoHTML5(filePath:String):Void
{
vid = new FlxVideo(filePath);

vid.scrollFactor.set();
{
vid.zIndex = 0;

vid.finishCallback = onLightsEnd;

add(vid);
}
else
{
}
}


function playVideoNative(filePath:String):Void
{
vid = new FunkinVideoSprite(0, 0);

vid.scrollFactor.set();

{
vid.zIndex = 0;
vid.active = false;
vid.bitmap?.onEncounteredError.add(function(msg:String):Void
{

onLightsEnd();
});
vid.bitmap?.onEndReached.add(onLightsEnd);
vid.bitmap?.onFormatSetup.add(() ->
{
vid?.setGraphicSize(FlxG.initialWidth, FlxG.initialHeight);
vid?.updateHitbox();
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

}

/**
* When the lights video finishes, it will close the substate
*/
function onLightsEnd():Void
{
{
vid.stop();
remove(vid);
vid.destroy();
vid = null;
}


close();
}
}
