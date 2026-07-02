

typedef ScoreInput =
{
}

/**
* Functions dedicated to serializing and deserializing data.
* NOTE: Use `json2object` wherever possible, it's way more efficient.
*/
class SerializerUtil
{

/**
* Convert a Haxe object to a JSON string.
* NOTE: Use `json2object.JsonWriter<T>` WHEREVER POSSIBLE. Do not use this one unless you ABSOLUTELY HAVE TO it's SLOW!
* And don't even THINK about using `haxe.Json.stringify` without the replacer!
*/
public static function toJSON(input:Dynamic, pretty:Bool = true):String
{
}

/**
* Convert a JSON string to a Haxe object.
*/
public static function fromJSON(input:String):Dynamic
{

try
{
}
catch (e)
{
}
}

/**
* Convert a JSON byte array to a Haxe object.
*/
public static function fromJSONBytes(input:Bytes):Null<Dynamic>
{
try
{
}
catch (e:Dynamic)
{
}
}

/**
* Customize how certain types are serialized when converting to JSON.
*/
static function replacer(key:Dynamic, value:Dynamic):Dynamic
{
{

}

}

static inline function serializeVersion(value:thx.semver.Version):String
{
}

/**
* Trims garbage data that may accompany JSON strings converted from bytes.
*/
static function sanitizeJSON(data:String):String
{
for (i => c in data)
{
{
}
}


}
}
