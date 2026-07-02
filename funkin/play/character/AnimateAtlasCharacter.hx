package funkin.play.character;


/**
* An AnimateAtlasCharacter is a Character which is rendered by
* displaying an animation derived from an Adobe Animate texture atlas spritesheet file.
*
* BaseCharacter has game logic, AnimateAtlasCharacter has only rendering logic.
* KEEP THEM SEPARATE!
*/
class AnimateAtlasCharacter extends BaseCharacter
{
public function new(id:String)
{
super(id, CharacterRenderType.AnimateAtlas);
}

override function onCreate(event:ScriptEvent):Void
{
cpp.vm.tracy.TracyProfiler.zoneScoped('AnimateAtlasCharacter.create(${this.characterId})');

log('Loading assets for Animate Atlas character "${characterId}"');
loadAtlas();
loadAnimations();

log('Successfully loaded texture atlas for ${characterId} with ${_data.animations.length} animations.');
super.onCreate(event);
}

function loadAtlas():Void
{
log('Loading sprite atlas for ${characterId}.');

loadTextureAtlas(assetPath, assetLibrary, getAtlasSettings());

{
this.isPixel = true;
this.antialiasing = false;
}
else
{
this.isPixel = false;
this.antialiasing = true;
}

this.setScale(_data.scale);
}

function loadAnimations():Void
{
log('Loading ${_data.animations.length} animations for ${characterId}');

FlxAnimationUtil.addTextureAtlasAnimations(this, _data.animations);

for (anim in _data.animations)
{
{
setAnimationOffsets(anim.name, 0, 0);
}
else
{
setAnimationOffsets(anim.name, anim.offsets[0], anim.offsets[1]);
}
}

log('[ATLASCHAR] Successfully loaded ${animationNames.length} animations for ${characterId}');
}

/**
* Get the configuration for the texture atlas.
* @return The configuration for the texture atlas.
*/
public function getAtlasSettings():AtlasSpriteSettings
{
}

static function log(message:String):Void
{
}
}
