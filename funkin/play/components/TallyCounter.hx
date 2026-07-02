package funkin.play.components;


/**
* Numerical counters used next to each judgement in the Results screen.
*/
class TallyCounter extends FlxTypedSpriteGroup<FlxSprite>
{



public function new(x:Float, y:Float, neededNumber:Int = 0, ?flavour:Int, align:FlxTextAlign = FlxTextAlign.LEFT)
{
super(x, y);

this.align = align;

this.flavour = flavour ?? 0xFFFFFFFF;

this.neededNumber = neededNumber;

}


override function update(elapsed:Float)
{
super.update(elapsed);

}

function drawNumbers()
{


{
seperatedScore.push(tempCombo % 10);
tempCombo = Math.floor(tempCombo / 10);
}


seperatedScore.reverse();

for (ind => num in seperatedScore)
{
{
{
xPos -= (fullNumberDigits * (43 * this.scale.x));
}
numb.scale.set(this.scale.x, this.scale.y);
add(numb);
numb.color = flavour;
}
else
{
members[ind].animation.play(Std.string(num));
members[ind].color = flavour;
}
}
}
}

class TallyNumber extends FlxSprite
{
public function new(x:Float, y:Float, digit:Int)
{
super(x, y);

frames = Paths.getSparrowAtlas("resultScreen/tallieNumber");

for (i in 0...10)
animation.addByPrefix(Std.string(i), i + " small", 24, false);

animation.play(Std.string(digit));
updateHitbox();
}
}
