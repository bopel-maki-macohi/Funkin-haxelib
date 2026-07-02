

/**
* A class representing the data for a style of the Freeplay menu.
*/
class FreeplayStyle implements IRegistryEntry<FreeplayStyleData>
{
/**
* The internal ID for this freeplay style.
*/

/**
* The full data for a freeplay style.
*/
public function new(id:String, ?params:Dynamic)
{

{
}
}

/**
* Get the background art as a graphic, ready to apply to a sprite.
* @return The built graphic
*/
public function getBgAssetGraphic():FlxGraphic
{
}

/**
* Get the asset key for the background.
* @return The asset key
*/
public function getBgAssetKey():String
{
}

/**
* Get the asset key for the background.
* @return The asset key
*/
public function getSelectorAssetKey():String
{
}

/**
* Get the asset key for the number assets.
* @return The asset key
*/
public function getCapsuleAssetKey():String
{
}

/**
* Get the asset key for the capsule art.
* @return The asset key
*/
public function getNumbersAssetKey():String
{
}

/**
* Return the deselected color of the text outline
* for freeplay capsules.
* @return The deselected color
*/
public function getCapsuleDeselCol():FlxColor
{
}

/**
* Return the song selection transition delay.
* @return The start delay
*/
public function getStartDelay():Float
{
}

public function toString():String
{
}

/**
* Return the selected color of the text outline
* for freeplay capsules.
* @return The selected color
*/
public function getCapsuleSelCol():FlxColor
{
}

public function destroy():Void
{
}

static function _fetchData(id:String):Null<FreeplayStyleData>
{
}
}
