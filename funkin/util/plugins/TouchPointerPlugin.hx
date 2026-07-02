package funkin.util.plugins;



/**
* @author moondroidcoder
* Tracks your touch points in your game.
*/
class TouchPointerPlugin extends FlxTypedSpriteGroup<TouchPointer>
{
/**
* Whether the plugin is enabled.
*/

/**
* A singleton instance of the plugin.
*/

/**
* A camera dedicated to displaying the pointers.
*/

public function new()
{
super();
}

/**
* Initializes the TouchPointerPlugin by creating a new camera and setting it up to be drawn on top of other elements.
*/
public static function initialize():Void
{
pointerCamera = new FlxCamera();
pointerCamera.bgColor.alpha = 0;
instance = new TouchPointerPlugin();
instance.cameras = [pointerCamera];


function moveCameraToTop(camera:FlxCamera):Void
{

{
}

{
}

{
}

}


{
{
{
instance.cameras = [pointerCamera = new FlxCamera()];
moveCameraToTop(null);
pointerCamera.bgColor.alpha = 0;
pointerCamera.ID = FlxG.cameras.list.length - 1;
}
else // It's not destroyed so just move it to the top!
{
moveCameraToTop(null);
}
}
else
{
moveCameraToTop(null);
}
});

{
instance.removeAll();
});
}

override public function update(elapsed:Float):Void
{
super.update(elapsed);

for (touch in FlxG.touches.list)
{



{
pointer = recycle(TouchPointer);
pointer.initialize(touch.touchPointID);
add(pointer);
}

pointer.updateFromTouch(touch, pointerCamera);
}

for (pointer in members)
{
{
pointer.alpha = 0.8;
FlxTween.tween(pointer, {alpha: 0}, FlxG.random.float(0.8, 0.9), {
ease: FlxEase.cubeIn,
onComplete: function(_)
{
remove(pointer, true);
}
});
pointer.touchId = -2;
}
}
}

/**
* Finds a TouchPointer object in the members list by its touch ID.
*
* @param touchId The ID of the touch to find.
* @return The TouchPointer object with the specified touch ID, or null if not found.
*/
private function findPointerByTouchId(touchId:Int):TouchPointer
{
for (pointer in members)
{

}
}

/**
* Checks if a touch with the specified ID exists in the current touch list.
*
* @param touchId The ID of the touch to check for.
* @return True if a touch with the specified ID exists, false otherwise.
*/
private function touchExists(touchId:Int):Bool
{
for (touch in FlxG.touches.list)
{

}
}

private static function set_enabled(value:Bool):Bool
{
{
instance.exists = instance.visible = instance.active = instance.alive = value;
}

}

public function removeAll(skipTween:Bool = false)
{
for (pointer in members)
{

{
FlxTween.cancelTweensOf(pointer);
remove(pointer, true);
continue;
}

pointer.alpha = 0.8;
FlxTween.tween(pointer, {alpha: 0}, FlxG.random.float(0.8, 1), {
ease: FlxEase.quadIn,
onComplete: function(_)
{
remove(pointer, true);
}
});
}
}
}

/**
* Represents a touch pointer in the game.
*/
class TouchPointer extends FlxSprite
{
/**
* Represents a touch pointer plugin.
*/

/**
* An internal point for grabbing the view position of the camera.
* Useful for reducing point allocation.
*/

/**
* Stores the last position of the touch pointer.
*/

/**
* Constructor for the TouchPointerPlugin class.
* Initializes the touch pointer graphic and sets the scroll factor.
*/
public function new()
{
super();
makeGraphic(16, 16, FlxColor.RED);
scrollFactor.set(0, 0);
viewPoint = FlxPoint.get();
lastPosition = FlxPoint.get();
}

/**
* Initializes the touch pointer object itself with the specified touch ID.
* Loads the graphic for the touch pointer.
*
* @param touchId The ID of the touch event to initialize.
*/
public function initialize(touchId:Int):Void
{
this.touchId = touchId;
loadGraphic("assets/images/cursor/michael.png");
}

/**
* Updates the position and angle of the touch pointer based on the given touch input.
* Used in TouchPointerPlugin's update method.
*
* @param touch The FlxTouch object containing the current touch input data.
* @param camera The FlxCamera to grab the touch's view position from.
*/
public function updateFromTouch(touch:FlxTouch, camera:FlxCamera):Void
{
touch.getViewPosition(camera, viewPoint);

x = viewPoint.x - width / 2;
y = viewPoint.y - height / 2;

{
x -= camera.target.x;
y -= camera.target.y;
}

{
this.angle = angle;
loadGraphic("assets/images/cursor/kevin.png");
}
else
{
angle = 0;
loadGraphic("assets/images/cursor/michael.png");
}

lastPosition.copyFrom(viewPoint);
}

override public function destroy():Void
{
viewPoint.put();
lastPosition.put();
super.destroy();
}

override public function loadGraphic(graphic:FlxGraphicAsset, animated = false, frameWidth = 0, frameHeight = 0, unique = false, ?key:String):FlxSprite
{
super.loadGraphic(graphic, animated, frameWidth, frameHeight, unique, key);
color = 0xff6666e1;
blend = "screen";
}
}
