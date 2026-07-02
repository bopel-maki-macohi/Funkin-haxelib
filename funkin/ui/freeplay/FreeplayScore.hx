

class FreeplayScore extends FlxTypedSpriteGroup<ScoreNum>
{

function set_scoreShit(val):Int
{



{

}

{
}

}

public function new(x:Float, y:Float, digitCount:Int, scoreShit:Int = 100, ?styleData:FreeplayStyle)
{

for (i in 0...digitCount)
{
{
}
else
{
}
}

}

public function updateScore(scoreNew:Int)
{
}
}

/**
* ScoreNum is the number graphic that is used for the completion percentage.
* It handles offsetting / positioning of the numbers so they look a bit nicer placed
* NOTE: this is actually a bit similar to the ResultScore class, should perhaps tidy the logic up?
*/
class ScoreNum extends FlxSprite
{

function set_digit(val):Int
{
{

switch (val)
{
case 1:
case 5:

case 7:
case 4:
case 9:
default:
}
}

}

public function new(x:Float, y:Float, ?initDigit:Int = 0, ?styleData:FreeplayStyle)
{

{
}
else
{
}

for (i in 0...10)
{
}



}


function getIntToString(number:Int):String
{
}
}
