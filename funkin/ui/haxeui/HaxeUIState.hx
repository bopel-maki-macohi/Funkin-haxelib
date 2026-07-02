

class HaxeUIState extends MusicBeatState
{


public function new(key:String)
{
}

override function create():Void
{

}

public function buildComponent(assetPath:String):Component
{
try
{
}
catch (e)
{

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


{
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
}
else
{
target.registerEvent(MouseEvent.RIGHT_CLICK, function(e:MouseEvent)
{
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
}
}

function setComponentText(key:String, text:String):Void
{
{
}
else
{
}
}

function setComponentShortcutText(key:String, text:String):Void
{
{
}
else
{
}
}

function addTooltip(key:String, text:String):Void
{
{
}
else
{
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

}
}
