

/**
* A class for the backing cards so they dont have to be part of freeplayState......
*/
class BackingCard extends FlxSpriteGroup implements IBPMSyncedScriptedClass implements IStateChangingScriptedClass implements IFreeplayScriptedClass
{



public function new(currentCharacter:String)
{






pinkBack.color = 0xFFFFD4E9; // sets it to pink!
}

/**
* Apply exit movers for the pieces of the backing card.
* @param exitMovers The exit movers to apply.
*/
public function applyExitMovers(?exitMovers:FreeplayState.ExitMoverData, ?exitMoversCharSel:FreeplayState.ExitMoverData):Void
{
{
}
else
{
}


{
}
else
{
}


exitMovers.set([pinkBack, orangeBackShit, alsoOrangeLOL], {
x: -pinkBack.width,
y: pinkBack.y,
speed: 0.4,
wait: 0

exitMoversCharSel.set([pinkBack], {
y: -100,
speed: 0.8,
wait: 0.1

exitMoversCharSel.set([orangeBackShit, alsoOrangeLOL], {
y: -40,
speed: 0.8,
wait: 0.1
}

/**
* Helper function to snap the back of the card to its final position.
* Used when returning from character select, as we dont want to play the full animation of everything sliding in.
*/
public function skipIntroTween():Void
{
}

/**
* Called after the dj finishes their start animation.
*/
public function introDone():Void
{
}

/**
* Called when selecting a song.
*/
public function confirm():Void
{



FlxTween.color(instance.backingImage, 0.5, 0xFFA8A8A8, 0xFF646464, {
onUpdate: function(_)
{
instance.angleMaskShader.extraColor = instance.backingImage.color;
}
FlxTween.tween(confirmGlow2, {alpha: 0.5}, 0.33, {
ease: FlxEase.quadOut,
onComplete: function(_)
{
FlxTween.color(instance.backingImage, 2, 0xFFCDCDCD, 0xFF555555, {
ease: FlxEase.expoOut,
onUpdate: function(_)
{
instance.angleMaskShader.extraColor = instance.backingImage.color;
}
}
}

/**
* Called when entering character select, does nothing by default.
*/
public function enterCharSel():Void
{
}

/**
* Called on each beat in freeplay state.
*/
public function beatHit():Void
{
}

/**
* Called when exiting the freeplay menu.
*/
public function disappear():Void
{


}

public function onScriptEvent(event:ScriptEvent):Void
{
}

/**
* Called in create. Adds sprites and tweens.
*/
public function onCreate(event:ScriptEvent):Void
{











}

public function onDestroy(event:ScriptEvent):Void
{
}

public function onUpdate(event:UpdateScriptEvent):Void
{
}

public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onBeatHit(event:SongTimeScriptEvent):Void
{
}

public function onStateChangeBegin(event:StateChangeScriptEvent):Void
{
}

public function onStateChangeEnd(event:StateChangeScriptEvent):Void
{
}

public function onSubStateOpenBegin(event:SubStateScriptEvent):Void
{
}

public function onSubStateOpenEnd(event:SubStateScriptEvent):Void
{
}

public function onSubStateCloseBegin(event:SubStateScriptEvent):Void
{
}

public function onSubStateCloseEnd(event:SubStateScriptEvent):Void
{
}

public function onFocusLost(event:FocusScriptEvent):Void
{
}

public function onFocusGained(event:FocusScriptEvent):Void
{
}

/**
* Called when a capsule is selected.
*/
public function onCapsuleSelected(event:CapsuleScriptEvent):Void
{
}

/**
* Called when the current difficulty is changed.
*/
public function onDifficultySwitch(event:CapsuleScriptEvent):Void
{
}

/**
* Called when a song is selected.
*/
public function onSongSelected(event:CapsuleScriptEvent):Void
{
}

/**
* Called when the intro for Freeplay finishes.
*/
public function onFreeplayIntroDone(event:FreeplayScriptEvent):Void
{
}

/**
* Called when the Freeplay outro begins.
*/
public function onFreeplayOutro(event:FreeplayScriptEvent):Void
{
}

/**
* Called when Freeplay is closed.
*/
public function onFreeplayClose(event:FreeplayScriptEvent):Void
{
}

public function centerObjectOnCard(object:flixel.FlxObject)
{
}
}
