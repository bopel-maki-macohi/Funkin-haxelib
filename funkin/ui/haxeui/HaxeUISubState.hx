

class HaxeUISubState extends MusicBeatSubState
{


public function new(key:String)
{
}

override function create()
{

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


{
}
}

function refreshComponent()
{
/*
{
}

{
}
else
{
}
*/

{
}
else
{
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
}
}
