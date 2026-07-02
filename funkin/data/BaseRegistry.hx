package funkin.data;


/**
* The entry's constructor function takes 2 arguments, the entry ID and optional parameters.
*/
typedef EntryConstructorFunction = (String, ?Dynamic) -> Void;

/**
* A base type for a Registry, which is an object which handles loading scriptable objects.
*
* @param T The type to construct. Must implement `IRegistryEntry`.
* @param J The type of the JSON data used when constructing.
* @param P The type of the parameters used for `fetchEntry()`.
*/
abstract class BaseRegistry<T:(IRegistryEntry<J> & Constructible<EntryConstructorFunction>), J, P>
{
/**
* The ID of the registry. Used when logging.
*/
public final registryId:String;


/**
* A map of entry IDs to entries.
*/

/**
* A map of entry IDs to scripted class names.
*/

/**
* The version rule to use when loading entries.
* If the entry's version does not match this rule, migration is needed.
*/


/**
* @param registryId A readable ID for this registry, used when logging.
* @param dataFilePath The path (relative to `assets/data`) to search for JSON files.
*/
public function new(registryId:String, dataFilePath:String, ?versionRule:thx.semver.VersionRule)
{
this.registryId = registryId;
this.dataFilePath = dataFilePath;
this.versionRule = versionRule == null ? '1.0.x' : versionRule;

this.entries = new Map<String, T>();
this.scriptedEntryIds = [];

{
}
}

/**
* TODO: Create a `loadEntriesAsync(onProgress, onComplete)` function.
*/
public function loadEntries():Void
{
clearEntries();

//
//
log(' INFO '.info() + 'Parsing ${scriptedEntryClassNames.length} scripted entries...');

for (entryCls in scriptedEntryClassNames)
{
try
{
entry = createScriptedEntry(entryCls);
}
catch (e)
{
log('Failed to create scripted entry (${entryCls})');
continue;
}

{
log('Successfully created scripted entry (${entryCls} = ${entry.id})');
entries.set(entry.id, entry);
scriptedEntryIds.set(entry.id, entryCls);
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
log(' INFO '.info() + 'Parsing ${unscriptedEntryIds.length} unscripted entries...');
for (entryId in unscriptedEntryIds)
{
try
{
{
log('Loaded entry data: ${entry}');
entries.set(entry.id, entry);
}
}
catch (e)
{
log(' WARNING '.warning() + ' Failed to load entry data: ${entryId}');
continue;
}
}
}

/**
* Retrieve a list of all entry IDs in this registry.
* @return The list of entry IDs.
*/
public function listEntryIds():Array<String>
{
}

/**
* Count the number of entries in this registry.
* @return The number of entries.
*/
public function countEntries():Int
{
}

/**
* Return whether the entry ID is known to have an attached script.
* @param id The ID of the entry.
* @return `true` if the entry has an attached script, `false` otherwise.
*/
public function isScriptedEntry(id:String, ?params:Null<P>):Bool
{
}

/**
* Return the class name of the scripted entry with the given ID, if it exists.
* @param id The ID of the entry.
* @return The class name, or `null` if it does not exist.
*/
public function getScriptedEntryClassName(id:String, ?params:Null<P>):Null<String>
{
}

/**
* Return whether the registry has successfully parsed an entry with the given ID.
* @param id The ID of the entry.
* @return `true` if the entry exists, `false` otherwise.
*/
public function hasEntry(id:String):Bool
{
}

/**
* Fetch an entry by its ID.
* @param id The ID of the entry to fetch.
* @return The entry, or `null` if it does not exist.
*/
public function fetchEntry(id:String, ?params:Null<P>):Null<T>
{
}

/**
* A list of all entries included in the base game.
* The actual function exists and is auto-generated on each registry at build time.
* @return Array<String>
*/

/**
* A list of all entries that are not included in the base game.
* @return Array<String>
*/

public function toString():String
{
}

/**
* Retrieve the data for an entry and parse its Semantic Version.
* @param id The ID of the entry.
* @return The entry's version, or `null` if it does not exist or is invalid.
*/
public function fetchEntryVersion(id:String):Null<thx.semver.Version>
{
}

function log(message:String):Void
{
}

function loadEntryFile(id:String):JsonFile
{
fileName: entryFilePath,
contents: rawJson
};
}

function clearEntries():Void
{
for (entry in entries)
{
entry.destroy();
}

entries.clear();
}

//
//

/**
* Read, parse, and validate the JSON data and produce the corresponding data object.
*
* NOTE: Must be implemented on the implementation class.
* @param id The ID of the entry.
* @return The created entry.
*/
public abstract function parseEntryData(id:String):Null<J>;

/**
* Parse and validate the JSON data and produce the corresponding data object.
*
* NOTE: Must be implemented on the implementation class.
* @param contents The JSON as a string.
* @param fileName An optional file name for error reporting.
* @return The created entry.
*/
public abstract function parseEntryDataRaw(contents:String, ?fileName:String):Null<J>;

/**
* Read, parse, and validate the JSON data and produce the corresponding data object,
* accounting for old versions of the data.
*
* NOTE: Extend this function to handle migration.
* @param id The ID of the entry.
* @param version The entry's version (use `fetchEntryVersion(id)`).
* @return The created entry.
*/
public function parseEntryDataWithMigration(id:String, version:Null<thx.semver.Version>):Null<J>
{
{
throw '[${registryId}] Entry ${id} could not be JSON-parsed or does not have a parseable version.';
}

{
}
else
{
throw '[${registryId}] Entry ${id} does not support migration to version ${versionRule}.';
}

/*
* An example of what you should override this with:
*
* ```haxe
* if (VersionUtil.validateVersion(version, "0.1.x")) {
*   return parseEntryData_v0_1_x(id);
* } else {
*   super.parseEntryDataWithMigration(id, version);
* }
* ```
*/
}

/**
* Retrieve the list of scripted class names to load.
* @return An array of scripted class names.
*/
abstract function getScriptedClassNames():Array<String>;

/**
* Create an entry from the given ID.
* @param id
*/
function createEntry(id:String):Null<T>
{
}

/**
* Create a entry, attached to a scripted class, from the given class name.
* @param clsName
*/
abstract function createScriptedEntry(clsName:String):Null<T>;

function printErrors(errors:Array<json2object.Error>, id:String = ''):Void
{

for (error in errors)
{
DataError.printError(error);
}
}
}
