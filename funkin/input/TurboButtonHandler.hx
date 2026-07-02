package funkin.input;


/**
* Handles repeating behavior when holding down a gamepad button or button combination.
*
* When the `inputs` are pressed, `activated` will be true for the first frame,
* then wait `delay` seconds before becoming true for one frame every `interval` seconds.
*
* Example: Pressing Ctrl+Z will undo, while holding Ctrl+Z will start to undo repeatedly.
*/
class TurboButtonHandler extends FlxBasic
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
* Whether all of the keys for this handler are pressed.
*/

/**
* Whether all of the keys for this handler are activated,
* and the handler is ready to repeat.
*/



function new(inputs:Array<FlxGamepadInputID>, delay:Float = DEFAULT_DELAY, interval:Float = DEFAULT_INTERVAL, ?targetGamepad:FlxGamepad)
{
super();
this.inputs = inputs;
this.delay = delay;
this.interval = interval;
this.targetGamepad = targetGamepad ?? FlxG.gamepads.firstActive;
}

function get_allPressed():Bool
{

for (input in inputs)
{
}
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

{
targetGamepad = FlxG.gamepads.firstActive;
}

{
{
activated = true;
}
else if (allPressedTime >= (delay + interval))
{
activated = true;
allPressedTime -= interval;
}
else
{
activated = false;
}
allPressedTime += elapsed;
}
else
{
allPressedTime = 0;
activated = false;
}
}

/**
* Builds a TurboButtonHandler that monitors from a single input.
* @param input The input to monitor.
* @param delay How long to wait before repeating.
* @param repeatDelay How long to wait between repeats.
* @return A TurboKeyHandler
*/
public static overload inline extern function build(input:FlxGamepadInputID, ?delay:Float = DEFAULT_DELAY,
?interval:Float = DEFAULT_INTERVAL):TurboButtonHandler
{
}

/**
* Builds a TurboKeyHandler that monitors a key combination.
* @param inputs The combination of inputs to monitor.
* @param delay How long to wait before repeating.
* @param repeatDelay How long to wait between repeats.
* @return A TurboKeyHandler
*/
public static overload inline extern function build(inputs:Array<FlxGamepadInputID>, ?delay:Float = DEFAULT_DELAY,
?interval:Float = DEFAULT_INTERVAL):TurboButtonHandler
{
}
}
