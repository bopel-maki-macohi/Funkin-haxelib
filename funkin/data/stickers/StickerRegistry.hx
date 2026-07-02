package funkin.data.stickers;


class StickerRegistry extends BaseRegistry<StickerPack, StickerData, StickerEntryParams>
{
/**
* The current version string for the sticker pack data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateStickerData()` function.
*/
public static final STICKER_DATA_VERSION:thx.semver.Version = '1.0.0';

public static final STICKER_DATA_VERSION_RULE:thx.semver.VersionRule = '1.0.x';

public static final instance:StickerRegistry = new StickerRegistry();

public function new()
{
super('STICKER', 'stickerpacks', STICKER_DATA_VERSION_RULE);
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
parser.ignoreUnknownVariables = false;

switch (loadEntryFile(id))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(contents, fileName);
default:
}

{
printErrors(parser.errors, id);
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
parser.ignoreUnknownVariables = false;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
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
