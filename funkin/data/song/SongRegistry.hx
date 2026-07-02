


{
/**
* The current version string for the stage data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateStageData()` function.
*/








static function get_DEFAULT_GENERATEDBY():String
{
}

public function new()
{
}

public override function loadEntries():Void
{

//
//

for (entryCls in scriptedEntryClassNames)
{

{
{
}
else
{
}
}
else
{
}
}

//
//
{
{
for (entryId in unscriptedEntryIds)
{
try
{
{
}
}
catch (e:Dynamic)
{
}
}
}

/**
* Read, parse, and validate the JSON data and produce the corresponding data object.
*/
public function parseEntryData(id:String):Null<SongMetadata>
{
}

/**
* Parse, and validate the JSON data and produce the corresponding data object.
*/
public function parseEntryDataRaw(contents:String, ?fileName:String = 'raw'):Null<SongMetadata>
{
}

public override function isScriptedEntry(id:String, ?params:Null<SongEntryParams>)
{
{
}
}

public override function getScriptedEntryClassName(id:String, ?params:Null<SongEntryParams>):Null<String>
{
{
}
}

/**
* We override `fetchEntry` to handle song variations!
*/
public override function fetchEntry(id:String, ?params:SongEntryParams):Null<Song>
{

{
{
{
}
}
}

}

public function parseEntryMetadata(id:String, ?variation:String):Null<SongMetadata>
{


switch (loadEntryMetadataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
default:
}

{
}
}

public function parseEntryMetadataRaw(contents:String, ?fileName:String = 'raw', ?variation:String):Null<SongMetadata>
{


{
}
}

public function parseEntryMetadataWithMigration(id:String, variation:String, version:thx.semver.Version):Null<SongMetadata>
{

{
}
else if (VersionUtil.validateVersion(version, "2.1.x"))
{
}
else if (VersionUtil.validateVersion(version, "2.0.x"))
{
}
else
{
}
}

public function parseEntryMetadataRawWithMigration(contents:String, ?fileName:String = 'raw', version:thx.semver.Version,
?variation:String):Null<SongMetadata>
{
{
}
else if (VersionUtil.validateVersion(version, "2.1.x"))
{
}
else if (VersionUtil.validateVersion(version, "2.0.x"))
{
}
else
{
}
}

function parseEntryMetadata_v2_1_0(id:String, ?variation:String):Null<SongMetadata>
{


switch (loadEntryMetadataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
default:
}
{
}
}

function parseEntryMetadata_v2_0_0(id:String, ?variation:String):Null<SongMetadata>
{


switch (loadEntryMetadataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
default:
}
{
}
}

function parseEntryMetadataRaw_v2_1_0(contents:String, ?fileName:String = 'raw'):Null<SongMetadata>
{

{
}
}

function parseEntryMetadataRaw_v2_0_0(contents:String, ?fileName:String = 'raw'):Null<SongMetadata>
{

{
}
}

public function parseMusicData(id:String, ?variation:String):Null<SongMusicData>
{


switch (loadMusicDataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
default:
}

{
}
}

public function parseMusicDataRaw(contents:String, ?fileName:String = 'raw'):Null<SongMusicData>
{

{
}
}

public function parseMusicDataWithMigration(id:String, ?variation:String, version:thx.semver.Version):Null<SongMusicData>
{

{
}
else
{
}
}

public function parseMusicDataRawWithMigration(contents:String, ?fileName:String = 'raw', version:thx.semver.Version):Null<SongMusicData>
{
{
}
else
{
}
}

public function parseEntryChartData(id:String, ?variation:String):Null<SongChartData>
{


switch (loadEntryChartFile(id, variation))
{
case {fileName: fileName, contents: contents}:
default:
}

{
}
}

public function parseEntryChartDataRaw(contents:String, ?fileName:String = 'raw', ?variation:String):Null<SongChartData>
{


{
}
}

public function parseEntryChartDataWithMigration(id:String, ?variation:String, version:thx.semver.Version):Null<SongChartData>
{

{
}
else
{
}
}

public function parseEntryChartDataRawWithMigration(contents:String, ?fileName:String = 'raw', version:thx.semver.Version,
?variation:String):Null<SongChartData>
{
{
}
else
{
}
}

function loadEntryMetadataFile(id:String, ?variation:String):Null<JsonFile>
{
{
}
}

function loadMusicDataFile(id:String, ?variation:String):Null<JsonFile>
{
}

function hasMusicDataFile(id:String, ?variation:String):Bool
{
}

function loadEntryChartFile(id:String, ?variation:String):Null<JsonFile>
{
}

public function fetchEntryMetadataVersion(id:String, ?variation:String):Null<thx.semver.Version>
{
}

public function fetchEntryChartVersion(id:String, ?variation:String):Null<thx.semver.Version>
{
}

function cleanMetadata(metadata:SongMetadata, variation:String):SongMetadata
{

}

function cleanChartData(chartData:SongChartData, variation:String):SongChartData
{

}

/**
* A list of all difficulties for a specific character.
*/
public function listAllDifficulties(characterId:String):Array<String>
{

{
}

for (songId in listEntryIds())
{

for (diff in song.listDifficulties(null, song.getVariationsByCharacter(character)))
{
}
}


{
}

}
}

typedef SongEntryParams =
{
/**
* The variation ID for the song.
*/
}
