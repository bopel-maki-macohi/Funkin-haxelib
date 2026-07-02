

/**
* Handles setting up and managing input controls for the game.
*/
class ControlsHandler
{
/**
* Returns wether the last input was sent through touch.
*/

/**
* Returns wether there's a gamepad or keyboard devices connected and active.
*/

/**
* Returns wether an external input device is currently used as the main input.
*/

/**
* Initialize input trackers used to get the current status of the `lastInputTouch` field.
*/
public static function initInputTrackers():Void
{
}

/**
* Adds a button input to a given FlxActionDigital and caches it.
*
* @param action The FlxActionDigital to add the button input to.
* @param button The FunkinButton associated with the action.
* @param state The input state to associate with the action.
* @param cachedInput The array of FlxActionInput objects to cache the input.
*/
public static function addButton(action:FlxActionDigital, button:FunkinButton, state:FlxInputState, cachedInput:Array<FlxActionInput>):Void
{

}

/**
* Sets up hitbox controls based on game controls and hitbox hints.
*
* @param controls The controls instance defining game controls.
* @param hitbox The hitbox to associate with the controls.
* @param cachedInput The array of action input objects to cache the input.
*/
public static function setupHitbox(controls:Controls, hitbox:FunkinHitbox, cachedInput:Array<FlxActionInput>):Void
{

for (hint in hitbox.members)
{
switch (hint.noteDirection)
{
case NoteDirection.LEFT:
controls.forEachBound(Control.NOTE_LEFT, function(action:FlxActionDigital, state:FlxInputState):Void
{
case NoteDirection.DOWN:
controls.forEachBound(Control.NOTE_DOWN, function(action:FlxActionDigital, state:FlxInputState):Void
{
case NoteDirection.UP:
controls.forEachBound(Control.NOTE_UP, function(action:FlxActionDigital, state:FlxInputState):Void
{
case NoteDirection.RIGHT:
controls.forEachBound(Control.NOTE_RIGHT, function(action:FlxActionDigital, state:FlxInputState):Void
{
}
}
}

/**
* Removes cached input associated with game controls.
*
* @param controls The Controls instance defining game controls.
* @param cachedInput The array of action input objects to clear cached input from.
*/
public static function removeCachedInput(controls:Controls, cachedInput:Array<FlxActionInput>):Void
{
for (action in controls.digitalActions)
{

{

{
{
}
}
}
}
}

private static function get_hasExternalInputDevice():Bool
{
|| KeyboardUtil.keyboardConnected
}

private static function get_usingExternalInputDevice():Bool
{
}
}
