package funkin.input;


/**
* A core class which handles receiving player input and interpreting it into game actions.
*/
class Controls extends FlxActionSet
{
/*
* A list of actions that a player would invoke via some input device.
* Uses FlxActions to funnel various inputs to a single action.
*/






inline function get_UI_UP() return _ui_up.checkPressed();


inline function get_UI_LEFT() return _ui_left.checkPressed();


inline function get_UI_RIGHT() return _ui_right.checkPressed();


inline function get_UI_DOWN() return _ui_down.checkPressed();


inline function get_UI_UP_P() return _ui_up.checkJustPressed();


inline function get_UI_LEFT_P() return _ui_left.checkJustPressed();


inline function get_UI_RIGHT_P() return _ui_right.checkJustPressed();


inline function get_UI_DOWN_P() return _ui_down.checkJustPressed();


inline function get_UI_UP_R() return _ui_up.checkJustReleased();


inline function get_UI_LEFT_R() return _ui_left.checkJustReleased();


inline function get_UI_RIGHT_R() return _ui_right.checkJustReleased();


inline function get_UI_DOWN_R() return _ui_down.checkJustReleased();


inline function get_NOTE_UP() return _note_up.checkPressed();


inline function get_NOTE_LEFT() return _note_left.checkPressed();


inline function get_NOTE_RIGHT() return _note_right.checkPressed();


inline function get_NOTE_DOWN() return _note_down.checkPressed();


inline function get_NOTE_UP_P() return _note_up.checkJustPressed();


inline function get_NOTE_LEFT_P() return _note_left.checkJustPressed();


inline function get_NOTE_RIGHT_P() return _note_right.checkJustPressed();


inline function get_NOTE_DOWN_P() return _note_down.checkJustPressed();


inline function get_NOTE_UP_R() return _note_up.checkJustReleased();


inline function get_NOTE_LEFT_R() return _note_left.checkJustReleased();


inline function get_NOTE_RIGHT_R() return _note_right.checkJustReleased();


inline function get_NOTE_DOWN_R() return _note_down.checkJustReleased();


inline function get_ACCEPT() return _accept.checkPressed();


inline function get_ACCEPT_P() return _accept.checkJustPressed();


inline function get_ACCEPT_R() return _accept.checkJustReleased();


inline function get_BACK() return _back.checkPressed();


inline function get_BACK_P() return _back.checkJustPressed();


inline function get_BACK_R() return _back.checkJustReleased();


inline function get_PAUSE() return _pause.checkPressed();


inline function get_PAUSE_P() return _pause.checkJustPressed();


inline function get_PAUSE_R() return _pause.checkJustReleased();


inline function get_RESET() return _reset.checkPressed();


inline function get_RESET_P() return _reset.checkJustPressed();


inline function get_RESET_R() return _reset.checkJustReleased();


inline function get_WINDOW_FULLSCREEN() return _window_fullscreen.check();


inline function get_WINDOW_SCREENSHOT() return _window_screenshot.check();


inline function get_FREEPLAY_FAVORITE() return _freeplay_favorite.check();


inline function get_FREEPLAY_LEFT() return _freeplay_left.check();


inline function get_FREEPLAY_RIGHT() return _freeplay_right.check();


inline function get_FREEPLAY_CHAR_SELECT() return _freeplay_char_select.check();


inline function get_FREEPLAY_JUMP_TO_TOP() return _freeplay_jump_to_top.check();


inline function get_FREEPLAY_JUMP_TO_BOTTOM() return _freeplay_jump_to_bottom.check();


inline function get_CUTSCENE_ADVANCE() return _cutscene_advance.check();


inline function get_DEBUG_MENU() return _debug_menu.check();


inline function get_DEBUG_CHART() return _debug_chart.check();


inline function get_DEBUG_STAGE() return _debug_stage.check();


inline function get_DEBUG_DISPLAY() return _debug_display.check();


inline function get_VOLUME_UP() return _volume_up.check();


inline function get_VOLUME_DOWN() return _volume_down.check();


inline function get_VOLUME_MUTE() return _volume_mute.check();

public function new(name, ?scheme:KeyboardScheme)
{
super(name);

add(_ui_up);
add(_ui_left);
add(_ui_right);
add(_ui_down);
add(_note_up);
add(_note_left);
add(_note_right);
add(_note_down);
add(_accept);
add(_back);
add(_pause);
add(_reset);
add(_window_fullscreen);
add(_freeplay_favorite);
add(_freeplay_left);
add(_freeplay_right);
add(_freeplay_char_select);
add(_freeplay_jump_to_top);
add(_freeplay_jump_to_bottom);
add(_cutscene_advance);
add(_debug_display);
add(_volume_up);
add(_volume_down);
add(_volume_mute);

for (action in digitalActions)
{
{
byName[funkinAction.name] = funkinAction;
}
}


setKeyboardScheme(scheme, false);
}

override function update():Void
{
super.update();
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
case KEYBOARD: return '[${InputUtil.format(input.inputID, Keys).toUpperCase()}]';
case GAMEPAD: return '(${InputUtil.format(input.inputID, Gamepad(input.deviceID)).toUpperCase()})';
case device: throw 'unhandled device: $device';
}
}
else
{
{
case KEYBOARD: return InputUtil.format(input.inputID, Keys).toUpperCase();
case GAMEPAD: return InputUtil.format(input.inputID, Gamepad(input.deviceID)).toUpperCase();
case device: throw 'unhandled device: $device';
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
case UI_UP: _ui_up;
case UI_DOWN: _ui_down;
case UI_LEFT: _ui_left;
case UI_RIGHT: _ui_right;
case NOTE_UP: _note_up;
case NOTE_DOWN: _note_down;
case NOTE_LEFT: _note_left;
case NOTE_RIGHT: _note_right;
case ACCEPT: _accept;
case BACK: _back;
case PAUSE: _pause;
case RESET: _reset;
case WINDOW_FULLSCREEN: _window_fullscreen;
case FREEPLAY_FAVORITE: _freeplay_favorite;
case FREEPLAY_LEFT: _freeplay_left;
case FREEPLAY_RIGHT: _freeplay_right;
case FREEPLAY_CHAR_SELECT: _freeplay_char_select;
case FREEPLAY_JUMP_TO_TOP: _freeplay_jump_to_top;
case FREEPLAY_JUMP_TO_BOTTOM: _freeplay_jump_to_bottom;
case CUTSCENE_ADVANCE: _cutscene_advance;
case DEBUG_DISPLAY: _debug_display;
case VOLUME_UP: _volume_up;
case VOLUME_DOWN: _volume_down;
case VOLUME_MUTE: _volume_mute;
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
func(_ui_up, PRESSED);
func(_ui_up, JUST_PRESSED);
func(_ui_up, JUST_RELEASED);
case UI_LEFT:
func(_ui_left, PRESSED);
func(_ui_left, JUST_PRESSED);
func(_ui_left, JUST_RELEASED);
case UI_RIGHT:
func(_ui_right, PRESSED);
func(_ui_right, JUST_PRESSED);
func(_ui_right, JUST_RELEASED);
case UI_DOWN:
func(_ui_down, PRESSED);
func(_ui_down, JUST_PRESSED);
func(_ui_down, JUST_RELEASED);
case NOTE_UP:
func(_note_up, PRESSED);
func(_note_up, JUST_PRESSED);
func(_note_up, JUST_RELEASED);
case NOTE_LEFT:
func(_note_left, PRESSED);
func(_note_left, JUST_PRESSED);
func(_note_left, JUST_RELEASED);
case NOTE_RIGHT:
func(_note_right, PRESSED);
func(_note_right, JUST_PRESSED);
func(_note_right, JUST_RELEASED);
case NOTE_DOWN:
func(_note_down, PRESSED);
func(_note_down, JUST_PRESSED);
func(_note_down, JUST_RELEASED);
case ACCEPT:
func(_accept, PRESSED);
func(_accept, JUST_PRESSED);
func(_accept, JUST_RELEASED);
case BACK:
func(_back, PRESSED);
func(_back, JUST_PRESSED);
func(_back, JUST_RELEASED);
case PAUSE:
func(_pause, PRESSED);
func(_pause, JUST_PRESSED);
func(_pause, JUST_RELEASED);
case RESET:
func(_reset, PRESSED);
func(_reset, JUST_PRESSED);
func(_reset, JUST_RELEASED);
case WINDOW_SCREENSHOT:
func(_window_screenshot, JUST_PRESSED);
case WINDOW_FULLSCREEN:
func(_window_fullscreen, JUST_PRESSED);
case FREEPLAY_FAVORITE:
func(_freeplay_favorite, JUST_PRESSED);
case FREEPLAY_LEFT:
func(_freeplay_left, JUST_PRESSED);
case FREEPLAY_RIGHT:
func(_freeplay_right, JUST_PRESSED);
case FREEPLAY_CHAR_SELECT:
func(_freeplay_char_select, JUST_PRESSED);
case FREEPLAY_JUMP_TO_TOP:
func(_freeplay_jump_to_top, JUST_PRESSED);
case FREEPLAY_JUMP_TO_BOTTOM:
func(_freeplay_jump_to_bottom, JUST_PRESSED);
case CUTSCENE_ADVANCE:
func(_cutscene_advance, JUST_PRESSED);
case DEBUG_MENU:
func(_debug_menu, JUST_PRESSED);
case DEBUG_CHART:
func(_debug_chart, JUST_PRESSED);
case DEBUG_STAGE:
func(_debug_stage, JUST_PRESSED);
case DEBUG_DISPLAY:
func(_debug_display, JUST_PRESSED);
case VOLUME_UP:
func(_volume_up, JUST_PRESSED);
case VOLUME_DOWN:
func(_volume_down, JUST_PRESSED);
case VOLUME_MUTE:
func(_volume_mute, JUST_PRESSED);
}
}

public function replaceBinding(control:Control, device:Device, toAdd:Int, toRemove:Int):Void
{

switch (device)
{
case Keys:
forEachBound(control, function(action, state) replaceKey(action, toAdd, toRemove, state));

case Gamepad(id):
forEachBound(control, function(action, state) replaceButton(action, id, toAdd, toRemove, state));
}
}

function replaceKey(action:FlxActionDigital, toAdd:FlxKey, toRemove:FlxKey, state:FlxInputState):Void
{
{
addKeys(action, [toAdd], state);
}

for (i in 0...action.inputs.length)
{

{
{
action.inputs.remove(input);
}
else
{
action.inputs[i].inputID = toAdd;
}
hasReplaced = true;
}
else if (input.device == KEYBOARD && input.inputID == toAdd)
{
{
action.inputs.remove(input);
}
else
{
hasReplaced = true;
}
}
}

{
addKeys(action, [toAdd], state);
}
}

function replaceButton(action:FlxActionDigital, deviceID:Int, toAdd:FlxGamepadInputID, toRemove:FlxGamepadInputID, state:FlxInputState):Void
{
{
addButtons(action, [toAdd], state, deviceID);
}

for (i in 0...action.inputs.length)
{

{
action.inputs[i].inputID = toAdd;
hasReplaced = true;
}
}

{
addButtons(action, [toAdd], state, deviceID);
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

mergeKeyboardScheme(controls.keyboardScheme);

case Gamepad(id):
gamepadsAdded.push(id);
case Keys:
mergeKeyboardScheme(controls.keyboardScheme);
}
}

inline public function copyTo(controls:Controls, ?device:Device):Void
{
controls.copyFrom(this, device);
}

function mergeKeyboardScheme(scheme:KeyboardScheme):Void
{
{
switch (keyboardScheme)
{
case None:
keyboardScheme = scheme;
default:
keyboardScheme = Custom;
}
}
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function bindKeys(control:Control, keys:Array<FlxKey>):Void
{
forEachBound(control, function(action, state) addKeys(action, keys, state));
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function unbindKeys(control:Control, keys:Array<FlxKey>):Void
{
forEachBound(control, function(action, _) removeKeys(action, keys));
}

static function addKeys(action:FlxActionDigital, keys:Array<FlxKey>, state:FlxInputState):Void
{
for (key in keys)
{
action.addKey(key, state);
}
}

static function removeKeys(action:FlxActionDigital, keys:Array<FlxKey>):Void
{
{
}
}

public function setKeyboardScheme(scheme:KeyboardScheme, reset = true)
{

keyboardScheme = scheme;

bindKeys(Control.UI_UP, getDefaultKeybinds(scheme, Control.UI_UP));
bindKeys(Control.UI_DOWN, getDefaultKeybinds(scheme, Control.UI_DOWN));
bindKeys(Control.UI_LEFT, getDefaultKeybinds(scheme, Control.UI_LEFT));
bindKeys(Control.UI_RIGHT, getDefaultKeybinds(scheme, Control.UI_RIGHT));
bindKeys(Control.NOTE_UP, getDefaultKeybinds(scheme, Control.NOTE_UP));
bindKeys(Control.NOTE_DOWN, getDefaultKeybinds(scheme, Control.NOTE_DOWN));
bindKeys(Control.NOTE_LEFT, getDefaultKeybinds(scheme, Control.NOTE_LEFT));
bindKeys(Control.NOTE_RIGHT, getDefaultKeybinds(scheme, Control.NOTE_RIGHT));
bindKeys(Control.ACCEPT, getDefaultKeybinds(scheme, Control.ACCEPT));
bindKeys(Control.BACK, getDefaultKeybinds(scheme, Control.BACK));
bindKeys(Control.PAUSE, getDefaultKeybinds(scheme, Control.PAUSE));
bindKeys(Control.RESET, getDefaultKeybinds(scheme, Control.RESET));
bindKeys(Control.WINDOW_SCREENSHOT, getDefaultKeybinds(scheme, Control.WINDOW_SCREENSHOT));
bindKeys(Control.WINDOW_FULLSCREEN, getDefaultKeybinds(scheme, Control.WINDOW_FULLSCREEN));
bindKeys(Control.FREEPLAY_FAVORITE, getDefaultKeybinds(scheme, Control.FREEPLAY_FAVORITE));
bindKeys(Control.FREEPLAY_LEFT, getDefaultKeybinds(scheme, Control.FREEPLAY_LEFT));
bindKeys(Control.FREEPLAY_RIGHT, getDefaultKeybinds(scheme, Control.FREEPLAY_RIGHT));
bindKeys(Control.FREEPLAY_CHAR_SELECT, getDefaultKeybinds(scheme, Control.FREEPLAY_CHAR_SELECT));
bindKeys(Control.FREEPLAY_JUMP_TO_TOP, getDefaultKeybinds(scheme, Control.FREEPLAY_JUMP_TO_TOP));
bindKeys(Control.FREEPLAY_JUMP_TO_BOTTOM, getDefaultKeybinds(scheme, Control.FREEPLAY_JUMP_TO_BOTTOM));
bindKeys(Control.CUTSCENE_ADVANCE, getDefaultKeybinds(scheme, Control.CUTSCENE_ADVANCE));
bindKeys(Control.DEBUG_MENU, getDefaultKeybinds(scheme, Control.DEBUG_MENU));
bindKeys(Control.DEBUG_CHART, getDefaultKeybinds(scheme, Control.DEBUG_CHART));
bindKeys(Control.DEBUG_STAGE, getDefaultKeybinds(scheme, Control.DEBUG_STAGE));
bindKeys(Control.DEBUG_DISPLAY, getDefaultKeybinds(scheme, Control.DEBUG_DISPLAY));
bindKeys(Control.VOLUME_UP, getDefaultKeybinds(scheme, Control.VOLUME_UP));
bindKeys(Control.VOLUME_DOWN, getDefaultKeybinds(scheme, Control.VOLUME_DOWN));
bindKeys(Control.VOLUME_MUTE, getDefaultKeybinds(scheme, Control.VOLUME_MUTE));
}

function getDefaultKeybinds(scheme:KeyboardScheme, control:Control):Array<FlxKey>
{
switch (scheme)
{
case Solo:
switch (control)
{
case Control.UI_UP: return [W, FlxKey.UP];
case Control.UI_DOWN: return [S, FlxKey.DOWN];
case Control.UI_LEFT: return [A, FlxKey.LEFT];
case Control.UI_RIGHT: return [D, FlxKey.RIGHT];
case Control.NOTE_UP: return [W, FlxKey.UP];
case Control.NOTE_DOWN: return [S, FlxKey.DOWN];
case Control.NOTE_LEFT: return [A, FlxKey.LEFT];
case Control.NOTE_RIGHT: return [D, FlxKey.RIGHT];
case Control.ACCEPT: return [Z, SPACE, ENTER];
case Control.BACK: return [X, BACKSPACE, ESCAPE];
case Control.PAUSE: return [P, ENTER, ESCAPE];
case Control.RESET: return [R];
case Control.WINDOW_FULLSCREEN: return [F11]; // We use F for other things LOL.
case Control.FREEPLAY_FAVORITE: return [F]; // Favorite a song on the menu
case Control.FREEPLAY_LEFT: return [Q]; // Switch tabs on the menu
case Control.FREEPLAY_RIGHT: return [E]; // Switch tabs on the menu
case Control.FREEPLAY_CHAR_SELECT: return [TAB];
case Control.FREEPLAY_JUMP_TO_TOP: return [HOME];
case Control.FREEPLAY_JUMP_TO_BOTTOM: return [END];
case Control.CUTSCENE_ADVANCE: return [Z, ENTER];
case Control.DEBUG_DISPLAY: return [F6];
case Control.VOLUME_UP: return [PLUS, NUMPADPLUS];
case Control.VOLUME_DOWN: return [MINUS, NUMPADMINUS];
case Control.VOLUME_MUTE: return [ZERO, NUMPADZERO];
}
case Duo(true):
switch (control)
{
case Control.UI_UP: return [W];
case Control.UI_DOWN: return [S];
case Control.UI_LEFT: return [A];
case Control.UI_RIGHT: return [D];
case Control.NOTE_UP: return [W];
case Control.NOTE_DOWN: return [S];
case Control.NOTE_LEFT: return [A];
case Control.NOTE_RIGHT: return [D];
case Control.ACCEPT: return [G, Z];
case Control.BACK: return [H, X];
case Control.PAUSE: return [ONE];
case Control.RESET: return [R];
case Control.WINDOW_FULLSCREEN: return [F11];
case Control.FREEPLAY_FAVORITE: return [F]; // Favorite a song on the menu
case Control.FREEPLAY_LEFT: return [Q]; // Switch tabs on the menu
case Control.FREEPLAY_RIGHT: return [E]; // Switch tabs on the menu
case Control.FREEPLAY_CHAR_SELECT: return [TAB];
case Control.FREEPLAY_JUMP_TO_TOP: return [HOME];
case Control.FREEPLAY_JUMP_TO_BOTTOM: return [END];
case Control.CUTSCENE_ADVANCE: return [G, Z];
case Control.DEBUG_DISPLAY: return [F6];
case Control.VOLUME_UP: return [PLUS];
case Control.VOLUME_DOWN: return [MINUS];
case Control.VOLUME_MUTE: return [ZERO];
}
case Duo(false):
switch (control)
{
case Control.UI_UP: return [FlxKey.UP];
case Control.UI_DOWN: return [FlxKey.DOWN];
case Control.UI_LEFT: return [FlxKey.LEFT];
case Control.UI_RIGHT: return [FlxKey.RIGHT];
case Control.NOTE_UP: return [FlxKey.UP];
case Control.NOTE_DOWN: return [FlxKey.DOWN];
case Control.NOTE_LEFT: return [FlxKey.LEFT];
case Control.NOTE_RIGHT: return [FlxKey.RIGHT];
case Control.ACCEPT: return [ENTER];
case Control.BACK: return [ESCAPE];
case Control.PAUSE: return [ONE];
case Control.RESET: return [R];
case Control.WINDOW_FULLSCREEN: return [];
case Control.FREEPLAY_FAVORITE: return [];
case Control.FREEPLAY_LEFT: return [];
case Control.FREEPLAY_RIGHT: return [];
case Control.FREEPLAY_CHAR_SELECT: return [];
case Control.FREEPLAY_JUMP_TO_TOP: return [];
case Control.FREEPLAY_JUMP_TO_BOTTOM: return [];
case Control.CUTSCENE_ADVANCE: return [ENTER];
case Control.DEBUG_DISPLAY: return [];
case Control.VOLUME_UP: return [NUMPADPLUS];
case Control.VOLUME_DOWN: return [NUMPADMINUS];
case Control.VOLUME_MUTE: return [NUMPADZERO];
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
gamepadsAdded.push(id);

fromSaveData(padData, Gamepad(id));
}

inline function addGamepadLiteral(id:Int, ?buttonMap:Map<Control, Array<FlxGamepadInputID>>):Void
{
gamepadsAdded.push(id);

for (control in buttonMap.keys())
bindButtons(control, id, buttonMap[control]);
}

public function removeGamepad(deviceID:Int = FlxInputDeviceID.ALL):Void
{
for (action in this.digitalActions)
{
{
}
}

gamepadsAdded.remove(deviceID);
}

public function addDefaultGamepad(id:Int):Void
{
addGamepadLiteral(id,
[Control.ACCEPT => getDefaultGamepadBinds(Control.ACCEPT), Control.BACK => getDefaultGamepadBinds(Control.BACK), Control.UI_UP => getDefaultGamepadBinds(Control.UI_UP), Control.UI_DOWN => getDefaultGamepadBinds(Control.UI_DOWN), Control.UI_LEFT => getDefaultGamepadBinds(Control.UI_LEFT), Control.UI_RIGHT => getDefaultGamepadBinds(Control.UI_RIGHT), Control.NOTE_UP => getDefaultGamepadBinds(Control.NOTE_UP), Control.NOTE_DOWN => getDefaultGamepadBinds(Control.NOTE_DOWN), Control.NOTE_LEFT => getDefaultGamepadBinds(Control.NOTE_LEFT), Control.NOTE_RIGHT => getDefaultGamepadBinds(Control.NOTE_RIGHT), Control.PAUSE => getDefaultGamepadBinds(Control.PAUSE), Control.RESET => getDefaultGamepadBinds(Control.RESET), Control.WINDOW_FULLSCREEN => getDefaultGamepadBinds(Control.WINDOW_FULLSCREEN), #if FEATURE_SCREENSHOTS Control.WINDOW_SCREENSHOT => getDefaultGamepadBinds(Control.WINDOW_SCREENSHOT), #end Control.CUTSCENE_ADVANCE => getDefaultGamepadBinds(Control.CUTSCENE_ADVANCE), Control.FREEPLAY_FAVORITE => getDefaultGamepadBinds(Control.FREEPLAY_FAVORITE), Control.FREEPLAY_LEFT => getDefaultGamepadBinds(Control.FREEPLAY_LEFT), Control.FREEPLAY_RIGHT => getDefaultGamepadBinds(Control.FREEPLAY_RIGHT), Control.FREEPLAY_CHAR_SELECT => getDefaultGamepadBinds(Control.FREEPLAY_CHAR_SELECT), Control.FREEPLAY_JUMP_TO_TOP => getDefaultGamepadBinds(Control.FREEPLAY_JUMP_TO_TOP), Control.FREEPLAY_JUMP_TO_BOTTOM => getDefaultGamepadBinds(Control.FREEPLAY_JUMP_TO_BOTTOM), Control.VOLUME_UP => getDefaultGamepadBinds(Control.VOLUME_UP), Control.VOLUME_DOWN => getDefaultGamepadBinds(Control.VOLUME_DOWN), Control.VOLUME_MUTE => getDefaultGamepadBinds(Control.VOLUME_MUTE), #if FEATURE_DEBUG_MENU Control.DEBUG_MENU => getDefaultGamepadBinds(Control.DEBUG_MENU), #end#if FEATURE_CHART_EDITOR Control.DEBUG_CHART => getDefaultGamepadBinds(Control.DEBUG_CHART), #end#if FEATURE_STAGE_EDITOR Control.DEBUG_STAGE => getDefaultGamepadBinds(Control.DEBUG_STAGE), #end Control.DEBUG_DISPLAY => getDefaultGamepadBinds(Control.DEBUG_DISPLAY),]);
}

function getDefaultGamepadBinds(control:Control):Array<FlxGamepadInputID>
{
{
case Control.ACCEPT:
[A];
case Control.BACK:
[B];
case Control.UI_UP:
[DPAD_UP, LEFT_STICK_DIGITAL_UP];
case Control.UI_DOWN:
[DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN];
case Control.UI_LEFT:
[DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT];
case Control.UI_RIGHT:
[DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT];
case Control.NOTE_UP:
[DPAD_UP, Y, LEFT_STICK_DIGITAL_UP, RIGHT_STICK_DIGITAL_UP];
case Control.NOTE_DOWN:
[DPAD_DOWN, A, LEFT_STICK_DIGITAL_DOWN, RIGHT_STICK_DIGITAL_DOWN];
case Control.NOTE_LEFT:
[DPAD_LEFT, X, LEFT_STICK_DIGITAL_LEFT, RIGHT_STICK_DIGITAL_LEFT];
case Control.NOTE_RIGHT:
[DPAD_RIGHT, B, LEFT_STICK_DIGITAL_RIGHT, RIGHT_STICK_DIGITAL_RIGHT];
case Control.PAUSE:
[START];
case Control.RESET:
[FlxGamepadInputID.BACK]; // Back (i.e. Select)
case Control.WINDOW_FULLSCREEN:
[];
case Control.WINDOW_SCREENSHOT:
[];
case Control.CUTSCENE_ADVANCE:
[A];
case Control.FREEPLAY_FAVORITE:
[Y]; // Back (i.e. Select)
case Control.FREEPLAY_LEFT:
[LEFT_SHOULDER];
case Control.FREEPLAY_RIGHT:
[RIGHT_SHOULDER];
case Control.FREEPLAY_CHAR_SELECT:
[X];
case Control.FREEPLAY_JUMP_TO_TOP:
[RIGHT_STICK_DIGITAL_UP];
case Control.FREEPLAY_JUMP_TO_BOTTOM:
[RIGHT_STICK_DIGITAL_DOWN];
case Control.VOLUME_UP:
[];
case Control.VOLUME_DOWN:
[];
case Control.VOLUME_MUTE:
[];
case Control.DEBUG_MENU:
[];
case Control.DEBUG_CHART:
[];
case Control.DEBUG_STAGE:
[];
case Control.DEBUG_DISPLAY:
[];
default:
[];
}
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function bindButtons(control:Control, id:Int, buttons):Void
{
forEachBound(control, function(action, state) addButtons(action, buttons, state, id));
}

/**
* Sets all actions that pertain to the binder to trigger when the supplied keys are used.
* If binder is a literal you can inline this
*/
public function unbindButtons(control:Control, gamepadID:Int, buttons):Void
{
forEachBound(control, function(action, _) removeButtons(action, gamepadID, buttons));
}

inline static function addButtons(action:FlxActionDigital, buttons:Array<FlxGamepadInputID>, state, id:Int):Void
{
for (button in buttons)
{
action.addGamepad(button, state, id);
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
inputs = inputs?.distinct();
{
{
switch (device)
{
case Keys:
bindKeys(control, getDefaultKeybinds(Solo, control));
case Gamepad(id):
bindButtons(control, id, getDefaultGamepadBinds(control));
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
bindKeys(control, inputs.copy());
case Gamepad(id):
bindButtons(control, id, inputs.copy());
}
}
}
else
{
switch (device)
{
case Keys:
bindKeys(control, getDefaultKeybinds(Solo, control));
case Gamepad(id):
bindButtons(control, id, getDefaultGamepadBinds(control));
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
isEmpty = isEmpty && inputs.length == 0;

{
inputs = [FlxKey.NONE];
}
else
{
inputs = inputs.distinct();
}

Reflect.setField(data, control.getName(), inputs);
}

}

static function isDevice(input:FlxActionInput, device:Device):Bool
{
{
case Keys: input.device == KEYBOARD;
case Gamepad(id): isGamepad(input, id);
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
};

typedef Swipes =
{
?initTouchPos:FlxPoint,
?touchAngle:Float,
?touchLength:Float,
?curTouchPos:FlxPoint
};

/**
* An FlxActionDigital with additional functionality, including:
* - Combining `pressed` and `released` inputs into one action.
* - Filtering by input method (`KEYBOARD`, `MOUSE`, `GAMEPAD`, etc).
*/
class FunkinAction extends FlxActionDigital
{

{timestamp:Float, value:Bool}> = [];

public function new(?name:String = "", ?namePressed:String, ?nameReleased:String)
{
super(name);

this.namePressed = namePressed;
this.nameReleased = nameReleased;

updateLastDeviceUsed();
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
filterTriggers ??= [PRESSED, JUST_PRESSED];
filterDevices ??= [];

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

_x = null;
_y = null;

_timestamp = FlxG.game.ticks;
triggered = false;

{

{
inputs.remove(input);
continue;
}

input.update();

{
continue;
}

{
continue;
}

{
triggered = true;
}
}

cache.set(key, {timestamp: FlxG.game.ticks, value: triggered});

}


/**
* Checks which is the last device you have used and stores the value in `lastDeviceUsed`.
*/
public function updateLastDeviceUsed()
{
{
lastDeviceUsed = FlxInputDevice.KEYBOARD;
}

{
lastDeviceUsed = FlxInputDevice.GAMEPAD;
}

lastDeviceUsed = FlxInputDevice.KEYBOARD;
}
}

/**
* Since, in many cases multiple actions should use similar keys, we don't want the
* rebinding UI to list every action. ActionBinders are what the user percieves as
* an input so, for instance, they can't set jump-press and jump-release to different keys.
*/
enum Control
{
NOTE_LEFT;
NOTE_DOWN;
NOTE_UP;
NOTE_RIGHT;
UI_LEFT;
UI_DOWN;
UI_UP;
UI_RIGHT;
ACCEPT;
BACK;
PAUSE;
RESET;
CUTSCENE_ADVANCE;
FREEPLAY_FAVORITE;
FREEPLAY_LEFT;
FREEPLAY_RIGHT;
FREEPLAY_CHAR_SELECT;
FREEPLAY_JUMP_TO_TOP;
FREEPLAY_JUMP_TO_BOTTOM;
WINDOW_FULLSCREEN;
VOLUME_UP;
VOLUME_DOWN;
VOLUME_MUTE;
DEBUG_DISPLAY;
}

enum abstract Action(String) to String from String
{
}

enum Device
{
Keys;
Gamepad(id:Int);
}

enum KeyboardScheme
{
Solo;
Duo(first:Bool);
None;
Custom;
}
