package funkin.ui.freeplay;


class FreeplayFlames extends FlxSpriteGroup
{



public function new(x:Float, y:Float)
{
super(x, y);

for (i in 0...5)
{
flame.frames = Paths.getSparrowAtlas("freeplay/freeplayFlame");
flame.animation.addByPrefix("flame", "fire loop full instance 1", FlxG.random.int(23, 25), false);
flame.animation.play("flame");
flame.visible = false;
flameCount = 0;

flame.animation.onFinish.add(function(_)
{
flame.animation.play("flame", true, false, 2);
});
add(flame);
}
}


override public function update(elapsed:Float):Void
{
super.update(elapsed);
{
setFlamePositions();
properPositions = true;
}
}


function set_flameCount(value:Int):Int
{
for (timer in timers)
{
timer.active = false;
timer.destroy();
timers.remove(timer);
}

this.properPositions = false;
this.flameCount = value;
for (i in 0...5)
{
{
{
{
{
}
timers.remove(currentTimer);
flame.animation.play("flame", true);
flame.visible = true;
});
timers.push(nextTimer);

visibleCount++;
}
}
else
{
flame.visible = false;
}
}
}

function setFlamePositions()
{
for (i in 0...5)
{
flame.x = flameX + (flameSpreadX * i);
flame.y = flameY + (flameSpreadY * i);
}
}

function set_flameX(value:Float):Float
{
this.flameX = value;
setFlamePositions();
}

function set_flameY(value:Float):Float
{
this.flameY = value;
setFlamePositions();
}

function set_flameSpreadX(value:Float):Float
{
this.flameSpreadX = value;
setFlamePositions();
}

function set_flameSpreadY(value:Float):Float
{
this.flameSpreadY = value;
setFlamePositions();
}
}
