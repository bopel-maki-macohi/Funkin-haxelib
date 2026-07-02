package funkin.play.character;


/**
* This render type is the most complex, and is used by characters which use
* multiple Adobe Animate texture atlases. This render type concatenates multiple
* texture atlases into a single sprite.
*
* BaseCharacter has game logic, MultiAnimateAtlasCharacter has only rendering logic.
* KEEP THEM SEPARATE!
*/
class MultiAnimateAtlasCharacter extends BaseCharacter
{

public function new(id:String)
{
super(id, CharacterRenderType.MultiAnimateAtlas);
}

override function onCreate(event:ScriptEvent):Void
{
cpp.vm.tracy.TracyProfiler.zoneScoped('MultiAnimateAtlasCharacter.create(${this.characterId})');

log('Loading assets for Multi-Animate Atlas character "${characterId}"');
loadAtlases();
loadAnimations();

log('Successfully loaded texture atlases for ${characterId} with ${_data.animations.length} animations.');
super.onCreate(event);
}

function loadAtlases():Void
{
log('Loading sprite atlases for ${characterId}.');



textureList.push(mainTexture);

this.useRenderTexture = _data.atlasSettings.useRenderTexture;
this.applyStageMatrix = _data.atlasSettings.applyStageMatrix;

mainTexture.parent.destroyOnNoUse = false;

for (animation in _data.animations)
{

switch (animation.renderType)
{
case "sparrow":

{
log('Multi-Animate atlas could not load subtexture: ${animation.assetPath}');
}
else
{
log('Concatenating sparrow atlas: ${animation.assetPath}');
subTexture.parent.destroyOnNoUse = false;
}

textureList.push(subTexture);

default:


log('Concatenating texture atlas: ${animation.assetPath}');
subTexture.parent.destroyOnNoUse = false;

textureList.push(subTexture);
}

addedAssetPaths.push(animation.assetPath);
}

{
this.isPixel = true;
this.antialiasing = false;
}
else
{
this.isPixel = false;
this.antialiasing = true;
}

this.frames = FlxAnimateFrames.combineAtlas(textureList);
this.setScale(_data.scale);
}

function loadAnimations():Void
{
log('[MULTIATLASCHAR] Loading ${_data.animations.length} animations for ${characterId}');

for (anim in _data.animations)
{
switch (anim.renderType)
{
case "sparrow":
FlxAnimationUtil.addAtlasAnimation(this, anim);
default:
FlxAnimationUtil.addTextureAtlasAnimation(this, anim);
}

{
setAnimationOffsets(anim.name, 0, 0);
}
else
{
setAnimationOffsets(anim.name, anim.offsets[0], anim.offsets[1]);
}
}

log('[MULTIATLASCHAR] Successfully loaded ${animationNames.length} animations for ${characterId}');
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

override function destroy():Void
{
for (atlas in _usedAtlases)
{
atlas.parent.destroyOnNoUse = true;
}

_usedAtlases.clear();

super.destroy();
}
}
