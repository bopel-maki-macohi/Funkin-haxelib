

/**
* Contains all the Logic needed for Stage Editor. Only for Stage Editor, as in the gameplay StageProps and Boppers will be used.
*/
class StageEditorObject extends FunkinSprite
{
/**
* The internal Name of the Object.
*/


/**
* What animation to play upon starting.
*/


override public function new()
{

}

/**
* Whether the Object is currently being modified in the Stage Editor.
*/

function set_isDebugged(value:Bool):Bool
{

else
{
{
}
}

}

public function playAnim(name:String, restart:Bool = false, reversed:Bool = false):Void
{


else
}

/**
* On which beat should it dance?
*/

/**
* Internal, handles danceLeft and danceRight.
*/

public function dance(restart:Bool = false):Void
{



{
else

}
else if (idle)
{
}
}

public function addAnim(name:String, prefix:String, offsets:Array<Float>, indices:Array<Int>, frameRate:Int = 24, looped:Bool = true, flipX:Bool = false,
flipY:Bool = false)
{
else

{
animDatas.set(name, {
name: name,
prefix: prefix,
offsets: offsets,
looped: looped,
frameRate: frameRate,
flipX: flipX,
flipY: flipY,
frameIndices: indices
}
}
}
