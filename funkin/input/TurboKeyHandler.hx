

/**
* Handles repeating behavior when holding down a key or key combination.
*
* When the `keys` are pressed, `activated` will be true for the first frame,
* then wait `delay` seconds before becoming true for one frame every `interval` seconds.
*
* Example: Pressing Ctrl+Z will undo, while holding Ctrl+Z will start to undo repeatedly.
*/
class TurboKeyHandler extends FlxBasic
{
/**
* Default delay before repeating.
*/

/**
* Default interval between repeats.
*/

/**
* Whether all of the keys for this handler are pressed.
*/

/**
* Whether all of the keys for this handler are activated,
* and the handler is ready to repeat.
*/



function new(keys:Array<FlxKey>, delay:Float = DEFAULT_DELAY, interval:Float = DEFAULT_INTERVAL)
{
}

function get_allPressed():Bool
{

for (key in keys)
{
}
}

public override function update(elapsed:Float):Void
{

{
{
}
else if (allPressedTime >= (delay + interval))
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
* Builds a TurboKeyHandler that monitors from a single key.
* @param inputKey The key to monitor.
* @param delay How long to wait before repeating.
* @param repeatDelay How long to wait between repeats.
* @return A TurboKeyHandler
*/
public static overload inline extern function build(inputKey:FlxKey, ?delay:Float = DEFAULT_DELAY, ?interval:Float = DEFAULT_INTERVAL):TurboKeyHandler
{
}

/**
* Builds a TurboKeyHandler that monitors a key combination.
* @param inputKeys The combination of keys to monitor.
* @param delay How long to wait before repeating.
* @param repeatDelay How long to wait between repeats.
* @return A TurboKeyHandler
*/
public static overload inline extern function build(inputKeys:Array<FlxKey>, ?delay:Float = DEFAULT_DELAY, ?interval:Float = DEFAULT_INTERVAL):TurboKeyHandler
{
}
}
