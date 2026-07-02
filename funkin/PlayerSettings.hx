

/**
* A core class which represents the current player(s) and their controls and other configuration.
*/
class PlayerSettings
{


/**
* The player number associated with this settings object.
*/

/**
* The controls handler for this player.
*/

/**
* Return the PlayerSettings for the given player number, or `null` if that player isn't active.
*
* @param id The player number this represents.
* @return The PlayerSettings for the given player number, or `null` if that player isn't active.
*/
public static function get(id:Int):Null<PlayerSettings>
{
{
}

/**
* Initialize the PlayerSettings singletons for each player.
*/
public static function init():Void
{
{
}


for (i in 0...numGamepads)
{
}
}

/**
* Forcibly destroy the PlayerSettings singletons for each player.
*/
public static function reset():Void
{
}

/**
* Callback invoked when a gamepad is added.
* @param gamepad The gamepad that was added.
*/
static function onGamepadAdded(gamepad:FlxGamepad):Void
{
}

/**
* @param id The player number this represents. This was refactored to START AT `1`.
*/
function new(id:Int)
{


}

function addKeyboard():Void
{
{
}
else
{
}

{
}

PreciseInputManager.instance.initializeKeys(controls);
}

/**
* Called after an FlxGamepad has been detected.
* @param gamepad The gamepad that was detected.
*/
function addGamepad(gamepad:FlxGamepad):Void
{
{
}
else
{
}

{
}
PreciseInputManager.instance.initializeButtons(controls, gamepad);
}

/**
* Save this player's controls to the game's persistent save.
*/
public function saveControls():Void
{
{
Save.instance.setControls(id, Keys, keyData);
}

{
{
Save.instance.setControls(id, Gamepad(controls.gamepadsAdded[0]), padData);
}
}
}
}
