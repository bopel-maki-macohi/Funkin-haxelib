package funkin.mobile.util;


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

notchRect.x = 0.0;
notchRect.y = 0.0;


for (rect in NativeScreenUtil.getCutoutDimensions())
{
rectDimensions[0].push(rect.x);
rectDimensions[1].push(rect.y);
rectDimensions[2].push(rect.width);
rectDimensions[3].push(rect.height);
}

for (i => dimensions in rectDimensions)
{
for (dimension in dimensions)
{
switch (i)
{
case 0:
notchRect.x += dimension;
case 1:
notchRect.y += dimension;
case 2:
notchRect.width += dimension;
case 3:
notchRect.height += dimension;
}
}
}

NativeScreenUtil.getSafeAreaInsets(cpp.RawPointer.addressOf(topInset), cpp.RawPointer.addressOf(bottomInset), cpp.RawPointer.addressOf(leftInset),
cpp.RawPointer.addressOf(rightInset));
NativeScreenUtil.getScreenSize(cpp.RawPointer.addressOf(deviceWidth), cpp.RawPointer.addressOf(deviceHeight));

switch (System.getDisplayOrientation(Application.current.window.display))
{
case DISPLAY_ORIENTATION_LANDSCAPE: // landscape
notchRect.width = leftInset;
notchRect.height = deviceHeight;
case DISPLAY_ORIENTATION_LANDSCAPE_FLIPPED: // landscape
notchRect.width = leftInset;
notchRect.height = deviceHeight;
notchRect.x = deviceWidth - rightInset;
case DISPLAY_ORIENTATION_PORTRAIT: // portrait
notchRect.width = deviceWidth;
notchRect.height = topInset;
case DISPLAY_ORIENTATION_PORTRAIT_FLIPPED: // portrait
notchRect.width = deviceWidth;
notchRect.height = bottomInset;
notchRect.y = deviceHeight - notchRect.height; // move notchRect if we are flipped, the notch is at the bottom of screen
default: // display orientation unknown? perhaps this occurs on desktop
}

}
}
