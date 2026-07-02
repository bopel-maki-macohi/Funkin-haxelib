

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
}

override function onCreate(event:ScriptEvent):Void
{

}

function buildSprites():Void
{

{
}
else
{
}
}

function buildSpritesheet():Void
{


{
}
else
{
}


for (anim in _data.animations)
{
{
}
}

for (animation in _data.animations)
{

switch (animation.renderType)
{
case "animateatlas":



default:

{
}
else
{

{
}
}


}

}


}

function buildAnimations():Void
{

for (anim in _data.animations)
{
switch (anim.renderType)
{
case "animateatlas":
default:
}

{
}
else
{
}
}

}

static function log(message:String):Void
{
}

override function destroy():Void
{
for (atlas in _usedAtlases)
{
}


}
}
