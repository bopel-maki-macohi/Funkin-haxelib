

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


}

public function loadFrames():Void
{
{
}
}

public function loadAnimations():Void
{


}

public override function update(elapsed:Float):Void
{
switch (currentState)
{
case Intro:
{
}
case Idle:
{
}
case NewUnlock:
{
}
{
}
case Confirm:
case FistPumpIntro:

{
{
}
}
else if (getCurrentAnimation() == animPrefixB)
{
{
}
}
else
{
}

case FistPump:

{
{
}
}
else if (getCurrentAnimation() == animPrefixB)
{
{
}
}
else
{
}

case IdleEasterEgg:
{
}
case Cartoon:
{
}
else
{
}
default:
}

}

override function onFinishAnim(name:String):Void
{
{
{
}
else
{
}
}
else if (name == playableCharData?.getAnimationPrefix('idle'))
{

{
}
else if (timeIdling >= IDLE_CARTOON_PERIOD)
{
}
}
else if (name == playableCharData?.getAnimationPrefix('confirm'))
{
}
else if (name == playableCharData?.getAnimationPrefix('fistPump'))
{
}
else if (name == playableCharData?.getAnimationPrefix('idleEasterEgg'))
{
}
else if (name == playableCharData?.getAnimationPrefix('loss'))
{
}
else if (name == playableCharData?.getAnimationPrefix('newUnlock'))
{
}
else if (name == playableCharData?.getAnimationPrefix('charSelect'))
{
}
else
{
}
}

override public function playFlashAnimation(id:String, Force:Bool = false, Reverse:Bool = false, Loop:Bool = false, Frame:Int = 0):Void
{

{
}
}

static function log(message:String):Void
{
}
}
