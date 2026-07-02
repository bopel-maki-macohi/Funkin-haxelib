

/**
* A wrapper around `openfl.utils.Assets` which disallows access to the harmful functions.
* Later we'll add Funkin-specific caching to this.
*/
class Assets implements ConsoleClass
{
/**
* The assets cache.
*/

/**
* Get the file system path for an asset
* @param path The asset path to load from, relative to the assets folder
* @return The path to the asset on the file system
*/
public static function getPath(path:String):String
{
}

/**
* Load bytes from an asset
* May cause stutters or throw an error if the asset is not cached
* @param path The asset path to load from
* @return The byte contents of the file
*/
public static function getBytes(path:String):haxe.io.Bytes
{
}

/**
* Load bytes from an asset asynchronously
* @param path The asset path to load from
* @return A future which promises to return the byte contents of the file
*/
public static function loadBytes(path:String):Future<openfl.utils.ByteArray>
{
}

/**
* Load text from an asset.
* May cause stutters or throw an error if the asset is not cached
* @param path The asset path to load from
* @return The text contents of the file
*/
public static function getText(path:String):String
{
}

/**
* Load text from an asset asynchronously
* @param path The asset path to load from
* @return A future which promises to return the text contents of the file
*/
public static function loadText(path:String):Future<String>
{
}

/**
* Load a Sound file from an asset
* May cause stutters or throw an error if the asset is not cached
* @param path The asset path to load from
* @return The loaded sound
*/
public static function getSound(path:String):openfl.media.Sound
{
}

/**
* Load a Sound file from an asset asynchronously
* @param path The asset path to load from
* @return A future which promises to return the loaded sound
*/
public static function loadSound(path:String):Future<openfl.media.Sound>
{
}

/**
* Load a Sound file from an asset, with optimizations specific to long-duration music
* May cause stutters or throw an error if the asset is not cached
* @param path The asset path to load from
* @return The loaded sound
*/
public static function getMusic(path:String):openfl.media.Sound
{
}

/**
* Load a Sound file from an asset asynchronously, with optimizations specific to long-duration music
* @param path The asset path to load from
* @return A future which promises to return the loaded sound
*/
public static function loadMusic(path:String):Future<openfl.media.Sound>
{
}

/**
* Load a Bitmap from an asset
* May cause stutters or throw an error if the asset is not cached
* @param path The asset path to load from
* @return The loaded Bitmap image
*/
public static function getBitmapData(path:String, useCache:Bool = true):openfl.display.BitmapData
{
}

/**
* Load a Bitmap from an asset asynchronously
* @param path The asset path to load from
* @return The future which promises to return the loaded Bitmap image
*/
public static function loadBitmapData(path:String):Future<openfl.display.BitmapData>
{
}

/**
* Determines whether the given asset of the given type exists.
* @param path The asset path to check
* @param type The asset type to check
* @return Whether the asset exists
*/
public static function exists(path:String, ?type:openfl.utils.AssetType):Bool
{
}

/**
* Retrieve a list of all assets of the given type
* @param type The asset type to check
* @return A list of asset paths
*/
public static function list(?type:openfl.utils.AssetType):Array<String>
{
}

/**
* Checks if a library with the given name exists.
* @param name The name to check.
* @return Whether or not the library exists.
*/
public static function hasLibrary(name:String):Bool
{
}

/**
* Retrieves a library with the given name.
* @param name The name of the library to get.
* @return The library with the given name.
*/
public static function getLibrary(name:String):lime.utils.AssetLibrary
{
}

/**
* Loads a library with the given name.
* @param name The name of the library to load.
* @return An `AssetLibary` object.
*/
public static function loadLibrary(name:String):Future<openfl.utils.AssetLibrary>
{
}
}
