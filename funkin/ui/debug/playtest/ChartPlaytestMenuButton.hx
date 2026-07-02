

class ChartPlaytestMenuButtonBase extends FlxText
{

public function new(x:Float, y:Float, text:String)
{

}

override function update(elapsed:Float)
{


{

{
}
}
else
{
}
}

function onButtonPressed():Void
{
}
}

class ChartPlaytestMenuButton extends ChartPlaytestMenuButtonBase
{

public function new(x:Float, y:Float, text:String, onPressed:Void->Void)
{

}

override function onButtonPressed():Void
{
}
}

class ChartPlaytestMenuButtonListToggle extends ChartPlaytestMenuButtonBase
{


public function new(x:Float, y:Float, title:String, list:Array<String>, onPressed:String->Void)
{

}

override function onButtonPressed():Void
{

{
}
else if (curSelected < 0)
{
}


}

function getCurrentText(title:String, selectedItem:String):String
{
}
}
