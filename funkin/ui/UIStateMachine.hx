package funkin.ui;

/**
* Simple state machine for UI components
* Replaces scattered boolean flags with clean state management
*/
enum UIState
{
Idle;
Interacting;
EnteringMainMenu;
EnteringFreeplay;
Exiting;
Disabled;
}

/**
* Note: Not to be confust with FlxState or FlxSubState!
* State as in the design pattern!
* https://refactoring.guru/design-patterns/state
*
* TODO: Generalize this a bit more to allow the UIState enum be defined with any enum
*/
class UIStateMachine
{


public function new(?transitions:Map<UIState, Array<UIState>>)
{
validTransitions = transitions != null ? transitions : [Idle => [Interacting, EnteringMainMenu, EnteringFreeplay, Exiting, Disabled], EnteringMainMenu => [Idle, Exiting, Disabled, Interacting], Interacting => [Idle, EnteringMainMenu, EnteringFreeplay, Exiting, Disabled], Exiting => [Idle], Disabled => [Idle], EnteringFreeplay => [Idle]];
}

public function canTransition(from:UIState, to:UIState):Bool
{

}

public function transition(newState:UIState):Bool
{
{
log('State transition ${currentState} -> ${newState} (no change)');
}

{
log('State transition: ${currentState} -> ${newState} (INVALID, blocked)');
}

previousState = currentState;
currentState = newState;

log('State transition ${previousState} -> ${currentState}');

for (callback in onStateChange)
{
callback(previousState, currentState);
}

}

public function onStateChanged(callback:(UIState, UIState) -> Void):Void
{
onStateChange.push(callback);
}

public function reset():Void
{
previousState = currentState;
currentState = Idle;
}

public function is(state:UIState):Bool
{
}

public function canInteract():Bool
{
}

static function log(message:String):Void
{
}
}
