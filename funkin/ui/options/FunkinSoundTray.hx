package funkin.ui.options;


/**
*  Extends the default flixel soundtray, but with some art
*  and lil polish!
*
*  Gets added to the game in Main.hx, right after FlxGame is new'd
*  since it's a Sprite rather than Flixel related object
*/
class FunkinSoundTray extends FlxSoundTray
{


public function new()
{
super();
removeChildren();

bg.scaleX = graphicScale;
bg.scaleY = graphicScale;
bg.smoothing = true;
addChild(bg);

y = -height;
visible = false;

backingBar.x = 9;
backingBar.y = 5;
backingBar.scaleX = graphicScale;
backingBar.scaleY = graphicScale;
backingBar.smoothing = true;
addChild(backingBar);
backingBar.alpha = 0.4;

_bars = [];

for (i in 1...11)
{
bar.x = 9;
bar.y = 5;
bar.scaleX = graphicScale;
bar.scaleY = graphicScale;
bar.smoothing = true;
addChild(bar);
_bars.push(bar);
}

screenCenter();
y = -height - 10;

volumeUpSound = Paths.sound("soundtray/Volup");
volumeDownSound = Paths.sound("soundtray/Voldown");
volumeMaxSound = Paths.sound("soundtray/VolMAX");
}

override public function update(ms:Float):Void
{


{
{
_timer -= elapsed;
{
lerpYPos = -height - 10;
alphaTarget = 0;
}
}
else if (y <= -height)
{
visible = false;
active = false;
}
}
else if (!visible)
{
showTray();
}

y = MathUtil.smoothLerpPrecision(y, lerpYPos, elapsed, 0.768);
alpha = MathUtil.smoothLerpPrecision(alpha, alphaTarget, elapsed, 0.307);
screenCenter();
}

override function showIncrement():Void
{
moveTrayMakeVisible(true);
saveVolumePreferences();
}

override function showDecrement():Void
{
moveTrayMakeVisible(false);
saveVolumePreferences();
}

function moveTrayMakeVisible(up:Bool = false):Void
{
showTray();

{
}
}

function showTray():Void
{
_timer = 1;
lerpYPos = 10;
visible = true;
active = true;
alphaTarget = 1;

updateBars();
}

function updateBars():Void
{

for (i in 0..._bars.length) _bars[i].visible = i < globalVolume;
}

function saveVolumePreferences():Void
{
{
}
}
}
