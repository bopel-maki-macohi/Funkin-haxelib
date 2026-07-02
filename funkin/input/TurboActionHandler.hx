package funkin.input;


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
static inline final DEFAULT_DELAY:Float = 0.4;

/**
* Default interval between repeats.
*/
static inline final DEFAULT_INTERVAL:Float = 0.1;

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
super();
this.action = action;
this.delay = delay;
this.interval = interval;
this.gamepadOnly = gamepadOnly;
}

function get_pressed():Bool
{
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
{
activated = true;
}
else if (pressedTime >= (delay + interval))
{
activated = true;
pressedTime -= interval;
}
else
{
activated = false;
}
pressedTime += elapsed;
}
else
{
pressedTime = 0;
activated = false;
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
