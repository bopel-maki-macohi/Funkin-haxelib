package funkin.play;


class ResultScore extends FlxTypedSpriteGroup<ScoreNum>
{


function set_scoreShit(val):Int
{

dumbNumb = Std.int(Math.min(dumbNumb, Math.pow(10, group.members.length) - 1));

{
scoreStart += 1;
group.members[loopNum].finalDigit = dumbNumb % 10;




dumbNumb = Math.floor(dumbNumb / 10);
loopNum--;
}

{
group.members[loopNum].digit = 10;
loopNum--;
}

}

public function animateNumbers():Void
{
for (i in group.members.length - scoreStart...group.members.length)
{

new FlxTimer().start((i - 1) / 24, _ ->
{
group.members[i].finalDelay = scoreStart - (i - 1);
group.members[i].playAnim();
group.members[i].shuffle();
});
}
}

public function new(x:Float, y:Float, digitCount:Int, scoreShit:Int = 100)
{
super(x, y);

for (i in 0...digitCount)
{
add(new ScoreNum(x + (65 * i), y));
}

this.scoreShit = scoreShit;
}

public function updateScore(scoreNew:Int)
{
scoreShit = scoreNew;
}
}

class ScoreNum extends FlxSprite
{

function set_finalDigit(val):Int
{
animation.play('GONE', true, false, 0);

}

function set_digit(val):Int
{
{
{
animation.play(numToString[val], true, false, 0);
glow = false;
}
else
{
animation.play(numToString[val], true, false, 4);
}
updateHitbox();

switch (val)
{
case 1:
case 5:

case 7:
case 4:
case 9:
default:
centerOffsets(false);
}
}

}

public function playAnim():Void
{
animation.play(numToString[digit], true, false, 0);
}




function finishShuffleTween():Void
{
{
digit = digitRounded;
};

ease: FlxEase.quadOut,
onComplete: function(input)
{
new FlxTimer().start((finalDelay) / 24, _ ->
{
animation.play(animation.curAnim.name, true, false, 0);
});
}
}, tweenFunction);
}

function shuffleProgress(shuffleTimer:FlxTimer):Void
{
tempDigit += 1;
digit = tempDigit;

{
finishShuffleTween();
}
}

public function shuffle():Void
{
shuffleTimer = new FlxTimer().start(interval, shuffleProgress, Std.int(duration / interval));
}

public function new(x:Float, y:Float)
{
super(x, y);

baseY = y;
baseX = x;

frames = Paths.getSparrowAtlas('resultScreen/score-digital-numbers');

for (i in 0...10)
{
animation.addByPrefix(stringNum, '$stringNum DIGITAL', 24, false);
}

animation.addByPrefix('DISABLED', 'DISABLED', 24, false);
animation.addByPrefix('GONE', 'GONE', 24, false);

this.digit = 10;

animation.play(numToString[digit], true);

updateHitbox();
}
}
