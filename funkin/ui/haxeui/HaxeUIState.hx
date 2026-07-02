package funkin.ui.haxeui;


class HaxeUIState extends MusicBeatState
{


public function new(key:String)
{
super();
_componentKey = key;
}

override function create():Void
{
super.create();

}

public function buildComponent(assetPath:String):Component
{
try
{
}
catch (e)
{
Application.current.window.alert('Error building component "$assetPath": $e', 'HaxeUI Parsing Error');

}
}

/**
* The currently active context menu.
*/

/**
* This function is called when right clicking on a component, to display a context menu.
*/
function showContextMenu(assetPath:String, xPos:Float, yPos:Float):Component
{

contextMenu = buildComponent(assetPath);

{
contextMenu.left = xPos;
contextMenu.top = yPos;
Screen.instance.addComponent(contextMenu);
}

}

/**
* Register a context menu to display when right clicking.
* @param component Only display the menu when clicking this component. If null, display the menu when right clicking anywhere.
* @param assetPath The asset path to the context menu XML.
*/
public function registerContextMenu(target:Null<Component>, assetPath:String):Void
{
{
Screen.instance.registerEvent(MouseEvent.RIGHT_CLICK, function(e:MouseEvent)
{
showContextMenu(assetPath, e.screenX, e.screenY);
});
}
else
{
target.registerEvent(MouseEvent.RIGHT_CLICK, function(e:MouseEvent)
{
showContextMenu(assetPath, e.screenX, e.screenY);
});
}
}

/**
* Add an onClick listener to a HaxeUI menu bar item.
*/
function addUIClickListener(key:String, callback:MouseEvent->Void):Void
{
{
}
else
{
target.onClick = callback;
}
}

/**
* Add an onRightClick listener to a HaxeUI menu bar item.
*/
function addUIRightClickListener(key:String, callback:MouseEvent->Void):Void
{
{
}
else
{
target.onRightClick = callback;
}
}

function setComponentText(key:String, text:String):Void
{
{
}
else
{
target.text = text;
}
}

function setComponentShortcutText(key:String, text:String):Void
{
{
}
else
{
target.shortcutText = text;
}
}

function addTooltip(key:String, text:String):Void
{
{
}
else
{
target.tooltip = text;
}
}

/**
* Add an onChange listener to a HaxeUI input component such as a slider or text field.
*/
function addUIChangeListener(key:String, callback:UIEvent->Void):Void
{
{
}
else
{
target.onChange = callback;
}
}

/**
* Set the value of a HaxeUI component.
* Usually modifies the text of a label or value of a text field.
*/
function setUIValue<T>(key:String, value:T):T
{
{
}
else
{
}
}

/**
* Set the value of a HaxeUI checkbox,
* since that's on 'selected' instead of 'value'.
*/
public function setUICheckboxSelected<T>(key:String, value:Bool):Bool
{

{
}

{
}

}

public function findComponent<T:Component>(criteria:String = null, type:Class<T> = null, recursive:Null<Bool> = null, searchType:String = "id"):Null<T>
{

}

override function destroy():Void
{
component = null;

super.destroy();
}
}
