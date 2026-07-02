package funkin.modding;


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
public static final API_VERSION_RULE:String = '>=0.8.0 <0.9.0';

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
FileUtil.createDirIfNotExists(MOD_FOLDER);
}

/**
* Loads the game with ALL mods enabled with Polymod.
*/
public static function loadAllMods():Void
{
createModRoot();
loadModsByDir(getAllModDirs());
}

/**
* Loads the game with configured mods enabled with Polymod.
*/
public static function loadEnabledMods():Void
{
createModRoot();
loadModsByDir(Save.instance.enabledModDirs.value);
}

/**
* Loads the game without any mods enabled with Polymod.
*/
public static function loadNoMods():Void
{
createModRoot();
loadModsByDir([]);
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

buildImports();


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
});

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

loadedModIds = [];
loadedModDirs = [];
for (mod in loadedModList)
{
loadedModDirs.push(mod.dirName);
loadedModIds.push(mod.id);
}

for (item in fileList)
{
}

fileList = Polymod.listModFiles(PolymodAssetType.TEXT);
for (item in fileList)
{
}

fileList = Polymod.listModFiles(PolymodAssetType.AUDIO_MUSIC);
for (item in fileList)
{
}

fileList = Polymod.listModFiles(PolymodAssetType.AUDIO_SOUND);
for (item in fileList)
{
}

fileList = Polymod.listModFiles(PolymodAssetType.AUDIO_GENERIC);
for (item in fileList)
{
}
}

static function buildFileSystem():polymod.fs.ZipFileSystem
{
polymod.Polymod.onError = PolymodErrorHandler.onPolymodError;
modRoot: MOD_FOLDER,
autoScan: true
});
}

static function buildImports():Void
{

for (cls in DEFAULT_IMPORTS)
{
Polymod.addDefaultImport(cls);
}

Polymod.addImportAlias('lime.utils.Assets', funkin.Assets);
Polymod.addImportAlias('openfl.utils.Assets', funkin.Assets);

Polymod.addImportAlias('funkin.modding.base.ScriptedFunkinSprite', funkin.graphics.ScriptedFunkinSprite);
Polymod.addImportAlias('funkin.modding.base.ScriptedMusicBeatState', funkin.ui.ScriptedMusicBeatState);
Polymod.addImportAlias('funkin.modding.base.ScriptedMusicBeatSubState', funkin.ui.ScriptedMusicBeatSubState);

Polymod.addImportAlias('funkin.data.dialogue.conversation.ConversationRegistry', funkin.data.dialogue.ConversationRegistry);
Polymod.addImportAlias('funkin.data.dialogue.dialoguebox.DialogueBoxRegistry', funkin.data.dialogue.DialogueBoxRegistry);
Polymod.addImportAlias('funkin.data.dialogue.speaker.SpeakerRegistry', funkin.data.dialogue.SpeakerRegistry);
Polymod.addImportAlias('funkin.play.character.CharacterDataParser', funkin.data.character.CharacterData.CharacterDataParser);
Polymod.addImportAlias('funkin.play.character.CharacterData.CharacterDataParser', funkin.data.character.CharacterData.CharacterDataParser);

Polymod.addImportAlias('funkin.graphics.adobeanimate.FlxAtlasSprite', funkin.graphics.FunkinSprite);
Polymod.addImportAlias('funkin.modding.base.ScriptedFlxAtlasSprite', funkin.graphics.ScriptedFunkinSprite);

Polymod.addImportAlias('funkin.util.FileUtil', funkin.util.FileUtilSandboxed);

Polymod.addImportAlias('funkin.api.newgrounds.Leaderboards', funkin.api.newgrounds.Leaderboards.LeaderboardsSandboxed);

Polymod.addImportAlias('funkin.api.newgrounds.Medals', funkin.api.newgrounds.Medals.MedalsSandboxed);

Polymod.addImportAlias('funkin.api.newgrounds.NewgroundsClient', funkin.api.newgrounds.NewgroundsClient.NewgroundsClientSandboxed);

Polymod.addImportAlias('funkin.api.discord.DiscordClient', funkin.api.discord.DiscordClient.DiscordClientSandboxed);


Polymod.blacklistImport('Sys');

Polymod.addImportAlias('Reflect', funkin.util.ReflectUtil);

Polymod.addImportAlias('Type', funkin.util.ReflectUtil);

Polymod.blacklistImport('cpp.Lib');

Polymod.blacklistImport('haxe.Unserializer');

Polymod.blacklistImport('lime.utils.AssetLibrary');

Polymod.blacklistImport('funkin.mobile.util.AdMobUtil');

Polymod.blacklistImport('funkin.mobile.util.InAppPurchasesUtil');

Polymod.blacklistImport('funkin.mobile.util.InAppReviewUtil');

for (cls in ClassMacro.listClassesInPackage('extension.androidtools'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('extension.haptics'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('extension.admob'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('extension.iapcore'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('extension.iarcore'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('extension.webviewcore'))
{
Polymod.blacklistImport(className);
}

Polymod.blacklistImport('lime.system.CFFI');

Polymod.blacklistImport('lime.system.JNI');

Polymod.blacklistImport('lime.system.System');

Polymod.blacklistImport('lime.utils.Assets');
Polymod.blacklistImport('openfl.utils.Assets');
Polymod.blacklistImport('openfl.Lib');
Polymod.blacklistImport('openfl.system.ApplicationDomain');
Polymod.blacklistImport('openfl.net.SharedObject');

Polymod.blacklistImport('openfl.desktop.NativeProcess');

Polymod.blacklistStaticFields(flixel.util.FlxSave, ['resolveFlixelClasses']);
Polymod.blacklistStaticFields(flixel.FlxG, ['save']);

Polymod.blacklistStaticFields(haxe.Unserializer, ['run']);
Polymod.blacklistInstanceFields(haxe.Unserializer, ['unserialize']);

Polymod.blacklistInstanceFields(funkin.save.Save, [ // No direct field access
'data', // LMFAO definitely not
'clearData', // No score manipulation please
'setLevelScore', 'setSongScore', 'applySongRank']);

Polymod.blacklistInstanceFields(openfl.net.Socket, ['readObject']);
Polymod.blacklistInstanceFields(openfl.utils.ByteArray.ByteArrayData, ['readObject']);

for (cls in ClassMacro.listClassesInPackage('funkin.api'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('polymod'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('hscript'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('io.newgrounds'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('sys'))
{
Polymod.blacklistImport(className);
}

for (cls in ClassMacro.listClassesInPackage('funkin.util.macro'))
{
Polymod.blacklistImport(className);
}

Polymod.blacklistImport('funkin.external.android.CallbackUtil');
Polymod.blacklistImport('funkin.external.android.DataFolderUtil');
Polymod.blacklistImport('funkin.external.android.JNIUtil');
}

/**
* Build a list of file paths that will be ignored in mods.
*/
static function buildIgnoreList():Array<String>
{

result.push('.vscode');
result.push('.idea');
result.push('.git');
result.push('.gitignore');
result.push('.gitattributes');
result.push('README.md');

}

static function buildParseRules():polymod.format.ParseRules
{
output.addType('txt', TextFileFormat.LINES);

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
});
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
enabledMods.push(item);
}
}
}

/**
* Clear and reload from disk all data assets.
* Useful for "hot reloading" for fast iteration!
*/
public static function forceReloadAssets():Void
{
ModuleHandler.clearModuleCache();
Polymod.clearScripts();

funkin.modding.PolymodHandler.loadAllMods();



SongEventRegistry.loadEventCache();

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
NoteKindManager.initialize();
ModuleHandler.loadModuleCache();
ModuleHandler.callOnCreate();
}
}
