


class CreditsDataHandler
{


public static function debugPrint(data:Null<CreditsData>):Void
{
{
}

{
}

for (entry in data.entries)
{
}

}

/**
* If for some reason the full credits won't load,
* use this hardcoded data for the original Funkin' Crew.
*
* @return `CreditsData`
*/
public static inline function getFallback():CreditsData
{
entries: [{
header: 'Founders',
body: [{line: 'ninjamuffin99'}, {line: 'PhantomArcade'}, {line: 'Kawai Sprite'}, {line: 'evilsk8r'},]
}]
}

public static function fetchBackerEntries():Array<String>
{
}

/**
* The data for the credits.
* Hardcoded into game via a macro at compile time.
*/

/**
* The data for the credits.
* Loaded dynamically from the game folder when needed.
* Nullable because data may fail to parse.
*/

static function get_CREDITS_DATA():Null<CreditsData>
{

}

static function fetchCreditsData():funkin.data.JsonFile
{

fileName: CREDITS_DATA_PATH,
contents: rawJson
fileName: CREDITS_DATA_PATH,
contents: null
}

static function parseCreditsData(file:JsonFile):Null<CreditsData>
{


{
}
}

static function printErrors(errors:Array<json2object.Error>, id:String = ''):Void
{

for (error in errors)
}
}
