package funkin.audio;


/**
* A FlxSound which adds additional functionality:
* - Delayed playback via negative song position.
* - Easy functions for immediate playback and recycling.
*/
class FunkinSound extends FlxSound implements ICloneable<FunkinSound>
{

/**
* An FlxSignal which is dispatched when the volume changes.
*/


static function get_onVolumeChanged():FlxTypedSignal<Float->Void>
{
{
_onVolumeChanged = new FlxTypedSignal<Float->Void>();
{
_onVolumeChanged.dispatch(volume);
});
}
}

/**
* Using `FunkinSound.load` will override a dead instance from here rather than creating a new one, if possible!
*/

/**
* Calculate the current time of the sound.
* NOTE: You need to `add()` the sound to the scene for `update()` to increment the time.
*/
//

function set_muted(value:Bool):Bool
{
muted = value;
updateTransform();
}

override function set_volume(value:Float):Float
{
_volume = value.clamp(0.0, MAX_VOLUME);
updateTransform();
}


function get_paused():Bool
{
}


function get_isPlaying():Bool
{
}

/**
* Waveform data for this sound.
* This is lazily loaded, so it will be built the first time it is accessed.
*/


function get_waveformData():WaveformData
{
{
_waveformData = WaveformDataParser.interpretFlxSound(this);
}
}

/**
* If true, the game will forcefully add this sound's channel to the list of playing sounds.
*/

/**
* Are we in a state where the song should play but time is negative?
*/

/**
* For debug purposes.
*/

public function new()
{
super();
}

public override function update(elapsedSec:Float)
{

{
_time += elapsedMs;
{
super.play();
_shouldPlay = false;
}
}
else
{
super.update(elapsedSec);

{
{
SoundMixer.__soundChannels.push(_channel);
}
}
}
}

public function togglePlayback():FunkinSound
{
{
pause();
}
else
{
resume();
}
}

public override function play(forceRestart:Bool = false, startTime:Float = 0, ?endTime:Float):FunkinSound
{

{
cleanup(false, true);
}
else if (playing)
{
}

{
this.active = true;
this._shouldPlay = true;
this._time = startTime;
this.endTime = endTime;
}
else
{
{
resume();
}
else
{
startSound(startTime);
}

this.endTime = endTime;
}
}

public override function pause():FunkinSound
{
{
_shouldPlay = false;
_paused = true;
active = false;
}
else
{
super.pause();
}
}

public override function resume():FunkinSound
{
{
_shouldPlay = true;
_paused = false;
active = true;
}
else
{
super.resume();
}
}

/**
* Call after adjusting the volume to update the sound channel's settings.
*/
override function updateTransform():Void
{
{
_transform.volume = #if FLX_SOUND_SYSTEM ((FlxG.sound.muted || this.muted) ? 0 : 1) * FlxG.sound.volume * #end
(group != null ? group.volume : 1) * _volume * _volumeAdjust;
}

{
_channel.soundTransform = _transform;
}
}

public function clone():FunkinSound
{

sound._sound = openfl.media.Sound.fromAudioBuffer(this._sound.__buffer);

sound.init(this.looped, this.autoDestroy, this.onComplete);

sound._waveformData = this._waveformData;

}

/**
* Creates a new `FunkinSound` object and loads it as the current music track.
*
* @param key The key of the music you want to play. Music should be at `music/<key>/<key>.ogg`.
* @param params A set of additional optional parameters.
*   Data should be at `music/<key>/<key>-metadata.json`.
* @return Whether the music was started. `false` if music was already playing or could not be started
*/
public static function playMusic(key:String, params:FunkinSoundPlayMusicParams):Bool
{

{
{
{
}
}
}

{
}

{
{
Conductor.instance.mapTimeChanges(songMusicData.timeChanges);

}
else
{
}
}
{
case MUSIC: Paths.music('$key/$key');
case INST: Paths.inst('$key', suffix);
default: Paths.music('$key/$key');
}



emptyPartialQueue();

{
params.loop ?? true, false, false, params.onComplete);

{
partialQueue.push(music);

music.future.onComplete(function(partialMusic:Null<FunkinSound>)
{

});

}
else
{
}
}
else
{
{
setMusic(music);


}
else
{
}
}
}

/**
* Replaces the Flixel current music object with the given `FunkinSound` object.
* @param newMusic The new music to be set as the current music.
*/
public static function setMusic(newMusic:FunkinSound):Void
{

}

public static function emptyPartialQueue():Void
{
{
partialQueue.pop().error("Cancel loading partial sound");
}
}


/**
* Creates a new `FunkinSound` object synchronously.
*
* @param embeddedSound   The embedded sound resource you want to play.  To stream, use the optional URL parameter instead.
* @param volume          How loud to play it (0 to 1).
* @param looped          Whether to loop this sound.
* @param group           The group to add this sound to.
* @param autoDestroy     Whether to destroy this sound when it finishes playing.
*                          Leave this value set to `false` if you want to re-use this `FunkinSound` instance.
* @param autoPlay        Whether to play the sound immediately or wait for a `play()` call.
* @param persist         Whether to keep this `FunkinSound` between states, or destroy it.
* @param onComplete      Called when the sound finished playing.
* @param onLoad          Called when the sound finished loading.  Called immediately for succesfully loaded embedded sounds.
* @param important       If `true`, the sound channel will forcefully be added onto the channel array, even if full. Use sparingly!
* @return A `FunkinSound` object, or `null` if the sound could not be loaded.
*/
public static function load(embeddedSound:FlxSoundAsset, volume:Float = 1.0, looped:Bool = false, autoDestroy:Bool = false, autoPlay:Bool = false,
persist:Bool = false, ?onComplete:Void->Void, ?onLoad:Void->Void, important:Bool = false):Null<FunkinSound>
{
{
}


sound.loadEmbedded(embeddedSound, looped, autoDestroy, onComplete);

{
sound._label = embeddedSound;
}
else
{
sound._label = 'unknown';
}

sound.volume = volume;
sound.persist = persist;
sound.important = important;



}

/**
* Will load a section of a sound file, useful for Freeplay where we don't want to load all the bytes of a song
* @param path The path to the sound file
* @param start The start time of the sound file
* @param end The end time of the sound file
* @param volume Volume to start at
* @param looped Whether the sound file should loop
* @param autoDestroy Whether the sound file should be destroyed after it finishes playing
* @param autoPlay Whether the sound file should play immediately
* @param onComplete Callback when the sound finishes playing
* @param onLoad Callback when the sound finishes loading
* @return A FunkinSound object
*/
public static function loadPartial(path:String, start:Float = 0, end:Float = 1, volume:Float = 1.0, looped:Bool = false, autoDestroy:Bool = false,
autoPlay:Bool = true, ?onComplete:Void->Void, ?onLoad:Void->Void):Promise<Null<FunkinSound>>
{

path = Paths.stripLibrary(path);


{
promise.complete(null);
}
else
{
promise.future.onError(function(e)
{
soundRequest.error("Sound loading was errored or cancelled");
});

soundRequest.future.onComplete(function(partialSound)
{
promise.complete(snd);
});
}

}

public override function destroy():Void
{
super.destroy();
{
fadeTween.cancel();
fadeTween = null;
}
FlxTween.cancelTweensOf(this);
this._label = 'unknown';
this._waveformData = null;
}

override function startSound(startTime:Float)
{
{
super.startSound(startTime);
}

_time = startTime;
_paused = false;



audioSource.offset = Std.int(startTime);
audioSource.gain = volume;

position.x = pan;
position.z = -1 * Math.sqrt(1 - Math.pow(pan, 2));
audioSource.position = position;

_channel = new SoundChannel(_sound, audioSource, _transform);
_channel.addEventListener(Event.SOUND_COMPLETE, stopped);
pitch = _pitch;
active = true;
}

/**
* Play a sound effect once, then destroy it.
* @param key
* @param volume
* @return A `FunkinSound` object, or `null` if the sound could not be loaded.
*/
public static function playOnce(key:String, volume:Float = 1.0, ?onComplete:Void->Void, ?onLoad:Void->Void, important:Bool = false):Null<FunkinSound>
{
}

/**
* Stop all sounds in the pool and allow them to be recycled.
*/
public static function stopAllAudio(musicToo:Bool = false, persistToo:Bool = false):Void
{
for (sound in pool)
{
sound.destroy();
}
}

static function construct():FunkinSound
{

pool.add(sound);

}

/**
* Produces a string representation suitable for debugging.
*/
public override function toString():String
{
}
}

/**
* Additional parameters for `FunkinSound.playMusic()`
*/
typedef FunkinSoundPlayMusicParams =
{
/**
* The volume you want the music to start at.
* @default `1.0`
*/

/**
* The suffix of the music file to play. Usually for "-erect" tracks when loading an INST file
* @default ``
*/

/**
* Whether to override music if a different track is already playing.
* @default `false`
*/

/**
* Whether to override music if the same track is already playing.
* @default `false`
*/

/**
* Whether the music should loop or play once.
* @default `true`
*/

/**
* Whether to check for `SongMusicData` to update the Conductor with.
* @default `true`
*/

/**
* Which Paths function to use to load a song
* @default `MUSIC`
*/


/**
* Whether the sound should be destroyed on state switches
*/

}

typedef PartialSoundParams =
{
}
