

/**
* A class for interacting with Polymod, the atomic modding framework for Haxe.
*/
class PolymodHandler
{
/**
* The API version for the current version of the game. Since 0.5.0, we've just made this the game version!
* Minor updates rarely impact mods but major versions sometimes do.
*/

static function get_API_VERSION():String
{
}

/**
* The Semantic Versioning rule
* Indicates which mods are compatible with this version of the game.
* Using more complex rules allows mods from older compatible versions to stay functioning,
* while preventing mods made for future versions from being installed.
*/

/**
* Where relative to the executable that mods are located.
*/
'../../../../../../../example_mods'
'../../../../example_mods'
'mods'

'../../../../../../../assets'
'../../../../assets'
null

/**
* Populated with the directories of mods once they're successfully loaded.
*/

/**
* Populated with the IDs of mods once they're successfully loaded.
*/


/**
* If the mods folder doesn't exist, create it.
*/
public static function createModRoot():Void
{
}

/**
* Loads the game with ALL mods enabled with Polymod.
*/
public static function loadAllMods():Void
{
}

/**
* Loads the game with configured mods enabled with Polymod.
*/
public static function loadEnabledMods():Void
{
loadModsByDir(Save.instance.enabledModDirs.value);
}

/**
* Loads the game without any mods enabled with Polymod.
*/
public static function loadNoMods():Void
{
}

/**
* Load all the mods with the directories they're in.
* @param dirs The ORDERED list of mod ids to load.
*/
public static function loadModsByDir(dirs:Array<String>):Void
{
{
}
else
{
}



modRoot: MOD_FOLDER,
dirs: dirs,
framework: OPENFL,
apiVersionRule: API_VERSION_RULE,
errorCallback: PolymodErrorHandler.onPolymodError,

customFilesystem: modFileSystem,

frameworkParams: buildFrameworkParams(),

ignoredFiles: buildIgnoreList(),

parseRules: buildParseRules(),

skipDependencyErrors: true,

useScriptedClasses: true,
loadScriptsAsync: #if html5 true #else false #end,

{
}
else
{
{
}
else
{
}
}

for (mod in loadedModList)
{
}

for (item in fileList)
{
}

for (item in fileList)
{
}

for (item in fileList)
{
}

for (item in fileList)
{
}

for (item in fileList)
{
}
}

static function buildFileSystem():polymod.fs.ZipFileSystem
{
modRoot: MOD_FOLDER,
autoScan: true
}

static function buildImports():Void
{

for (cls in DEFAULT_IMPORTS)
{
}




















for (cls in ClassMacro.listClassesInPackage('extension.androidtools'))
{
}

for (cls in ClassMacro.listClassesInPackage('extension.haptics'))
{
}

for (cls in ClassMacro.listClassesInPackage('extension.admob'))
{
}

for (cls in ClassMacro.listClassesInPackage('extension.iapcore'))
{
}

for (cls in ClassMacro.listClassesInPackage('extension.iarcore'))
{
}

for (cls in ClassMacro.listClassesInPackage('extension.webviewcore'))
{
}








Polymod.blacklistInstanceFields(funkin.save.Save, [ // No direct field access
'data', // LMFAO definitely not
'clearData', // No score manipulation please


for (cls in ClassMacro.listClassesInPackage('funkin.api'))
{
}

for (cls in ClassMacro.listClassesInPackage('polymod'))
{
}

for (cls in ClassMacro.listClassesInPackage('hscript'))
{
}

for (cls in ClassMacro.listClassesInPackage('io.newgrounds'))
{
}

for (cls in ClassMacro.listClassesInPackage('sys'))
{
}

for (cls in ClassMacro.listClassesInPackage('funkin.util.macro'))
{
}

}

/**
* Build a list of file paths that will be ignored in mods.
*/
static function buildIgnoreList():Array<String>
{


}

static function buildParseRules():polymod.format.ParseRules
{

}

static inline function buildFrameworkParams():polymod.Polymod.FrameworkParams
{
assetLibraryPaths: ['default' => 'preload', 'shared' => 'shared', 'songs' => 'songs', 'videos' => 'videos', 'tutorial' => 'tutorial', 'week1' => 'week1', 'week2' => 'week2', 'week3' => 'week3', 'week4' => 'week4', 'week5' => 'week5', 'week6' => 'week6', 'week7' => 'week7', 'weekend1' => 'weekend1', 'sserafim' => 'sserafim'],
coreAssetRedirect: CORE_FOLDER,
}
}

/**
* Retrieve a list of metadata for ALL installed mods, including disabled mods.
* @return An array of mod metadata
*/
public static function getAllMods():Array<ModMetadata>
{


modRoot: MOD_FOLDER,
apiVersionRule: API_VERSION_RULE,
fileSystem: modFileSystem,
errorCallback: PolymodErrorHandler.onPolymodError
}

/**
* Retrieve a list of ALL mod IDs, including disabled mods.
* @return An array of mod IDs
*/
public static function getAllModIds():Array<String>
{
}

/**
* Retrieve a list of ALL mod directory names, including disabled mods.
* @return An array of mod direcotry names
*/
public static function getAllModDirs():Array<String>
{
}

/**
* Retrieve a list of metadata for all enabled mods.
* @return An array of mod metadata
*/
public static function getEnabledMods():Array<ModMetadata>
{
for (item in modMetadata)
{
{
}
}
}

/**
* Clear and reload from disk all data assets.
* Useful for "hot reloading" for fast iteration!
*/
public static function forceReloadAssets():Void
{





SongRegistry.instance.loadEntries();
LevelRegistry.instance.loadEntries();
NoteStyleRegistry.instance.loadEntries();
PlayerRegistry.instance.loadEntries();
ConversationRegistry.instance.loadEntries();
DialogueBoxRegistry.instance.loadEntries();
SpeakerRegistry.instance.loadEntries();
AlbumRegistry.instance.loadEntries();
StageRegistry.instance.loadEntries();
StickerRegistry.instance.loadEntries();
FreeplayStyleRegistry.instance.loadEntries();

CharacterDataParser.loadCharacterCache(); // TODO: Migrate characters to BaseRegistry.
}
}
