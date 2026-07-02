package funkin.ui;


class MenuItem extends FlxSpriteGroup
{

public function new(x:Float, y:Float, weekNum:Int = 0, weekType:WeekType)
{
super(x, y);

{
case WEEK:
"week";
case WEEKEND:
"weekend";
}

week = new FlxSprite().loadGraphic(Paths.image('storymenu/' + weekStr + weekNum));
add(week);
}


public function startFlashing():Void
{
isFlashing = true;
}

override function update(elapsed:Float)
{
super.update(elapsed);
y = MathUtil.smoothLerpPrecision(y, (targetY * 120) + 480, elapsed, 0.451);

{
flashTick += elapsed;
{
flashTick %= 1 / flashFramerate;
week.color = (week.color == FlxColor.WHITE) ? 0xFF33ffff : FlxColor.WHITE;
}
}
}
}

enum abstract WeekType(String) to String
{
}
