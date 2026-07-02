

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


{
}

switch (event.type)
{
case CREATE:
case STATE_CREATE:
{
}
case DESTROY:
case UPDATE:
}

{
switch (event.type)
{
case ADDED:
}
}
else
{
}

{
switch (event.type)
{
case DIALOGUE_START:
case DIALOGUE_LINE:
case DIALOGUE_COMPLETE_LINE:
case DIALOGUE_SKIP:
case DIALOGUE_END:
}
}
else
{
}

{
switch (event.type)
{
case NOTE_INCOMING:
case NOTE_HIT:
case NOTE_MISS:
case NOTE_HOLD_DROP:
}
}
else
{
}

{
switch (event.type)
{
case SONG_BEAT_HIT:
case SONG_STEP_HIT:
}
}
else
{
}

{
switch (event.type)
{
case NOTE_GHOST_MISS:
case SONG_START:
case SONG_END:
case SONG_RETRY:
case GAME_OVER:
case PAUSE:
case RESUME:
case SONG_EVENT:
case COUNTDOWN_START:
case COUNTDOWN_STEP:
case COUNTDOWN_END:
case SONG_LOADED:
}
}
else
{
}

{
switch (event.type)
{
case STATE_CHANGE_BEGIN:
case STATE_CHANGE_END:
case SUBSTATE_OPEN_BEGIN:
case SUBSTATE_OPEN_END:
case SUBSTATE_CLOSE_BEGIN:
case SUBSTATE_CLOSE_END:
case FOCUS_LOST:
case FOCUS_GAINED:
}
}
else
{
}

{
switch (event.type)
{
case CAPSULE_SELECTED:
case DIFFICULTY_SWITCH:
case SONG_SELECTED:
case FREEPLAY_INTRO:
case FREEPLAY_OUTRO:
case FREEPLAY_CLOSE:
}
}
else
{
}

{
switch (event.type)
{
case CHARACTER_SELECTED:
case CHARACTER_DESELECTED:
case CHARACTER_CONFIRMED:
}
}
else
{
}

}

public static function callEventOnAllTargets(targets:Iterator<IScriptedClass>, event:ScriptEvent):Void
{

{
}

for (target in targets)
{


{
}
}
}
}
