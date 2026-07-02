

/**
* An FlxTypeText that better accounts for text-wrapping,
* by overriding the functions of insertBreakLines() to check the finished state.
* Also fixes a bug where empty strings would make the typing never 'finish'.
*/
class FunkinTypeText extends FlxTypeText
{

public function new(X:Float, Y:Float, Width:Int, Text:String, Size:Int = 8, EmbeddedFont:Bool = true, CheckWrapping:Bool = true)
{
}

override public function start(?Delay:Float, ForceRestart:Bool = false, AutoErase:Bool = false, ?SkipKeys:Array<FlxKey>, ?Callback:Void->Void):Void
{
{
}


{
}


{
}

{
}

{
}

{
}

{
}
}

override function insertBreakLines()
{



for (i in 0...textField.numLines)
{
{
}
else if (prefixLength != null)
{
}
else
{
}
}

}
}
