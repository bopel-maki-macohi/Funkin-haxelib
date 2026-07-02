

/**
* Utility class for handling the atlases loaded by CharSelect & co. in an efficient way.
* TODO: Maybe this should be a general utility class instead?
*/
class CharSelectAtlasHandler
{

public static function loadAtlas(path:String, ?settings:FlxAnimateSettings):Null<FlxAnimateFrames>
{

swfMode: settings?.swfMode ?? true,
filterQuality: settings?.filterQuality ?? MEDIUM,
cacheOnLoad: settings?.cacheOnLoad ?? false

{
}

}

public static function clearAtlasCache():Void
{
for (frames in framesCache.iterator())
{
}
}
}
