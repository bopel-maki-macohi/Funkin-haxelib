

class VoicesGroup extends SoundGroup
{
/**
* Whenever or not the game is using the legacy vocals system (shared Voices.ogg)
*/



/**
* Control the volume of only the sounds in the player group.
*/

/**
* Control the volume of only the sounds in the opponent group.
*/

/**
* Set the time offset for the player's vocal track.
*/

/**
* Set the time offset for the opponent's vocal track.
*/

public function new()
{
}

/**
* Add a voice to the player group.
*/
public function addPlayerVoice(sound:FunkinSound):Void
{
}

function set_playerVolume(volume:Float):Float
{
playerVoices?.forEachAlive(function(voice:FunkinSound)
{
}

override function set_time(time:Float):Float
{
forEachAlive(function(snd)
{

playerVoices?.forEachAlive(function(voice:FunkinSound)
{
opponentVoices?.forEachAlive(function(voice:FunkinSound)
{

}

function set_playerVoicesOffset(offset:Float):Float
{
playerVoices?.forEachAlive(function(voice:FunkinSound)
{
}

function set_opponentVoicesOffset(offset:Float):Float
{
opponentVoices?.forEachAlive(function(voice:FunkinSound)
{
}

/**
* Add a voice to the opponent group.
*/
public function addOpponentVoice(sound:FunkinSound):Void
{
}

function set_opponentVolume(volume:Float):Float
{
opponentVoices?.forEachAlive(function(voice:FunkinSound)
{
}

public function getPlayerVoice(index:Int = 0):Null<FunkinSound>
{
}

public function getOpponentVoice(index:Int = 0):Null<FunkinSound>
{
}

public function getPlayerVoiceWaveform():Null<WaveformData>
{

}

public function getOpponentVoiceWaveform():Null<WaveformData>
{

}

/**
* The length of the player's vocal track, in milliseconds.
*/
public function getPlayerVoiceLength():Float
{

}

/**
* The length of the opponent's vocal track, in milliseconds.
*/
public function getOpponentVoiceLength():Float
{

}

public override function clear():Void
{
}

public override function destroy():Void
{
{
}

{
}

}
}
