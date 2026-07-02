package funkin.ui.story;


class LevelTitle extends FlxSpriteGroup
{

public final level:Level;



public function new(x:Int, y:Int, level:Level)
{
super(x, y);

this.level = level;


buildLevelTitle();
buildLevelLock();
}

override function get_width():Float
{

{
}
else
{
}
}



public override function update(elapsed:Float):Void
{
this.y = MathUtil.smoothLerpPrecision(y, targetY, elapsed, 0.451);

{
flashTick += elapsed;
{
flashTick %= 1 / flashFramerate;
title.color = (title.color == FlxColor.WHITE) ? 0xFF33ffff : FlxColor.WHITE;
}
}
}

public function showLock():Void
{
lock.visible = true;
this.x -= (lock.width + LOCK_PAD) / 2;
}

public function hideLock():Void
{
lock.visible = false;
this.x += (lock.width + LOCK_PAD) / 2;
}

function buildLevelTitle():Void
{
title = level.buildTitleGraphic();
add(title);
}

function buildLevelLock():Void
{
lock = new FlxSprite(0, 0).loadGraphic(Paths.image('storymenu/ui/lock'));
lock.x = title.x + title.width + LOCK_PAD;
lock.visible = false;
add(lock);
}
}
