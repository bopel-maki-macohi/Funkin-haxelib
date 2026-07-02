

/**
* A Utility class to get mobile screen related informations.
*/
class ScreenUtil
{
/**
* Get `Rectangle` Object that contains the dimensions of the screen's Notch.
* Scales the dimensions to return coords in pixels, not points
* @return Rectangle
*/
public static function getNotchRect():Rectangle
{



for (rect in NativeScreenUtil.getCutoutDimensions())
{
}

for (i => dimensions in rectDimensions)
{
for (dimension in dimensions)
{
switch (i)
{
case 0:
case 1:
case 2:
case 3:
}
}
}

NativeScreenUtil.getSafeAreaInsets(cpp.RawPointer.addressOf(topInset), cpp.RawPointer.addressOf(bottomInset), cpp.RawPointer.addressOf(leftInset),

switch (System.getDisplayOrientation(Application.current.window.display))
{
case DISPLAY_ORIENTATION_LANDSCAPE: // landscape
case DISPLAY_ORIENTATION_LANDSCAPE_FLIPPED: // landscape
case DISPLAY_ORIENTATION_PORTRAIT: // portrait
case DISPLAY_ORIENTATION_PORTRAIT_FLIPPED: // portrait
notchRect.y = deviceHeight - notchRect.height; // move notchRect if we are flipped, the notch is at the bottom of screen
default: // display orientation unknown? perhaps this occurs on desktop
}

}
}
