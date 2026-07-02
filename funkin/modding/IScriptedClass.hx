

/**
* Defines a set of callbacks available to all scripted classes.
*
* Includes events handling basic life cycle relevant to all scripted classes.
*/
interface IScriptedClass
{

}

/**
* Defines an element which can receive script events.
* For example, the PlayState dispatches the event to all its child elements.
*/
interface IEventHandler
{
}

/**
* Defines a set of callbacks available to scripted classes which can follow the game between states.
*/
interface IStateChangingScriptedClass extends IScriptedClass
{


}

/**
* Defines a set of callbacks available to scripted classes which can be added to the current state.
* Generally requires the class to be an instance of FlxBasic.
*/
interface IStateStageProp extends IScriptedClass
{
/**
* Called when the relevant element is added to the game state.
*/
}

/**
* Defines a set of callbacks available to scripted classes which represent notes.
*/
interface INoteScriptedClass extends IScriptedClass
{
/**
* Called when a note enters the field of view and approaches the strumline.
*/

/**
* Called when EITHER player hits a note.
* Query the note attached to the event to determine if it was hit by the player or CPU.
*/

/**
* Called when EITHER player (usually the player) misses a note.
*/

/**
* Called when EITHER player (usually the player) drops a hold note.
*/
}

/**
* Defines a set of callbacks available to scripted classes which represent sprites synced with the BPM.
*/
interface IBPMSyncedScriptedClass extends IScriptedClass
{
/**
* Called once every step of the song.
*/

/**
* Called once every beat of the song.
*/
}

/**
* Developer note:
*
* I previously considered adding events for onKeyDown, onKeyUp, mouse events, etc.
* However, I realized that you can simply call something like the following within a module:
* `FlxG.state.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);`
* This is more efficient than adding an entire event handler for every key press.
*
* -Eric
*/
/**
* Defines a set of callbacks available to scripted classes that involve the lifecycle of the Play State.
*/
interface IPlayStateScriptedClass extends INoteScriptedClass extends IBPMSyncedScriptedClass
{
/**
* Called when the game is paused.
* Has properties to set whether the pause easter egg will happen,
* and can be cancelled by scripts.
*/

/**
* Called when the game is unpaused.
*/

/**
* Called when the song has been parsed, before notes have been placed.
* Use this to mutate the chart.
*/

/**
* Called when the song starts (conductor time is 0 seconds).
*/

/**
* Called when the song ends and the song is about to be unloaded.
*/

/**
* Called as the player runs out of health just before the game over substate is entered.
*/

/**
* Called when the player restarts the song, either via pause menu or restarting after a game over.
*/

/**
* Called when the player presses a key when no note is on the strumline.
*/

/**
* Called when the song reaches an event.
*/

/**
* Called when the countdown of the song starts.
*/

/**
* Called when the a part of the countdown happens.
*/

/**
* Called when the countdown of the song ends.
*/
}

/**
* Defines a set of callbacks activated in Freeplay.
*/
interface IFreeplayScriptedClass extends IScriptedClass
{
/**
* Called when a capsule is selected.
*/

/**
* Called when the current difficulty is changed.
*/

/**
* Called when a song is selected.
*/

/**
* Called when the intro for Freeplay finishes.
*/

/**
* Called when the Freeplay outro begins.
*/

/**
* Called when Freeplay is closed.
*/
}

/**
* Defines a set of callbacks activated in Character Select.
*/
interface ICharacterSelectScriptedClass extends IScriptedClass
{
/**
* Called when a character is selected.
*/

/**
* Called when the user presses BACK after confirming a character.
*/

/**
* Called when a character has been confirmed.
*/
}

/**
* Defines a set of callbacks activated during a dialogue conversation.
*/
interface IDialogueScriptedClass extends IScriptedClass
{
/**
* Called as the dialogue starts, and before the first dialogue text is displayed.
*/

}
