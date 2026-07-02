package funkin.ui.freeplay.dj;


/**
* A script that can be tied to a SparrowFreeplayDJ.
* Create a scripted class that extends SparrowFreeplayDJ to use this.
*/
class ScriptedSparrowFreeplayDJ extends SparrowFreeplayDJ implements polymod.hscript.HScriptedClass
{
}

/**
* A SparrowFreeplayDJ is a Freeplay DJ which is rendered by
* displaying an animation derived from a SparrowV2 atlas spritesheet file.
*
* BaseFreeplayDJ has game logic, SparrowFreeplayDJ has only rendering logic.
* KEEP THEM SEPARATE!
*/
class SparrowFreeplayDJ extends BaseFreeplayDJ
{
public function new(x:Float, y:Float, characterId:String)
{
super(x, y, characterId);

loadFrames();
loadAnimations();

animation.onFinish.add(onFinishAnim);
animation.onLoop.add(onFinishAnim);
}

public function loadFrames():Void
{
{
log('Could not load sparrow sprite: ' + playableCharData.getAssetPath());
}
this.frames = tex;
}

public function loadAnimations():Void
{
log('[SPARROWDJ] Loading ${playableCharData.getAnimationsList().length} animations for ${characterId}');

FlxAnimationUtil.addAtlasAnimations(this, playableCharData.getAnimationsList());

log('[SPARROWDJ] Successfully loaded ${animationList.length} animations for ${characterId}');
}

public override function update(elapsed:Float):Void
{
switch (currentState)
{
case Intro:
{
playFlashAnimation(animPrefix, true);
}
timeIdling = 0;
case Idle:
{
playFlashAnimation(animPrefix, true, false, true);
}
timeIdling += elapsed;
case NewUnlock:
{
currentState = Idle;
}
{
playFlashAnimation(animPrefix, true, false, true);
}
case Confirm:
timeIdling = 0;
case FistPumpIntro:

{
{
playFlashAnimation(animPrefixA, true, false, false, playableCharData?.getFistPumpIntroStartFrame());
}
}
else if (getCurrentAnimation() == animPrefixB)
{
{
playFlashAnimation(animPrefixB, true, false, false, playableCharData?.getFistPumpIntroBadStartFrame());
}
}
else
{
}

case FistPump:

{
{
playFlashAnimation(animPrefixA, true, false, false, playableCharData?.getFistPumpLoopStartFrame());
}
}
else if (getCurrentAnimation() == animPrefixB)
{
{
playFlashAnimation(animPrefixB, true, false, false, playableCharData?.getFistPumpLoopBadStartFrame());
}
}
else
{
}

case IdleEasterEgg:
{
onIdleEasterEgg.dispatch();
playFlashAnimation(animPrefix, false);
seenIdleEasterEgg = true;
}
timeIdling = 0;
case Cartoon:
{
currentState = IdleEasterEgg;
}
else
{
timeIdling = 0;
}
default:
}

super.update(elapsed);
}

override function onFinishAnim(name:String):Void
{
{
{
currentState = NewUnlock;
}
else
{
currentState = Idle;
}
onIntroDone.dispatch();
}
else if (name == playableCharData?.getAnimationPrefix('idle'))
{

{
currentState = IdleEasterEgg;
}
else if (timeIdling >= IDLE_CARTOON_PERIOD)
{
currentState = Cartoon;
}
}
else if (name == playableCharData?.getAnimationPrefix('confirm'))
{
}
else if (name == playableCharData?.getAnimationPrefix('fistPump'))
{
currentState = Idle;
}
else if (name == playableCharData?.getAnimationPrefix('idleEasterEgg'))
{
currentState = Idle;
}
else if (name == playableCharData?.getAnimationPrefix('loss'))
{
currentState = Idle;
}
else if (name == playableCharData?.getAnimationPrefix('newUnlock'))
{
}
else if (name == playableCharData?.getAnimationPrefix('charSelect'))
{
onCharSelectComplete();
}
else
{
log('Finished ${name}');
}
}

override public function playFlashAnimation(id:String, Force:Bool = false, Reverse:Bool = false, Loop:Bool = false, Frame:Int = 0):Void
{
animation.play(id, Force, Reverse, Frame);

{
animation.curAnim.looped = Loop;
}
applyAnimationOffset();
}

static function log(message:String):Void
{
}
}
