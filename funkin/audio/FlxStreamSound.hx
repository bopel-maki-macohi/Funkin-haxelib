

/**
* a FlxSound that just overrides loadEmbedded to allow for "streamed" sounds to load with better performance!
*/
class FlxStreamSound extends FlxSound
{
public function new()
{
}

override public function loadEmbedded(EmbeddedSound:Null<FlxSoundAsset>, Looped:Bool = false, AutoDestroy:Bool = false, ?OnComplete:Void->Void):FlxSound
{


{
}
else if ((EmbeddedSound is Class))
{
}
else if ((EmbeddedSound is String))
{
else
}

}
}
