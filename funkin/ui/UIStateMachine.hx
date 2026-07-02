
/**
* Simple state machine for UI components
* Replaces scattered boolean flags with clean state management
*/
enum UIState
{
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
}

public function canTransition(from:UIState, to:UIState):Bool
{

}

public function transition(newState:UIState):Bool
{
{
}

{
}



for (callback in onStateChange)
{
}

}

public function onStateChanged(callback:(UIState, UIState) -> Void):Void
{
}

public function reset():Void
{
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
