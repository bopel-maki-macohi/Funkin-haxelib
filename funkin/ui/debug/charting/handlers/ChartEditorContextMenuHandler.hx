

/**
* Handles context menus (the little menus that appear when you right click on stuff) for the new Chart Editor.
*/
class ChartEditorContextMenuHandler
{

public static function openDefaultContextMenu(state:ChartEditorState, xPos:Float, yPos:Float)
{
{
Screen.instance.addComponent(existingDefaultContextMenu);
}
else
{
}
}

/**
* Opened when shift+right-clicking a selection of multiple items.
*/
public static function openSelectionContextMenu(state:ChartEditorState, xPos:Float, yPos:Float)
{
{
Screen.instance.addComponent(existingSelectionContextMenu);
}
else
{
}
}

/**
* Opened when shift+right-clicking a single note.
*/
public static function openNoteContextMenu(state:ChartEditorState, xPos:Float, yPos:Float, data:SongNoteData)
{
{
Screen.instance.addComponent(existingNoteContextMenu);
}
else
{
}
}

/**
* Opened when shift+right-clicking a single hold note.
*/
public static function openHoldNoteContextMenu(state:ChartEditorState, xPos:Float, yPos:Float, data:SongNoteData)
{
{
Screen.instance.addComponent(existingHoldNoteContextMenu);
}
else
{
}
}

/**
* Opened when shift+right-clicking a single event.
*/
public static function openEventContextMenu(state:ChartEditorState, xPos:Float, yPos:Float, data:SongEventData)
{
{
Screen.instance.addComponent(existingEventContextMenu);
}
else
{
}
}

static function displayMenu(state:ChartEditorState, targetMenu:Menu)
{

Screen.instance.addComponent(targetMenu);
}

public static function closeExistingMenu(state:ChartEditorState)
{
{
Screen.instance.removeComponent(existingMenu);

}
}
}
