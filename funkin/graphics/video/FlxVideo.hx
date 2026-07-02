package funkin.graphics.video;


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
super();

this.videoPath = videoPath;

makeGraphic(2, 2, FlxColor.TRANSPARENT);

video = new Video();
video.x = 0;
video.y = 0;
video.alpha = 0;


netConnection.connect(null);

netStream = new NetStream(netConnection);
netStream.client = {onMetaData: onClientMetaData};
netConnection.addEventListener(NetStatusEvent.NET_STATUS, onNetConnectionNetStatus);
netStream.play(videoPath);
}

/**
* Tell the FlxVideo to pause playback.
*/
public function pauseVideo():Void
{
{
netStream.pause();
}
}

/**
* Tell the FlxVideo to resume if it is paused.
*/
public function resumeVideo():Void
{
{
netStream.resume();
}
}



public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
frameTimer = 0;
pixels.draw(video);
}

}

/**
* Tell the FlxVideo to seek to the beginning.
*/
public function restartVideo():Void
{
{
netStream.seek(0);
}
}

/**
* Tell the FlxVideo to end.
*/
public function finishVideo():Void
{
netStream.dispose();

}

public override function destroy():Void
{
{
netStream.dispose();

}

super.destroy();
}

/**
* Callback executed when the video stream loads.
* @param metaData The metadata of the video
*/
public function onClientMetaData(metaData:Dynamic):Void
{
video.attachNetStream(netStream);

onVideoReady();
}

function onVideoReady():Void
{
video.width = FlxG.width;
video.height = FlxG.height;

videoAvailable = true;

FunkinSound.onVolumeChanged.add(onVolumeChanged);
onVolumeChanged(FlxG.sound.muted ? 0 : FlxG.sound.volume);

makeGraphic(Std.int(video.width), Std.int(video.height), FlxColor.TRANSPARENT);
}

function onVolumeChanged(volume:Float):Void
{
netStream.soundTransform = new SoundTransform(volume);
}

function onNetConnectionNetStatus(event:NetStatusEvent):Void
{
}
}
