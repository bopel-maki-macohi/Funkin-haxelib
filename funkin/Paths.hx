

/**
* A core class which handles determining asset paths.
*/
class Paths implements ConsoleClass
{

public static function setCurrentLevel(name:Null<String>):Void
{
{
}
else
{
}
}

public static function stripLibrary(path:String):String
{
}

public static function getLibrary(path:String):String
{
}

static function getPath(file:String, type:AssetType, library:Null<String>):String
{

{
}


}

public static function getLibraryPath(file:String, library = 'preload'):String
{
}

static inline function getLibraryPathForce(file:String, library:String):String
{
}

static inline function getPreloadPath(file:String):String
{
}

public static function file(file:String, type:AssetType = TEXT, ?library:String):String
{
}

public static function animateAtlas(path:String, ?library:String):String
{
}

public static function txt(key:String, ?library:String):String
{
}

public static function frag(key:String, ?library:String):String
{
}

public static function vert(key:String, ?library:String):String
{
}

public static function xml(key:String, ?library:String):String
{
}

public static function json(key:String, ?library:String):String
{
}

public static function srt(key:String, ?library:String, ?directory:String = "data/"):String
{
}

public static function sound(key:String, ?library:String):String
{
}

public static function soundRandom(key:String, min:Int, max:Int, ?library:String):String
{
}

public static function music(key:String, ?library:String):String
{
}

public static function videos(key:String, ?library:String):String
{

{
}

}

public static function voices(song:String, ?suffix:String = ''):String
{

}

/**
* Gets the path to an `Inst.mp3/ogg` song instrumental from songs:assets/songs/`song`/
* @param song name of the song to get instrumental for
* @param suffix any suffix to add to end of song name, used for `-erect` variants usually
* @param withExtension if it should return with the audio file extension `.mp3` or `.ogg`.
* @return String
*/
public static function inst(song:String, ?suffix:String = '', withExtension:Bool = true):String
{
}

public static function image(key:String, ?library:String):String
{
}

public static function font(key:String):String
{
}

public static function ui(key:String, ?library:String):String
{
}

public static function getSparrowAtlas(key:String, ?library:String):FlxAtlasFrames
{
}

public static function getAnimateAtlas(key:String, ?library:String, settings:AtlasSpriteSettings):FlxAnimateFrames
{

{
}
else
{
}

swfMode: settings?.swfMode ?? false,
cacheOnLoad: settings?.cacheOnLoad ?? false,
filterQuality: settings?.filterQuality ?? MEDIUM,
spritemaps: settings?.spritemaps ?? null,
metadataJson: settings?.metadataJson ?? null,
cacheKey: settings?.cacheKey ?? null,
uniqueInCache: settings?.uniqueInCache ?? false,
onSymbolCreate: settings?.onSymbolCreate ?? null,
applyStageMatrix: settings?.applyStageMatrix ?? false,
useRenderTexture: settings?.useRenderTexture ?? false

{
}

validatedSettings.uniqueInCache, {
swfMode: validatedSettings.swfMode,
cacheOnLoad: validatedSettings.cacheOnLoad,
filterQuality: validatedSettings.filterQuality,
onSymbolCreate: validatedSettings.onSymbolCreate
}

public static function getPackerAtlas(key:String, ?library:String):FlxAtlasFrames
{
}
}

enum abstract PathsFunction(String)
{
}
