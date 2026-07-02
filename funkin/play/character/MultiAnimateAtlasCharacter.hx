

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
}

override function onCreate(event:ScriptEvent):Void
{


}

function loadAtlases():Void
{






for (animation in _data.animations)
{

switch (animation.renderType)
{
case "sparrow":

{
}
else
{
}


default:



}

}

{
}
else
{
}

}

function loadAnimations():Void
{

for (anim in _data.animations)
{
switch (anim.renderType)
{
case "sparrow":
default:
}

{
}
else
{
}
}

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
}


}
}
