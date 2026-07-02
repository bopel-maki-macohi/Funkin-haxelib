package funkin.ui.debug.stageeditor;


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
super();

selectedShader = new InverseDotsShader(0);
shader = selectedShader;
}

/**
* Whether the Object is currently being modified in the Stage Editor.
*/

function set_isDebugged(value:Bool):Bool
{
this.isDebugged = value;

playAnim(startingAnimation, true);
else
{
{
animation.stop();
offset.set();
updateHitbox();
}
}

}

public function playAnim(name:String, restart:Bool = false, reversed:Bool = false):Void
{

animation.play(name, restart, reversed, 0);

else
offset.set();
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
playAnim("danceLeft", restart);

_danced = !_danced;
}
else if (idle)
{
playAnim("idle", restart);
}
}

public function addAnim(name:String, prefix:String, offsets:Array<Float>, indices:Array<Int>, frameRate:Int = 24, looped:Bool = true, flipX:Bool = false,
flipY:Bool = false)
{
else
animation.addByPrefix(name, prefix, frameRate, looped, flipX, flipY);

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
});
}
}
}
