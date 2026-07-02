package funkin.ui.freeplay;


class DifficultyStars extends FlxSpriteGroup
{
/**
* Internal handler var for difficulty... ranges from 0... to 15
* 0 is 1 star... 15 is 0 stars!
*/

/**
* Range between 0 and 15
*/




public function new(x:Float, y:Float)
{
super(x, y);

hsvShader = new HSVShader();

flames = new FreeplayFlames(0, 0);

stars = FunkinSprite.createTextureAtlas(0, 0, "freeplay/freeplayStars");
stars.anim.play("diff stars");

add(flames);
add(stars);

stars.shader = hsvShader;

for (memb in flames.members)
memb.shader = hsvShader;
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

{
stars.anim.play("diff stars", true, false, curDifficulty * 100);
}
}

function set_difficulty(value:Int):Int
{
difficulty = value;

{
difficulty = 0;
curDifficulty = 15;
}
else if (difficulty <= 15)
{
difficulty = value;
curDifficulty = difficulty - 1;
}
else
{
difficulty = 15;
curDifficulty = difficulty - 1;
}

flameCheck();

}

public function flameCheck():Void
{
else
flames.flameCount = 0;
}

function set_curDifficulty(value:Int):Int
{
curDifficulty = value;

{
stars.anim.play("diff stars", true, false, 1500);
stars.anim.pause();
}
else
{
stars.anim.curAnim.curFrame = Std.int(curDifficulty * 100);
stars.anim.play("diff stars", true, false, curDifficulty * 100);
}

}
}
