package funkin.mobile.ui.mainmenu;


class FunkinOptionsButton extends FunkinButton
{



function get_confirming():Bool
{
}


/**
* Creates a new FunkinOptionsButton instance.
*
* @param x The x position of the object.
* @param y The y position of the object.
* @param confirmCallback An optional callback function that will be triggered when the object is clicked.
* @param instant An optional flag that makes the button not play the full animation before calling the callback.
*/
public function new(?x:Float = 0, ?y:Float = 0, ?confirmCallback:Void->Void, instant:Bool = false):Void
{
super(x, y);

frames = Paths.getSparrowAtlas("mainmenu/optionsButton");
animation.addByIndices('idle', 'options', [0], "", 24, false);
animation.addByIndices('hold', 'options', [3], "", 24, false);
animation.addByIndices('confirm', 'options', [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], "", 24, false);
animation.play("idle");

scale.set(0.7, 0.7);
updateHitbox();

this.instant = instant;
this.ignoreDownHandler = true;

onUp.add(playConfirmAnim);
onDown.add(playHoldAnim);
onOut.add(playOutAnim);

onConfirmEnd.add(confirmCallback);
}

function playHoldAnim():Void
{

held = true;

FlxTween.cancelTweensOf(this);
HapticUtil.vibrate(0, 0.01, 0.2);
animation.play('hold');
}

function playConfirmAnim():Void
{
{
onConfirmEnd.dispatch();
}
else if (confirming)
{
}

_confirming = true;

FlxTween.cancelTweensOf(this);
HapticUtil.vibrate(0, 0.05, 0.5);
animation.play('confirm');

FunkinSound.playOnce(Paths.sound('confirmMenu'));

new FlxTimer().start(0.05, function(_)
{
HapticUtil.vibrate(0, 0.01, 0.2);
}, 4);

onConfirmStart.dispatch();

animation.onFinish.addOnce(function(name:String)
{
_confirming = false;
held = false;
onConfirmEnd.dispatch();
});
}

function playOutAnim():Void
{

FlxTween.cancelTweensOf(this);
HapticUtil.vibrate(0, 0.01, 0.2);
animation.play('idle');
held = false;
}

public function resetCallbacks():Void
{
onUp.removeAll();
onDown.removeAll();
onOut.removeAll();

_confirming = false;
held = false;

onUp.add(playConfirmAnim);
onDown.add(playHoldAnim);
onOut.add(playOutAnim);
}

override function destroy():Void
{
super.destroy();

onConfirmStart.removeAll();
onConfirmEnd.removeAll();

}
}
