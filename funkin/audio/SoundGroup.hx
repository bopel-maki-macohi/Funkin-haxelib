

/**
* A group of FunkinSounds that are all synced together.
* Unlike FlxSoundGroup, you can also control their time and pitch.
*/
class SoundGroup extends FlxTypedGroup<FunkinSound>
{





public function new()
{
}

public static function build(song:String, ?files:Array<String> = null):SoundGroup
{

{
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
}

/**
* Add a sound to the group.
*/
public override function add(sound:FunkinSound):Null<FunkinSound>
{



result.onComplete = function()
{
}


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
}

/**
* Resume all the sounds in the group.
*/
public function resume()
{
forEachAlive(function(sound:FunkinSound)
{
}

/**
* Fade in all the sounds in the group.
*/
public function fadeIn(duration:Float, ?from:Float = 0.0, ?to:Float = 1.0, ?onComplete:FlxTween->Void):Void
{
forEachAlive(function(sound:FunkinSound)
{
}

/**
* Fade out all the sounds in the group.
*/
public function fadeOut(duration:Float, ?to:Float = 0.0, ?onComplete:FlxTween->Void):Void
{
forEachAlive(function(sound:FunkinSound)
{
}

/**
* Stop all the sounds in the group.
*/
public function stop():Void
{
{
forEachAlive(function(sound:FunkinSound)
{
}
}

public override function destroy():Void
{
}

/**
* Remove all sounds from the group.
*/
public override function clear():Void
{

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

}

function get_muted():Bool
{
else
}

function set_muted(muted:Bool):Bool
{
forEachAlive(function(snd:FunkinSound)
{

}

function get_pitch():Float
{
else
}

function set_pitch(val:Float):Float
{
forEachAlive(function(snd:FunkinSound)
{
}
}
