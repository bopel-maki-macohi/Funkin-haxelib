package funkin.ui.freeplay;


class CapsuleOptionsMenu extends FlxSpriteGroup
{





public function setBusy(b:Bool):Void
{
busy = b;
leftArrow.busy = b;
rightArrow.busy = b;
}

public function new(parent:FreeplayState, x:Float = 0, y:Float = 0, instIds:Array<String>):Void
{
super(x, y);

this.parent = parent;
this.instrumentalIds = instIds;

capsuleMenuBG = FunkinSprite.createSparrow(0, 0, 'freeplay/instBox/instBox');

capsuleMenuBG.animation.addByPrefix('open', 'open0', 24, false);
capsuleMenuBG.animation.addByPrefix('idle', 'idle0', 24, true);
capsuleMenuBG.animation.addByPrefix('open', 'open0', 24, false);

currentInstrumental = new FlxText(0, 36, capsuleMenuBG.width, '');
currentInstrumental.setFormat('VCR OSD Mono', 40, FlxTextAlign.CENTER, true);


leftArrow = new InstrumentalSelector(parent, PAD, 30, false, parent.controls);
rightArrow = new InstrumentalSelector(parent, capsuleMenuBG.width - leftArrow.width - PAD, 30, true, parent.controls);

label.setFormat('VCR OSD Mono', 24, FlxTextAlign.CENTER, true);

add(capsuleMenuBG);
add(leftArrow);
add(rightArrow);
add(label);
add(currentInstrumental);

capsuleMenuBG.animation.onFinish.add(function(_)
{
capsuleMenuBG.animation.play('idle', true);
});
capsuleMenuBG.animation.play('open', true);
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
destroy();
}
{
{
setBusy(true);
close();
}

{
currentInstrumentalIndex = (currentInstrumentalIndex + 1) % instrumentalIds.length;
changedInst = true;
}
{
currentInstrumentalIndex = (currentInstrumentalIndex - 1 + instrumentalIds.length) % instrumentalIds.length;
changedInst = true;
}
|| ((TouchUtil.pressAction(currentInstrumental))
&& !(TouchUtil.overlapsComplex(leftArrow) || TouchUtil.overlapsComplex(rightArrow))) #end)
{
setBusy(true);
onConfirm(instrumentalIds[currentInstrumentalIndex] ?? '');
}
}


{
currentInstrumental.text = instrumentalIds[currentInstrumentalIndex].toTitleCase() ?? '';
}
}

public function close():Void
{
capsuleMenuBG.animation.play('open', true, true);
capsuleMenuBG.animation.onFinish.add(function(_)
{
parent.cleanupInstSelectMenu();
queueDestroy = true;
});
}

/**
* Override this with `capsuleOptionsMenu.onConfirm = myFunction;`
*/
public dynamic function onConfirm(targetInstId:String):Void
{
throw 'onConfirm not implemented!';
}
}

/**
* The difficulty selector arrows to the left and right of the difficulty.
*/
class InstrumentalSelector extends FunkinSprite
{





public function new(parent:FreeplayState, x:Float, y:Float, flipped:Bool, controls:Controls)
{
super(x, y);

this.parent = parent;
this.controls = controls;

whiteShader = new PureColor(FlxColor.WHITE);

frames = Paths.getSparrowAtlas('freeplay/freeplaySelector');
animation.addByPrefix('shine', 'arrow pointer loop', 24);
animation.play('shine');

shader = whiteShader;

flipX = flipped;

scale.x = scale.y = 1 * baseScale;
updateHitbox();
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

}

function moveShitDown():Void
{
offset.y -= 5;

whiteShader.colorSet = true;

scale.x = scale.y = 0.5 * baseScale;

moveShitDownTimer = new FlxTimer().start(2 / 24, function(tmr)
{
scale.x = scale.y = 1 * baseScale;
whiteShader.colorSet = false;
updateHitbox();
});
}
}
