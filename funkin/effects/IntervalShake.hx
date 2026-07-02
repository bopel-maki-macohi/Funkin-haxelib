package funkin.effects;


/**
* pretty much a copy of FlxFlicker geared towards making sprites
* shake around at a set interval and slow down over time.
*/
class IntervalShake implements IFlxDestroyable
{

/**
* Internal map for looking up which objects are currently shaking and getting their shake data.
*/

/**
* An effect that shakes the sprite on a set interval and a starting intensity that goes down over time.
*
* @param   Object               The object to shake.
* @param   Duration             How long to shake for (in seconds). `0` means "forever".
* @param   Interval             In what interval to update the shake position. Set to `FlxG.elapsed` if `<= 0`!
* @param   StartIntensity       The starting intensity of the shake.
* @param   EndIntensity         The ending intensity of the shake.
* @param   Ease                 Control the easing of the intensity over the shake.
* @param   CompletionCallback   Callback on shake completion
* @param   ProgressCallback     Callback on each shake interval
* @return The `IntervalShake` object. `IntervalShake`s are pooled internally, so beware of storing references.
*/
public static function shake(Object:FlxObject, Duration:Float = 1, Interval:Float = 0.04, StartIntensity:Float = 0, EndIntensity:Float = 0,
Ease:EaseFunction, ?CompletionCallback:IntervalShake->Void, ?ProgressCallback:IntervalShake->Void):IntervalShake
{
{
}

{
Interval = FlxG.elapsed;
}

shake.start(Object, Duration, Interval, StartIntensity, EndIntensity, Ease, CompletionCallback, ProgressCallback);
}

/**
* Returns whether the object is shaking or not.
*
* @param   Object The object to test.
*/
public static function isShaking(Object:FlxObject):Bool
{
}

/**
* Stops shaking the object.
*
* @param   Object The object to stop shaking.
*/
public static function stopShaking(Object:FlxObject):Void
{
{
boundShake.stop();
}
}

/**
* The shaking object.
*/

/**
* The shaking timer. You can check how many seconds has passed since shaking started etc.
*/

/**
* The starting intensity of the shake.
*/

/**
* The ending intensity of the shake.
*/

/**
* How long to shake for (in seconds). `0` means "forever".
*/

/**
* The interval of the shake.
*/

/**
* Defines on what axes to `shake()`. Default value is `XY` / both.
*/

/**
* Defines the initial position of the object at the beginning of the shake effect.
*/

/**
* The callback that will be triggered after the shake has completed.
*/

/**
* The callback that will be triggered every time the object shakes.
*/

/**
* The easing of the intensity over the shake.
*/

/**
* Nullifies the references to prepare object for reuse and avoid memory leaks.
*/
public function destroy():Void
{
object = null;
timer = null;
ease = null;
completionCallback = null;
progressCallback = null;
}

/**
* Starts shaking behavior.
*/
function start(Object:FlxObject, Duration:Float = 1, Interval:Float = 0.04, StartIntensity:Float = 0, EndIntensity:Float = 0, Ease:EaseFunction,
?CompletionCallback:IntervalShake->Void, ?ProgressCallback:IntervalShake->Void):Void
{
object = Object;
duration = Duration;
interval = Interval;
completionCallback = CompletionCallback;
startIntensity = StartIntensity;
endIntensity = EndIntensity;
initialOffset = new FlxPoint(Object.x, Object.y);
ease = Ease;
axes = FlxAxes.XY;
_secondsSinceStart = 0;
timer = new FlxTimer().start(interval, shakeProgress, Std.int(duration / interval));
}

/**
* Prematurely ends shaking.
*/
public function stop():Void
{
timer.cancel();
object.x = initialOffset.x;
object.y = initialOffset.y;
release();
}

/**
* Unbinds the object from shaking and releases it into pool for reuse.
*/
function release():Void
{
_boundObjects.remove(object);
_pool.put(this);
}



/**
* Just a helper function for shake() to update object's position.
*/
function shakeProgress(timer:FlxTimer):Void
{
_secondsSinceStart += interval;
scale = _secondsSinceStart / duration;
{
scale = 1 - ease(scale);
}

curIntensity = FlxMath.lerp(endIntensity, startIntensity, scale);




{
object.x = initialOffset.x;
object.y = initialOffset.y;
{
completionCallback(this);
}

}
}

/**
* Internal constructor. Use static methods.
*/
function new()
{
}
}
