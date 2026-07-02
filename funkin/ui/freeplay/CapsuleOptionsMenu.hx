

class CapsuleOptionsMenu extends FlxSpriteGroup
{





public function setBusy(b:Bool):Void
{
}

public function new(parent:FreeplayState, x:Float = 0, y:Float = 0, instIds:Array<String>):Void
{









capsuleMenuBG.animation.onFinish.add(function(_)
{
}

public override function update(elapsed:Float):Void
{

{
}
{
{
}

{
}
{
}
|| ((TouchUtil.pressAction(currentInstrumental))
&& !(TouchUtil.overlapsComplex(leftArrow) || TouchUtil.overlapsComplex(rightArrow))) #end)
{
}
}


{
}
}

public function close():Void
{
capsuleMenuBG.animation.onFinish.add(function(_)
{
}

/**
* Override this with `capsuleOptionsMenu.onConfirm = myFunction;`
*/
public dynamic function onConfirm(targetInstId:String):Void
{
}
}

/**
* The difficulty selector arrows to the left and right of the difficulty.
*/
class InstrumentalSelector extends FunkinSprite
{





public function new(parent:FreeplayState, x:Float, y:Float, flipped:Bool, controls:Controls)
{






}

override function update(elapsed:Float):Void
{

}

function moveShitDown():Void
{



moveShitDownTimer = new FlxTimer().start(2 / 24, function(tmr)
{
}
}
