package funkin.audio;


/**
* A group of FunkinSounds that are all synced together.
* Unlike FlxSoundGroup, you can also control their time and pitch.
*/
class SoundGroup extends FlxTypedGroup<FunkinSound>
{





public function new()
{
super();
}

public static function build(song:String, ?files:Array<String> = null):SoundGroup
{

{
result.add(new FunkinSound());
}

for (sndFile in files)
{
result.add(snd); // adds it to main group for other shit
}

}

/**
* Finds the largest deviation from the desired time inside this SoundGroup.
*
* @param targetTime	The time to check against.
* 						If none is provided, it checks the time of all members against the first member of this SoundGroup.
* @return The largest deviation from the target time found.
*/
public function checkSyncError(?targetTime:Float):Float
{

forEachAlive(function(snd)
{
else
{
}
});
}

/**
* Add a sound to the group.
*/
public override function add(sound:FunkinSound):Null<FunkinSound>
{


result.time = this.time;

result.onComplete = function()
{
this.onComplete();
}

result.pitch = this.pitch;
result.volume = this.volume;

}

public dynamic function onComplete():Void
{
}

/**
* Pause all the sounds in the group.
*/
public function pause()
{
forEachAlive(function(sound:FunkinSound)
{
sound.pause();
});
}

/**
* Play all the sounds in the group.
*/
public function play(forceRestart:Bool = false, startTime:Float = 0.0, ?endTime:Float)
{
forEachAlive(function(sound:FunkinSound)
{
{
}
sound.play(forceRestart, startTime, endTime);
});
}

/**
* Resume all the sounds in the group.
*/
public function resume()
{
forEachAlive(function(sound:FunkinSound)
{
sound.resume();
});
}

/**
* Fade in all the sounds in the group.
*/
public function fadeIn(duration:Float, ?from:Float = 0.0, ?to:Float = 1.0, ?onComplete:FlxTween->Void):Void
{
forEachAlive(function(sound:FunkinSound)
{
sound.fadeIn(duration, from, to, onComplete);
});
}

/**
* Fade out all the sounds in the group.
*/
public function fadeOut(duration:Float, ?to:Float = 0.0, ?onComplete:FlxTween->Void):Void
{
forEachAlive(function(sound:FunkinSound)
{
sound.fadeOut(duration, to, onComplete);
});
}

/**
* Stop all the sounds in the group.
*/
public function stop():Void
{
{
forEachAlive(function(sound:FunkinSound)
{
sound.stop();
});
}
}

public override function destroy():Void
{
stop();
super.destroy();
}

/**
* Remove all sounds from the group.
*/
public override function clear():Void
{
this.stop();

super.clear();
}

function get_time():Float
{
{
}
else
{
}
}

function set_time(time:Float):Float
{
forEachAlive(function(snd:FunkinSound)
{
snd.time = time;
});

}

function get_playing():Bool
{
{
}
else
{
}
}

function get_volume():Float
{
{
}
else
{
}
}

function set_volume(volume:Float):Float
{
forEachAlive(function(snd:FunkinSound)
{
snd.volume = volume;
});

}

function get_muted():Bool
{
else
}

function set_muted(muted:Bool):Bool
{
forEachAlive(function(snd:FunkinSound)
{
snd.muted = muted;
});

}

function get_pitch():Float
{
else
}

function set_pitch(val:Float):Float
{
forEachAlive(function(snd:FunkinSound)
{
snd.pitch = val;
});
}
}
