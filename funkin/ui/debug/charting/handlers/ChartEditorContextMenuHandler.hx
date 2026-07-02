package funkin.ui.debug.charting.handlers;


/**
* Handles context menus (the little menus that appear when you right click on stuff) for the new Chart Editor.
*/
class ChartEditorContextMenuHandler
{

public static function openDefaultContextMenu(state:ChartEditorState, xPos:Float, yPos:Float)
{
{
existingDefaultContextMenu.left = xPos;
existingDefaultContextMenu.top = yPos;
Screen.instance.addComponent(existingDefaultContextMenu);
}
else
{
displayMenu(state, targetMenu);
existingDefaultContextMenu = targetMenu;
}
}

/**
* Opened when shift+right-clicking a selection of multiple items.
*/
public static function openSelectionContextMenu(state:ChartEditorState, xPos:Float, yPos:Float)
{
{
existingSelectionContextMenu.left = xPos;
existingSelectionContextMenu.top = yPos;
existingSelectionContextMenu.initialize();
Screen.instance.addComponent(existingSelectionContextMenu);
}
else
{
displayMenu(state, targetMenu);
existingSelectionContextMenu = targetMenu;
}
}

/**
* Opened when shift+right-clicking a single note.
*/
public static function openNoteContextMenu(state:ChartEditorState, xPos:Float, yPos:Float, data:SongNoteData)
{
{
existingNoteContextMenu.left = xPos;
existingNoteContextMenu.top = yPos;
existingNoteContextMenu.data = data;
existingNoteContextMenu.initialize();
Screen.instance.addComponent(existingNoteContextMenu);
}
else
{
displayMenu(state, targetMenu);
existingNoteContextMenu = targetMenu;
}
}

/**
* Opened when shift+right-clicking a single hold note.
*/
public static function openHoldNoteContextMenu(state:ChartEditorState, xPos:Float, yPos:Float, data:SongNoteData)
{
{
existingHoldNoteContextMenu.left = xPos;
existingHoldNoteContextMenu.top = yPos;
existingHoldNoteContextMenu.data = data;
existingHoldNoteContextMenu.initialize();
Screen.instance.addComponent(existingHoldNoteContextMenu);
}
else
{
displayMenu(state, targetMenu);
existingHoldNoteContextMenu = targetMenu;
}
}

/**
* Opened when shift+right-clicking a single event.
*/
public static function openEventContextMenu(state:ChartEditorState, xPos:Float, yPos:Float, data:SongEventData)
{
{
existingEventContextMenu.left = xPos;
existingEventContextMenu.top = yPos;
existingEventContextMenu.data = data;
existingEventContextMenu.initialize();
Screen.instance.addComponent(existingEventContextMenu);
}
else
{
displayMenu(state, targetMenu);
existingEventContextMenu = targetMenu;
}
}

static function displayMenu(state:ChartEditorState, targetMenu:Menu)
{
closeExistingMenu(state);

Screen.instance.addComponent(targetMenu);
existingMenu = targetMenu;
}

public static function closeExistingMenu(state:ChartEditorState)
{
{
Screen.instance.removeComponent(existingMenu);

existingDefaultContextMenu = null;
existingSelectionContextMenu = null;
existingNoteContextMenu = null;
existingHoldNoteContextMenu = null;
existingEventContextMenu = null;
existingMenu = null;
}
}
}
