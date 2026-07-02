

/**
* MusicBeatState actually represents the core utility FlxState of the game.
* It includes functionality for event handling, as well as maintaining BPM-based update events.
*/
class MusicBeatState extends FlxTransitionableState implements IEventHandler
{





function get_conductorInUse():Conductor
{
}

function set_conductorInUse(value:Conductor):Conductor
{
}

public function new()
{


}

function initCallbacks()
{
}


public function addHitbox(visible:Bool = true, initInput:Bool = true, ?schemeOverride:String, ?directionsOverride:Array<NoteDirection>,
?colorsOverride:Array<FlxColor>):Void
{
{
}

{
}


}

public function addBackButton(?xPos:Float = 0, ?yPos:Float = 0, ?color:FlxColor = FlxColor.WHITE, ?confirmCallback:Void->Void = null,
?restOpacity:Float = 0.3, ?instant:Bool = false):Void
{

{
}

}

public function addOptionsButton(?xPos:Float = 0, ?yPos:Float = 0, ?confirmCallback:Void->Void = null, ?instant:Bool = false):Void
{

{
}

}

override function create()
{


}

public override function destroy():Void
{


}

function handleFunctionControls():Void
{
{
}
}

override function update(elapsed:Float)
{

}

override function onFocus():Void
{

}

override function onFocusLost():Void
{

}

function createWatermarkText()
{


}

public function dispatchEvent(event:ScriptEvent)
{
}

function reloadAssets()
{

}

public function stepHit():Bool
{



}

public function beatHit():Bool
{



}

/**
* Refreshes the state, by redoing the render order of all sprites.
* It does this based on the `zIndex` of each prop.
*/
public function refresh()
{
}

override function startOutro(onComplete:() -> Void):Void
{


{
}
else
{

}
}

public override function openSubState(targetSubState:FlxSubState):Void
{



}

function onOpenSubStateComplete(targetState:FlxSubState):Void
{
}

public override function closeSubState():Void
{



}

function onCloseSubStateComplete(targetState:FlxSubState):Void
{
}
}
