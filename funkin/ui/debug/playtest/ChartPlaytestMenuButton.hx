package funkin.ui.debug.playtest;


class ChartPlaytestMenuButtonBase extends FlxText
{

public function new(x:Float, y:Float, text:String)
{
super(x, y, 0, text, 30);

setFormat(Paths.font('vcr.ttf'), 50, FlxColor.WHITE, FlxTextAlign.CENTER);
}

override function update(elapsed:Float)
{
super.update(elapsed);

currentScale = MathUtil.smoothLerpPrecision(currentScale, targetScale, elapsed, 0.2);
scale.x = currentScale;
scale.y = currentScale;

{
targetScale = 0.9;

{
onButtonPressed();
}
}
else
{
targetScale = 1;
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
super(x, y, text);

this.onPressed = onPressed;
}

override function onButtonPressed():Void
{
}
}

class ChartPlaytestMenuButtonListToggle extends ChartPlaytestMenuButtonBase
{


public function new(x:Float, y:Float, title:String, list:Array<String>, onPressed:String->Void)
{
super(x, y, getCurrentText(title, list[curSelected]));

this.title = title;
this.list = list;
this.onPressed = onPressed;
}

override function onButtonPressed():Void
{
curSelected++;

{
curSelected = 0;
}
else if (curSelected < 0)
{
curSelected = list.length - 1;
}

text = getCurrentText(title, list[curSelected]);

}

function getCurrentText(title:String, selectedItem:String):String
{
}
}
