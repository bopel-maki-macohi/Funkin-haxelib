


class ABotVis extends FlxTypedSpriteGroup<FlxSprite>
{




public function new(snd:FlxSound, pixel:Bool)
{





for (index in 1...visCount)
{



}
}

public function initAnalyzer():Void
{



}

public function dumpSound():Void
{
}


override function update(elapsed:Float)
{
}

static inline function min(x:Int, y:Int):Int
{
}

override function draw()
{
}

/**
* TJW funkin.vis based visualizer! updateFFT() is the old nasty shit that dont worky!
*/
function drawFFT():Void
{

for (i in 0...min(group.members.length, analyzerLevelsCache.length))
{




animFrame = Std.int(Math.abs(animFrame - 5)); // shitty dumbass flip, cuz dave got da shit backwards lol!

}
}

/**
* Explicitly define the default levels to draw when the analyzer is not available.
* @return Array<Bar>
*/
static function getDefaultLevels():Array<Bar>
{

for (i in 0...BAR_COUNT)
{
}

}
}
