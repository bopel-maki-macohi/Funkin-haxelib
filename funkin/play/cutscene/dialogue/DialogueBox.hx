

class DialogueBox extends FlxSpriteGroup implements IDialogueScriptedClass implements IRegistryEntry<DialogueBoxData>
{

function get_dialogueBoxName():String
{
}

/**
* Offset the speaker's sprite by this much when playing each animation.
*/

/**
* The position without offsets applied.
*/

/**
* The current animation offset being used.
*/

function set_animOffsets(value:Array<Float>):Array<Float>
{


}

/**
* The offset of the speaker overall.
*/

function set_globalOffsets(value:Array<Float>):Array<Float>
{




}



function set_text(value:String):String
{


}


function set_speed(value:Float):Float
{
textDisplay.delay = this.speed * 0.05; // 1.0 x 0.05
}

public function new(id:String, ?params:Dynamic)
{

{
}
}

public function onCreate(event:ScriptEvent):Void
{


}

function loadSpritesheet():Void
{
{
}



{
}


{
}
else
{
}


}

public function setText(newText:String):Void
{
}

public function appendText(newText:String):Void
{
}

public function skip():Void
{
}

/**
* Reassign this to set a callback.
*/
function onTypingComplete():Void
{
}


/**
* Set the sprite scale to the appropriate value.
* @param scale
*/
public function setScale(scale:Null<Float>):Void
{

}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function kill():Void
{
{
}
{
}
}

public override function revive():Void
{

}

function loadAnimations():Void
{


for (anim in _data.animations)
{
{
}
else
{
}
}


}

/**
* Called when an animation finishes.
* @param name The name of the animation that just finished.
*/
function onAnimationFinished(name:String):Void
{
}

/**
* Called when the current animation's frame changes.
* @param name The name of the current animation.
* @param frameNumber The number of the current frame.
* @param frameIndex The index of the current frame.
*
* For example, if an animation was defined as having the indexes [3, 0, 1, 2],
* then the first callback would have frameNumber = 0 and frameIndex = 3.
*/
function onAnimationFrame(name:String = "", frameNumber:Int = -1, frameIndex:Int = -1):Void
{

}

function loadText():Void
{
textDisplay.setFormat(_data.text.fontFamily, _data.text.size, FlxColor.fromString(_data.text.color), LEFT, SHADOW,



}

/**
* @param name The name of the animation to play.
* @param restart Whether to restart the animation if it is already playing.
* @param reversed If true, play the animation backwards, from the last frame to the first.
*/
public function playAnimation(name:String, restart:Bool = false, reversed:Bool = false):Void
{


}

/**
* Ensure that a given animation exists before playing it.
* Will gracefully check for name, then name with stripped suffixes, then 'idle', then fail to play.
* @param name
*/
function correctAnimationName(name:String):String
{


{
}
else
{
{
}
else
{
}
}
}

public function hasAnimation(id:String):Bool
{

}

/**
* Returns the name of the animation that is currently playing.
* If no animation is playing (usually this means the character is BROKEN!),
*   returns an empty string to prevent NPEs.
*/
public function getCurrentAnimation():String
{
}

/**
* Define the animation offsets for a specific animation.
*/
public function setAnimationOffsets(name:String, xOffset:Float, yOffset:Float):Void
{
}

/**
* Retrieve an apply the animation offsets for a specific animation.
*/
function applyAnimationOffsets(name:String):Void
{
{
}
else
{
}
}

public function isAnimationFinished():Bool
{
}

public function onDialogueStart(event:DialogueScriptEvent):Void
{
}

public function onDialogueCompleteLine(event:DialogueScriptEvent):Void
{
}

public function onDialogueLine(event:DialogueScriptEvent):Void
{
}

public function onDialogueSkip(event:DialogueScriptEvent):Void
{
}

public function onDialogueEnd(event:DialogueScriptEvent):Void
{
}

public function onUpdate(event:UpdateScriptEvent):Void
{
}

public function onDestroy(event:ScriptEvent):Void
{



}

public function onScriptEvent(event:ScriptEvent):Void
{
}
}
