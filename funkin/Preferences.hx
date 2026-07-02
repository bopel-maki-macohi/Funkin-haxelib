
/**
* A core class which provides a store of user-configurable, globally relevant values.
*/
class Preferences
{
/**
* FPS
* Always the refresh rate of the display on mobile, or 60 on web.
* @default `60`
*/

static function get_framerate():Int
{


}

static function set_framerate(value:Int):Int
{



{
}

}

/**
* Whether some particularly foul language is displayed.
* @default `true`
*/

static function get_naughtyness():Bool
{
}

static function set_naughtyness(value:Bool):Bool
{
}

/**
* If enabled, the strumline is at the bottom of the screen rather than the top.
* @default `false`
*/

static function get_downscroll():Bool
{
}

static function set_downscroll(value:Bool):Bool
{
}

/**
* If disabled, flashing lights in the main menu and other areas will be less intense.
* @default `true`
*/

static function get_flashingLights():Bool
{
}

static function set_flashingLights(value:Bool):Bool
{
}

/**
* If disabled, the camera bump synchronized to the beat.
* @default `false`
*/

static function get_zoomCamera():Bool
{
}

static function set_zoomCamera(value:Bool):Bool
{
}

/**
* If enabled, an FPS and memory counter will be displayed even if this is not a debug build.
* Always disabled on release mobile builds.
* @default `Off`
*/

static function get_debugDisplay():DebugDisplayMode
{
{
}
}

static function set_debugDisplay(value:DebugDisplayMode):DebugDisplayMode
{

}

/**
* Opacity of the debug display's background.
* @default `50`
*/

static function get_debugDisplayBGOpacity():Int
{
}

static function set_debugDisplayBGOpacity(value:Int):Int
{

}

/**
* If enabled, haptic feedback will be enabled.
* @default `All`
*/

static function get_hapticsMode():HapticsMode
{

{
case "None":
case "Notes Only":
default:
}

static function set_hapticsMode(value:HapticsMode):HapticsMode
{

switch (value)
{
case HapticsMode.NONE:
case HapticsMode.NOTES_ONLY:
default:

}

/**
* Multiplier of intensity for all the haptic feedback effects.
* @default `2.5`
*/

static function get_hapticsIntensityMultiplier():Float
{
}

static function set_hapticsIntensityMultiplier(value:Float):Float
{
}

/**
* If enabled, the game will automatically pause when tabbing out.
* Always enabled on mobile.
* @default `true`
*/

static function get_autoPause():Bool
{
}

static function set_autoPause(value:Bool):Bool
{

}

/**
* If enabled, the game will automatically launch in fullscreen on startup.
* @default `true`
*/

static function get_autoFullscreen():Bool
{
}

static function set_autoFullscreen(value:Bool):Bool
{
}

/**
* A global audio offset in milliseconds.
* This is used to sync the audio.
* @default `0`
*/

static function get_globalOffset():Int
{
}

static function set_globalOffset(value:Int):Int
{
}

/**
* If enabled, the game will utilize VSync (or adaptive VSync) on startup.
* @default `OFF`
*/

static function get_vsyncMode():lime.ui.WindowVSyncMode
{

{
case "Off":
case "On":
case "Adaptive":
default:
}

static function set_vsyncMode(value:lime.ui.WindowVSyncMode):lime.ui.WindowVSyncMode
{

switch (value)
{
case lime.ui.WindowVSyncMode.OFF:
case lime.ui.WindowVSyncMode.ON:
case lime.ui.WindowVSyncMode.ADAPTIVE:
default:


}


static function get_unlockedFramerate():Bool
{
}

static function set_unlockedFramerate(value:Bool):Bool
{
{
}

}

/**
* If >0, the game will display a semi-opaque background under the notes.
* `0` for no background, `100` for solid black if you're freaky like that
* @default `0`
*/

static function get_strumlineBackgroundOpacity():Int
{
}

static function set_strumlineBackgroundOpacity(value:Int):Int
{
}

/**
* If enabled, the game will hide the mouse when taking a screenshot.
* @default `true`
*/

static function get_shouldHideMouse():Bool
{
}

static function set_shouldHideMouse(value:Bool):Bool
{
}

/**
* If enabled, the game will show a preview after taking a screenshot.
* @default `true`
*/

static function get_fancyPreview():Bool
{
}

static function set_fancyPreview(value:Bool):Bool
{
}

/**
* If enabled, the game will show the preview only after a screenshot is saved.
* @default `true`
*/

static function get_previewOnSave():Bool
{
}

static function set_previewOnSave(value:Bool):Bool
{
}

/**
* Loads the user's preferences from the save data and apply them.
*/
public static function init():Void
{



}

static function toggleFramerateCap(unlocked:Bool):Void
{
}

public static function setDebugDisplayMode(mode:DebugDisplayMode):Void
{



}

static function setDebugDisplayBGOpacity(value:Float):Void
{

}

/**
* If enabled, subtitles will appear during some songs and cutscenes.
* @default `true`
*/

static function get_subtitles():Bool
{
}

static function set_subtitles(value:Bool):Bool
{
}

/**
* If enabled, device will be able to sleep on its own.
* @default `false`
*/

static function get_screenTimeout():Bool
{
}

static function set_screenTimeout(value:Bool):Bool
{

}

/**
* Controls Scheme for the hitbox.
* @default `4 Lanes`
*/

static function get_controlsScheme():String
{
}

static function set_controlsScheme(value:String):String
{
}

/**
* If bought, the game will not show any ads.
* @default `false`
*/

static function get_noAds():Bool
{
}

static function set_noAds(value:Bool):Bool
{
}
}
