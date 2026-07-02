package funkin.ui.debug.dialogue;


/**
* A state with displays a conversation with no background.
* Used for testing.
* @param conversationId The conversation to display.
*/
class ConversationDebugState extends MusicBeatState
{


public function new()
{
super();

Paths.setCurrentLevel('week6');
}

public override function create():Void
{
super.create();
startConversation();
}

function startConversation():Void
{

conversation = ConversationRegistry.instance.fetchEntry(conversationId);

conversation.zIndex = 1000;
add(conversation);
refresh();

ScriptEventDispatcher.callEvent(conversation, event);
}

function onConversationComplete():Void
{
remove(conversation);
conversation = null;
}

public override function dispatchEvent(event:ScriptEvent):Void
{
ScriptEventDispatcher.callEvent(conversation, event);
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
{
conversation.advanceConversation();
}
else if (controls.PAUSE)
{
conversation.kill();
remove(conversation);
conversation = null;

}
}
}
}
