
enum abstract ScriptEventType(String) from String to String
{
/**
* Called when the relevant object is created.
* Keep in mind that the constructor may be called before the object is needed,
* for the purposes of caching data or otherwise.
*
* This event is not cancelable.
*/

/**
* Called when the relevant object is fully created and ready to be used.
* This assumes all data is loaded and ready to go.
*
* This event is not cancelable.
*/

/**
* Called when the relevant object is destroyed.
* This should perform relevant cleanup to ensure good performance.
*
* This event is not cancelable.
*/

/**
* Called when the relevant object is added to the game state.
* This assumes all data is loaded and ready to go.
*
* This event is not cancelable.
*/

/**
* Called during the update function.
* This is called every frame, so be careful!
*
* This event is not cancelable.
*/

/**
* Called when the player moves to pause the game.
*
* This event IS cancelable! Canceling the event will prevent the game from pausing.
*/

/**
* Called when the player moves to unpause the game while paused.
*
* This event IS cancelable! Canceling the event will prevent the game from resuming.
*/

/**
* Called once per step in the song. This happens 4 times per measure.
*
* This event is not cancelable.
*/

/**
* Called once per step in the song. This happens 16 times per measure.
*
* This event is not cancelable.
*/

/**
* Called when a note comes on screen and starts approaching the strumline.
*
* This event is not cancelable.
*/

/**
* Called when a character hits a note.
* Important information such as judgement/timing, note data, player/opponent, etc. are all provided.
*
* This event IS cancelable! Canceling this event prevents the note from being hit,
*   and will likely result in a miss later.
*/

/**
* Called when a character misses a note.
* Important information such as note data, player/opponent, etc. are all provided.
*
* This event IS cancelable! Canceling this event prevents the note from being considered missed,
*   avoiding a combo break and lost health.
*/

/**
* Called when a character lets go of a hold note.
* Important information such as note data, player/opponent, etc. are all provided.
*
* This event is not cancelable.
*/

/**
* Called when a character presses a note when there was none there, causing them to lose health.
* Important information such as direction pressed, etc. are all provided.
*
* This event IS cancelable! Canceling this event prevents the note from being considered missed,
*   avoiding lost health/score and preventing the miss animation.
*/

/**
* Called when a song event is reached in the chart.
*
* This event IS cancelable! Cancelling this event prevents the event from being triggered,
*   thus blocking its normal functionality.
*/

/**
* Called when the song starts. This occurs as the countdown ends and the instrumental and vocals begin.
*
* This event is not cancelable.
*/

/**
* Called when the song ends. This happens as the instrumental and vocals end.
*
* This event is not cancelable.
*/

/**
* Called when the countdown begins. This occurs before the song starts.
*
* This event IS cancelable! Canceling this event will prevent the countdown from starting.
* - The song will not start until you call Countdown.performCountdown() later.
* - Note that calling performCountdown() will trigger this event again, so be sure to add logic to ignore it.
*/

/**
* Called when a step of the countdown happens.
* Includes information about what step of the countdown was hit.
*
* This event IS cancelable! Canceling this event will pause the countdown.
* - The countdown will not resume until you call PlayState.resumeCountdown().
*/

/**
* Called when the countdown is done but just before the song starts.
*
* This event is not cancelable.
*/

/**
* Called before the game over screen triggers and the death animation plays.
*
* This event is not cancelable.
*/

/**
* Called after the player presses a key to restart the game.
* This can happen from the pause menu or the game over screen.
*
* This event IS cancelable! Canceling this event will prevent the game from restarting.
*/

/**
* Called when the player pushes down any key on the keyboard.
*
* This event is not cancelable.
*/

/**
* Called when the player releases a key on the keyboard.
*
* This event is not cancelable.
*/

/**
* Called when the game has finished loading the notes from JSON.
* This allows modders to mutate the notes before they are used in the song.
*
* This event is not cancelable.
*/

/**
* Called when the game is about to switch the current FlxState.
*
* This event is not cancelable.
*/

/**
* Called when the game has finished switching the current FlxState.
*
* This event is not cancelable.
*/

/**
* Called when the game is about to open a new FlxSubState.
*
* This event is not cancelable.
*/

/**
* Called when the game has finished opening a new FlxSubState.
*
* This event is not cancelable.
*/

/**
* Called when the game is about to close the current FlxSubState.
*
* This event is not cancelable.
*/

/**
* Called when the game has finished closing the current FlxSubState.
*
* This event is not cancelable.
*/

/**
* Called when the game regains focus.
*
* This event is not cancelable.
*/

/**
* Called when the game loses focus.
*
* This event is not cancelable.
*/

/**
* Called when a freeplay capsule is selected.
*
* This event is not cancelable.
*/

/**
* Called when the current difficulty in Freeplay is changed.
*
* This event is not cancelable.
*/

/**
* Called when a song is selected in Freeplay.
*
* This event is not cancelable.
*/

/**
* Called when the intro for Freeplay finishes.
*
* This event is not cancelable.
*/

/**
* Called when the outro for Freeplay starts.
*
* This event is not cancelable.
*/

/**
* Called when Freeplay is closed.
*
* This event is not cancelable.
*/

/**
* Called when a character is selected, but not confirmed, in Character Select.
*
* This event is not cancelable.
*/

/**
* Called when a character is deselected in Character Select.
*
* This event is not cancelable.
*/

/**
* Called when a character is confirmed in Character Select.
*
* This event is not cancelable.
*/

/**
* Called when the game starts a conversation.
*
* This event is not cancelable.
*/

/**
* Called to display the next line of conversation.
*
* This event IS cancelable! Canceling this event will prevent the conversation from moving to the next line.
* - This event is called when the conversation starts, or when the user presses ACCEPT to advance the conversation.
*/

/**
* Called to skip scrolling the current line of conversation.
*
* This event IS cancelable! Canceling this event will prevent the conversation from skipping to the next line.
* - This event is called when the user presses ACCEPT to advance the conversation while it is already advancing.
*/

/**
* Called to skip the conversation.
*
* This event IS cancelable! Canceling this event will prevent the conversation from skipping.
*/

/**
* Called when the game ends a conversation.
*
* This event is not cancelable.
*/

/**
* Allow for comparing `ScriptEventType` to `String`.
*/
{
}

/**
* Allow for comparing `ScriptEventType` to `String`.
*/
{
}
}
