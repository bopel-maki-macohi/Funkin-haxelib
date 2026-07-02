

/**
* The character sprite which displays during dialogue.
*
* Most conversations have two speakers, with one being flipped.
*/
class Speaker extends FlxSprite implements IDialogueScriptedClass implements IRegistryEntry<SpeakerData>
{
/**
* A readable name for this speaker.
*/

function get_speakerName():String
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

public function new(id:String, ?params:Dynamic)
{


{
}
}

/**
* Called when speaker is being created.
* @param event The script event.
*/
public function onCreate(event:ScriptEvent):Void
{

}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function kill():Void
{
}

public override function revive():Void
{


}

function loadSpritesheet():Void
{

{
}


{
}
else
{
}



}

/**
* Set the sprite scale to the appropriate value.
* @param scale
*/
public function setScale(scale:Null<Float>):Void
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
* @param name The name of the animation to play.
* @param restart Whether to restart the animation if it is already playing.
*/
public function playAnimation(name:String, restart:Bool = false):Void
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
