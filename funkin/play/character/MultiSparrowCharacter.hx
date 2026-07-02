package funkin.play.character;


/**
* For some characters which use Sparrow atlases, the spritesheets need to be split
* into multiple files. This character renderer concatenates these together into a single sprite.
*
* Examples in base game include BF Holding GF (most of the sprites are in one file
* but the death animation is in a separate file).
* Only example I can think of in mods is Tricky (which has a separate file for each animation).
*
* BaseCharacter has game logic, MultiSparrowCharacter has only rendering logic.
* KEEP THEM SEPARATE!
*/
class MultiSparrowCharacter extends BaseCharacter
{

public function new(id:String)
{
super(id, CharacterRenderType.MultiSparrow);
}

override function onCreate(event:ScriptEvent):Void
{
cpp.vm.tracy.TracyProfiler.zoneScoped('MultiSparrowCharacter.create(${this.characterId})');

buildSprites();
super.onCreate(event);
}

function buildSprites():Void
{
buildSpritesheet();
buildAnimations();

{
this.isPixel = true;
this.antialiasing = false;
}
else
{
this.isPixel = false;
this.antialiasing = true;
}
}

function buildSpritesheet():Void
{
log('Loading assets for Multi-Sparrow character "${characterId}"');


{
log('Multi-Sparrow atlas could not load PRIMARY texture: ${_data.assetPath}');
}
else
{
log('Creating multi-sparrow atlas: ${_data.assetPath}');
mainTexture.parent.destroyOnNoUse = false;
}


for (anim in _data.animations)
{
{
hasTextureAtlas = true;
break;
}
}

for (animation in _data.animations)
{

switch (animation.renderType)
{
case "animateatlas":


log('Concatenating texture atlas: ${animation.assetPath}');
subTexture.parent.destroyOnNoUse = false;

textureList.push(subTexture);
default:

{
log('Multi-Sparrow atlas could not load subtexture: ${animation.assetPath}');
continue;
}
else
{
log('Concatenating multi-sparrow atlas: ${animation.assetPath}');
subTexture.parent.destroyOnNoUse = false;

{
FunkinMemory.cacheTexture(Paths.image(animation.assetPath));
}
}

textureList.push(subTexture);

}

addedAssetPaths.push(animation.assetPath);
}

textureList.push(mainTexture);
_usedAtlases.push(mainTexture);

this.frames = FlxAnimateFrames.combineAtlas(textureList);
this.setScale(_data.scale);
}

function buildAnimations():Void
{
log('[MULTISPARROWCHAR] Loading ${_data.animations.length} animations for ${characterId}');

for (anim in _data.animations)
{
switch (anim.renderType)
{
case "animateatlas":
FlxAnimationUtil.addTextureAtlasAnimation(this, anim);
default:
FlxAnimationUtil.addAtlasAnimation(this, anim);
}

{
setAnimationOffsets(anim.name, 0, 0);
}
else
{
setAnimationOffsets(anim.name, anim.offsets[0], anim.offsets[1]);
}
}

log('[MULTISPARROWCHAR] Successfully loaded ${animationNames.length} animations for ${characterId}');
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
