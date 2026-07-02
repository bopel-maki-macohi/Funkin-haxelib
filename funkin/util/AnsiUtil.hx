package funkin.util;

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
public static inline function error(str:String):String return AnsiUtil.bold(AnsiUtil.bg_note_right(str));

/**
* Makes the string display as WARNING text.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function warning(str:String):String return AnsiUtil.bold(AnsiUtil.bg_yellow(str));

/**
* Makes the string display as INFO text.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function info(str:String):String return AnsiUtil.bold(AnsiUtil.bg_blue(str));


/**
* Makes the string bold.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bold(str:String):String return apply(str, AnsiCode.BOLD);

/**
* Makes the string dim/faint.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function dim(str:String):String return apply(str, AnsiCode.DIM);

/**
* Underlines the string.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function underline(str:String):String return apply(str, AnsiCode.UNDERLINE);

/**
* Makes the string blink. (Not widely supported on modern terminals.)
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function blink(str:String):String return apply(str, AnsiCode.BLINK);

/**
* Inverts the foreground and background colors of the string.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function inverse(str:String):String return apply(str, AnsiCode.INVERSE);

/**
* Hides the string (renders it invisible in many terminals).
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function hidden(str:String):String return apply(str, AnsiCode.HIDDEN);

/**
* Applies a strikethrough effect to the string.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function strikethrough(str:String):String return apply(str, AnsiCode.STRIKETHROUGH);


/**
* Colors the string black.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function black(str:String):String return apply(str, AnsiCode.BLACK);

/**
* Colors the string red.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function red(str:String):String return apply(str, AnsiCode.RED);

/**
* Colors the string green.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function green(str:String):String return apply(str, AnsiCode.GREEN);

/**
* Colors the string yellow.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function yellow(str:String):String return apply(str, AnsiCode.YELLOW);

/**
* Colors the string blue.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function blue(str:String):String return apply(str, AnsiCode.BLUE);

/**
* Colors the string magenta.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function magenta(str:String):String return apply(str, AnsiCode.MAGENTA);

/**
* Colors the string cyan.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function cyan(str:String):String return apply(str, AnsiCode.CYAN);

/**
* Colors the string white.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function white(str:String):String return apply(str, AnsiCode.WHITE);


/**
* Sets the background color to black.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_black(str:String):String return apply(str, AnsiCode.BG_BLACK);

/**
* Sets the background color to red.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_red(str:String):String return apply(str, AnsiCode.BG_RED);

/**
* Sets the background color to green.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_green(str:String):String return apply(str, AnsiCode.BG_GREEN);

/**
* Sets the background color to yellow.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_yellow(str:String):String return apply(str, AnsiCode.BG_YELLOW);

/**
* Sets the background color to blue.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_blue(str:String):String return apply(str, AnsiCode.BG_BLUE);

/**
* Sets the background color to magenta.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_magenta(str:String):String return apply(str, AnsiCode.BG_MAGENTA);

/**
* Sets the background color to cyan.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_cyan(str:String):String return apply(str, AnsiCode.BG_CYAN);

/**
* Sets the background color to white.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_white(str:String):String return apply(str, AnsiCode.BG_WHITE);

/**
* Sets the background color to orange (256-color mode).
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_orange(str:String):String return apply(str, AnsiCode.BG_ORANGE);

/**
* Sets the background color to purple (256-color mode).
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_purple(str:String):String return apply(str, AnsiCode.BG_PURPLE);

/**
* Sets the background color to bright lilac (256-color mode).
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_lilac(str:String):String return apply(str, AnsiCode.BG_BRIGHT_LILAC);

/**
* Sets the background color to the color of a Left note.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_note_left(str:String):String return apply(str, AnsiCode.BG_NOTE_LEFT);

/**
* Sets the background color to the color of a Down note.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_note_down(str:String):String return apply(str, AnsiCode.BG_NOTE_DOWN);

/**
* Sets the background color to the color of a Up note.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_note_up(str:String):String return apply(str, AnsiCode.BG_NOTE_UP);

/**
* Sets the background color to the color of a Right note.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_note_right(str:String):String return apply(str, AnsiCode.BG_NOTE_RIGHT);


/**
* Colors the string bright black (gray).
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_black(str:String):String return apply(str, AnsiCode.BRIGHT_BLACK);

/**
* Colors the string bright red.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_red(str:String):String return apply(str, AnsiCode.BRIGHT_RED);

/**
* Colors the string bright green.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_green(str:String):String return apply(str, AnsiCode.BRIGHT_GREEN);

/**
* Colors the string bright yellow.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_yellow(str:String):String return apply(str, AnsiCode.BRIGHT_YELLOW);

/**
* Colors the string bright blue.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_blue(str:String):String return apply(str, AnsiCode.BRIGHT_BLUE);

/**
* Colors the string bright magenta.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_magenta(str:String):String return apply(str, AnsiCode.BRIGHT_MAGENTA);

/**
* Colors the string bright cyan.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_cyan(str:String):String return apply(str, AnsiCode.BRIGHT_CYAN);

/**
* Colors the string bright white.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bright_white(str:String):String return apply(str, AnsiCode.BRIGHT_WHITE);


/**
* Sets the background color to bright black (gray).
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_black(str:String):String return apply(str, AnsiCode.BG_BRIGHT_BLACK);

/**
* Sets the background color to bright red.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_red(str:String):String return apply(str, AnsiCode.BG_BRIGHT_RED);

/**
* Sets the background color to bright green.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_green(str:String):String return apply(str, AnsiCode.BG_BRIGHT_GREEN);

/**
* Sets the background color to bright yellow.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_yellow(str:String):String return apply(str, AnsiCode.BG_BRIGHT_YELLOW);

/**
* Sets the background color to bright blue.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_blue(str:String):String return apply(str, AnsiCode.BG_BRIGHT_BLUE);

/**
* Sets the background color to bright magenta.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_magenta(str:String):String return apply(str, AnsiCode.BG_BRIGHT_MAGENTA);

/**
* Sets the background color to bright cyan.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_cyan(str:String):String return apply(str, AnsiCode.BG_BRIGHT_CYAN);

/**
* Sets the background color to bright white.
* @param str The input string to format.
* @return The formatted string.
*/
public static inline function bg_bright_white(str:String):String return apply(str, AnsiCode.BG_BRIGHT_WHITE);

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
codesSupported = false;
}
else
{
{
codesSupported = REGEX_TERM_256.match(term) || REGEX_TERM_TYPES.match(term);
}

{
"GITHUB_ACTIONS", "GITEA_ACTIONS",    "TRAVIS", "CIRCLECI",
"APPVEYOR",     "GITLAB_CI", "BUILDKITE",    "DRONE"
];

for (ci in ciEnvNames)
{
{
codesSupported = true;
break;
}
}

{
codesSupported = true;
}
}


{
codesSupported = REGEX_TEAMCITY_VERSION.match(teamCity);
}

{
codesSupported = getEnvSafe('TERM_PROGRAM') == 'iTerm.app'
|| getEnvSafe('TERM_PROGRAM') == 'Apple_Terminal'
|| getEnvSafe('COLORTERM') != null
|| getEnvSafe('ANSICON') != null
|| getEnvSafe('ConEmuANSI') != null
|| getEnvSafe('WT_SESSION') != null;
}
}
}
codesSupported = false;
}

}

static function stripCodes(output:String):String
{
}
}
