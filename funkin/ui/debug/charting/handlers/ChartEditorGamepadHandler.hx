

/**
* Yes, we're that crazy. Gamepad support for the chart editor.
*/

class ChartEditorGamepadHandler
{
public static function handleGamepadControls(chartEditorState:ChartEditorState)
{
}

/**
* Handle context-generic binds for the gamepad.
* @param chartEditorState The chart editor state.
* @param gamepad The gamepad to handle.
*/
static function handleGamepad(chartEditorState:ChartEditorState, gamepad:FlxGamepad):Void
{
{
ChartEditorGamepadActionInputSource.instance.handleGamepad(gamepad);
}
else
{

{
}

{
}

{
}
else if (gamepad.justPressed.BACK && gamepad.pressed.LEFT_SHOULDER)
{
FocusManager.instance.focus = null;
}
}

{
}
}

static function handleGamepadLiveInputs(chartEditorState:ChartEditorState, gamepad:FlxGamepad):Void
{
{

}
}
}

class ChartEditorGamepadActionInputSource implements IActionInputSource
{

public function new()
{
}

public function start():Void
{
}

/**
* Handle HaxeUI-specific binds for the gamepad.
* Only called when the HaxeUI menu is focused.
* @param chartEditorState The chart editor state.
* @param gamepad The gamepad to handle.
*/
public function handleGamepad(gamepad:FlxGamepad):Void
{
{
ActionManager.instance.actionStart(ActionType.LEFT, this);
}
else if (gamepad.justReleased.DPAD_LEFT)
{
ActionManager.instance.actionEnd(ActionType.LEFT, this);
}

{
ActionManager.instance.actionStart(ActionType.RIGHT, this);
}
else if (gamepad.justReleased.DPAD_RIGHT)
{
ActionManager.instance.actionEnd(ActionType.RIGHT, this);
}

{
ActionManager.instance.actionStart(ActionType.UP, this);
}
else if (gamepad.justReleased.DPAD_UP)
{
ActionManager.instance.actionEnd(ActionType.UP, this);
}

{
ActionManager.instance.actionStart(ActionType.DOWN, this);
}
else if (gamepad.justReleased.DPAD_DOWN)
{
ActionManager.instance.actionEnd(ActionType.DOWN, this);
}

{
ActionManager.instance.actionStart(ActionType.CONFIRM, this);
}
else if (gamepad.justReleased.A)
{
ActionManager.instance.actionEnd(ActionType.CONFIRM, this);
}

{
ActionManager.instance.actionStart(ActionType.CANCEL, this);
}
else if (gamepad.justReleased.B)
{
ActionManager.instance.actionEnd(ActionType.CANCEL, this);
}

{
ActionManager.instance.actionStart(ActionType.PREVIOUS, this);
}
else if (gamepad.justReleased.LEFT_TRIGGER)
{
ActionManager.instance.actionEnd(ActionType.PREVIOUS, this);
}

{
ActionManager.instance.actionStart(ActionType.NEXT, this);
}
else if (gamepad.justReleased.RIGHT_TRIGGER)
{
ActionManager.instance.actionEnd(ActionType.NEXT, this);
}
}
}
