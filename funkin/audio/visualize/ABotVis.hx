package funkin.audio.visualize;


using Lambda;

class ABotVis extends FlxTypedSpriteGroup<FlxSprite>
{




public function new(snd:FlxSound, pixel:Bool)
{
super();

this.snd = snd;




for (index in 1...visCount)
{
volumes.push(0.0);


viz.frames = visFrms;
viz.antialiasing = pixel ? false : true;
viz.scale.set(visScale, visScale);
add(viz);

viz.animation.addByPrefix('VIZ', '$visStr${index}0', 0);
viz.animation.play('VIZ', false, false, 1);
}
}

public function initAnalyzer():Void
{

analyzer = new SpectralAnalyzer(snd._channel.__audioSource, BAR_COUNT, 0.1, 40);
analyzer.minDb = -65;
analyzer.maxDb = -25;
analyzer.maxFreq = 22000;
analyzer.minFreq = 10;

analyzer.fftN = 256;

}

public function dumpSound():Void
{
snd = null;
analyzer = null;
}


override function update(elapsed:Float)
{
super.update(elapsed);
}

static inline function min(x:Int, y:Int):Int
{
}

override function draw()
{
super.draw();
drawFFT();
}

/**
* TJW funkin.vis based visualizer! updateFFT() is the old nasty shit that dont worky!
*/
function drawFFT():Void
{
analyzerLevelsCache = (analyzer != null) ? analyzer.getLevels(analyzerLevelsCache) : getDefaultLevels();

for (i in 0...min(group.members.length, analyzerLevelsCache.length))
{

group.members[i].visible = animFrame > 0;

animFrame -= 1;

animFrame = Math.floor(Math.min(5, animFrame));
animFrame = Math.floor(Math.max(0, animFrame));

animFrame = Std.int(Math.abs(animFrame - 5)); // shitty dumbass flip, cuz dave got da shit backwards lol!

group.members[i].animation.curAnim.curFrame = animFrame;
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
result.push({value: 0, peak: 0.0});
}

}
}
