

class AlbumRegistry extends BaseRegistry<Album, AlbumData, AlbumEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the album data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateAlbumData()` function.
*/


public function new()
{
}
}

typedef AlbumEntryParams =
{
}
