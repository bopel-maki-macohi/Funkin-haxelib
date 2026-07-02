package funkin;


/**
* Handles caching of textures and sounds for the game.
* I did this hello, this can be improved later on and I have ideas on how, but for now this functions well enough. -Zack
*/
class FunkinMemory
{



/**
* Caches textures that are always required.
*/
public static inline function initialCache():Void
{

for (file in allImages)
{
|| file.contains("chart-editor")
|| !file.contains("ui/"))
{
continue;
}

file = file.replace(" ", ""); // Handle stray spaces.

{
file = 'shared:$file';
}
permanentCacheTexture(file);
}

permanentCacheTexture(Paths.image("healthBar"));
permanentCacheTexture(Paths.image("menuDesat"));
permanentCacheTexture(Paths.image("notes", "shared"));
permanentCacheTexture(Paths.image("noteSplashes", "shared"));
permanentCacheTexture(Paths.image("noteStrumline", "shared"));
permanentCacheTexture(Paths.image("NOTE_hold_assets"));
permanentCacheTexture(Paths.image("fonts/bold", null));
permanentCacheTexture(Paths.image("fonts/default", null));
permanentCacheTexture(Paths.image("fonts/freeplay-clear", null));


for (file in allSounds)
{

file = file.replace(" ", "");

{
file = 'shared:$file';
}

permanentCacheSound(file);
}

permanentCacheSound(Paths.sound("cancelMenu"));
permanentCacheSound(Paths.sound("confirmMenu"));
permanentCacheSound(Paths.sound("screenshot"));
permanentCacheSound(Paths.sound("scrollMenu"));
permanentCacheSound(Paths.sound("soundtray/Voldown"));
permanentCacheSound(Paths.sound("soundtray/VolMAX"));
permanentCacheSound(Paths.sound("soundtray/Volup"));
permanentCacheSound(Paths.music("freakyMenu/freakyMenu"));
permanentCacheSound(Paths.music("offsetsLoop/offsetsLoop"));
permanentCacheSound(Paths.music("offsetsLoop/drumsLoop"));
permanentCacheSound(Paths.sound("missnote1", "shared"));
permanentCacheSound(Paths.sound("missnote2", "shared"));
permanentCacheSound(Paths.sound("missnote3", "shared"));
}

/**
* Clears the current texture and sound caches.
* @param callGarbageCollector Whether to call the system's garbage collector after purging.
*/
public static inline function purgeCache(callGarbageCollector:Bool = false):Void
{
preparePurgeTextureCache();
purgeTextureCache();
preparePurgeSoundCache();
purgeSoundCache();
}

///// TEXTURES /////

/**
* Ensures a texture with the given key is cached.
* @param key The key of the texture to cache.
*/
public static function cacheTexture(key:String):Void
{

{
previousCachedTextures.remove(key);
}

{
}

log('Cached asset $key');
graphic.persist = true;
currentCachedTextures.set(key, graphic);
forceRender(graphic);
}

/**
* Permanently caches a texture with the given key.
* @param key The key of the texture to cache.
*/
static function permanentCacheTexture(key:String):Void
{

{
}

log('Cached graphic $key');
graphic.persist = true;
permanentCachedTextures.set(key, graphic);
forceRender(graphic);
currentCachedTextures = permanentCachedTextures.copy();
}

public static function getCachedGraphic(path:String):Null<FlxGraphic>
{

}

/**
* Prepares the cache for purging unused textures.
*/
public inline static function preparePurgeTextureCache():Void
{
previousCachedTextures = currentCachedTextures.copy();

for (graphicKey in previousCachedTextures.keys())
{
{
previousCachedTextures.remove(graphicKey);
}
}

currentCachedTextures = permanentCachedTextures.copy();
}

/**
* Purges unused textures from the cache.
*/
public static function purgeTextureCache():Void
{
for (graphicKey in previousCachedTextures.keys())
{
{
previousCachedTextures.remove(graphicKey);
continue;
}


{
graphic.persist = false;
graphic.destroy();
previousCachedTextures.remove(graphicKey);
Assets.cache.clear(graphicKey);
}
}
{
}

for (key in FlxG.bitmap._cache.keys())
{

{
continue;
}

{
for (purgeEntry in purgeFilter)
{
{
obj.persist = false;
obj.destroy();
}
}
}
}
}

/**
* Forces the GPU to load and upload a FlxGraphic.
* @param graphic The graphic to force render.
*/
private static function forceRender(graphic:FlxGraphic):Void
{


sprite.loadGraphic(graphic);
sprite.draw(); // Draw sprite and load it into game's memory.
graphic.bitmap?.getTexture(FlxG.stage.context3D); // Just in case that didn't work...
sprite.destroy();
}

/**
* Determine whether the texture with the given key is cached.
* @param key The key of the texture to check.
* @return Whether the texture is cached.
*/
public static function isTextureCached(key:String):Bool
{
&& (permanentCachedTextures.exists(key) || currentCachedTextures.exists(key) || previousCachedTextures.exists(key));
}

///// NOTE STYLE //////

/**
*  Caches all assets for the given note style.
* @param style The note style to cache.
*/
public static function cacheNoteStyle(style:NoteStyle):Void
{
cacheTexture(Paths.image(style.getNoteAssetPath() ?? "note"));
cacheTexture(style.getHoldNoteAssetPath() ?? "noteHold");
cacheTexture(Paths.image(style.getStrumlineAssetPath() ?? "strumline"));
cacheTexture(Paths.image(style.getSplashAssetPath() ?? "noteSplash"));

cacheTexture(Paths.image(style.getHoldCoverDirectionAssetPath(LEFT) ?? "LEFT"));
cacheTexture(Paths.image(style.getHoldCoverDirectionAssetPath(RIGHT) ?? "RIGHT"));
cacheTexture(Paths.image(style.getHoldCoverDirectionAssetPath(UP) ?? "UP"));
cacheTexture(Paths.image(style.getHoldCoverDirectionAssetPath(DOWN) ?? "DOWN"));

cacheTexture(Paths.image(style.buildCountdownSpritePath(TWO) ?? "TWO"));
cacheTexture(Paths.image(style.buildCountdownSpritePath(ONE) ?? "ONE"));
cacheTexture(Paths.image(style.buildCountdownSpritePath(GO) ?? "GO"));

cacheSound(style.getCountdownSoundPath(THREE) ?? "THREE");
cacheSound(style.getCountdownSoundPath(TWO) ?? "TWO");
cacheSound(style.getCountdownSoundPath(ONE) ?? "ONE");
cacheSound(style.getCountdownSoundPath(GO) ?? "GO");

cacheTexture(Paths.image(style.buildJudgementSpritePath("sick") ?? 'sick'));
cacheTexture(Paths.image(style.buildJudgementSpritePath("good") ?? 'good'));
cacheTexture(Paths.image(style.buildJudgementSpritePath("bad") ?? 'bad'));
cacheTexture(Paths.image(style.buildJudgementSpritePath("shit") ?? 'shit'));

cacheTexture(Paths.image(style.buildComboNumSpritePath(0) ?? '0'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(1) ?? '1'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(2) ?? '2'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(3) ?? '3'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(4) ?? '4'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(5) ?? '5'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(6) ?? '6'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(7) ?? '7'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(8) ?? '8'));
cacheTexture(Paths.image(style.buildComboNumSpritePath(9) ?? '9'));
}

///// SOUND //////

/**
* Caches a sound with the given key.
* @param key The key of the sound to cache.
*/
public static function cacheSound(key:String):Void
{

{
previousCachedSounds.remove(key);
}

else
currentCachedSounds.set(key, sound);
}

/**
* Permanently caches a sound with the given key.
* @param key The key of the sound to cache.
*/
public static function permanentCacheSound(key:String):Void
{

else
permanentCachedSounds.set(key, sound);

}

/**
* Prepares the cache for purging unused sounds.
*/
public static function preparePurgeSoundCache():Void
{
previousCachedSounds = currentCachedSounds.copy();

for (key in previousCachedSounds.keys())
{
{
previousCachedSounds.remove(key);
}
}

currentCachedSounds = permanentCachedSounds.copy();
}

/**
* Purges unused sounds from the cache.
*/
public static inline function purgeSoundCache():Void
{
for (key in previousCachedSounds.keys())
{
{
previousCachedSounds.remove(key);
continue;
}

{
Assets.cache.removeSound(key);
previousCachedSounds.remove(key);
}
}
Assets.cache.clear("songs");
Assets.cache.clear("music");
{
permanentCachedSounds.set(key, sound);
currentCachedSounds.set(key, sound);
}
}

///// MISC /////

/**
* Clears all Freeplay assets from memory.
*/
public static inline function clearFreeplay():Void
{

for (key in FlxG.bitmap._cache.keys())
{

keysToRemove.push(key);
}

for (key in keysToRemove)
{
log('Cleaning asset $key');
{
obj.destroy();
}
Assets.cache.clear(key);
}

preparePurgeSoundCache();
purgeSoundCache();
}

/**
* Clears all sticker assets from memory.
*/
public static inline function clearStickers():Void
{

for (key in FlxG.bitmap._cache.keys())
{

keysToRemove.push(key);
}

for (key in keysToRemove)
{
log('Cleaning asset $key');
{
obj.destroy();
}
Assets.cache.clear(key);
}
}

/**
* Sends a trace with fancy ANSI colors.
* @param message The message to log.
*/
private static function log(message:String):Void
{
}
}
