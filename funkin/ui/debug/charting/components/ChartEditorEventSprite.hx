package funkin.ui.debug.charting.components;


/**
* A sprite that can be used to display a song event in a chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorEventSprite extends FlxSprite
{
public static final DEFAULT_EVENT = 'Default';


/**
* The note data that this sprite represents.
* You can set this to null to kill the sprite and flag it for recycling.
*/

/**
* The image used for all song events. Cached for performance.
*/



/**
* Whether this sprite is a "ghost" sprite used when hovering to place a new event.
*/

function set_overrideStepTime(value:Null<Float>):Null<Float>
{

overrideStepTime = value;
updateEventPosition();
}

public function new(parent:ChartEditorState, isGhost:Bool = false)
{
super();

this.parentState = parent;
this.isGhost = isGhost;

this.tooltip = HaxeUIUtil.buildTooltip('N/A');
this.frames = buildFrames();

buildAnimations();
refresh();
}


/**
* Build a set of animations to allow displaying different types of chart events.
* @param force `true` to force rebuilding the frames.
*/
static function buildFrames(force:Bool = false):FlxFramesCollection
{

initEmptyEventFrames();

defaultFrames.parent.persist = true;
for (frame in defaultFrames.frames)
{
eventFrames.pushFrame(frame);
}

for (eventName in SongEventRegistry.listEventIds())
{


frames.parent.persist = true;
for (frame in frames.frames)
{
eventFrames.pushFrame(frame);
}
}

}

static function initEmptyEventFrames():Void
{
eventFrames = new FlxAtlasFrames(null);
}

function buildAnimations():Void
{
for (eventName in eventNames)
{
this.animation.addByPrefix(eventName, '${eventName}0', 24, false);
}
}

public function correctAnimationName(name:String):String
{
}

public function playAnimation(?name:String):Void
{

this.animation.play(correctedName);
refresh();
}

function refresh():Void
{
setGraphicSize(ChartEditorState.GRID_SIZE);
this.updateHitbox();
}

function set_eventData(value:Null<SongEventData>):Null<SongEventData>
{
{
this.eventData = null;
this.kill();
this.visible = false;
updateTooltipPosition();
}
else
{
this.visible = true;
playAnimation(value.eventKind);
this.eventData = value;
updateEventPosition();
updateTooltipText();
}
}

public function updateEventPosition(?origin:FlxObject)
{

this.x = (ChartEditorState.STRUMLINE_SIZE * 2 + 1 - 1) * ChartEditorState.GRID_SIZE;

this.y = stepTime * ChartEditorState.GRID_SIZE;

{
this.x += origin.x;
this.y += origin.y;
}

this.updateTooltipPosition();
}

public function updateTooltipText():Void
{
this.tooltip.tipData = {text: this.eventData.buildTooltip()};
}

public function updateTooltipPosition():Void
{

{
ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}
else
{
this.tooltip.left = this.x;
this.tooltip.top = this.y;
this.tooltip.width = this.width;
this.tooltip.height = this.height;

ToolTipManager.instance.registerTooltipRegion(this.tooltip);
}
}

override public function kill()
{
super.kill();

ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}

/**
* Return whether this event is currently visible.
*/
public function isEventVisible(viewAreaBottom:Float, viewAreaTop:Float):Bool
{


}

/**
* Return whether an event, if placed in the scene, would be visible.
*/
public static function wouldEventBeVisible(viewAreaBottom:Float, viewAreaTop:Float, eventData:SongEventData, ?origin:FlxObject):Bool
{



}
}
