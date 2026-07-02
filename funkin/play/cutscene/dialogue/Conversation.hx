package funkin.play.cutscene.dialogue;


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
super();

this.id = id;
this._data = _fetchData(id);

{
throw 'Could not parse conversation data for id: $id';
}
}

public function onCreate(event:ScriptEvent):Void
{
currentDialogueEntry = 0;
currentDialogueLine = 0;
this.state = ConversationState.Start;

dispatchEvent(new DialogueScriptEvent(DIALOGUE_START, this, false));
}

function setupMusic():Void
{


music = FunkinSound.load(Paths.music(_data.music.asset), 0.0, true, true, true);

{
FlxTween.tween(music, {volume: 1.0}, fadeTime, {ease: FlxEase.linear});
}
else
{
{
music.volume = 1.0;
}
}
}

public function pauseMusic():Void
{
{
music.pause();
}
}

public function resumeMusic():Void
{
{
music.resume();
}
}

function setupBackdrop():Void
{

{
backdrop.destroy();
remove(backdrop);
backdrop = null;
}

backdrop = new FunkinSprite(0, 0);


switch (_data.backdrop)
{
case SOLID(backdropData):
backdrop.makeSolidColor(Std.int(FlxG.width), Std.int(FlxG.height), targetColor);
{
backdrop.alpha = 0.0;
FlxTween.tween(backdrop, {alpha: 1.0}, fadeTime, {ease: EaseUtil.stepped(10)});
}
else
{
backdrop.alpha = 1.0;
}
default:
}

backdrop.zIndex = 10;
add(backdrop);
refresh();
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

dispatchEvent(new UpdateScriptEvent(elapsed));
}

function showCurrentSpeaker():Void
{


{
remove(currentSpeaker);
currentSpeaker.kill(); // Kill, don't destroy! We want to revive it later.
currentSpeaker = null;
}


{
{
}
else
{
}
}

ScriptEventDispatcher.callEvent(nextSpeaker, new ScriptEvent(CREATE, true));

currentSpeaker = nextSpeaker;
currentSpeaker.zIndex = 200;
add(currentSpeaker);
refresh();
}

function playSpeakerAnimation():Void
{


}

public function refresh():Void
{
sort(SortUtil.byZIndex, FlxSort.ASCENDING);
}

function showCurrentDialogueBox():Void
{


{
remove(currentDialogueBox);
currentDialogueBox.kill(); // Kill, don't destroy! We want to revive it later.
currentDialogueBox = null;
}


{
}

ScriptEventDispatcher.callEvent(nextDialogueBox, new ScriptEvent(CREATE, true));

currentDialogueBox = nextDialogueBox;
currentDialogueBox.zIndex = 300;

currentDialogueBox.typingCompleteCallback = this.onTypingComplete;

add(currentDialogueBox);
refresh();
}

function playDialogueBoxAnimation():Void
{


}

function onTypingComplete():Void
{
{
this.state = ConversationState.Idle;
}
else
{
this.state = ConversationState.Idle;
}
}

public function startConversation():Void
{
dispatchEvent(new DialogueScriptEvent(DIALOGUE_START, this, true));
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
dispatchEvent(new DialogueScriptEvent(DIALOGUE_START, this, true));
case ConversationState.Opening:
dispatchEvent(new DialogueScriptEvent(DIALOGUE_COMPLETE_LINE, this, true));
case ConversationState.Speaking:
dispatchEvent(new DialogueScriptEvent(DIALOGUE_COMPLETE_LINE, this, true));
case ConversationState.Idle:
dispatchEvent(new DialogueScriptEvent(DIALOGUE_LINE, this, true));
case ConversationState.Ending:
endOutro();
default:
}
}

public function dispatchEvent(event:ScriptEvent):Void
{
currentState.dispatchEvent(event);
}

/**
* Reset the conversation back to the start.
*/
public function resetConversation():Void
{
currentDialogueEntry = 0;
this.state = ConversationState.Start;

{
outroTween.cancel();
}
outroTween = null;

{
this.music.stop();
this.music = null;
}

{
currentSpeaker.kill();
remove(currentSpeaker);
currentSpeaker = null;
}

{
currentDialogueBox.kill();
remove(currentDialogueBox);
currentDialogueBox = null;
}

{
backdrop.destroy();
remove(backdrop);
backdrop = null;
}

startConversation();
}

/**
* Dispatch an event to attempt to immediately end the conversation.
*
* The broadcast event may be cancelled by modules or ScriptedConversations. This will prevent the conversation from being cancelled.
* This is useful if you want to prevent an animation from being skipped or something.
*/
public function skipConversation():Void
{
dispatchEvent(new DialogueScriptEvent(DIALOGUE_SKIP, this, true));
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
});

case NONE(_):
endOutro();
default:
endOutro();
}
}


public function endOutro():Void
{
ScriptEventDispatcher.callEvent(this, new ScriptEvent(DESTROY, false));
}

/**
* Performed as the conversation starts.
*/
public function onDialogueStart(event:DialogueScriptEvent):Void
{
propagateEvent(event);

setupMusic();
setupBackdrop();

state = ConversationState.Opening;

showCurrentDialogueBox();
playDialogueBoxAnimation();
}

/**
* Display the next line of conversation.
*/
public function onDialogueLine(event:DialogueScriptEvent):Void
{
propagateEvent(event);

currentDialogueLine += 1;
{
currentDialogueLine = 0;
currentDialogueEntry += 1;

{
dispatchEvent(new DialogueScriptEvent(DIALOGUE_END, this, false));
}
else
{
{
showCurrentDialogueBox();
playDialogueBoxAnimation();

state = Opening;
}
}
}
else
{
state = Speaking;
}
}

/**
* Skip the scrolling of the next line of conversation.
*/
public function onDialogueCompleteLine(event:DialogueScriptEvent):Void
{
propagateEvent(event);

}

/**
* Skip to the end of the conversation, immediately triggering the DIALOGUE_END event.
*/
public function onDialogueSkip(event:DialogueScriptEvent):Void
{
propagateEvent(event);

dispatchEvent(new DialogueScriptEvent(DIALOGUE_END, this, false));
}

public function onDialogueEnd(event:DialogueScriptEvent):Void
{
propagateEvent(event);

state = Ending;
}


public function onUpdate(event:UpdateScriptEvent):Void
{
propagateEvent(event);


switch (state)
{
case ConversationState.Start:
case ConversationState.Opening:
&& (currentDialogueBox.isAnimationFinished()
|| currentDialogueBox.getCurrentAnimation() != currentDialogueEntryData?.boxAnimation))
{

state = ConversationState.Speaking;
showCurrentSpeaker();
playSpeakerAnimation();
currentDialogueBox.setText(currentDialogueLineString);
}
case ConversationState.Speaking:
case ConversationState.Idle:
case ConversationState.Ending:
}
}

public function onDestroy(event:ScriptEvent):Void
{
propagateEvent(event);

{
outroTween.cancel();
}
outroTween = null;

this.music = null;

{
currentSpeaker.kill();
remove(currentSpeaker);
currentSpeaker = null;
}

{
currentDialogueBox.kill();
remove(currentDialogueBox);
currentDialogueBox = null;
}

{
backdrop.destroy();
remove(backdrop);
backdrop = null;
}

this.clear();

}

public function onScriptEvent(event:ScriptEvent):Void
{
propagateEvent(event);
}

/**
* As this event is dispatched to the Conversation, it is also dispatched to the active speaker.
* @param event
*/
function propagateEvent(event:ScriptEvent):Void
{
{
ScriptEventDispatcher.callEvent(this.currentDialogueBox, event);
}
{
ScriptEventDispatcher.callEvent(this.currentSpeaker, event);
}
}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function revive():Void
{
super.revive();
this.alpha = 1;
this.visible = true;
}

/**
* Calls `kill()` on the group's members and then on the group itself.
* You can revive this group later via `revive()` after this.
*/
public override function kill():Void
{
_skipTransformChildren = true;
alive = false;
exists = false;
_skipTransformChildren = false;

{
outroTween.cancel();
outroTween = null;
}
}
}

enum ConversationState
{
/**
* State hasn't been initialized yet.
*/
Start;

/**
* A dialog is animating. If the dialog is static, this may only last for one frame.
*/
Opening;

/**
* Text is scrolling and audio is playing. Speaker portrait is probably animating too.
*/
Speaking;

/**
* Text is done scrolling and game is waiting for user to open another dialog.
*/
Idle;

/**
* Fade out and leave conversation.
*/
Ending;
}
