

/**
* A sprite that can be used to display a song event in a chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorEventSprite extends FlxSprite
{


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

}

public function new(parent:ChartEditorState, isGhost:Bool = false)
{



}


/**
* Build a set of animations to allow displaying different types of chart events.
* @param force `true` to force rebuilding the frames.
*/
static function buildFrames(force:Bool = false):FlxFramesCollection
{


for (frame in defaultFrames.frames)
{
}

for (eventName in SongEventRegistry.listEventIds())
{


for (frame in frames.frames)
{
}
}

}

static function initEmptyEventFrames():Void
{
}

function buildAnimations():Void
{
for (eventName in eventNames)
{
}
}

public function correctAnimationName(name:String):String
{
}

public function playAnimation(?name:String):Void
{

}

function refresh():Void
{
}

function set_eventData(value:Null<SongEventData>):Null<SongEventData>
{
{
}
else
{
}
}

public function updateEventPosition(?origin:FlxObject)
{



{
}

}

public function updateTooltipText():Void
{
}

public function updateTooltipPosition():Void
{

{
ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}
else
{

ToolTipManager.instance.registerTooltipRegion(this.tooltip);
}
}

override public function kill()
{

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
