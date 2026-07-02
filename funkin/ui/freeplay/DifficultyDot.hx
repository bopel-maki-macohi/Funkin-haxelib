

enum DotType
{
}

enum DotState
{
}

class DifficultyDot extends FlxSpriteGroup
{
/**
* The difficulty id which this dot represents.
*/







public function new(id:String, num:Int)
{





pulse.animation.onFrameChange.add(function(animName:String, frameNumber:Int, frameIndex:Int)
{
}


/**
* Interpolates between 2 colors to make the dot pulse in time with the pulse's animation.
* The colors are based on the current state of the dot.
*/
public function interpolateColor():Void
{
{
}
else
{
}


switch (type)
{
case NORMAL:
switch (state)
{
case SELECTED:
default:
}
case ERECT:
switch (state)
{
case SELECTED:
default:
}
default:
}
}

/**
* Updates the current visuals of the dot.
* @param _type Changes the overall appearance of the dot.
* @param _state Changes how the dot will react over time.
*/
public function updateState(_type:DotType, _state:DotState):Void
{

{
}
{
}





switch (type)
{
case NORMAL:

switch (state)
{
case SELECTED:

case DESELECTING:

case DESELECTED:

default:
}

case ERECT:

switch (state)
{
case SELECTED:

case DESELECTING:

case DESELECTED:

default:
}

case INACTIVE:

default:
}
}

/**
* Fade in the dot. Used when entering Freeplay.
*/
public function fadeIn():Void
{

{
}

{
}
else
{
}
}

/**
* Fade out the dot. Used when leaving Freeplay.
*/
public function fadeOut():Void
{
{
}

}

override function update(elapsed:Float):Void
{
}
}
