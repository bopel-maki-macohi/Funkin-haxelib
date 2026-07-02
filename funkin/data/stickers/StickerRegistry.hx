

class StickerRegistry extends BaseRegistry<StickerPack, StickerData, StickerEntryParams>
{
/**
* The current version string for the sticker pack data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateStickerData()` function.
*/


public static final instance:StickerRegistry = new StickerRegistry();

public function new()
{
}

public function fetchDefault():StickerPack
{
}

/**
* Read, parse, and validate the JSON data and produce the corresponding data object.
* @param id The ID of the entry to load.
* @return The parsed data object.
*/
public function parseEntryData(id:String):Null<StickerData>
{

switch (loadEntryFile(id))
{
case {fileName: fileName, contents: contents}:
default:
}

{
}
}

/**
* Parse and validate the JSON data and produce the corresponding data object.
*
* NOTE: Must be implemented on the implementation class.
* @param contents The JSON as a string.
* @param fileName An optional file name for error reporting.
* @return The parsed data object.
*/
public function parseEntryDataRaw(contents:String, ?fileName:String):Null<StickerData>
{

{
}
}

function createScriptedEntry(clsName:String):StickerPack
{
}

function getScriptedClassNames():Array<String>
{
}
}

typedef StickerEntryParams =
{
}
