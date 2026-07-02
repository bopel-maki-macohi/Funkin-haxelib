package funkin.audio;


/**
* a FlxSound that just overrides loadEmbedded to allow for "streamed" sounds to load with better performance!
*/
class FlxStreamSound extends FlxSound
{
public function new()
{
super();
}

override public function loadEmbedded(EmbeddedSound:Null<FlxSoundAsset>, Looped:Bool = false, AutoDestroy:Bool = false, ?OnComplete:Void->Void):FlxSound
{

cleanup(true);

{
_sound = EmbeddedSound;
}
else if ((EmbeddedSound is Class))
{
_sound = Type.createInstance(EmbeddedSound, []);
}
else if ((EmbeddedSound is String))
{
|| Assets.exists(EmbeddedSound, AssetType.MUSIC)) _sound = Assets.getMusic(EmbeddedSound);
else
}

}
}
