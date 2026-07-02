package funkin.ui.freeplay.dj;


enum FreeplayDJState
{
/**
* Character enters the frame and transitions to Idle.
*/
Intro;

/**
* Character loops in idle.
*/
Idle;

/**
* Plays an easter egg animation after a period in Idle, then reverts to Idle.
*/
IdleEasterEgg;

/**
* Plays an elaborate easter egg animation. Does not revert until another animation is triggered.
*/
Cartoon;

/**
* Player has selected a song.
*/
Confirm;

/**
* Character preps to play the fist pump animation; plays after the Results screen.
* The actual frame label that gets played may vary based on the player's success.
*/
FistPumpIntro;

/**
* Character plays the fist pump animation.
* The actual frame label that gets played may vary based on the player's success.
*/
FistPump;

/**
* Plays an animation to indicate that the player has a new unlock in Character Select.
* Overrides all idle animations as well as the fist pump. Only Confirm and CharSelect will override this.
*/
NewUnlock;

/**
* Plays an animation to transition to the Character Select screen.
*/
CharSelect;
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
this.characterId = characterId;

playableCharData = playableChar?.getFreeplayDJData();

super(x, y);
}

function onFinishAnim(name:String):Void
{
}

public function onCharSelectComplete():Void
{
}

public function playFlashAnimation(id:String, Force:Bool = false, Reverse:Bool = false, Loop:Bool = false, Frame:Int = 0):Void
{
applyAnimationOffset();
}

public function onPlayerAction():Void
{
resetAFKTimer();
}

public function resetAFKTimer():Void
{
timeIdling = 0;
seenIdleEasterEgg = false;
}

public function getMusicPreviewMult():Float
{
}

public function onConfirm():Void
{
{
currentState = NewUnlock;
}

currentState = Confirm;
}

public function toCharSelect():Void
{
{
currentState = CharSelect;
playFlashAnimation(animPrefix, true, false, false, 0);
}
else
{
currentState = Confirm;
onCharSelectComplete();
}
}

public function fistPumpIntro():Void
{
{
currentState = NewUnlock;
}

currentState = FistPumpIntro;
}

public function fistPump():Void
{
{
currentState = NewUnlock;
}

currentState = FistPump;
}

public function fistPumpLossIntro():Void
{
{
currentState = NewUnlock;
}

currentState = FistPumpIntro;
}

public function fistPumpLoss():Void
{
{
currentState = NewUnlock;
}

currentState = FistPump;
}

public function resetPosition():Void
{

{
this.x = (FreeplayState.CUTOUT_WIDTH * FreeplayState.DJ_POS_MULTI);
this.y = 0;
}
else
{
this.x = (FreeplayState.CUTOUT_WIDTH * FreeplayState.DJ_POS_MULTI) + 640;
this.y = 366;
}
}

function applyAnimationOffset():Void
{


globalOffsets[0] -= playableCharData.getGlobalOffsets()[0];
globalOffsets[1] -= playableCharData.getGlobalOffsets()[1];

{

{
}
else
{
}

offset.set(finalOffsetX, finalOffsetY);
}
else
{
offset.set(0, 0);
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
