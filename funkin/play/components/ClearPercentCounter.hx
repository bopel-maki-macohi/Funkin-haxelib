

/**
* Numerical counters used to display the clear percent.
*/
class ClearPercentCounter extends FlxTypedSpriteGroup<FlxSprite>
{


function set_curNumber(val:Int):Int
{
}


public function new(x:Float, y:Float, startingNumber:Int = 0, small:Bool = false)
{





}

/**
* Make the counter flash turn white or stop being all white.
* @param enabled Whether the counter should be white.
*/
public function flash(enabled:Bool):Void
{
}


override function update(elapsed:Float):Void
{

}

function drawNumbers():Void
{

{
}



for (ind => num in seperatedScore)
{


{
}
else
{
}
}
for (ind in (seperatedScore.length + 1)...(members.length))
{
}
}
}

class ClearPercentNumber extends FlxSprite
{
public function new(x:Float, y:Float, digit:Int, variant:Bool, small:Bool)
{


for (i in 0...10)
{
}

}
}
