

typedef AnimationInfo =
{
}

/**
* A variant of SparrowPlayer which loads a BaseCharacter instead.
* This allows it to play appropriate animations based on song events.
*/
class CharacterPlayer extends Box
{

public function new(defaultToBf:Bool = true)
{

{
}
}


function get_charId():String
{
}

function set_charId(value:String):String
{
}


function get_charName():String
{
}


/**
* Loads a character by ID.
* @param id The ID of the character to load.
*/
public function loadCharacter(id:String):Void
{

{
}

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

/**
* The character type (such as BF, Dad, GF, etc).
*/

function set_characterType(value:CharacterType):CharacterType
{
}


function set_flip(value:Bool):Bool
{

{
}

}


function set_targetScale(value:Float):Float
{

{
}

}

function onFrame(name:String, frameNumber:Int, frameIndex:Int):Void
{
}

function onFinish(name:String):Void
{
}

public function playAnimManually(name:String, restart:Bool = false, ignoreOther:Bool = false, reversed:Bool = false):Void
{
}

override function repositionChildren():Void
{

}

/**
* Called when an update event is hit in the song.
* Used to play character animations.
* @param event The event.
*/
public function onUpdate(event:UpdateScriptEvent):Void
{
}

/**
* Called when an beat is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onBeatHit(event:SongTimeScriptEvent):Void
{
}

/**
* Called when a step is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onNoteIncoming(event:NoteScriptEvent):Void
{
}

/**
* Called when a note is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteHit(event:HitNoteScriptEvent):Void
{
{

}
}

/**
* Called when a note is missed in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteMiss(event:NoteScriptEvent):Void
{
}

/**
* Called when a hold note is dropped in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteHoldDrop(event:HoldNoteScriptEvent):Void
{
}

/**
* Called when a key is pressed but no note is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteGhostMiss(event:GhostMissNoteScriptEvent):Void
{
}
}

private class Layout extends DefaultLayout
{
public override function resizeChildren():Void
{

{
}

}

public override function calcAutoSize(exclusions:Array<Component> = null):Size
{
{
}


}
}
