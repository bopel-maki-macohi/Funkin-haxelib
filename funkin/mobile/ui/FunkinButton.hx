

/**
* Enum representing the status of the button.
*/
enum abstract FunkinButtonStatus(Int) from Int to Int
{
}

/**
* A simple button class that calls a function when touched.
*/
class FunkinButton extends FunkinSprite implements IFlxInput
{
/**
* A map that's storing every active touch's ID that's pressing a button.
*/

/**
* The current state of the button, either `FunkinButtonStatus.NORMAL` or `FunkinButtonStatus.PRESSED`.
*/

/**
* The callback function to call when the button is released.
*/

/**
* The callback function to call when the button is pressed down.
*/

/**
* The callback function to call when the button is no longer hovered over.
*/

/**
* Whether the button was just released.
*/

/**
* Whether the button is currently released.
*/

/**
* Whether the button is currently pressed.
*/

/**
* Whether the button was just pressed.
*/

/**
* The touch instance that pressed this button.
*/

/**
* An array of objects that blocks your input.
*/

/**
* Whether the button should be released if you swiped over somwhere else.
*/

/**
* A radius for circular buttons.
* If this radius is larger than 0 then the overlap check will look if the touch point is inside this raius.
*/

/**
* The vertices of the polygon defining the button's hitbox.
* The array should contain points in the format: [x1, y1, x2, y2, ...].
* If the array is empty, the polygon is ignored, and the default hitbox is used.
*/

/**
* The input associated with the button, using `Int` as the type.
*/

/**
* The input currently pressing this button, if none, it's `null`.
* Needed to check for its release.
*/

/**
* The ID of the touch object that pressed this button.
*/

/**
* Whether the button should skip calling onDownHandler() on touch.pressed.
*/

/**
* Creates a new `FunkinButton` object.
*
* @param x The x position of the button.
* @param y The y position of the button.
*/
public function new(x:Float = 0, y:Float = 0):Void
{

}

/**
* Called by the game state when the state is changed (if this object belongs to the state).
*/
public override function destroy():Void
{



}

/**
* Called by the game loop automatically, handles touch over and click detection.
*/
public override function update(elapsed:Float):Void
{

{

{
}

{
}
}

}

function checkTouchOverlap(?touch:FlxTouch):Bool
{

for (camera in cameras)
{
for (touch in touches)
{

for (zone in deadZones)
{
}

function updateTouchID():Void
{
{

}

}

{
{
}
}
else if (radius > 0)
{
{
}
}
else
{
{
}
}
}
}

}

function circleOverlapsPoint(point:FlxPoint, ?camera:FlxCamera):Bool
{



}

function polygonOverlapsPoint(point:FlxPoint, inScreenSpace:Bool = false, ?camera:FlxCamera):Bool
{





}

static function isPointInPolygon(vertices:Array<Float>, point:FlxPoint, ?offset:FlxPoint):Bool
{



for (i in 0...numsPoints)
{

{
}
}


}

static inline function checkRayIntersection(vertex1:FlxPoint, vertex2:FlxPoint, point:FlxPoint):Bool
{


}

function isPressed(check:Bool):Bool
{
}

function updateStatus(newInput:IFlxInput):Void
{
{

}
else if (status == FunkinButtonStatus.NORMAL && !ignoreDownHandler)
{
{
}
}
}

function onUpHandler():Void
{





}

function onDownHandler():Void
{


}

function onOutHandler():Void
{




}

public override function drawDebugOnCamera(camera:FlxCamera):Void
{
{





}
else if (radius > 0)
{





}
else
{
}
}

function drawDebugCircleColor(gfx:Graphics, color:FlxColor):Void
{
}

function drawDebugPolygonColor(gfx:Graphics, vertices:Array<Float>, color:FlxColor):Void
{

for (i in 0...Math.floor(vertices.length / 2))
{
{
}
else
{
}
}
}

inline function get_justReleased():Bool
{
}

inline function get_released():Bool
{
}

inline function get_pressed():Bool
{
}

inline function get_justPressed():Bool
{
}

inline function get_currentTouch():Null<FlxTouch>
{
}
}
