package funkin.modding.events;


/**
* Utility functions to assist with handling scripted classes.
*/
class ScriptEventDispatcher
{
/**
* Invoke the given event hook on the given scripted class.
* @param target The target class to call script hooks on.
* @param event The event, which determines the script hook to call and provides parameters for it.
*/
public static function callEvent(target:Null<IScriptedClass>, event:ScriptEvent):Void
{

target.onScriptEvent(event);

{
}

switch (event.type)
{
case CREATE:
target.onCreate(event);
case STATE_CREATE:
{
t.onStateCreate(event);
}
case DESTROY:
target.onDestroy(event);
case UPDATE:
target.onUpdate(cast event);
default: // Continue;
}

{
switch (event.type)
{
case ADDED:
t.onAdd(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case DIALOGUE_START:
t.onDialogueStart(cast event);
case DIALOGUE_LINE:
t.onDialogueLine(cast event);
case DIALOGUE_COMPLETE_LINE:
t.onDialogueCompleteLine(cast event);
case DIALOGUE_SKIP:
t.onDialogueSkip(cast event);
case DIALOGUE_END:
t.onDialogueEnd(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case NOTE_INCOMING:
t.onNoteIncoming(cast event);
case NOTE_HIT:
t.onNoteHit(cast event);
case NOTE_MISS:
t.onNoteMiss(cast event);
case NOTE_HOLD_DROP:
t.onNoteHoldDrop(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case SONG_BEAT_HIT:
t.onBeatHit(cast event);
case SONG_STEP_HIT:
t.onStepHit(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case NOTE_GHOST_MISS:
t.onNoteGhostMiss(cast event);
case SONG_START:
t.onSongStart(event);
case SONG_END:
t.onSongEnd(event);
case SONG_RETRY:
t.onSongRetry(cast event);
case GAME_OVER:
t.onGameOver(event);
case PAUSE:
t.onPause(cast event);
case RESUME:
t.onResume(event);
case SONG_EVENT:
t.onSongEvent(cast event);
case COUNTDOWN_START:
t.onCountdownStart(cast event);
case COUNTDOWN_STEP:
t.onCountdownStep(cast event);
case COUNTDOWN_END:
t.onCountdownEnd(cast event);
case SONG_LOADED:
t.onSongLoaded(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case STATE_CHANGE_BEGIN:
t.onStateChangeBegin(cast event);
case STATE_CHANGE_END:
t.onStateChangeEnd(cast event);
case SUBSTATE_OPEN_BEGIN:
t.onSubStateOpenBegin(cast event);
case SUBSTATE_OPEN_END:
t.onSubStateOpenEnd(cast event);
case SUBSTATE_CLOSE_BEGIN:
t.onSubStateCloseBegin(cast event);
case SUBSTATE_CLOSE_END:
t.onSubStateCloseEnd(cast event);
case FOCUS_LOST:
t.onFocusLost(cast event);
case FOCUS_GAINED:
t.onFocusGained(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case CAPSULE_SELECTED:
t.onCapsuleSelected(cast event);
case DIFFICULTY_SWITCH:
t.onDifficultySwitch(cast event);
case SONG_SELECTED:
t.onSongSelected(cast event);
case FREEPLAY_INTRO:
t.onFreeplayIntroDone(cast event);
case FREEPLAY_OUTRO:
t.onFreeplayOutro(cast event);
case FREEPLAY_CLOSE:
t.onFreeplayClose(cast event);
default: // Continue;
}
}
else
{
}

{
switch (event.type)
{
case CHARACTER_SELECTED:
t.onCharacterSelect(cast event);
case CHARACTER_DESELECTED:
t.onCharacterDeselect(cast event);
case CHARACTER_CONFIRMED:
t.onCharacterConfirm(cast event);
default: // Continue;
}
}
else
{
}

throw 'No corresponding function called for dispatched event type: ${event.type}';
}

public static function callEventOnAllTargets(targets:Iterator<IScriptedClass>, event:ScriptEvent):Void
{

{
}

for (target in targets)
{

callEvent(t, event);

{
}
}
}
}
