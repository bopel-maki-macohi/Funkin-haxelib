

/**
* This is a base class for all events that are issued to scripted classes.
* It can be used to identify the type of event called, store data, and cancel event propagation.
*/
class ScriptEvent
{
/**
* If true, the behavior associated with this event can be prevented.
* For example, cancelling COUNTDOWN_START should prevent the countdown from starting,
* until another script restarts it, or cancelling NOTE_HIT should cause the note to be missed.
*/

/**
* The type associated with the event.
*/

/**
* Whether the event should continue to be triggered on additional targets.
*/

/**
* Whether the event has been canceled by one of the scripts that received it.
*/

public function new(type:ScriptEventType, cancelable:Bool = false):Void
{
}

/**
* Call this function on a cancelable event to cancel the associated behavior.
* For example, cancelling COUNTDOWN_START will prevent the countdown from starting.
*/
public function cancelEvent():Void
{
{
}
}

/**
* Cancel this event.
* This is an alias for cancelEvent() but I make this typo all the time.
*/
public function cancel():Void
{
}

/**
* Call this function to stop any other Scripteds from receiving the event.
*/
public function stopPropagation():Void
{
}

public function toString():String
{
}
}

/**
* SPECIFIC EVENTS
*/
/**
* An event that is fired associated with a specific note.
*/
class NoteScriptEvent extends ScriptEvent
{
/**
* The note associated with this event.
* You cannot replace it, but you can edit it.
*/

/**
* The combo count as it is with this event.
* Will be (combo) on miss events and (combo + 1) on hit events (the stored combo count won't update if the event is cancelled).
*/

/**
* Whether to play the record scratch sound (if this event type is `NOTE_MISS`).
*/

/**
* The health gained or lost from this note.
* This affects both hits and misses. Remember that max health is 2.00.
*/

public function new(type:ScriptEventType, note:NoteSprite, healthChange:Float, comboCount:Int = 0, cancelable:Bool = false):Void
{
}

public override function toString():String
{
}
}

class HitNoteScriptEvent extends NoteScriptEvent
{
/**
* The judgement the player received for hitting the note.
*/

/**
* The score the player received for hitting the note.
*/

/**
* If the hit causes a combo break.
*/

/**
* The time difference when the player hit the note
*/

/**
* Whether this note hit causes a note splash to display.
* Defaults to true only on "sick" notes.
*/

public function new(note:NoteSprite, healthChange:Float, score:Float, judgement:String, isComboBreak:Bool, comboCount:Int = 0, hitDiff:Float = 0,
doesNotesplash:Bool = false):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when you press a key with no note present.
*/
class GhostMissNoteScriptEvent extends ScriptEvent
{
/**
* The direction that was mistakenly pressed.
*/

/**
* Whether there was a note within judgement range when this ghost note was pressed.
*/

/**
* How much health should be lost when this ghost note is pressed.
* Remember that max health is 2.00.
*/

/**
* How much score should be lost when this ghost note is pressed.
*/

/**
* Whether to play the record scratch sound.
*/

/**
* Whether to play the miss animation on the player.
*/

public function new(dir:NoteDirection, hasPossibleNotes:Bool, healthChange:Float, scoreChange:Float):Void
{
}

public override function toString():String
{
}
}

class HoldNoteScriptEvent extends NoteScriptEvent
{
/**
* The hold note that was hit (or dropped).
*/

/**
* The score the player received for hitting the note.
*/

/**
* If the hit causes a combo break.
*/

/**
* The time difference when the player hit the note
*/

/**
* Whether this note hit causes a note splash to display.
* Defaults to true only on "sick" notes.
*/

public function new(type:ScriptEventType, holdNote:SustainTrail, healthChange:Float, score:Float, isComboBreak:Bool, comboCount:Int = 0,
cancelable:Bool = false):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when the song reaches an event.
*/
class SongEventScriptEvent extends ScriptEvent
{
/**
* The note associated with this event.
* You cannot replace it, but you can edit it.
*/

public function new(eventData:funkin.data.song.SongData.SongEventData):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired during the update loop.
*/
class UpdateScriptEvent extends ScriptEvent
{
/**
* The note associated with this event.
* You cannot replace it, but you can edit it.
*/

public function new(elapsed:Float):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired regularly during the song.
* May be on beat or on step.
*/
class SongTimeScriptEvent extends ScriptEvent
{
/**
* The current beat of the song.
*/

/**
* The current step of the song.
*/

public function new(type:ScriptEventType, beat:Int, step:Int):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired regularly during the song.
* May be on beat or on step.
*/
class CountdownScriptEvent extends ScriptEvent
{
/**
* The current step of the countdown.
*/

public function new(type:ScriptEventType, step:CountdownStep, cancelable:Bool = true):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired during a dialogue.
*/
class DialogueScriptEvent extends ScriptEvent
{
/**
* The dialogue being referenced by the event.
*/

public function new(type:ScriptEventType, conversation:Conversation, cancelable:Bool = true):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when the player presses a key.
*/
class KeyboardInputScriptEvent extends ScriptEvent
{
/**
* The associated keyboard event.
*/

public function new(type:ScriptEventType, event:KeyboardEvent):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired once the song's chart has been parsed.
*
* The event data includes the song's full note data and event data, which lets you modify it if you like.
* Override `onSongLoad(event:SongLoadScriptEvent)` on a song/character/stage/module to use it.
*/
class SongLoadScriptEvent extends ScriptEvent
{
/**
* The note data for the song that just loaded.
* Modifying this will carry over to the song, so feel free to edit it
* (to easily mirror a chart, randomize it, add/remove notes, etc.)
*/

/**
* The event data for the song that just loaded.
* Modifying this will carry over to the song, so feel free to edit it
* (add/remove events, modify event data, etc.)
*/

/**
* The ID of the song that just loaded.
*/

/**
* The difficulty of the song that just loaded.
*/

function set_notes(notes:Array<SongNoteData>):Array<SongNoteData>
{
}

function set_events(events:Array<SongEventData>):Array<SongEventData>
{
}

public function new(id:String, difficulty:String, notes:Array<SongNoteData>, events:Array<SongEventData>):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when the player retries the song.
*/
class SongRetryEvent extends ScriptEvent
{
/**
* The new difficulty of the song.
*/

public function new(difficulty:String):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when moving out of or into an FlxState.
*/
class StateChangeScriptEvent extends ScriptEvent
{
/**
* The state the game is moving into.
*/

public function new(type:ScriptEventType, targetState:FlxState, cancelable:Bool = false):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when the game loses or gains focus.
*/
class FocusScriptEvent extends ScriptEvent
{
public function new(type:ScriptEventType):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when a capsule is selected.
*/
class CapsuleScriptEvent extends ScriptEvent
{
/**
* The capsule that was selected.
*/

/**
* The difficulty ID of the selected song.
*/

/**
* The variation ID of the selected song.
*/

public function new(type:ScriptEventType, capsule:SongMenuItem, difficultyId:String, variationId:String):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when Freeplay is entered or exited.
*/
class FreeplayScriptEvent extends ScriptEvent
{
public function new(type:ScriptEventType):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when a character is selected or deselected.
*/
class CharacterSelectScriptEvent extends ScriptEvent
{
/**
* The character ID of the selected character.
*/

public function new(type:ScriptEventType, characterId:String):Void
{
}

public override function toString():String
{
}
}

/**
* An event that is fired when moving out of or into an FlxSubState.
*/
class SubStateScriptEvent extends ScriptEvent
{
/**
* The state the game is moving into.
*/

public function new(type:ScriptEventType, targetState:FlxSubState, cancelable:Bool = false):Void
{
}

public override function toString():String
{
}
}

/**
* An event which is called when the player attempts to pause the game.
*/
class PauseScriptEvent extends ScriptEvent
{
/**
* Whether to use the Gitaroo Man pause.
*/

public function new(gitaroo:Bool):Void
{
}
}
