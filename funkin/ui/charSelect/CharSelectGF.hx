

class CharSelectGF extends FunkinSprite implements IBPMSyncedScriptedClass
{



public function new(x:Float, y:Float)
{

}

public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onBeatHit(event:SongTimeScriptEvent):Void
{
{
}

override public function draw()
{
}

function drawFFT()
{
{

for (i in 0...len)
{



animFrame = Std.int(Math.abs(animFrame - 12)); // shitty dumbass flip, cuz dave got da shit backwards lol!


}
}
}

/**
* For switching between "GFs" such as gf, nene, etc
* @param bf Which BF we are selecting, so that we know the accompyaning GF
*/
public function switchGF(bf:String):Void
{



{
}
else if (previousGFPath != currentGFPath)
{

{
}
else
{
}

}


}

public function onScriptEvent(event:ScriptEvent):Void
{

public function onCreate(event:ScriptEvent):Void
{

public function onDestroy(event:ScriptEvent):Void
{

public function onUpdate(event:UpdateScriptEvent):Void
{
}
