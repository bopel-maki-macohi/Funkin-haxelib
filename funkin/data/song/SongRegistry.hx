package funkin.data.song;


using funkin.data.song.migrator.SongDataMigrator;

{
/**
* The current version string for the stage data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateStageData()` function.
*/
public static final SONG_METADATA_VERSION:thx.semver.Version = "2.2.4";

public static final SONG_METADATA_VERSION_RULE:thx.semver.VersionRule = "2.2.x";

public static final SONG_CHART_DATA_VERSION:thx.semver.Version = "2.0.0";

public static final SONG_CHART_DATA_VERSION_RULE:thx.semver.VersionRule = "2.0.x";

public static final SONG_MUSIC_DATA_VERSION:thx.semver.Version = "2.0.0";

public static final SONG_MUSIC_DATA_VERSION_RULE:thx.semver.VersionRule = "2.0.x";



static function get_DEFAULT_GENERATEDBY():String
{
}

public function new()
{
super('SONG', 'songs', SONG_METADATA_VERSION_RULE);
}

public override function loadEntries():Void
{
clearEntries();

//
//
log(' INFO '.info() + 'Parsing ${scriptedEntryClassNames.length} scripted entries...');

for (entryCls in scriptedEntryClassNames)
{

{
{
scriptedSongVariations.set('${entry.id}:${entry.variation}', entry);
log('Successfully created scripted entry (${entryCls} = ${entry.id}, ${entry.variation})');
}
else
{
entries.set(entry.id, entry);
scriptedEntryIds.set(entry.id, entryCls);
log('Successfully created scripted entry (${entryCls} = ${entry.id})');
}
}
else
{
log('Failed to create scripted entry (${entryCls})');
}
}

//
//
{
});
{
});
log('Parsing ${unscriptedEntryIds.length} unscripted entries...');
for (entryId in unscriptedEntryIds)
{
try
{
{
log('Loaded entry data: ${entry}');
entries.set(entry.id, entry);
}
}
catch (e:Dynamic)
{
log(' ERROR '.error() + 'Failed to load entry data: ${entryId}');
log(' ERROR '.error() + e);
continue;
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

parser.ignoreUnknownVariables = true;

switch (loadEntryMetadataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(contents, fileName);
default:
}

{
printErrors(parser.errors, id);
}
}

public function parseEntryMetadataRaw(contents:String, ?fileName:String = 'raw', ?variation:String):Null<SongMetadata>
{

parser.ignoreUnknownVariables = true;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
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
throw '[${registryId}] Metadata entry ${id}:${variation} does not support migration to version ${SONG_METADATA_VERSION_RULE}.';
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
throw '[${registryId}] Metadata entry "${fileName}" does not support migration to version ${SONG_METADATA_VERSION_RULE}.';
}
}

function parseEntryMetadata_v2_1_0(id:String, ?variation:String):Null<SongMetadata>
{

parser.ignoreUnknownVariables = true;

switch (loadEntryMetadataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(contents, fileName);
default:
}
{
printErrors(parser.errors, id);
}
}

function parseEntryMetadata_v2_0_0(id:String, ?variation:String):Null<SongMetadata>
{

parser.ignoreUnknownVariables = true;

switch (loadEntryMetadataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(contents, fileName);
default:
}
{
printErrors(parser.errors, id);
}
}

function parseEntryMetadataRaw_v2_1_0(contents:String, ?fileName:String = 'raw'):Null<SongMetadata>
{
parser.ignoreUnknownVariables = true;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
}
}

function parseEntryMetadataRaw_v2_0_0(contents:String, ?fileName:String = 'raw'):Null<SongMetadata>
{
parser.ignoreUnknownVariables = true;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
}
}

public function parseMusicData(id:String, ?variation:String):Null<SongMusicData>
{

parser.ignoreUnknownVariables = false;

switch (loadMusicDataFile(id, variation))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(contents, fileName);
default:
}

{
printErrors(parser.errors, id);
}
}

public function parseMusicDataRaw(contents:String, ?fileName:String = 'raw'):Null<SongMusicData>
{
parser.ignoreUnknownVariables = false;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
}
}

public function parseMusicDataWithMigration(id:String, ?variation:String, version:thx.semver.Version):Null<SongMusicData>
{

{
}
else
{
throw '[${registryId}] Chart entry ${id}:${variation} does not support migration to version ${SONG_MUSIC_DATA_VERSION_RULE}.';
}
}

public function parseMusicDataRawWithMigration(contents:String, ?fileName:String = 'raw', version:thx.semver.Version):Null<SongMusicData>
{
{
}
else
{
throw '[${registryId}] Chart entry "$fileName" does not support migration to version ${SONG_MUSIC_DATA_VERSION_RULE}.';
}
}

public function parseEntryChartData(id:String, ?variation:String):Null<SongChartData>
{

parser.ignoreUnknownVariables = true;

switch (loadEntryChartFile(id, variation))
{
case {fileName: fileName, contents: contents}:
parser.fromJson(contents, fileName);
default:
}

{
printErrors(parser.errors, id);
}
}

public function parseEntryChartDataRaw(contents:String, ?fileName:String = 'raw', ?variation:String):Null<SongChartData>
{

parser.ignoreUnknownVariables = true;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
}
}

public function parseEntryChartDataWithMigration(id:String, ?variation:String, version:thx.semver.Version):Null<SongChartData>
{

{
}
else
{
throw '[${registryId}] Chart entry ${id}:${variation} does not support migration to version ${SONG_CHART_DATA_VERSION_RULE}.';
}
}

public function parseEntryChartDataRawWithMigration(contents:String, ?fileName:String = 'raw', version:thx.semver.Version,
?variation:String):Null<SongChartData>
{
{
}
else
{
throw '[${registryId}] Chart entry "${fileName}" does not support migration to version ${SONG_CHART_DATA_VERSION_RULE}.';
}
}

function loadEntryMetadataFile(id:String, ?variation:String):Null<JsonFile>
{
{
}
rawJson = rawJson.trim();
}

function loadMusicDataFile(id:String, ?variation:String):Null<JsonFile>
{
rawJson = rawJson.trim();
}

function hasMusicDataFile(id:String, ?variation:String):Bool
{
}

function loadEntryChartFile(id:String, ?variation:String):Null<JsonFile>
{
rawJson = rawJson.trim();
}

public function fetchEntryMetadataVersion(id:String, ?variation:String):Null<thx.semver.Version>
{
}

public function fetchEntryChartVersion(id:String, ?variation:String):Null<thx.semver.Version>
{
}

function cleanMetadata(metadata:SongMetadata, variation:String):SongMetadata
{
metadata.variation = variation;

}

function cleanChartData(chartData:SongChartData, variation:String):SongChartData
{
chartData.variation = variation;

}

/**
* A list of all difficulties for a specific character.
*/
public function listAllDifficulties(characterId:String):Array<String>
{

{
}

allDifficulties = [];
for (songId in listEntryIds())
{

for (diff in song.listDifficulties(null, song.getVariationsByCharacter(character)))
{
}
}

allDifficulties.sort(funkin.util.SortUtil.defaultsThenAlphabetically.bind(Constants.DEFAULT_DIFFICULTY_LIST_FULL));

{
allDifficulties = Constants.DEFAULT_DIFFICULTY_LIST.copy();
}

}
}

typedef SongEntryParams =
{
/**
* The variation ID for the song.
*/
}
