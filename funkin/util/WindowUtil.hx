


/**
* Utilities for operating on the current window, such as changing the title.
*/
class WindowUtil
{
/**
* A regex to match valid URLs.
*/

/**
* Sanitizes a URL via a regex.
*
* @param targetUrl The URL to sanitize.
* @return The sanitized URL, or an empty string if the URL is invalid.
*/
public static function sanitizeURL(targetUrl:String):String
{
{
}

{
}

{
}

}

/**
* Runs platform-specific code to open a URL in a web browser.
* @param targetUrl The URL to open.
*/
public static function openURL(targetUrl:String):Void
{

{
}

}

/**
* Initialize Tracy.
* NOTE: Call this from the main thread ONLY!
*/
public static function initTracy():Void
{



}

/**
* Dispatched when the game window is closed.
*/

/**
* Wires up FlxSignals that happen based on window activity.
* For example, we can run a callback when the window is closed.
*/
public static function initWindowEvents():Void
{
openfl.Lib.current.stage.application.onExit.add(function(exitCode:Int)
{

openfl.Lib.current.stage.addEventListener(openfl.events.KeyboardEvent.KEY_DOWN, (e:openfl.events.KeyboardEvent) ->
{
{
}

for (key in PlayerSettings.player1.controls.getKeysForAction(WINDOW_FULLSCREEN))
{
{
}

{
}
}
}

/**
* Sets the title of the application window.
* @param value The title to use.
*/
public static function setWindowTitle(value:String):Void
{
}

/**
* Shows an error dialog with an error icon.
* @param name The title of the dialog window.
* @param desc The error message to display.
*/
public static function showError(name:String, desc:String):Void
{
}

/**
* Shows a warning dialog with a warning icon.
* @param name The title of the dialog window.
* @param desc The warning message to display.
*/
public static function showWarning(name:String, desc:String):Void
{
}

/**
* Shows an information dialog with an information icon.
* @param name The title of the dialog window.
* @param desc The information message to display.
*/
public static function showInformation(name:String, desc:String):Void
{
}

public static function setVSyncMode(value:lime.ui.WindowVSyncMode):Void
{

{
}
}
}
