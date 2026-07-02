package funkin.data.song.importer;

/**
* A helper JSON blob found in `.fnfc` files.
*/
class ChartManifestData
{
/**
* The current semantic version of the chart manifest data.
*/
public static final CHART_MANIFEST_DATA_VERSION:thx.semver.Version = "1.0.0";

public static final invalidIdRegex:EReg = ~/[\/\\:*?"<>|]/g;


/**
* The internal song ID for this chart.
* The metadata and chart data file names are derived from this.
*/

public function set_songId(value:String):String
{
}

public function new(songId:String)
{
this.version = CHART_MANIFEST_DATA_VERSION;
this.songId = songId;
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
updateVersionToLatest();

}

public function updateVersionToLatest():Void
{
this.version = CHART_MANIFEST_DATA_VERSION;
}

public static function deserialize(contents:String):Null<ChartManifestData>
{
parser.ignoreUnknownVariables = false;
parser.fromJson(contents, 'manifest.json');

{

for (error in parser.errors)
DataError.printError(error);

}
}
}
