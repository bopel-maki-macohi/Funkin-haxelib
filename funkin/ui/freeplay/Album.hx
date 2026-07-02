

/**
* A class representing the data for an album as displayed in Freeplay.
*/
class Album implements IRegistryEntry<AlbumData>
{
public function new(id:String, ?params:Dynamic)
{

{
}
}

/**
* @return The name of the album.
*/
public function getAlbumName():String
{
}

/**
* Return the artists of the album.
* @return The list of artists
*/
public function getAlbumArtists():Array<String>
{
}

/**
* Get the asset key for the album art.
* @return The asset key
*/
public function getAlbumArtAssetKey():String
{
}

/**
* Get the album art as a graphic, ready to apply to a sprite.
* @return The built graphic
*/
public function getAlbumArtGraphic():FlxGraphic
{
}

/**
* Get the asset key for the album title.
*/
public function getAlbumTitleAssetKey():String
{
}

/**
* Get the offsets for the album title.
*/
public function getAlbumTitleOffsets():Null<Array<Float>>
{
}

public function hasAlbumTitleAnimations():Bool
{
}

public function getAlbumTitleAnimations():Array<AnimationData>
{
}

/**
* @return A name to display for the OST in Freeplay. Will be `null` if not set.
*/
public function getAlbumOSTName():Null<String>
{
}
}
