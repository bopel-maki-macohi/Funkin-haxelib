package funkin.ui.mainmenu;


class UpgradeSparkle extends FlxSprite
{


public function new(_x:Float, _y:Float, _width:Float, _height:Float, big:Bool)
{
super(0, 0);
bounds = FlxRect.get(_x, _y, _width, _height);
{
loadGraphic(Paths.image('mainmenu/upgradeshine_big'));
}
else
{
loadGraphic(Paths.image('mainmenu/upgradeshine_small'));
}
sparkleTimer = new FlxTimer().start(FlxG.random.float(2, 7), sparkleEffect);
visible = false;
}

public function cancelSparkle():Void
{
FlxTween.cancelTweensOf(this);
alpha = 0;
}

public function restartSparkle():Void
{
FlxTween.cancelTweensOf(this);
alpha = 1;
sparkleTimer = new FlxTimer().start(FlxG.random.float(2, 7), sparkleEffect);
}

function sparkleEffect(timer:FlxTimer):Void
{
visible = true;
alpha = 1;

flipX = !flipX;

scale.set(targetScale, targetScale);
updateHitbox();

setPosition(FlxG.random.float(bounds.x, bounds.x + bounds.width), FlxG.random.float(bounds.y, bounds.y + bounds.height));
x -= width / 2;
y -= height / 2;

angle += 70;

angularVelocity = targetVelocity;
angularDrag = 200;

FlxTween.tween(this.scale, {x: targetScale * 0.001, y: targetScale * 0.001}, targetTime, {ease: FlxEase.backIn});
FlxTween.tween(this, {alpha: 0}, targetTime, {ease: FlxEase.quintIn});

sparkleTimer = new FlxTimer().start(FlxG.random.float(2, 7), sparkleEffect);
}
}
