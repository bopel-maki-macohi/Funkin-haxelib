

class FullScreenScaleMode extends flixel.system.scaleModes.BaseScaleMode
{
/**
* The size of the screen cutout (e.g., for notches or camera cutouts).
*/

/**
* The position of the notch on the screen.
*/

/**
* The size of the notch on the screen.
*/

/**
* The size of the game in screen resolution relativly to the initial size.
* eg: If screen is 1080p and initial size of the game is 1280x720 then this is 1920x1080.
*/

/**
* The maximum aspect ratio a screen can have.
*/

/**
* The maximum ratio axis indicating on which axis the black bar will be added.
*/

/**
* The aspect ratio of the game screen.
*/

/**
* The size of the game cutout.
*/

/**
* The position of the notch in game coordinates.
*/

/**
* The size of the notch in game coordinates.
*/

/**
* The aspect ratio of the window.
*/

/**
* The scale factor for the window.
*/

/**
* Axis used to determine the ratio (X or Y).
*/

/**
* Singleton instance of the `FullScreenScaleMode`.
*/

/**
* Whether fullscreen scaling is enabled.
*/

/**
* Wether fake cutouts are added to the screen.
*/





/**
* Constructor for `FullScreenScaleMode`.
*
* @param enable Whether fullscreen scaling should be enabled by default.
*/
public function new(enable:Bool = true):Void
{

instance = this;


}

/**
* Measures and adjusts the game layout based on the provided screen width and height.
* @param Width The width of the screen.
* @param Height The height of the screen.
*/
override public function onMeasure(Width:Int, Height:Int):Void
{
{
}
else
{
}
}

/**
* Locks the game to the current aspect ratio and assignes the requested resolution as awaited for later.
* @param Width The width of the screen.
* @param Height The height of the screen.
*/
public function onMeasureAwait(Width:Int, Height:Int):Void
{


}

/**
* Unlock the game resolution and swap into the awaited one.
*/
public function onMeasurePostAwait():Void
{


}

/**
* Instantly apply the measured resolution to the game
* @param Width The width of the screen.
* @param Height The height of the screen.
*/
public function onMeasureInstant(Width:Int, Height:Int):Void
{



}

/**
* Add fake cutouts into the screen.
* Useful for when switching from wide display into 16:9 seamlessly and directly is needed.
* @param tweenDuration The duration of the tweens that adds the cutout bars. Using 0 will instantly put them on screen.
* @param ease The function that's used for the tween.
*/
public static function addCutouts(tweenDuration:Float = 0.0, ?ease:Float->Float):Void
{
{
}

for (i => bitmap in cutoutBitmaps)
{
{

cutoutBitmaps[i] = bitmap = new Bitmap(new BitmapData((ratioAxis == X ? Math.ceil(cutoutSize.x / 2) : Math.ceil(FlxG.scaleMode.gameSize.x)) + 1,
}


{
bitmap.x = instance.offset.x + ((i == 0) ? -bitmap.width - 1 : FlxG.scaleMode.gameSize.x + 1);
targetX = instance.offset.x + ((i == 0) ? -1 : FlxG.scaleMode.gameSize.x - bitmap.width + 1);
}
else
{
bitmap.y = instance.offset.y + ((i == 0) ? -bitmap.height - 1 : FlxG.scaleMode.gameSize.y + 1);
targetY = instance.offset.y + ((i == 0) ? -1 : FlxG.scaleMode.gameSize.y - bitmap.height + 1);
}


{
}
else
{
}
}
}

/**
* Remove the fake cutouts from the screen.
* Used to go back from 16:9 into widescreen seamlessly and directly when needed.
* @param tweenDuration The duration of the tweens that remove the cutout bars. Using 0 will instantly put them off screen.
* @param ease The function that's used for the tween.
*/
public static function removeCutouts(tweenDuration:Float = 0.0, ?ease:Float->Float):Void
{
for (i => bitmap in cutoutBitmaps)
{
{
}


{
}
else
{
}
}
}

private function updateDeviceCutout(Width:Int, Height:Int):Void
{
{
}
else
{
}
}

override public function updateGameSize(Width:Int, Height:Int):Void
{


{
}
else
{
}
}

override public function updateScaleOffset():Void
{
{
}
else
{

else
}
}

override function updateOffsetX():Void
{
offset.x = switch (horizontalAlign)
{
case FlxHorizontalAlign.LEFT:
case FlxHorizontalAlign.CENTER:
case FlxHorizontalAlign.RIGHT:
}
}

override function updateOffsetY():Void
{
offset.y = switch (verticalAlign)
{
case FlxVerticalAlign.TOP:
case FlxVerticalAlign.CENTER:
case FlxVerticalAlign.BOTTOM:
}
}

private function updateDeviceNotch(notch:openfl.geom.Rectangle):Void
{

{
}
else
{
}
}

public function reset():Void
{
}

private function adjustGameSize():Void
{
{

{

{
}

{



}


}
else
{

{
}

{



}


}
}
}

private static function set_enabled(Value:Bool):Bool
{
&& (extension.androidtools.os.Build.VERSION.SDK_INT >= extension.androidtools.os.Build.VERSION_CODES.P
|| extension.androidtools.Tools.isTablet()) #end)
{
}
else
{
}

{
instance.horizontalAlign = enabled ? LEFT : CENTER;
instance.verticalAlign = enabled ? TOP : CENTER;
instance.onMeasure(FlxG.stage.stageWidth, FlxG.stage.stageHeight);

}

}
}
