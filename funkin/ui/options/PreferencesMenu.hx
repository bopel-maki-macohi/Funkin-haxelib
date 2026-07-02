

class PreferencesMenu extends Page<OptionsState.OptionsMenuPageName>
{


public function new()
{










items.onChange.add(function(selected)
{

}

/**
* Create the description for preferences.
*/
function createPrefDescription():Void
{


}

/**
* Create the menu items for each of the preferences.
*/
function createPrefItems():Void
{
createPrefItemCheckbox('Naughtyness', 'When enabled, raunchy content (such as swearing, etc.) is displayed.', function(value:Bool):Void
{
createPrefItemCheckbox('Downscroll', 'When enabled, notes move downwards toward the strumline at the bottom of the screen.', function(value:Bool):Void
{
},
Preferences.downscroll, #if mobile ControlsHandler.hasExternalInputDevice
createPrefItemPercentage('Strumline Background', 'Show a semi-transparent background behind the strumline.', function(value:Int):Void
{
createPrefItemEnum('Haptics', 'When enabled, the game plays haptic feedback effects.',
["All" => HapticsMode.ALL, "Notes Only" => HapticsMode.NOTES_ONLY, "None" => HapticsMode.NONE,], function(key:String, value:HapticsMode):Void
{
}, switch (Preferences.hapticsMode)
{
createPrefItemNumber('Haptics Intensity', 'Intensity multiplier for all haptic feedback effects.', function(value:Float)
{
createPrefItemCheckbox('Flashing Lights', 'When disabled, flashing effects are dampened. Useful for people with photosensitive epilepsy.',
function(value:Bool):Void
{
createPrefItemCheckbox('Camera Zooms', 'When enabled, the camera bounces during songs.', function(value:Bool):Void
{
createPrefItemCheckbox('Subtitles', 'When enabled, subtitles appear during some songs and cutscenes.', function(value:Bool):Void
{
createPrefItemEnum('Debug Display', 'When enabled, FPS and other debug stats are displayed.',
["Advanced" => DebugDisplayMode.Advanced, "Simple" => DebugDisplayMode.Simple, "Off" => DebugDisplayMode.Off], (key:String, value:DebugDisplayMode) ->
{
createPrefItemPercentage('Debug Display BG', "Adjust the debug display's background opacity.", function(value:Int):Void
{
createPrefItemCheckbox('Pause on Unfocus', 'When enabled, the game automatically pauses when losing focus.', function(value:Bool):Void
{
createPrefItemCheckbox('Launch in Fullscreen', 'When enabled, the game automatically starts up in fullscreen mode.', function(value:Bool):Void
{

createPrefItemEnum('VSync', "When enabled, the game attempts to match the framerate with your monitor's refresh rate.",
["Off" => WindowVSyncMode.OFF, "On" => WindowVSyncMode.ON, "Adaptive" => WindowVSyncMode.ADAPTIVE,], function(key:String, value:WindowVSyncMode):Void
{
}, switch (Preferences.vsyncMode)
{
createPrefItemCheckbox('Unlocked Framerate', 'When enabled, the framerate is unlocked.\nThis setting is mutually exclusive with FPS.',
function(value:Bool):Void
{
createPrefItemNumber('FPS', 'The maximum framerate that the game targets.\nThis setting is mutually exclusive with Unlocked Framerate.',
function(value:Float)
{

createPrefItemCheckbox('Hide Mouse', 'When enabled, the mouse is hidden while taking a screenshot.', function(value:Bool):Void
{
createPrefItemCheckbox('Fancy Preview', 'When enabled, a preview is shown after taking a screenshot.', function(value:Bool):Void
{
createPrefItemCheckbox('Preview on Save', 'When enabled, the preview is only shown after a screenshot is saved.', function(value:Bool):Void
{
}

override function update(elapsed:Float):Void
{


items.forEach(function(daItem:TextMenuItem)
{
switch (Type.typeof(daItem))
{
case TClass(CheckboxPreferenceItem):
case TClass(EnumPreferenceItem):
case TClass(NumberPreferenceItem):
default:
}

{
}
else
{
}

}


/**
* Creates a pref item that works with booleans
* @param onChange Gets called every time the player changes the value; use this to apply the value
* @param defaultValue The value that is loaded in when the pref item is created (usually your Preferences.settingVariable)
*/
function createPrefItemCheckbox(prefName:String, prefDesc:String, onChange:Bool->Void, defaultValue:Bool, available:Bool = true):Void
{

items.createItem(0, (120 * items.length) + 30, prefName, AtlasFont.BOLD, function()
{

}

/**
* Creates a pref item that works with general numbers
* @param onChange Gets called every time the player changes the value; use this to apply the value
* @param valueFormatter Will get called every time the game needs to display the float value; use this to change how the displayed value looks
* @param defaultValue The value that is loaded in when the pref item is created (usually your Preferences.settingVariable)
* @param min Minimum value (example: 0)
* @param max Maximum value (example: 10)
* @param step The value to increment/decrement by (default = 0.1)
* @param precision Rounds decimals up to a `precision` amount of digits (ex: 4 -> 0.1234, 2 -> 0.12)
*/
function createPrefItemNumber(prefName:String, prefDesc:String, onChange:Float->Void, ?valueFormatter:Float->String, defaultValue:Float, min:Float,
max:Float, step:Float = 0.1, precision:Int):Void
{
}

/**
* Creates a pref item that works with number percentages
* @param onChange Gets called every time the player changes the value; use this to apply the value
* @param defaultValue The value that is loaded in when the pref item is created (usually your Preferences.settingVariable)
* @param min Minimum value (default = 0)
* @param max Maximum value (default = 100)
*/
function createPrefItemPercentage(prefName:String, prefDesc:String, onChange:Int->Void, defaultValue:Int, min:Int = 0, max:Int = 100):Void
{
{
{
}

/**
* Creates a pref item that works with enums
* @param values Maps enum values to display strings _(ex: `NoteHitSoundType.PingPong => "Ping pong"`)_
* @param onChange Gets called every time the player changes the value; use this to apply the value
* @param defaultValue The value that is loaded in when the pref item is created (usually your Preferences.settingVariable)
*/
function createPrefItemEnum<T>(prefName:String, prefDesc:String, values:Map<String, T>, onChange:String->T->Void, defaultKey:String):Void
{
}

override function exit():Void
{
}
}
