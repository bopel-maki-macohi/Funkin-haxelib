

class MenuItem extends FlxSpriteGroup
{

public function new(x:Float, y:Float, weekNum:Int = 0, weekType:WeekType)
{

{
case WEEK:
case WEEKEND:
}

}


public function startFlashing():Void
{
}

override function update(elapsed:Float)
{

{
{
}
}
}
}

enum abstract WeekType(String) to String
{
}
