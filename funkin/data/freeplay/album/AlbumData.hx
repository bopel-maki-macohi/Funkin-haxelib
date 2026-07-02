package funkin.data.freeplay.album;


/**
* A type definition for the data for an album of songs.
* It includes things like what graphics to display in Freeplay.
* @see https://lib.haxe.org/p/json2object/
*/
typedef AlbumData =
{
/**
* Semantic version for album data.
*/

/**
* Readable name of the album.
*/

/**
* Readable name of the artist(s) of the album.
*/

/**
* Asset key for the album art.
* The album art will be displayed in Freeplay.
*/

/**
* Asset key for the album title.
* The album title will be displayed below the album art in Freeplay.
*/

/**
* Offsets for the album title.
*/

/**
* An optional array of animations for the album title.
*/

/**
* An optional override for the Freeplay OST text.
*/
}
