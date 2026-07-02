package funkin.play.character;


/**
* A PackerCharacter is a Character which is rendered by
* displaying an animation derived from a Packer spritesheet file.
*/
class PackerCharacter extends BaseCharacter
{
public function new(id:String)
{
super(id, CharacterRenderType.Packer);
}

override function onCreate(event:ScriptEvent):Void
{
cpp.vm.tracy.TracyProfiler.zoneScoped('PackerCharacter.create(${this.characterId})');

loadSpritesheet();
loadAnimations();

super.onCreate(event);
}

function loadSpritesheet():Void
{

{
}

this.frames = tex;

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

FlxAnimationUtil.addAtlasAnimations(this, _data.animations);

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

}
}
