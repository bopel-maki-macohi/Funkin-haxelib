package funkin.util.logging;


/**
* A custom crash handler that writes to a log file and displays a message box.
*/
class CrashHandler
{
public static final LOG_FOLDER = 'logs';

/**
* Called before exiting the game when a standard error occurs, like a thrown exception.
* @param message The error message.
*/

/**
* Called before exiting the game when a critical error occurs, like a stack overflow or null object reference.
* CAREFUL: The game may be in an unstable state when this is called.
* @param message The error message.
*/

/**
* Initializes
*/
public static function initialize():Void
{
Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onUncaughtError);

untyped __global__.__hxcpp_set_critical_error_handler(onCriticalError);
}

/**
* Called when an uncaught error occurs.
* This handles most thrown errors, and is sufficient to handle everything alone on HTML5.
* @param error Information on the error that was thrown.
*/
static function onUncaughtError(error:UncaughtErrorEvent):Void
{
try
{
errorSignal.dispatch(generateErrorMessage(error));

try
{
logError(error);
}
catch (e:Dynamic)
{
}

displayError(error);
}
catch (e:Dynamic)
{
}

openfl.Lib.application.window.close();
}

static function onCriticalError(message:String):Void
{
try
{
criticalErrorSignal.dispatch(message);

logErrorMessage(message, true);

displayErrorMessage(message);
}
catch (e:Dynamic)
{

}

openfl.Lib.application.window.close();
}

static function displayError(error:UncaughtErrorEvent):Void
{
displayErrorMessage(generateErrorMessage(error));
}

static function displayErrorMessage(message:String):Void
{
funkin.util.WindowUtil.showError("Fatal Uncaught Exception", message);
}

static function logError(error:UncaughtErrorEvent):Void
{
logErrorMessage(generateErrorMessage(error));
}

static function logErrorMessage(message:String, critical:Bool = false):Void
{
FileUtil.createDirIfNotExists(LOG_FOLDER);

sys.io.File.saveContent('$LOG_FOLDER/crash${critical ? '-critical' : ''}-${DateUtil.generateTimestamp()}.log', buildCrashReport(message));
}

static function buildCrashReport(message:String):String
{
fullContents += ' Funkin Crash Report\n';
fullContents += '=====================\n';

fullContents += '\n';

fullContents += buildSystemInfo();

fullContents += '\n\n';

fullContents += '=====================\n';

fullContents += '\n';

{
{
currentState = Type.getClassName(currentStateCls) ?? 'No state loaded';
}
}

fullContents += 'Flixel Current State: ${currentState}\n';

fullContents += '\n';

fullContents += '=====================\n';

fullContents += '\n';

fullContents += 'Haxelibs: \n';

for (lib in Constants.LIBRARY_VERSIONS)
{
fullContents += '- ${lib}\n';
}

fullContents += '\n';

fullContents += '=====================\n';

fullContents += '\n';

fullContents += 'Loaded mods: \n';

{
fullContents += 'No mods loaded.\n';
}
else
{
for (mod in funkin.modding.PolymodHandler.loadedModIds)
{
fullContents += '- ${mod}\n';
}
}

fullContents += '\n';

fullContents += '=====================\n';

fullContents += '\n';

fullContents += message;

fullContents += '\n';

}

public static function buildSystemInfo():String
{
fullContents += ' Git hash: ${Constants.GIT_HASH} (${Constants.GIT_HAS_LOCAL_CHANGES ? 'MODIFIED' : 'CLEAN'})\n';
fullContents += 'System timestamp: ${DateUtil.generateTimestamp()}\n';
fullContents += 'Driver info: ${driverInfo}\n';
fullContents += 'Platform: ${Sys.systemName()}\n';
fullContents += 'Render method: ${renderMethod()}\n';

fullContents += '\n';

fullContents += '=====================\n';

fullContents += '\n';

fullContents += MemoryUtil.buildGCInfo();

}

static function generateErrorMessage(error:UncaughtErrorEvent):String
{

errorMessage += '${error.error}\n';

for (stackItem in callStack)
{
switch (stackItem)
{
case FilePos(innerStackItem, file, line, column):
errorMessage += ' in ${file}#${line}';
case CFunction:
errorMessage += '[Function] ';
case Module(m):
errorMessage += '[Module(${m})] ';
case Method(classname, method):
errorMessage += '[Function(${classname}.${method})] ';
case LocalFunction(v):
errorMessage += '[LocalFunction(${v})] ';
}
errorMessage += '\n';
}

}

public static function queryStatus():Void
{


}

public static function induceBasicCrash():Void
{
throw "This is an example of an uncaught exception.";
}

public static function induceNullObjectReference():Void
{
}

public static function induceNullObjectReference2():Void
{
}

public static function induceNullObjectReference3():Void
{
}

static function renderMethod():String
{
outputStr = try
{
switch (FlxG.renderMethod)
{
case FlxRenderMethod.DRAW_TILES: 'DRAW_TILES';
case FlxRenderMethod.BLITTING: 'BLITTING';
default: 'UNKNOWN';
}
}
catch (e)
{
'ERROR ON QUERY RENDER METHOD: ${e}';
}

}
}
