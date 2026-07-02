

/**
* A high-level handler for dialogue.
*
* This shit is great for modders but it's pretty elaborate for how much it'll actually be used, lolol. -Eric
*/
class Conversation extends FlxSpriteGroup implements IDialogueScriptedClass implements IRegistryEntry<ConversationData>
{
/**
* The current state of the conversation.
*/

/**
* The current entry in the dialogue.
*/


function get_currentDialogueEntryCount():Int
{
}

/**
* The current line in the current entry in the dialogue.
* **/


function get_currentDialogueLineCount():Int
{
}


function get_currentDialogueEntryData():Null<DialogueEntryData>
{

}


function get_currentDialogueLineString():String
{
}

/**
* AUDIO
*/

/**
* GRAPHICS
*/



public function new(id:String, ?params:Dynamic)
{


{
}
}

public function onCreate(event:ScriptEvent):Void
{

}

function setupMusic():Void
{



{
}
else
{
{
}
}
}

public function pauseMusic():Void
{
{
}
}

public function resumeMusic():Void
{
{
}
}

function setupBackdrop():Void
{

{
}



switch (_data.backdrop)
{
case SOLID(backdropData):
{
}
else
{
}
default:
}

}

public override function update(elapsed:Float):Void
{

}

function showCurrentSpeaker():Void
{


{
currentSpeaker.kill(); // Kill, don't destroy! We want to revive it later.
}


{
{
}
else
{
}
}


}

function playSpeakerAnimation():Void
{


}

public function refresh():Void
{
}

function showCurrentDialogueBox():Void
{


{
currentDialogueBox.kill(); // Kill, don't destroy! We want to revive it later.
}


{
}




}

function playDialogueBoxAnimation():Void
{


}

function onTypingComplete():Void
{
{
}
else
{
}
}

public function startConversation():Void
{
}

/**
* Dispatch an event to attempt to advance the conversation.
* This is done once at the start of the conversation, and once whenever the user presses CONFIRM to advance the conversation.
*
* The broadcast event may be cancelled by modules or ScriptedConversations. This will prevent the conversation from actually advancing.
* This is useful if you want to manually play an animation or something.
*/
public function advanceConversation():Void
{
switch (state)
{
case ConversationState.Start:
case ConversationState.Opening:
case ConversationState.Speaking:
case ConversationState.Idle:
case ConversationState.Ending:
default:
}
}

public function dispatchEvent(event:ScriptEvent):Void
{
}

/**
* Reset the conversation back to the start.
*/
public function resetConversation():Void
{

{
}

{
}

{
}

{
}

{
}

}

/**
* Dispatch an event to attempt to immediately end the conversation.
*
* The broadcast event may be cancelled by modules or ScriptedConversations. This will prevent the conversation from being cancelled.
* This is useful if you want to prevent an animation from being skipped or something.
*/
public function skipConversation():Void
{
}


public function startOutro():Void
{
switch (_data?.outro)
{
case FADE(outroData):
outroTween = FlxTween.tween(this, {alpha: 0.0}, outroData.fadeTime, {
type: ONESHOT, // holy shit like the game no way
startDelay: 0,
onComplete: (_) -> endOutro(),
ease: EaseUtil.stepped(8)

case NONE(_):
default:
}
}


public function endOutro():Void
{
}

/**
* Performed as the conversation starts.
*/
public function onDialogueStart(event:DialogueScriptEvent):Void
{



}

/**
* Display the next line of conversation.
*/
public function onDialogueLine(event:DialogueScriptEvent):Void
{

{

{
}
else
{
{

}
}
}
else
{
}
}

/**
* Skip the scrolling of the next line of conversation.
*/
public function onDialogueCompleteLine(event:DialogueScriptEvent):Void
{

}

/**
* Skip to the end of the conversation, immediately triggering the DIALOGUE_END event.
*/
public function onDialogueSkip(event:DialogueScriptEvent):Void
{

}

public function onDialogueEnd(event:DialogueScriptEvent):Void
{

}


public function onUpdate(event:UpdateScriptEvent):Void
{


switch (state)
{
case ConversationState.Start:
case ConversationState.Opening:
&& (currentDialogueBox.isAnimationFinished()
|| currentDialogueBox.getCurrentAnimation() != currentDialogueEntryData?.boxAnimation))
{

}
case ConversationState.Speaking:
case ConversationState.Idle:
case ConversationState.Ending:
}
}

public function onDestroy(event:ScriptEvent):Void
{

{
}


{
}

{
}

{
}


}

public function onScriptEvent(event:ScriptEvent):Void
{
}

/**
* As this event is dispatched to the Conversation, it is also dispatched to the active speaker.
* @param event
*/
function propagateEvent(event:ScriptEvent):Void
{
{
}
{
}
}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function revive():Void
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
}
}

enum ConversationState
{
/**
* State hasn't been initialized yet.
*/

/**
* A dialog is animating. If the dialog is static, this may only last for one frame.
*/

/**
* Text is scrolling and audio is playing. Speaker portrait is probably animating too.
*/

/**
* Text is done scrolling and game is waiting for user to open another dialog.
*/

/**
* Fade out and leave conversation.
*/
}
