

class PlayerData
{
/**
* The sematic version number of the player data JSON format.
* Supports fancy comparisons like NPM does it's neat.
*/

/**
* A readable name for this playable character.
*/

/**
* The character IDs this character is associated with.
* Only songs that use these characters will show up in Freeplay.
*/

/**
* Whether to show songs with character IDs that aren't associated with any specific character.
*/

/**
* The default sticker pack to use for songs featuring this playable character.
* Can be overridden by specific songs.
* @default `default`
*/

/**
* Which freeplay style to use for this character.
*/

/**
* Data for displaying this character in the Freeplay menu.
* If null, display no DJ.
*/

/**
* Data for displaying this character in the Character Select menu.
* If null, exclude from Character Select.
*/

/**
* Data for displaying this character in the results screen.
*/

/**
* Whether this character is unlocked by default.
* Use a ScriptedPlayableCharacter to add custom logic.
*/

public function new()
{
}

/**
* Convert this StageData into a JSON string.
*/
public function serialize(pretty:Bool = true):String
{

}

public function updateVersionToLatest():Void
{
}
}

class PlayerFreeplayDJData
{














public function new()
{
}

function mapAnimations():Void
{

for (anim in animations)
{
}
}



public function useApplyStageMatrix():Bool
{
}

public function getGlobalOffsets():Array<Float>
{
}

/**
* Normally, we'd let `FunkinSprite` handle the settings validation, but
* Freeplay DJs have a special case where the turntable lights use a movieclip
* that remains static without SWF mode enabled!
* So we have to manually validate the settings to have SWF mode enabled by default.
*
* @return The configuration for the texture atlas.
*/
public function getAtlasSettings():funkin.graphics.FunkinSprite.AtlasSpriteSettings
{
swfMode: atlasSettings?.swfMode ?? true,
cacheOnLoad: atlasSettings?.cacheOnLoad ?? false,
filterQuality: cast atlasSettings?.filterQuality ?? animate.FlxAnimateFrames.FilterQuality.MEDIUM,
applyStageMatrix: atlasSettings?.applyStageMatrix ?? false,
useRenderTexture: atlasSettings?.useRenderTexture ?? false
}
}

public function getFreeplayDJText(index:Int):String
{
switch (index)
{
case 1:
case 2:
case 3:
default:
}
}

public function getAnimationPrefix(name:String):Null<String>
{

}

public function getAnimationOffsetsByPrefix(?prefix:String):Array<Float>
{
}

public function getAnimationOffsets(name:String):Array<Float>
{
}

public function getFistPumpIntroStartFrame():Int
{
}

public function getFistPumpIntroEndFrame():Int
{
}

public function getFistPumpLoopStartFrame():Int
{
}

public function getFistPumpLoopEndFrame():Int
{
}

public function getFistPumpIntroBadStartFrame():Int
{
}

public function getFistPumpIntroBadEndFrame():Int
{
}

public function getFistPumpLoopBadStartFrame():Int
{
}

public function getFistPumpLoopBadEndFrame():Int
{
}

public function getCharSelectTransitionDelay():Float
{
}
}

class PlayerCharSelectData
{
/**
* A zero-indexed number for the character's preferred position in the grid.
* 0 = top left, 4 = center, 8 = bottom right
* In the event of a conflict, the first character alphabetically gets it,
* and others get shifted over.
*/

/**
* The GF name to assign for this character.
*/
}

typedef PlayerCharSelectGFData =
{


}

typedef PlayerResultsData =
{


typedef PlayerResultsMusicData =
{





}

typedef PlayerResultsAnimationData =
{
/**
* `sparrow` or `animate` or whatever
*/














typedef PlayerFreeplayDJCharSelectData =
{
}

typedef PlayerFreeplayDJFistPumpData =
{







