package funkin.util;


/**
* Utility functions related to the mouse.
*/
class MouseUtil
{

/**
* Used to be for general camera middle click dragging, now generalized for any click and drag type shit!
* Listen I don't make the rules here
* @param target what you want to be dragged, defaults to CAMERA SCROLL
* @param jusPres the "justPressed", should be a button of some sort
* @param pressed the "pressed", which should be the same button as `jusPres`
*/
public static function mouseCamDrag(?target:FlxPoint, ?jusPres:Bool, ?pressed:Bool):Void
{



{
oldCamPos.set(target.x, target.y);
oldMousePos.set(FlxG.mouse.viewX, FlxG.mouse.viewY);
}

{
target.x = oldCamPos.x - (FlxG.mouse.viewX - oldMousePos.x);
target.y = oldCamPos.y - (FlxG.mouse.viewY - oldMousePos.y);
}
}

/**
* Increment the zoom level of the current camera by the mouse wheel scroll value.
*/
public static function mouseWheelZoom():Void
{
}
}
