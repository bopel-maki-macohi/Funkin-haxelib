

class CharSelectPlayer extends FunkinSprite implements IBPMSyncedScriptedClass
{



public function new(x:Float, y:Float)
{


loadTextureAtlas(DEFAULT_PATH, {
applyStageMatrix: true,
swfMode: true

anim.onFinish.add(function(animLabel:String)
{
switch (animLabel)
{
case "slidein":
{
}
else
{
}
case "deselect":
case "slidein idle point", "cannot select Label", "unlock":
case "idle":

{
{
}
}
}
}

public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onBeatHit(event:SongTimeScriptEvent):Void
{
//
{
}

public function switchChar(str:String, playSlideAnim:Bool = true):Void
{

{
}
else
{
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
