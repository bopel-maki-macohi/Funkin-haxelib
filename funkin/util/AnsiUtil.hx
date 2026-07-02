
/**
* Enum abstract representing ANSI codes for text colors, background colors, and text styles.
* TODO: Add more colors?
*/
enum abstract AnsiCode(String) from String to String
{








}

/**
* This class provides functionality for applying ANSI codes to strings for terminal output.
*/
class AnsiUtil
{





/**
* Safe wrapper for Sys.getEnv (returns null on non-sys targets).
*/
static function getEnvSafe(name:String):Null<String>
{
}


/**
* Makes the string display as ERROR text.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Makes the string display as WARNING text.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Makes the string display as INFO text.
* @param str The input string to format.
* @return The formatted string.
*/


/**
* Makes the string bold.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Makes the string dim/faint.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Underlines the string.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Makes the string blink. (Not widely supported on modern terminals.)
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Inverts the foreground and background colors of the string.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Hides the string (renders it invisible in many terminals).
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Applies a strikethrough effect to the string.
* @param str The input string to format.
* @return The formatted string.
*/


/**
* Colors the string black.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string red.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string green.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string yellow.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string blue.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string magenta.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string cyan.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string white.
* @param str The input string to format.
* @return The formatted string.
*/


/**
* Sets the background color to black.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to red.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to green.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to yellow.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to blue.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to magenta.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to cyan.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to white.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to orange (256-color mode).
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to purple (256-color mode).
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright lilac (256-color mode).
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to the color of a Left note.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to the color of a Down note.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to the color of a Up note.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to the color of a Right note.
* @param str The input string to format.
* @return The formatted string.
*/


/**
* Colors the string bright black (gray).
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright red.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright green.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright yellow.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright blue.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright magenta.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright cyan.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Colors the string bright white.
* @param str The input string to format.
* @return The formatted string.
*/


/**
* Sets the background color to bright black (gray).
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright red.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright green.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright yellow.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright blue.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright magenta.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright cyan.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Sets the background color to bright white.
* @param str The input string to format.
* @return The formatted string.
*/

/**
* Applies the specified ANSI codes to the input string.
*
* You can pass one or multiple ANSI codes for combining styles.
*
* @param str The input string.
* @param code The ANSI codes to apply.
*
* @return The styled string.
*/
public static function apply(str:String, code:AnsiCode):String
{
}

/**
* Whether ANSI codes are supported or not.
*
* @return `true` if ANSI codes are supported, `false` otherwise.
*/
public static function isColorCodesSupported():Bool
{
{
{

{
}
else
{
{
}

{
"GITHUB_ACTIONS", "GITEA_ACTIONS",    "TRAVIS", "CIRCLECI",
"APPVEYOR",     "GITLAB_CI", "BUILDKITE",    "DRONE"

for (ci in ciEnvNames)
{
{
}
}

{
}
}


{
}

{
codesSupported = getEnvSafe('TERM_PROGRAM') == 'iTerm.app'
|| getEnvSafe('TERM_PROGRAM') == 'Apple_Terminal'
|| getEnvSafe('COLORTERM') != null
|| getEnvSafe('ANSICON') != null
|| getEnvSafe('ConEmuANSI') != null
}
}
}
}

}

static function stripCodes(output:String):String
{
}
}
