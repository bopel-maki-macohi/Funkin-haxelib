package funkin.play.components;


/**
* Numerical counters used to display the clear percent.
*/
class ClearPercentCounter extends FlxTypedSpriteGroup<FlxSprite>
{


function set_curNumber(val:Int):Int
{
numberChanged = true;
}


public function new(x:Float, y:Float, startingNumber:Int = 0, small:Bool = false)
{
super(x, y);

flashShader = new PureColor(FlxColor.WHITE);
flashShader.colorSet = false;

curNumber = startingNumber;

this.small = small;

clearPercentText.x = small ? 40 : 0;
add(clearPercentText);

drawNumbers();
}

/**
* Make the counter flash turn white or stop being all white.
* @param enabled Whether the counter should be white.
*/
public function flash(enabled:Bool):Void
{
flashShader.colorSet = enabled;
}


override function update(elapsed:Float):Void
{
super.update(elapsed);

}

function drawNumbers():Void
{

{
seperatedScore.push(tempCombo % 10);
tempCombo = Math.floor(tempCombo / 10);
}


seperatedScore.reverse();

for (ind => num in seperatedScore)
{

xPos += small ? -24 : 0;
yPos += small ? 0 : 72;

{
numb.scale.set(this.scale.x, this.scale.y);
numb.shader = flashShader;
numb.visible = true;
add(numb);
}
else
{
members[digitIndex].animation.play(Std.string(num));
members[digitIndex].x = xPos + this.x;
members[digitIndex].y = yPos + this.y;
members[digitIndex].visible = true;
}
}
for (ind in (seperatedScore.length + 1)...(members.length))
{
members[ind].visible = false;
}
}
}

class ClearPercentNumber extends FlxSprite
{
public function new(x:Float, y:Float, digit:Int, variant:Bool, small:Bool)
{
super(x, y);

frames = Paths.getSparrowAtlas('resultScreen/clearPercent/clearPercentNumber${small ? 'Small' : variant ? 'Right' : 'Left'}');

for (i in 0...10)
{
animation.addByPrefix('$i', 'number $i 0', 24, false);
}

animation.play('$digit');
updateHitbox();
}
}
