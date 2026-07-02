package funkin.mobile.ui;


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
super(x, y);

status = FunkinButtonStatus.NORMAL;
solid = false;
immovable = true;
ignoreDrawDebug = true;
scrollFactor.set();
input = new FlxInput(0);
}

/**
* Called by the game state when the state is changed (if this object belongs to the state).
*/
public override function destroy():Void
{
deadZones = FlxDestroyUtil.destroyArray(deadZones);
currentInput = null;
input = null;

buttonsTouchID.remove(touchID);

touchID = -1;

super.destroy();
}

/**
* Called by the game loop automatically, handles touch over and click detection.
*/
public override function update(elapsed:Float):Void
{
super.update(elapsed);

{

{
onUpHandler();
}

{
}
}

input.update();
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
touchID = touch.touchPointID;
{

}
buttonsTouchID.set(touchID, this);

updateStatus(touch);
}

{
{
updateTouchID();
}
}
else if (radius > 0)
{
{
updateTouchID();
}
}
else
{
{
updateTouchID();
}
}
}
}

}

function circleOverlapsPoint(point:FlxPoint, ?camera:FlxCamera):Bool
{

getScreenPosition(_point, camera);
point.putWeak();


}

function polygonOverlapsPoint(point:FlxPoint, inScreenSpace:Bool = false, ?camera:FlxCamera):Bool
{




point.putWeak();

}

static function isPointInPolygon(vertices:Array<Float>, point:FlxPoint, ?offset:FlxPoint):Bool
{



for (i in 0...numsPoints)
{

{
inside = !inside;
}
}

point.putWeak();
offset.putWeak();

}

static inline function checkRayIntersection(vertex1:FlxPoint, vertex2:FlxPoint, point:FlxPoint):Bool
{
&& point.x < (vertex1.x + ((point.y - vertex1.y) / (vertex2.y - vertex1.y)) * (vertex2.x - vertex1.x));

vertex1.putWeak();
vertex2.putWeak();

}

function isPressed(check:Bool):Bool
{
}

function updateStatus(newInput:IFlxInput):Void
{
{
currentInput = newInput;

onDownHandler();
}
else if (status == FunkinButtonStatus.NORMAL && !ignoreDownHandler)
{
{
onDownHandler();
}
}
}

function onUpHandler():Void
{
status = FunkinButtonStatus.NORMAL;

input.release();

buttonsTouchID.remove(touchID);

touchID = -1;

currentInput = null;

onUp.dispatch();
}

function onDownHandler():Void
{
status = FunkinButtonStatus.PRESSED;

input.press();

onDown.dispatch();
}

function onOutHandler():Void
{
status = FunkinButtonStatus.NORMAL;

input.release();

buttonsTouchID.remove(touchID);

touchID = -1;

onOut.dispatch();
}

public override function drawDebugOnCamera(camera:FlxCamera):Void
{
{

getScreenPosition(_point, camera);




endDrawDebug(camera);
}
else if (radius > 0)
{

getScreenPosition(_point, camera);




endDrawDebug(camera);
}
else
{
super.drawDebugOnCamera(camera);
}
}

function drawDebugCircleColor(gfx:Graphics, color:FlxColor):Void
{
gfx.lineStyle(2, color, 0.75);
gfx.drawCircle(radius, radius, radius);
}

function drawDebugPolygonColor(gfx:Graphics, vertices:Array<Float>, color:FlxColor):Void
{
gfx.lineStyle(2, color, 0.75);

for (i in 0...Math.floor(vertices.length / 2))
{
{
gfx.moveTo(vertices[i * 2] + _point.x, vertices[i * 2 + 1] + _point.y);
}
else
{
gfx.lineTo(vertices[i * 2] + _point.x, vertices[i * 2 + 1] + _point.y);
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
