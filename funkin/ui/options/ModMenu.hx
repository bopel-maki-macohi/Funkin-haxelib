

class ModMenu extends Page<OptionsState.OptionsMenuPageName>
{


public function new():Void
{


}

override function update(elapsed:Float)
{




{
}

{
}

}

function selections(change:Int = 0):Void
{


for (txt in 0...grpMods.length)
{
{
}
else
}

}

function refreshModList():Void
{
{
}



for (index in 0...detectedMods.length)
{
}
}

function organizeByY():Void
{
for (i in 0...grpMods.length)
{
}
}
}

class ModMenuItem extends FlxText
{

public function new(x:Float, y:Float, w:Float, str:String, size:Int)
{
}

override function update(elapsed:Float)
{
else

}
}
