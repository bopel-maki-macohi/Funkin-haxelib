
/**
* A helper JSON blob found in `.fnfc` files.
*/
class ChartManifestData
{
/**
* The current semantic version of the chart manifest data.
*/



/**
* The internal song ID for this chart.
* The metadata and chart data file names are derived from this.
*/

public function set_songId(value:String):String
{
}

public function new(songId:String)
{
}

public function getMetadataFileName(?variation:String):String
{

}

public function getChartDataFileName(?variation:String):String
{

}

public function getInstFileName(?variation:String):String
{

}

public function getVocalsFileName(charId:String, ?variation:String):String
{

}

/**
* Serialize this ChartManifestData into a JSON string.
* @return The JSON string.
*/
public function serialize(pretty:Bool = true):String
{

}

public function updateVersionToLatest():Void
{
}

public static function deserialize(contents:String):Null<ChartManifestData>
{

{

for (error in parser.errors)

}
}
}
