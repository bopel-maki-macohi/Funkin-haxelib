

/**
* A class representing the data for a sticker pack as displayed in the Sticker SubState.
*/
class StickerPack implements IRegistryEntry<StickerData>
{
/**
* The internal ID for this sticker pack.
*/

/**
* The full data for this sticker pack.
*/

public function new(id:String, ?params:Dynamic)
{

{
}
}

/**
* Return the name of the sticker pack.
* @return The name of the sticker pack
*/
public function getStickerPackName():String
{
}

/**
* Return the artist of the sticker pack.
* @return The list of artists
*/
public function getStickerPackArtist():String
{
}

/**
* Gets a list of all the sticker assets available in the pack.
* @return The list of stickers as raw strings.
*/
public function getStickers():Array<String>
{
}

/**
* Retrieve a random sticker from the pack.
* @param last Whether this will be the last sticker to be placed on the screen.
* @return An asset path to a sticker to display.
*/
public function getRandomStickerPath(last:Bool):String
{
}

public function toString():String
{
}

public function destroy():Void
{
}

static function _fetchData(id:String):Null<StickerData>
{
}
}
