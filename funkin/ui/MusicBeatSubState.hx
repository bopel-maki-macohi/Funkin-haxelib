package funkin.ui;


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


inline function get_controls():Controls return PlayerSettings.player1.controls;


public function addHitbox(visible:Bool = true, initInput:Bool = true, ?schemeOverride:String, ?directionsOverride:Array<NoteDirection>,
?colorsOverride:Array<FlxColor>):Void
{
{
hitbox.kill();
remove(hitbox);
hitbox.destroy();
}

{
camControls = new FunkinCamera('camControls');
camControls.bgColor = 0x0;
}

hitbox = new FunkinHitbox(schemeOverride, directionsOverride, colorsOverride);
hitbox.cameras = [camControls];
hitbox.visible = visible;
add(hitbox);

}

public function addBackButton(?xPos:Float = 0, ?yPos:Float = 0, ?color:FlxColor = FlxColor.WHITE, ?confirmCallback:Void->Void = null,
?restOpacity:Float = 0.3, ?instant:Bool = false):Void
{

{
camControls = new FunkinCamera('camControls');
camControls.bgColor = 0x0;
}

backButton = new FunkinBackButton(xPos, yPos, color, confirmCallback, restOpacity, instant);
backButton.cameras = [camControls];
add(backButton);
}

public function new(bgColor:FlxColor = FlxColor.TRANSPARENT)
{
super();
this.bgColor = bgColor;

initCallbacks();
}

function initCallbacks()
{
subStateOpened.add(onOpenSubStateComplete);
subStateClosed.add(onCloseSubStateComplete);
}

override function create():Void
{
super.create();

createWatermarkText();

Conductor.beatHit.add(this.beatHit);
Conductor.stepHit.add(this.stepHit);

initConsoleHelpers();
}

public override function destroy():Void
{
super.destroy();


Conductor.beatHit.remove(this.beatHit);
Conductor.stepHit.remove(this.stepHit);
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

{
WindowUtil.setWindowTitle('Friday Night Funkin\'');
}

Conductor.watchQuick(conductorInUse);

dispatchEvent(new UpdateScriptEvent(elapsed));
}

override function onFocus():Void
{
super.onFocus();

dispatchEvent(new FocusScriptEvent(FOCUS_GAINED));
}

override function onFocusLost():Void
{
super.onFocusLost();

dispatchEvent(new FocusScriptEvent(FOCUS_LOST));
}

public function initConsoleHelpers():Void
{
}

function reloadAssets()
{
PolymodHandler.forceReloadAssets();

}

/**
* Refreshes the state, by redoing the render order of all sprites.
* It does this based on the `zIndex` of each prop.
*/
public function refresh()
{
sort(SortUtil.byZIndex, FlxSort.ASCENDING);
}

/**
* Called when a step is hit in the current song.
* Continues outside of PlayState, for things like animations in menus.
* @return Whether the event should continue (not canceled).
*/
public function stepHit():Bool
{

dispatchEvent(event);


}

/**
* Called when a beat is hit in the current song.
* Continues outside of PlayState, for things like animations in menus.
* @return Whether the event should continue (not canceled).
*/
public function beatHit():Bool
{

dispatchEvent(event);


}

public function dispatchEvent(event:ScriptEvent)
{
ModuleHandler.callEvent(event);
}

function createWatermarkText():Void
{
leftWatermarkText = new FlxText(0, FlxG.height - 18, FlxG.width, '', 12);
rightWatermarkText = new FlxText(0, FlxG.height - 18, FlxG.width, '', 12);

leftWatermarkText.zIndex = 100000;
rightWatermarkText.zIndex = 100000;
leftWatermarkText.scrollFactor.set(0, 0);
rightWatermarkText.scrollFactor.set(0, 0);
leftWatermarkText.setFormat('VCR OSD Mono', 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
rightWatermarkText.setFormat('VCR OSD Mono', 16, FlxColor.WHITE, RIGHT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);

add(leftWatermarkText);
add(rightWatermarkText);
}

/**
* Close this substate and replace it with a different one.
*/
public function switchSubState(substate:FlxSubState):Void
{
this.close();
this._parentState.openSubState(substate);
}

override function startOutro(onComplete:() -> Void):Void
{

dispatchEvent(event);

{
}
else
{
FunkinSound.stopAllAudio();

onComplete();
}
}

public override function openSubState(targetSubState:FlxSubState):Void
{

dispatchEvent(event);


super.openSubState(targetSubState);
}

function onOpenSubStateComplete(targetState:FlxSubState):Void
{
dispatchEvent(new SubStateScriptEvent(SUBSTATE_OPEN_END, targetState, true));
}

public override function closeSubState():Void
{

dispatchEvent(event);


super.closeSubState();
}

function onCloseSubStateComplete(targetState:FlxSubState):Void
{
dispatchEvent(new SubStateScriptEvent(SUBSTATE_CLOSE_END, targetState, true));
}
}
