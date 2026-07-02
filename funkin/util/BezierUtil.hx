

/**
* Utilities for performing math with bezier curves.
*/
class BezierUtil
{
/**
* Linearly interpolate between two values.
* Depending on p, 0 = a, 1 = b, 0.5 = halfway between a and b.
*/
static inline function mix2(p:Float, a:Float, b:Float):Float
{
}

/**
* Linearly interpolate between three values.
* Depending on p, 0 = a, 0.5 = b, 1 = c, 0.25 = halfway between a and b, etc.
*/
static inline function mix3(p:Float, a:Float, b:Float, c:Float):Float
{
}

static inline function mix4(p:Float, a:Float, b:Float, c:Float, d:Float):Float
{
}

static inline function mix5(p:Float, a:Float, b:Float, c:Float, d:Float, e:Float):Float
{
}

/**
* A bezier curve with two points.
* This is really just linear interpolation but whatever.
*/
public static function bezier2(p:Float, a:FlxPoint, b:FlxPoint):FlxPoint
{
}

/**
* A bezier curve with three points.
* @param p The percentage of the way through the curve.
* @param a The start point.
* @param b The control point.
* @param c The end point.
*/
public static function bezier3(p:Float, a:FlxPoint, b:FlxPoint, c:FlxPoint):FlxPoint
{
}

/**
* A bezier curve with four points.
* @param p The percentage of the way through the curve.
* @param a The start point.
* @param b The first control point.
* @param c The second control point.
* @param d The end point.
*/
public static function bezier4(p:Float, a:FlxPoint, b:FlxPoint, c:FlxPoint, d:FlxPoint):FlxPoint
{
}

/**
* A bezier curve with four points.
* @param p The percentage of the way through the curve.
* @param a The start point.
* @param b The first control point.
* @param c The second control point.
* @param c The third control point.
* @param d The end point.
*/
public static function bezier5(p:Float, a:FlxPoint, b:FlxPoint, c:FlxPoint, d:FlxPoint, e:FlxPoint):FlxPoint
{
}
}
