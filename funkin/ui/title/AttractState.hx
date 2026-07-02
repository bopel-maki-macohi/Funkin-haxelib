

/**
* After 40 seconds of inactivity on the title screen,
* the game will enter the Attract state, as a reference to physical arcade machines.
*
* In the current version, this just plays generic game/merch trailers,
* but this can be updated to include gameplay footage, or something more elaborate.
*/
class AttractState extends MusicBeatState
{
/**
* The videos that can be played by the Attract state.
* @param path The path to the video to play.
* This used
*/


/**
* Duration you need to touch for to skip the video.
*/


public override function create():Void
{
{
}



}

/**
* Get the path of a random video to display to the user.
* @return The video path to play.
*/
function getVideoPath():String
{



}


function playVideoHTML5(filePath:String):Void
{
{


}
else
{
}
}


function playVideoNative(filePath:String):Void
{

{
vid.bitmap.onEncounteredError.add(function(msg:String):Void
{

vid.bitmap.onFormatSetup.add(() ->
{


}
else
{
}
}

public override function update(elapsed:Float):Void
{

|| TouchUtil.touch != null && TouchUtil.touch.pressed #end)
{
}
else
{
}

}

/**
* When the attraction state ends (after the video ends or the user presses any button),
* switch immediately to the title screen.
*/
function onAttractEnd():Void
{
{
}

{
}


}
}
