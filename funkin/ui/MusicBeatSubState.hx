

/**
* MusicBeatSubState reincorporates the functionality of MusicBeatState into an FlxSubState.
*/
class MusicBeatSubState extends FlxSubState implements IEventHandler
{



function get_conductorInUse():Conductor
{
}

function set_conductorInUse(value:Conductor):Conductor
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

public function new(bgColor:FlxColor = FlxColor.TRANSPARENT)
{

}

function initCallbacks()
{
}

override function create():Void
{



}

public override function destroy():Void
{


}

override function update(elapsed:Float):Void
{

{
}


}

override function onFocus():Void
{

}

override function onFocusLost():Void
{

}

public function initConsoleHelpers():Void
{
}

function reloadAssets()
{

}

/**
* Refreshes the state, by redoing the render order of all sprites.
* It does this based on the `zIndex` of each prop.
*/
public function refresh()
{
}

/**
* Called when a step is hit in the current song.
* Continues outside of PlayState, for things like animations in menus.
* @return Whether the event should continue (not canceled).
*/
public function stepHit():Bool
{



}

/**
* Called when a beat is hit in the current song.
* Continues outside of PlayState, for things like animations in menus.
* @return Whether the event should continue (not canceled).
*/
public function beatHit():Bool
{



}

public function dispatchEvent(event:ScriptEvent)
{
}

function createWatermarkText():Void
{


}

/**
* Close this substate and replace it with a different one.
*/
public function switchSubState(substate:FlxSubState):Void
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
