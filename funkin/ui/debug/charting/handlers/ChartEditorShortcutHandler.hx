

/**
* Handles modifying the shortcut text of menu items based on the current platform.
* On MacOS, `Ctrl`, `Alt`, and `Shift` are replaced with `⌘` (or `^`), `⌥`, and `⇧`, respectively.
*/
class ChartEditorShortcutHandler
{
public static function applyPlatformShortcutText(state:ChartEditorState):Void
{





}

/**
* Display `Ctrl` on Windows and `⌘` (Command) on macOS.
* @param input
*/
static inline function ctrlOrCmd(input:String)
{
}

/**
* Display `Ctrl` on Windows and `^` (Control) on macOS.
* @param input
*/
static inline function ctrl(input:String)
{
}

static inline function alt(input:String)
{
}

static inline function shift(input:String)
{
}
}
