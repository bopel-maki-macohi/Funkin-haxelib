

class ResultScore extends FlxTypedSpriteGroup<ScoreNum>
{


function set_scoreShit(val):Int
{


{




}

{
}

}

public function animateNumbers():Void
{
for (i in group.members.length - scoreStart...group.members.length)
{

new FlxTimer().start((i - 1) / 24, _ ->
{
}
}

public function new(x:Float, y:Float, digitCount:Int, scoreShit:Int = 100)
{

for (i in 0...digitCount)
{
}

}

public function updateScore(scoreNew:Int)
{
}
}

class ScoreNum extends FlxSprite
{

function set_finalDigit(val):Int
{

}

function set_digit(val):Int
{
{
{
}
else
{
}

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

public function playAnim():Void
{
}




function finishShuffleTween():Void
{
{

ease: FlxEase.quadOut,
onComplete: function(input)
{
new FlxTimer().start((finalDelay) / 24, _ ->
{
}
}

function shuffleProgress(shuffleTimer:FlxTimer):Void
{

{
}
}

public function shuffle():Void
{
}

public function new(x:Float, y:Float)
{



for (i in 0...10)
{
}




}
}
