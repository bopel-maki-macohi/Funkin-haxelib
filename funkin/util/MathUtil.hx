
/**
* Utilities for performing mathematical operations.
*/
class MathUtil
{
/**
* Euler's constant and the base of the natural logarithm.
* Math.E is not a constant in Haxe, so we'll just define it ourselves.
*/

/**
* Get the logarithm of a value with a given base.
* @param base The base of the logarithm.
* @param value The value to get the logarithm of.
* @return `log_base(value)`
*/
public static function logBase(base:Float, value:Float):Float
{
}

public static function easeInOutCirc(x:Float):Float
{
}

public static function easeInOutBack(x:Float, c:Float = 1.70158):Float
{
}

public static function easeInBack(x:Float, c:Float = 1.70158):Float
{
}

public static function easeOutBack(x:Float, c:Float = 1.70158):Float
{
}

/**
* Get the base-2 exponent of a value.
* @param x value
* @return `2^x`
*/
public static function exp2(x:Float):Float
{
}

/**
* Performs a modulo operation to calculate the remainder of `a` divided by `b`.
*
* this one is similar to GLSL or Python in that it uses Euclidean division, which always returns positive,
* while Haxe's `%` operator uses signed truncated division.
*
* For example, `-5 % 3` returns `-2` while `FlxMath.mod(-5, 3)` returns `1`.
*
* @param a The dividend.
* @param b The divisor.
* @return `a mod b`.
*/
public static function mod(a:Float, b:Float):Float
{
}

/**
* Helper function to get the fractional part of a value.
* @param x value
* @return `x mod 1`.
*/
public static function fract(x:Float):Float
{
}

/**
* Linear interpolation.
*
* @param base The starting value, when `alpha = 0`.
* @param target The ending value, when `alpha = 1`.
* @param alpha The percentage of the interpolation from `base` to `target`. Forms a "line" intersecting the two.
*
* @return The interpolated value.
*/
public static function lerp(base:Float, target:Float, alpha:Float):Float
{
}

/**
* Exponential decay interpolation.
*
* Framerate-independent because the rate-of-change is proportional to the difference, so you can
* use the time elapsed since the last frame as `deltaTime` and the function will be consistent.
*
* Equivalent to `smoothLerpPrecision(base, target, deltaTime, halfLife, 0.5)`.
*
* @param base The starting or current value.
* @param target The value this function approaches.
* @param deltaTime The change in time along the function in seconds.
* @param halfLife Time in seconds to reach halfway to `target`.
*
* @see https://twitter.com/FreyaHolmer/status/1757918211679650262
*
* @return The interpolated value.
*/
public static function smoothLerpDecay(base:Float, target:Float, deltaTime:Float, halfLife:Float):Float
{
}

/**
* Exponential decay interpolation.
*
* Framerate-independent because the rate-of-change is proportional to the difference, so you can
* use the time elapsed since the last frame as `deltaTime` and the function will be consistent.
*
* Equivalent to `smoothLerpDecay(base, target, deltaTime, -duration / logBase(2, precision))`.
*
* @param base The starting or current value.
* @param target The value this function approaches.
* @param deltaTime The change in time along the function in seconds.
* @param duration Time in seconds to reach `target` within `precision`, relative to the original distance.
* @param precision Relative target precision of the interpolation. Defaults to 1% distance remaining.
*
* @see https://twitter.com/FreyaHolmer/status/1757918211679650262
*
* @return The interpolated value.
*/
public static function smoothLerpPrecision(base:Float, target:Float, deltaTime:Float, duration:Float, precision:Float = 1 / 100):Float
{
}

/**
* Snap a value to another if it's within a certain distance (inclusive).
*
* Helpful when using functions like `smoothLerpPrecision` to ensure the value actually reaches the target.
*
* @param base The base value to conditionally snap.
* @param target The target value to snap to.
* @param threshold Maximum distance between the two for snapping to occur.
*
* @return `target` if `base` is within `threshold` of it, otherwise `base`.
*/
public static function snap(base:Float, target:Float, threshold:Float):Float
{
}

/**
* Perform linear interpolation between the base and the target, based on the current framerate.
* @param base The starting value, when `progress <= 0`.
* @param target The ending value, when `progress >= 1`.
* @param ratio Value used to interpolate between `base` and `target`.
*
* @return The interpolated value.
*/
public static function coolLerp(base:Float, target:Float, ratio:Float):Float
{
}

/**
* Perform linear interpolation based on the current framerate.
* @param lerp Value used to interpolate between `base` and `target`.
*
* @return The interpolated value.
*/
public static function cameraLerp(lerp:Float):Float
{
}

/**
* Backwards compatibility for `smoothLerpPrecision`.
*
* Perform a framerate-independent linear interpolation between the base value and the target.
* @param current The current value.
* @param target The target value.
* @param elapsed The time elapsed since the last frame.
* @param duration The total duration of the interpolation. Nominal duration until remaining distance is less than `precision`.
* @param precision The target precision of the interpolation. Defaults to 1% of distance remaining.
* @see https://twitter.com/FreyaHolmer/status/1757918211679650262
*
* @return A value between the current value and the target value.
*/
public static function smoothLerp(current:Float, target:Float, elapsed:Float, duration:Float, precision:Float = 1 / 100):Float
{




}

/**
* GCD stands for Greatest Common Divisor
* It's used in FullScreenScaleMode to prevent weird window resolutions from being counted as wide screen since those were causing issues positioning the game
* It returns the greatest common divisor between m and n
*
* think it's from hxp..?
* @param m
* @param n
* @return Int the common divisor between m and n
*/
public static function gcd(m:Int, n:Int):Int
{
do
{
}
}
