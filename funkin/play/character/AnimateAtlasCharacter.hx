

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
}

override function onCreate(event:ScriptEvent):Void
{


}

function loadAtlas():Void
{


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
}
