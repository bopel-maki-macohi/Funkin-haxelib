

/**
* A core class which handles receiving player input and interpreting it into game actions.
*/
class Controls extends FlxActionSet
{
/*
* A list of actions that a player would invoke via some input device.
* Uses FlxActions to funnel various inputs to a single action.
*/













































































































public function new(name, ?scheme:KeyboardScheme)
{


for (action in digitalActions)
{
{
}
}


}

override function update():Void
{
}

public function check(name:Action, trigger:FlxInputState = JUST_PRESSED, gamepadOnly:Bool = false):Bool
{

else
}

public function getKeysForAction(name:Action):Array<FlxKey>
{

for (input in byName[name].inputs)
{
}
}

public function getButtonsForAction(name:Action):Array<FlxGamepadInputID>
{

for (input in byName[name].inputs)
{
}
}

public function getDialogueName(action:FlxActionDigital, ?ignoreSurrounding:Bool = false):String
{
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

public function getDialogueNameFromToken(token:String, ?ignoreSurrounding:Bool = false):String
{
}

public function getDialogueNameFromControl(control:Control, ?ignoreSurrounding:Bool = false):String
{
}

function getActionFromControl(control:Control):FlxActionDigital
{
{
}
}

static function init():Void
{
}

/**
* Calls a function passing each action bound by the specified control
* @param control
* @param func
*/
function forEachBound(control:Control, func:FunkinAction->FlxInputState->Void):Void
{
switch (control)
{
case UI_UP:
case UI_LEFT:
case UI_RIGHT:
case UI_DOWN:
case NOTE_UP:
case NOTE_LEFT:
case NOTE_RIGHT:
case NOTE_DOWN:
case ACCEPT:
case BACK:
case PAUSE:
case RESET:
case WINDOW_SCREENSHOT:
case WINDOW_FULLSCREEN:
case FREEPLAY_FAVORITE:
case FREEPLAY_LEFT:
case FREEPLAY_RIGHT:
case FREEPLAY_CHAR_SELECT:
case FREEPLAY_JUMP_TO_TOP:
case FREEPLAY_JUMP_TO_BOTTOM:
case CUTSCENE_ADVANCE:
case DEBUG_MENU:
case DEBUG_CHART:
case DEBUG_STAGE:
case DEBUG_DISPLAY:
case VOLUME_UP:
case VOLUME_DOWN:
case VOLUME_MUTE:
}
}

public function replaceBinding(control:Control, device:Device, toAdd:Int, toRemove:Int):Void
{

switch (device)
{
case Keys:

case Gamepad(id):
}
}

function replaceKey(action:FlxActionDigital, toAdd:FlxKey, toRemove:FlxKey, state:FlxInputState):Void
{
{
}

for (i in 0...action.inputs.length)
{

{
{
}
else
{
}
}
else if (input.device == KEYBOARD && input.inputID == toAdd)
{
{
}
else
{
}
}
}

{
}
}

function replaceButton(action:FlxActionDigital, deviceID:Int, toAdd:FlxGamepadInputID, toRemove:FlxGamepadInputID, state:FlxInputState):Void
{
{
}

for (i in 0...action.inputs.length)
{

{
}
}

{
}
}

public function copyFrom(controls:Controls, ?device:Device):Void
{
for (name in controls.byName.keys())
{
for (input in action.inputs)
{
}
}

switch (device)
{
case null:
for (gamepad in controls.gamepadsAdded)


case Gamepad(id):
case Keys:
}
}

inline public function copyTo(controls:Controls, ?device:Device):Void
{
}

function mergeKeyboardScheme(scheme:KeyboardScheme):Void
{
{
switch (keyboardScheme)
{
case None:
default:
}
}
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function bindKeys(control:Control, keys:Array<FlxKey>):Void
{
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function unbindKeys(control:Control, keys:Array<FlxKey>):Void
{
}

static function addKeys(action:FlxActionDigital, keys:Array<FlxKey>, state:FlxInputState):Void
{
for (key in keys)
{
}
}

static function removeKeys(action:FlxActionDigital, keys:Array<FlxKey>):Void
{
{
}
}

public function setKeyboardScheme(scheme:KeyboardScheme, reset = true)
{


}

function getDefaultKeybinds(scheme:KeyboardScheme, control:Control):Array<FlxKey>
{
switch (scheme)
{
case Solo:
switch (control)
{
case Control.WINDOW_FULLSCREEN: return [F11]; // We use F for other things LOL.
case Control.FREEPLAY_FAVORITE: return [F]; // Favorite a song on the menu
case Control.FREEPLAY_LEFT: return [Q]; // Switch tabs on the menu
case Control.FREEPLAY_RIGHT: return [E]; // Switch tabs on the menu
}
case Duo(true):
switch (control)
{
case Control.FREEPLAY_FAVORITE: return [F]; // Favorite a song on the menu
case Control.FREEPLAY_LEFT: return [Q]; // Switch tabs on the menu
case Control.FREEPLAY_RIGHT: return [E]; // Switch tabs on the menu
}
case Duo(false):
switch (control)
{
}
default:
}

}

function removeKeyboard():Void
{
for (action in this.digitalActions)
{
{
}
}
}

public function addGamepadWithSaveData(id:Int, ?padData:Dynamic):Void
{

}

inline function addGamepadLiteral(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
{

for (control in buttonMap.keys())
}

public function removeGamepad(deviceID:Int = FlxInputDeviceID.ALL):Void
{
for (action in this.digitalActions)
{
{
}
}

}

public function addDefaultGamepad(id:Int):Void
{
addGamepadLiteral(id,
}

function getDefaultGamepadBinds(control:Control):Array<FlxGamepadInputID>
{
{
case Control.ACCEPT:
case Control.BACK:
case Control.UI_UP:
case Control.UI_DOWN:
case Control.UI_LEFT:
case Control.UI_RIGHT:
case Control.NOTE_UP:
case Control.NOTE_DOWN:
case Control.NOTE_LEFT:
case Control.NOTE_RIGHT:
case Control.PAUSE:
case Control.RESET:
[FlxGamepadInputID.BACK]; // Back (i.e. Select)
case Control.WINDOW_FULLSCREEN:
case Control.WINDOW_SCREENSHOT:
case Control.CUTSCENE_ADVANCE:
case Control.FREEPLAY_FAVORITE:
[Y]; // Back (i.e. Select)
case Control.FREEPLAY_LEFT:
case Control.FREEPLAY_RIGHT:
case Control.FREEPLAY_CHAR_SELECT:
case Control.FREEPLAY_JUMP_TO_TOP:
case Control.FREEPLAY_JUMP_TO_BOTTOM:
case Control.VOLUME_UP:
case Control.VOLUME_DOWN:
case Control.VOLUME_MUTE:
case Control.DEBUG_MENU:
case Control.DEBUG_CHART:
case Control.DEBUG_STAGE:
case Control.DEBUG_DISPLAY:
default:
}
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function bindButtons(control:Control, id:Int, buttons):Void
{
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function unbindButtons(control:Control, gamepadID:Int, buttons):Void
{
}

inline static function addButtons(action:FlxActionDigital, buttons:Array<FlxGamepadInputID>, state, id:Int):Void
{
for (button in buttons)
{
}
}

static function removeButtons(action:FlxActionDigital, gamepadID:Int, buttons:Array<FlxGamepadInputID>):Void
{
{
}
}

public function getInputsFor(control:Control, device:Device, ?list:Array<Int>):Array<Int>
{

switch (device)
{
case Keys:
for (input in getActionFromControl(control).inputs)
{
}
case Gamepad(id):
for (input in getActionFromControl(control).inputs)
{
}
}
}

/**
* NOTE: When loading controls:
* An EMPTY array means the control is uninitialized and needs to be reset to default.
* An array with a single FlxKey.NONE means the control was intentionally unbound by the user.
*/
public function fromSaveData(data:Dynamic, device:Device):Void
{
for (control in Control.createAll())
{
{
{
switch (device)
{
case Keys:
case Gamepad(id):
}
}
else if (inputs == [FlxKey.NONE])
{
}
else
{
switch (device)
{
case Keys:
case Gamepad(id):
}
}
}
else
{
switch (device)
{
case Keys:
case Gamepad(id):
}
}
}
}

/**
* NOTE: When saving controls:
* An EMPTY array means the control is uninitialized and needs to be reset to default.
* An array with a single FlxKey.NONE means the control was intentionally unbound by the user.
*/
public function createSaveData(device:Device):Dynamic
{
for (control in Control.createAll())
{

{
}
else
{
}

}

}

static function isDevice(input:FlxActionInput, device:Device):Bool
{
{
}
}

inline static function isGamepad(input:FlxActionInput, deviceID:Int):Bool
{
}
}

typedef SaveInputLists =
{
?keys:Array<Int>,
?pad:Array<Int>

typedef Swipes =
{
?initTouchPos:FlxPoint,
?touchAngle:Float,
?touchLength:Float,
?curTouchPos:FlxPoint

/**
* An FlxActionDigital with additional functionality, including:
* - Combining `pressed` and `released` inputs into one action.
* - Filtering by input method (`KEYBOARD`, `MOUSE`, `GAMEPAD`, etc).
*/
class FunkinAction extends FlxActionDigital
{


public function new(?name:String = "", ?namePressed:String, ?nameReleased:String)
{


}

/**
* Input checks default to whether the input was just pressed, on any input device.
*/
public override function check():Bool
{
}

/**
* Check whether the input is currently being held.
*/
public function checkPressed():Bool
{
}

/**
* Check whether the input is currently being held, and was not held last frame.
*/
public function checkJustPressed():Bool
{
}

/**
* Check whether the input is not currently being held.
*/
public function checkReleased():Bool
{
}

/**
* Check whether the input is not currently being held, and was held last frame.
*/
public function checkJustReleased():Bool
{
}

/**
* Check whether the input is currently being held by a gamepad device.
*/
public function checkPressedGamepad():Bool
{
}

/**
* Check whether the input is currently being held by a gamepad device, and was not held last frame.
*/
public function checkJustPressedGamepad():Bool
{
}

/**
* Check whether the input is not currently being held by a gamepad device.
*/
public function checkReleasedGamepad():Bool
{
}

/**
* Check whether the input is not currently being held by a gamepad device, and was held last frame.
*/
public function checkJustReleasedGamepad():Bool
{
}

public function checkMultiFiltered(?filterTriggers:Array<FlxInputState>, ?filterDevices:Array<FlxInputDevice>):Bool
{

for (i in filterTriggers)
{
{
{
}
}
else
{
for (j in filterDevices)
{
{
}
}
}
}
}

/**
* Performs the functionality of `FlxActionDigital.check()`, but with optional filters.
* @param action The action to check for.
* @param filterTrigger Optionally filter by trigger condition (`JUST_PRESSED`, `PRESSED`, `JUST_RELEASED`, `RELEASED`).
* @param filterDevice Optionally filter by device (`KEYBOARD`, `MOUSE`, `GAMEPAD`, `OTHER`).
* @return bool if our input has been triggered
*/
public function checkFiltered(?filterTrigger:FlxInputState, ?filterDevice:FlxInputDevice):Bool
{

{
}



{

{
}


{
}

{
}

{
}
}


}


/**
* Checks which is the last device you have used and stores the value in `lastDeviceUsed`.
*/
public function updateLastDeviceUsed()
{
{
}

{
}

}
}

/**
* Since, in many cases multiple actions should use similar keys, we don't want the
* rebinding UI to list every action. ActionBinders are what the user percieves as
* an input so, for instance, they can't set jump-press and jump-release to different keys.
*/
enum Control
{
}

enum abstract Action(String) to String from String
{
}

enum Device
{
}

enum KeyboardScheme
{
}
