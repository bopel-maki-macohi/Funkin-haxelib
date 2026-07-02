package funkin.util;

/**
* Utility functions related to specific platforms.
*/
class PlatformUtil
{
/**
* Returns true if the current platform is MacOS.
*
* NOTE: Only use this for choosing modifier keys for shortcut hints.
* @return Whether the current platform is MacOS, or HTML5 running on MacOS.
*/
public static function isMacOS():Bool
{
|| js.Browser.window.navigator.platform.startsWith('iPad')
|| js.Browser.window.navigator.platform.startsWith('iPhone');
}

/**
* Detects and returns the current host platform.
* Always returns `HTML5` on web, regardless of the computer running that browser.
* @return The host platform, or `null` if the platform could not be detected.
*/
public static function detectHostPlatform():Null<HostPlatform>
{
switch (Sys.systemName())
{
case ~/window/i.match(_) => true:
case ~/linux/i.match(_) => true:
case ~/mac/i.match(_) => true:
default:
}
}
}

/**
* Represents a host platform.
*/
enum HostPlatform
{
WINDOWS;
LINUX;
MAC;
HTML5;
ANDROID;
IOS;
}
