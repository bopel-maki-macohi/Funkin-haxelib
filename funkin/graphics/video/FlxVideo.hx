

/**
* Plays a video via a NetStream. Only works on HTML5.
* This does NOT replace hxvlc, nor does hxvlc replace this.
* hxvlc only works on native and does not work on HTML5!
*/
class FlxVideo extends FunkinSprite
{

/**
* A callback to execute when the video finishes.
*/

public function new(videoPath:String)
{






}

/**
* Tell the FlxVideo to pause playback.
*/
public function pauseVideo():Void
{
{
}
}

/**
* Tell the FlxVideo to resume if it is paused.
*/
public function resumeVideo():Void
{
{
}
}



public override function update(elapsed:Float):Void
{

{
}

}

/**
* Tell the FlxVideo to seek to the beginning.
*/
public function restartVideo():Void
{
{
}
}

/**
* Tell the FlxVideo to end.
*/
public function finishVideo():Void
{

}

public override function destroy():Void
{
{

}

}

/**
* Callback executed when the video stream loads.
* @param metaData The metadata of the video
*/
public function onClientMetaData(metaData:Dynamic):Void
{

}

function onVideoReady():Void
{



}

function onVolumeChanged(volume:Float):Void
{
}

function onNetConnectionNetStatus(event:NetStatusEvent):Void
{
}
}
