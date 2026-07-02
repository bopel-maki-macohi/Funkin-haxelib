package funkin.ui.freeplay;


class FreeplayScore extends FlxTypedSpriteGroup<ScoreNum>
{

function set_scoreShit(val):Int
{

dumbNumb = Std.int(Math.min(dumbNumb, Math.pow(10, group.members.length) - 1));


{
group.members[loopNum].digit = dumbNumb % 10;

dumbNumb = Math.floor(dumbNumb / 10);
loopNum--;
}

{
group.members[loopNum].digit = 0;
loopNum--;
}

}

public function new(x:Float, y:Float, digitCount:Int, scoreShit:Int = 100, ?styleData:FreeplayStyle)
{
super(0, y);

for (i in 0...digitCount)
{
{
add(new ScoreNum(x + (45 * i), y, 0));
}
else
{
add(new ScoreNum(x + (45 * i), y, 0, styleData));
}
}

this.scoreShit = scoreShit;
}

public function updateScore(scoreNew:Int)
{
scoreShit = scoreNew;
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
animation.play(numToString[val], true, false, 0);
updateHitbox();

switch (val)
{
case 1:
offset.x -= 15;
case 5:

case 7:
case 4:
case 9:
default:
centerOffsets(false);
}
}

}

public function new(x:Float, y:Float, ?initDigit:Int = 0, ?styleData:FreeplayStyle)
{
super(x, y);

{
frames = Paths.getSparrowAtlas('digital_numbers');
}
else
{
frames = Paths.getSparrowAtlas(styleData.getNumbersAssetKey());
}

for (i in 0...10)
{
animation.addByPrefix(getIntToString(i), '${getIntToString(i)} DIGITAL', 24, false);
}

this.digit = initDigit ?? 0;

animation.play(getIntToString(digit), true);

setGraphicSize(Std.int(width * 0.4));
updateHitbox();
}


function getIntToString(number:Int):String
{
}
}
