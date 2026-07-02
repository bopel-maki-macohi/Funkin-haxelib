

/**
* Handles repeating behavior when holding down a control action.
*
* When the `action` is pressed, `activated` will be true for the first frame,
* then wait `delay` seconds before becoming true for one frame every `interval` seconds.
*
* Example: Pressing Ctrl+Z will undo, while holding Ctrl+Z will start to undo repeatedly.
*/
class TurboActionHandler extends FlxBasic
{
/**
* Default delay before repeating.
*/

/**
* Default interval between repeats.
*/

/**
* Whether the action for this handler is pressed.
*/

/**
* Whether the action for this handler is pressed,
* and the handler is ready to repeat.
*/

/**
* The Funkin Controls handler.
*/

function get_controls():Controls
{
}




function new(action:Action, delay:Float = DEFAULT_DELAY, interval:Float = DEFAULT_INTERVAL, gamepadOnly:Bool = false)
{
}

function get_pressed():Bool
{
}

public override function update(elapsed:Float):Void
{

{
{
}
else if (pressedTime >= (delay + interval))
{
}
else
{
}
}
else
{
}
}

/**
* Builds a TurboActionHandler that monitors from a single key.
* @param inputKey The key to monitor.
* @param delay How long to wait before repeating.
* @param repeatDelay How long to wait between repeats.
* @return A TurboActionHandler
*/
public static overload inline extern function build(action:Action, ?delay:Float = DEFAULT_DELAY, ?interval:Float = DEFAULT_INTERVAL,
?gamepadOnly:Bool = false):TurboActionHandler
{
}
}
