package funkin.ui.debug.charting.handlers;


/**
* Handles modifying the shortcut text of menu items based on the current platform.
* On MacOS, `Ctrl`, `Alt`, and `Shift` are replaced with `⌘` (or `^`), `⌥`, and `⇧`, respectively.
*/
class ChartEditorShortcutHandler
{
public static function applyPlatformShortcutText(state:ChartEditorState):Void
{
state.menubarItemNewChart.shortcutText = ctrlOrCmd('N');
state.menubarItemOpenChart.shortcutText = ctrlOrCmd('O');
state.menubarItemSaveChartAs.shortcutText = ctrlOrCmd(shift('S'));
state.menubarItemExit.shortcutText = ctrlOrCmd('Q');

state.menubarItemUndo.shortcutText = ctrlOrCmd('Z');
state.menubarItemRedo.shortcutText = ctrlOrCmd('Y');
state.menubarItemCut.shortcutText = ctrlOrCmd('X');
state.menubarItemCopy.shortcutText = ctrlOrCmd('C');
state.menubarItemPaste.shortcutText = ctrlOrCmd('V');

state.menubarItemMirrorX.shortcutText = ctrlOrCmd(shift('M'));
state.menubarItemMirrorY.shortcutText = ctrlOrCmd(alt('M'));
state.menubarItemMirrorXY.shortcutText = ctrlOrCmd(shift(alt('M')));

state.menubarItemSelectAllNotes.shortcutText = ctrlOrCmd('A');
state.menubarItemSelectAllEvents.shortcutText = ctrlOrCmd(alt('A'));
state.menubarItemSelectInverse.shortcutText = ctrlOrCmd('I');
state.menubarItemSelectNone.shortcutText = ctrlOrCmd('D');
state.menubarItemSelectBeforePlayhead.shortcutText = shift('Home');
state.menubarItemSelectAfterPlayhead.shortcutText = shift('End');

state.menubarItemDifficultyDown.shortcutText = ctrlOrCmd('←');
state.menubarItemDifficultyUp.shortcutText = ctrlOrCmd('→');

state.menubarItemPlaytestFull.shortcutText = 'Enter';
state.menubarItemPlaytestMinimal.shortcutText = shift('Enter');
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
