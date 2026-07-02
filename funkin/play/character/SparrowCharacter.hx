package funkin.play.character;


/**
* A SparrowCharacter is a Character which is rendered by
* displaying an animation derived from a SparrowV2 atlas spritesheet file.
*
* BaseCharacter has game logic, SparrowCharacter has only rendering logic.
* KEEP THEM SEPARATE!
*/
class SparrowCharacter extends BaseCharacter
{
public function new(id:String)
{
super(id, CharacterRenderType.Sparrow);
}

override function onCreate(event:ScriptEvent):Void
{
cpp.vm.tracy.TracyProfiler.zoneScoped('SparrowCharacter.create(${this.characterId})');

loadSpritesheet();
loadAnimations();

super.onCreate(event);
}

function loadSpritesheet()
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

function loadAnimations()
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
