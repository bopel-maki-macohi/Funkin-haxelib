

enum FreeplayDJState
{
/**
* Character enters the frame and transitions to Idle.
*/

/**
* Character loops in idle.
*/

/**
* Plays an easter egg animation after a period in Idle, then reverts to Idle.
*/

/**
* Plays an elaborate easter egg animation. Does not revert until another animation is triggered.
*/

/**
* Player has selected a song.
*/

/**
* Character preps to play the fist pump animation; plays after the Results screen.
* The actual frame label that gets played may vary based on the player's success.
*/

/**
* Character plays the fist pump animation.
* The actual frame label that gets played may vary based on the player's success.
*/

/**
* Plays an animation to indicate that the player has a new unlock in Character Select.
* Overrides all idle animations as well as the fist pump. Only Confirm and CharSelect will override this.
*/

/**
* Plays an animation to transition to the Character Select screen.
*/
}

/**
* A script that can be tied to a BaseFreeplayDJ.
* Create a scripted class that extends BaseFreeplayDJ to use this.
* Can be used for full control over DJ's logic.
*/
class ScriptedBaseFreeplayDJ extends BaseFreeplayDJ implements polymod.hscript.HScriptedClass {}

class BaseFreeplayDJ extends FunkinSprite implements IFreeplayScriptedClass
{







public function new(x:Float, y:Float, characterId:String)
{


}

function onFinishAnim(name:String):Void
{
}

public function onCharSelectComplete():Void
{
}

public function playFlashAnimation(id:String, Force:Bool = false, Reverse:Bool = false, Loop:Bool = false, Frame:Int = 0):Void
{
}

public function onPlayerAction():Void
{
}

public function resetAFKTimer():Void
{
}

public function getMusicPreviewMult():Float
{
}

public function onConfirm():Void
{
{
}

}

public function toCharSelect():Void
{
{
}
else
{
}
}

public function fistPumpIntro():Void
{
{
}

}

public function fistPump():Void
{
{
}

}

public function fistPumpLossIntro():Void
{
{
}

}

public function fistPumpLoss():Void
{
{
}

}

public function resetPosition():Void
{

{
}
else
{
}
}

function applyAnimationOffset():Void
{



{

{
}
else
{
}

}
else
{
}
}

public function onScriptEvent(event:ScriptEvent)
{
}

public function onCreate(event:ScriptEvent)
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
}
