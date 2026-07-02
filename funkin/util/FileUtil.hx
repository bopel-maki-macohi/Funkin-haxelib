


/**
* Utilities for reading and writing files on various platforms.
*/
class FileUtil
{

public static final FILE_EXTENSION_INFO_FNFC:FileDialogExtensionInfo = {
extension: 'fnfc',
label: 'Friday Night Funkin\' Chart',
public static final FILE_EXTENSION_INFO_ZIP:FileDialogExtensionInfo = {
extension: 'zip',
label: 'ZIP Archive',
public static final FILE_EXTENSION_INFO_PNG:FileDialogExtensionInfo = {
extension: 'png',
label: 'PNG Image',

public static final FILE_EXTENSION_INFO_FNFS:FileDialogExtensionInfo = {
extension: 'fnfs',
label: 'Friday Night Funkin\' Stage',

/**
* Paths which should not be deleted or modified by scripts.
*/

static function get_PROTECTED_PATHS():Array<String>
{

for (i in 0...protected.length)
{
}

}

/**
* Regex for invalid filesystem characters.
*/


public static function get_gameDirectory():String
{
{
}

}

/**
* Browses for a single file, then calls `onSelect(fileInfo)` when a file is selected.
* Powered by HaxeUI, so it works on all platforms.
* File contents will be binary, not String.
*
* @param typeFilter
* @param onSelect A callback that provides a `SelectedFileInfo` object when a file is selected.
* @param onCancel A callback that is called when the user closes the dialog without selecting a file.
*/
public static function browseForBinaryFile(dialogTitle:String, ?typeFilter:Array<FileDialogExtensionInfo>, onSelect:(SelectedFileInfo) -> Void,
?onCancel:() -> Void)
{
{
{
}
else if (onCancel != null)
{
}

Dialogs.openFile(onComplete, {
readContents: true,
readAsBinary: true, // Binary
multiple: false,
extensions: typeFilter ?? new Array<FileDialogExtensionInfo>(),
title: dialogTitle,
}

/**
* Browses for a single file, then calls `onSelect(fileInfo)` when a file is selected.
* Powered by HaxeUI, so it works on all platforms.
* File contents will be a String, not binary.
*
* @param typeFilter
* @param onSelect A callback that provides a `SelectedFileInfo` object when a file is selected.
* @param onCancel A callback that is called when the user closes the dialog without selecting a file.
*/
public static function browseForTextFile(dialogTitle:String, ?typeFilter:Array<FileDialogExtensionInfo>, onSelect:(SelectedFileInfo) -> Void,
?onCancel:() -> Void):Void
{
{
{
}
else if (onCancel != null)
{
}

Dialogs.openFile(onComplete, {
readContents: true,
readAsBinary: false, // Text
multiple: false,
extensions: typeFilter ?? new Array<FileDialogExtensionInfo>(),
title: dialogTitle,
}

/**
* Browses for a directory, then calls `onSelect(path)` when a path chosen.
*
* @param typeFilter TODO What does this do?
* @return Whether the file dialog was opened successfully.
*/
public static function browseForDirectory(?typeFilter:Array<FileFilter>, onSelect:(String) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
?dialogTitle:String):Bool
{

{
}

FileDialog.openDirectory(Lib.current.stage.window, function(filepaths:Array<String>):Void
{
{
{
}
}
else
{
{
}
}

}

/**
* Browses for multiple file, then calls `onSelect(paths)` when a path chosen.
* Note that on HTML5 this will immediately fail.
*
* @return Whether the file dialog was opened successfully.
*/
public static function browseForMultipleFiles(?typeFilter:Array<FileFilter>, onSelect:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
?dialogTitle:String):Bool
{

{
}

FileDialog.openFile(Lib.current.stage.window, function(filepaths:Array<String>, filter):Void
{
{
{
}
}
else
{
{
}
}
}, @:privateAccess openfl.filesystem.File.__getFilterTypes(typeFilter ?? []),

}

/**
* Browses for a file location to save to, then calls `onSave(path)` when a path chosen.
*
* @param typeFilter TODO What does this do?
* @return Whether the file dialog was opened successfully.
*/
public static function browseForSaveFile(?typeFilter:Array<FileFilter>, onSelect:(String) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
?dialogTitle:String):Bool
{

{
}

FileDialog.saveFile(Lib.current.stage.window, function(filepath:String, filter):Void
{
{
{
}
}
else
{
{
}
}
}

/**
* Browses for a single file location, then writes the provided `haxe.io.Bytes` data and calls `onSave(path)` when done.
* Works great on desktop and HTML5.
*
* @return Whether the file dialog was opened successfully.
*/
public static function saveFile(data:Bytes, ?typeFilter:Array<FileFilter>, ?onSave:(String) -> Void, ?onCancel:() -> Void, ?defaultFileName:String,
?dialogTitle:String):Bool
{

{
}

FileDialog.saveFile(Lib.current.stage.window, function(filepath:String, filter):Void
{
{
{
}

{
}
}
else
{
{
}
}
}, @:privateAccess openfl.filesystem.File.__getFilterTypes(typeFilter ?? []),

}

/**
* Prompts the user to save multiple files.
* On desktop, this will prompt the user for a directory, then write all of the files to there.
* On HTML5, this will zip the files up and prompt the user to save that.
*
* @param typeFilter TODO What does this do?
* @return Whether the file dialog was opened successfully.
*/
public static function saveMultipleFiles(resources:Array<Entry>, ?onSaveAll:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
force:Bool = false):Bool
{
{
for (resource in resources)
{
/*
try
{
{
}
else
{
}
}
catch (e:Dynamic)
{
}
*/
{
}


}

{
}
}






{
}

}

/**
* Takes an array of file entries and prompts the user to save them as a ZIP file.
*/
public static function saveFilesAsZIP(resources:Array<Entry>, ?onSave:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
force:Bool = false):Bool
{
{

{
}

}

/**
* Takes an array of file entries and prompts the user to save them as a FNFC file.
*/
public static function saveChartAsFNFC(resources:Array<Entry>, ?onSave:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
force:Bool = false):Bool
{
{

{
}
}

/**
* Takes an array of file entries and forcibly writes a ZIP to the given path.
* Only works on native, because HTML5 doesn't allow you to write files to arbitrary paths.
* Use `saveFilesAsZIP` instead.
* @param force Whether to force overwrite an existing file.
*/
public static function saveFilesAsZIPToPath(resources:Array<Entry>, path:String, mode:FileWriteMode = Skip):Bool
{
}

/**
* Read string file contents directly from a given path.
* Only works on native.
*
* @param path The path to the file.
* @return The file contents.
*/
public static function readStringFromPath(path:String):String
{
}

/**
* Read bytes file contents directly from a given path.
* Only works on native.
*
* @param path The path to the file.
* @return The file contents.
*/
public static function readBytesFromPath(path:String):Bytes
{
}

/**
* Browse for a file to read and execute a callback once we have a file reference.
* Works great on HTML5 or desktop.
*
* @param	callback The function to call when the file is loaded.
*/
public static function browseFileReference(callback:(FileReference) -> Void):Void
{
file.addEventListener(Event.SELECT, function(e)
{

selectedFileRef.addEventListener(Event.COMPLETE, function(e)
{



}

/**
* Prompts the user to save a file to their computer.
*/
public static function writeFileReference(path:String, data:String, callback:String->Void)
{

file.addEventListener(Event.COMPLETE, function(e:Event)
{

file.addEventListener(Event.CANCEL, function(e:Event)
{

file.addEventListener(IOErrorEvent.IO_ERROR, function(e:IOErrorEvent)
{

}

/**
* Read JSON file contents directly from a given path.
* Only works on native.
*
* @param path The path to the file.
* @return The JSON data.
*/
public static function readJSONFromPath(path:String):Dynamic
{
}

/**
* Write string file contents directly to a given path.
* Only works on native.
*
* @param path The path to the file.
* @param data The string to write.
* @param mode Whether to Force, Skip, or Ask to overwrite an existing file.
*/
public static function writeStringToPath(path:String, data:String, mode:FileWriteMode = Skip):Void
{
{
}


switch (mode)
{
case Force:
case Skip:
{
}
case Ask:
{
}
else
{
}
}
}

/**
* Write byte file contents directly to a given path.
* Only works on native.
*
* @param path The path to the file.
* @param data The bytes to write.
* @param mode Whether to Force, Skip, or Ask to overwrite an existing file.
*/
public static function writeBytesToPath(path:String, data:Bytes, mode:FileWriteMode = Skip):Void
{
{
}

switch (mode)
{
case Force:
case Skip:
{
}
case Ask:
{
}
else
{
}
}

{
}
}

/**
* Write string file contents directly to the end of a file at the given path.
* Only works on native.
*
* @param path The path to the file.
* @param data The string to append.
*/
public static function appendStringToPath(path:String, data:String):Void
{
{
}
else if (directoryExists(path))
{
}

try
{
}
catch (e:Dynamic)
{
{
}

}
}

/**
* Moves a file from one location to another.
* Only works on native.
*
* @param path The path to the file.
* @param destination The path to move the file to.
*/
public static function moveFile(path:String, destination:String):Void
{
{
}

}

/**
* Delete a file at the given path.
* Only works on native.
*
* @param path The path to the file.
*/
public static function deleteFile(path:String):Void
{
}

/**
* Get a file's size in bytes. Max representable size is ~2.147 GB.
* Only works on native.
*
* @param path The path to the file.
* @return The size of the file in bytes.
*/
public static function getFileSize(path:String):Int
{
}

/**
* Check if a path exists on the filesystem.
* Only works on native.
*
* @param path The path to the potential file or directory.
* @return Whether the path exists.
*/
public static function pathExists(path:String):Bool
{
}

/**
* Check if a path is a file on the filesystem.
* Only works on native.
*
* @param path The path to the potential file.
* @return Whether the path exists and is a file.
*/
public static function fileExists(path:String):Bool
{
}

/**
* Check if a path is a directory on the filesystem.
* Only works on native.
*
* @param path The path to the potential directory.
* @return Whether the path exists and is a directory.
*/
public static function directoryExists(path:String):Bool
{
try
{
}
catch (e:Dynamic)
{
}
}

/**
* Create a directory if it doesn't already exist.
* Only works on native.
*
* @param dir The path to the directory.
*/
public static function createDirIfNotExists(dir:String):Void
{
{
}
}

/**
* List all entries in a directory.
* Only works on native.
*
* @param path The path to the directory.
* @return An array of entries in the directory.
*/
public static function readDir(path:String):Array<String>
{
}

/**
* Move a directory from one location to another, optionally ignoring some paths.
* Only works on native.
*
* @param path The path to the directory.
* @param destination The path to move the directory to.
* @param ignore A list of paths to ignore.
* @param strict Fails if the destination directory is not empty.
*/
public static function moveDir(path:String, destination:String, ?ignore:Array<String>, strict:Bool = true):Void
{
{
}

{
{
}
}

{

for (entry in entries)
{
{
}
else
{
}
}
}

{
}
}

/**
* Delete a directory, optionally including its contents, and optionally ignoring some paths.
* Only works on native.
*
* @param path The path to the directory.
* @param recursive Whether to delete all contents of the directory.
* @param ignore A list of paths to ignore.
*/
public static function deleteDir(path:String, recursive:Bool = false, ?ignore:Array<String>):Void
{
{
}

{
{

for (entry in entries)
{
{
}
else
{
}
}
}
}
else
{
}
}

/**
* Get a directory's total size in bytes. Max representable size is ~2.147 GB.
* Only works on native.
*
* @param path The path to the directory.
* @return The total size of the directory in bytes.
*/
public static function getDirSize(path:String):Int
{
{
}

{

for (entry in readDir(currentPath))
{
{
}
else
{
}
}
}

}


/**
* Get the path to a temporary directory we can use for writing files.
* Only works on native.
*
* @return The path to the temporary directory.
*/
public static function getTempDir():Null<String>
{
for (envName in TEMP_ENV_VARS)
{
}
}

/**
* Rename a file or directory.
* Only works on native.
*
* @param path The path to the file or directory.
* @param newName The new name of the file or directory.
* @param keepExtension Whether to keep the extension the same, if applicable.
*/
public static function rename(path:String, newName:String, keepExtension:Bool = true):Void
{
{
}

{
}
else if (keepExtension)
{
}

{
}

{
}

}

/**
* Create a Bytes object containing a ZIP file, containing the provided entries.
*
* @param entries The entries to add to the ZIP file.
* @return The ZIP file as a Bytes object.
*/
public static function createZIPFromEntries(entries:Array<Entry>):Bytes
{
}

public static function readZIPFromBytes(input:Bytes):Array<Entry>
{
for (entry in zippedEntries)
{
{
}

}

}

public static function mapZIPEntriesByName(input:Array<Entry>):Map<String, Entry>
{
for (entry in input)
{
}

}

/**
* Create a ZIP file entry from a file name and its string contents.
*
* @param name The name of the file. You can use slashes to create subdirectories.
* @param content The string contents of the file.
* @return The resulting entry.
*/
public static function makeZIPEntry(name:String, content:String):Entry
{
}

/**
* Create a ZIP file entry from a file name and its string contents.
*
* @param name The name of the file. You can use slashes to create subdirectories.
* @param data The byte data of the file.
* @return The resulting entry.
*/
public static function makeZIPEntryFromBytes(name:String, data:haxe.io.Bytes):Entry
{
fileName: name,
fileSize: data.length,
data: data,
dataSize: data.length,
compressed: false,
fileTime: Date.now(),
crc32: null,
extraFields: null,
}

/**
* Runs platform-specific code to open a path in the file explorer.
*
* @param pathFolder The path of the folder to open.
* @param createIfNotExists If `true`, creates the folder if missing; otherwise, throws an error.
*/
public static function openFolder(pathFolder:String, createIfNotExists:Bool = true):Void
{
{
}
else if (!directoryExists(pathFolder))
{
}

//

for (fm in fileManagers)
{
{
}
}

}

/**
* Runs platform-specific code to open a file explorer and select a specific file.
*
* @param path The path of the file to select.
*/
public static function openSelectFile(path:String):Void
{
{
}

}

private static function convertTypeFilter(?typeFilter:Array<FileFilter>):Null<String>
{
{
for (type in typeFilter)
{
}

}

}
}

/**
* Utilities for reading and writing files on various platforms.
* Wrapper for `FileUtil` that sanitizes paths for script safety.
*/ @:nullSafety
class FileUtilSandboxed
{
/**
* Prevent paths from exiting the root.
*
* @param path The path to sanitize.
* @return The sanitized path.
*/
public static function sanitizePath(path:String):String
{
{
}

{
}

{
}

for (part in parts)
{
switch (part)
{
case '.' | '':
case '..':
default:
}
}

{
}

{
}

{
}

{
}

}

/**
* Check against protected paths.
* @param path The path to check.
* @return Whether the path is protected.
*/
public static function isProtected(path:String, sanitizeFirst:Bool = true):Bool
{
{
{
}
}

}



public static function browseForBinaryFile(dialogTitle:String, ?typeFilter:Array<FileDialogExtensionInfo>, onSelect:(SelectedFileInfo) -> Void,
?onCancel:() -> Void)
{
}

public static function browseForTextFile(dialogTitle:String, ?typeFilter:Array<FileDialogExtensionInfo>, onSelect:(SelectedFileInfo) -> Void,
?onCancel:() -> Void):Void
{
}

public static function browseForDirectory(?typeFilter:Array<FileFilter>, onSelect:(String) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
?dialogTitle:String):Bool
{
}

public static function browseForMultipleFiles(?typeFilter:Array<FileFilter>, onSelect:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
?dialogTitle:String):Bool
{
}

public static function browseForSaveFile(?typeFilter:Array<FileFilter>, onSelect:(String) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
?dialogTitle:String):Bool
{
}

public static function saveFile(data:Bytes, ?typeFilter:Array<FileFilter>, ?onSave:(String) -> Void, ?onCancel:() -> Void, ?defaultFileName:String,
?dialogTitle:String):Bool
{
}

public static function saveMultipleFiles(resources:Array<Entry>, ?onSaveAll:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
force:Bool = false):Bool
{
}

public static function saveFilesAsZIP(resources:Array<Entry>, ?onSave:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
force:Bool = false):Bool
{
}

public static function saveChartAsFNFC(resources:Array<Entry>, ?onSave:(Array<String>) -> Void, ?onCancel:() -> Void, ?defaultPath:String,
force:Bool = false):Bool
{
}

public static function saveFilesAsZIPToPath(resources:Array<Entry>, path:String, mode:FileWriteMode = Skip):Bool
{
}

public static function readStringFromPath(path:String):String
{
}

public static function readBytesFromPath(path:String):Bytes
{
}

public static function browseFileReference(callback:(FileReference) -> Void):Void
{
}

public static function writeFileReference(path:String, data:String, callback:String->Void):Void
{
}

public static function readJSONFromPath(path:String):Dynamic
{
}

public static function writeStringToPath(path:String, data:String, mode:FileWriteMode = Skip):Void
{
}

public static function writeBytesToPath(path:String, data:Bytes, mode:FileWriteMode = Skip):Void
{
}

public static function appendStringToPath(path:String, data:String):Void
{
}

public static function moveFile(path:String, destination:String):Void
{
}

public static function deleteFile(path:String):Void
{
}

public static function getFileSize(path:String):Int
{
}

public static function pathExists(path:String):Bool
{
}

public static function fileExists(path:String):Bool
{
}

public static function directoryExists(path:String):Bool
{
}

public static function createDirIfNotExists(dir:String):Void
{
}

public static function readDir(path:String):Array<String>
{
}

public static function moveDir(path:String, destination:String, ?ignore:Array<String>, strict:Bool = true):Void
{
}

public static function deleteDir(path:String, recursive:Bool = false, ?ignore:Array<String>):Void
{
}

public static function getDirSize(path:String):Int
{
}

public static function getTempDir():Null<String>
{
}

public static function rename(path:String, newName:String, keepExtension:Bool = true):Void
{
}

public static function createZIPFromEntries(entries:Array<Entry>):Bytes
{
}

public static function readZIPFromBytes(input:Bytes):Array<Entry>
{
}

public static function mapZIPEntriesByName(input:Array<Entry>):Map<String, Entry>
{
}

public static function makeZIPEntry(name:String, content:String):Entry
{
}

public static function makeZIPEntryFromBytes(name:String, data:haxe.io.Bytes):Entry
{
}

public static function openFolder(pathFolder:String, createIfNotExists:Bool = true):Void
{
}

public static function openSelectFile(path:String):Void
{
}
}

enum FileWriteMode
{
/**
* Forcibly overwrite the file if it already exists.
*/

/**
* Ask the user if they want to overwrite the file if it already exists.
*/

/**
* Skip the file if it already exists.
*/
}
