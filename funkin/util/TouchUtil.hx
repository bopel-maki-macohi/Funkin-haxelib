//


/**
* Utility class for handling touch input within the FlxG context.
*/
class TouchUtil
{
/**
* Indicates if any touch is currently pressed.
*/

/**
* Indicates if any touch was just pressed this frame.
*/

/**
* Indicates if any touch was just released this frame.
*/

/**
* Indicates if any touch is released this frame.
*/

/**
* Indicates if any touch is moved this frame.
*/

/**
* The first touch in the FlxG.touches list.
*/


/**
* Checks if the specified object overlaps with any active touch.
*
* @param object The FlxBasic object to check for overlap.
* @param camera Optional camera for the overlap check. Defaults to the object's camera.
*
* @return `true` if there is an overlap with any touch; `false` otherwise.
*/
public static function overlaps(?object:FlxBasic, ?camera:FlxCamera):Bool
{


}

/**
* Checks if the specified object overlaps with any active touch using precise point checks.
*
* @param object The FlxObject to check for overlap.
* @param camera Optional camera for the overlap check. Defaults to all cameras of the object.
*
* @return `true` if there is a precise overlap with any touch; `false` otherwise.
*/
public static function overlapsComplex(?object:FlxObject, ?camera:FlxCamera):Bool
{



}

/**
* Checks if the specified object overlaps with a specific point using precise point checks.
*
* @param object The FlxObject to check for overlap.
* @param point The FlxPoint to check against the object.
* @param inScreenSpace Whether to take scroll factors into account when checking for overlap.
* @param camera Optional camera for the overlap check. Defaults to all cameras of the object.
*
* @return `true` if there is a precise overlap with the specified point; `false` otherwise.
*/
public static function overlapsComplexPoint(?object:FlxObject, point:FlxPoint, ?inScreenSpace:Bool = false, ?camera:FlxCamera):Bool
{

{
}


}

/**
* A helper function to check if the selection is pressed using touch.
*
* @param object The optional FlxBasic to check for overlap.
* @param camera Optional camera for the overlap check. Defaults to all cameras of the object.
* @param useOverlapsComplex If true and atleast the object is not null, the function will use complex overlaps method.
*/
public static function pressAction(?object:FlxBasic, ?camera:FlxCamera, useOverlapsComplex:Bool = true):Bool
{

{
}
else if (object != null)
{
}

}







static function get_touch():FlxTouch
{
for (touch in FlxG.touches.list)
{
}

}
static function get_touch():FlxMouse
{
}
}
