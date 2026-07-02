package funkin.ui.haxeui;


class HaxeUISubState extends MusicBeatSubState
{


public function new(key:String)
{
super();
_componentKey = key;
}

override function create()
{
super.create();

refreshComponent();
}

/**
* Builds a component from a given XML file.
* Call this in your code to load additional components at runtime.
*/
public function buildComponent(assetPath:String)
{
}

override function update(elapsed:Float)
{
super.update(elapsed);


{
refreshComponent();
}
}

function refreshComponent()
{
/*
{
remove(component);
component = null;
}

{
add(component);
}
else
{
}
*/

{
component = buildComponent(_componentKey);
add(component);
}
else
{
component2.x += 100;
add(component2);
remove(component);
}
}

/**
* Add an onClick listener to a HaxeUI menu bar item.
*/
function addUIClickListener(key:String, callback:MouseEvent->Void)
{
{
}
else
{
target.onClick = callback;
}
}

/**
* Add an onChange listener to a HaxeUI input component such as a slider or text field.
*/
function addUIChangeListener(key:String, callback:UIEvent->Void)
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

override function destroy()
{
component = null;
}
}
