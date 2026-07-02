package funkin.ui.transition.stickers;


using Lambda;
using StringTools;

typedef StickerSubStateParams =
{
/*
* The state to transition into.
*/
?targetState:StickerSubState->FlxState,

/**
* The sticker pack to retrieve and use.
* @default `Constants.DEFAULT_STICKER_PACK`
*/
?stickerPack:String,

/**
* An existing set of stickers to transition out with.
*/
?oldStickers:Array<StickerSprite>,
}

class StickerSubState extends MusicBeatSubState
{

/**
*  An OpenFL sprite that serves as a container for rendering stickers on top of the game.
*/

/**
* The state to switch to after the stickers are done.
* This is a FUNCTION so we can pass it directly to `FlxG.switchState()`,
* and we can add constructor parameters in the caller.
*/


public function new(params:StickerSubStateParams):Void
{
super();
transitionSprite ??= new StickerTransitionSprite();
this.targetState = params?.targetState ?? (sticker) -> FreeplayState.build(null, sticker);
this.stickerPackId = params.stickerPack ?? Constants.DEFAULT_STICKER_PACK;
this.stickerPack = targetStickerPack ?? StickerRegistry.instance.fetchDefault();
{
};
soundSelections = assetsInList.filter(soundFilterFunc);
soundSelections = soundSelections.map(function(a:String)
{
});
grpStickers = new FlxTypedGroup<StickerSprite>();
for (i in soundSelections)
{
{
soundSelections.remove(i);
}
soundSelections.push(i);
}
soundSelection = FlxG.random.getObject(soundSelections);
{
};
sounds = assetsInList3.filter(filterFunc);
for (i in 0...sounds.length)
{
sounds[i] = sounds[i].replace('assets/shared/sounds/', '');
sounds[i] = sounds[i].substring(0, sounds[i].lastIndexOf('.'));
}
{
for (sticker in params.oldStickers)
grpStickers.add(sticker);
degenStickers();
}
else
{
regenStickers();
}
}

public function degenStickers():Void
{
{
switchingState = false;
close();
}
transitionSprite?.insert();
transitionSprite?.setupStickers(grpStickers);
for (ind => sticker in grpStickers.members)
{
new FlxTimer().start(sticker.timing, _ ->
{
sticker.visible = false;
FunkinSound.playOnce(Paths.sound(daSound));
HapticUtil.vibrate(0, 0.01, Constants.MIN_VIBRATION_AMPLITUDE * 0.5);
{
switchingState = false;
FunkinMemory.clearStickers();
close();
}
});
}
}

function regenStickers():Void
{
transitionSprite?.insert();

{
sticky.visible = false;
sticky.x = xPos;
sticky.y = yPos;
xPos += sticky.frameWidth * 0.5;
{
{
xPos = -100;
yPos += FlxG.random.float(70, 120);
}
}
sticky.angle = FlxG.random.int(-60, 70);
grpStickers.add(sticky);
}
lastSticker.visible = false;
lastSticker.updateHitbox();
lastSticker.angle = 0;
lastSticker.screenCenter();
grpStickers.add(lastSticker);
transitionSprite?.setupStickers(grpStickers);
for (ind => sticker in grpStickers.members)
{
sticker.timing = FlxMath.remapToRange(ind, 0, grpStickers.members.length, 0, 0.9);
new FlxTimer().start(sticker.timing, _ ->
{
sticker.visible = true;
FunkinSound.playOnce(Paths.sound(daSound));
HapticUtil.vibrate(0, 0.01, Constants.MIN_VIBRATION_AMPLITUDE * 0.5);
new FlxTimer().start((1 / 24) * frameTimer, _ ->
{
sticker.scale.x = sticker.scale.y = FlxG.random.float(0.97, 1.02);
{
switchingState = true;
FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;
else
funkin.FunkinMemory.purgeCache();
funkin.FunkinMemory.purgeCache(true);
});
{
});
}
});
});
}
grpStickers.sort((ord, a, b) ->
{
});
}

override public function onResize(width:Int, height:Int):Void
{
transitionSprite?.onResize();
}

override public function update(elapsed:Float):Void
{
super.update(elapsed);
transitionSprite?.update(elapsed);
}


override public function close():Void
{
transitionSprite?.clear();
super.close();
}

override public function destroy():Void
{
transitionSprite?.clear();
super.destroy();
}
}

class StickerTransitionSprite extends openfl.display.Sprite
{

public function new():Void
{
super();
visible = false;
stickersCamera = new FlxCamera();
stickersCamera.bgColor = 0x00000000;
addChild(stickersCamera.flashSprite);
scrollRect = new openfl.geom.Rectangle();
onResize();
}

public function update(elapsed:Float):Void
{
stickersCamera.visible = visible;
grpStickers?.update(elapsed);
stickersCamera.update(elapsed);

stickersCamera?.clearDrawStack();
stickersCamera?.canvas?.graphics.clear();

grpStickers?.draw();

stickersCamera.render();
}

public function insert():Void
{

visible = true;
onResize();
}

public function clear():Void
{
visible = false;
grpStickers = null;
stickersCamera?.clearDrawStack();
stickersCamera?.canvas?.graphics.clear();
}

public function onResize():Void
{
x = y = 0;
scaleX = 1;
scaleY = 1;

__scrollRect.setTo(0, 0, FlxG.camera._scrollRect.scrollRect.width, FlxG.camera._scrollRect.scrollRect.height);

stickersCamera.onResize();
stickersCamera._scrollRect.scrollRect = scrollRect;
}

public function setupStickers(group:FlxTypedGroup<StickerSprite>):Void
{
grpStickers = group;
grpStickers.camera = stickersCamera;
}
}
