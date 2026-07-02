

/**
* A state with displays a conversation with no background.
* Used for testing.
* @param conversationId The conversation to display.
*/
class ConversationDebugState extends MusicBeatState
{


public function new()
{

}

public override function create():Void
{
}

function startConversation():Void
{

conversation = ConversationRegistry.instance.fetchEntry(conversationId);


}

function onConversationComplete():Void
{
}

public override function dispatchEvent(event:ScriptEvent):Void
{
}

public override function update(elapsed:Float):Void
{

{
{
}
else if (controls.PAUSE)
{

}
}
}
}
