


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
this.stickerPack = targetStickerPack ?? StickerRegistry.instance.fetchDefault();
{
soundSelections = soundSelections.map(function(a:String)
{
for (i in soundSelections)
{
{
}
}
{
for (i in 0...sounds.length)
{
}
{
for (sticker in params.oldStickers)
}
else
{
}
}

public function degenStickers():Void
{
{
}
for (ind => sticker in grpStickers.members)
{
new FlxTimer().start(sticker.timing, _ ->
{
{
}
}
}

function regenStickers():Void
{

{
{
{
}
}
}
for (ind => sticker in grpStickers.members)
{
new FlxTimer().start(sticker.timing, _ ->
{
new FlxTimer().start((1 / 24) * frameTimer, _ ->
{
{
else
{
}
}
grpStickers.sort((ord, a, b) ->
{
}

override public function onResize(width:Int, height:Int):Void
{
}

override public function update(elapsed:Float):Void
{
}


override public function close():Void
{
}

override public function destroy():Void
{
}
}

class StickerTransitionSprite extends openfl.display.Sprite
{

public function new():Void
{
}

public function update(elapsed:Float):Void
{



}

public function insert():Void
{

}

public function clear():Void
{
}

public function onResize():Void
{


}

public function setupStickers(group:FlxTypedGroup<StickerSprite>):Void
{
}
}
