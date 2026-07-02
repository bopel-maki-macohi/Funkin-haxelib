

class FunkinOptionsButton extends FunkinButton
{



function get_confirming():Bool
{
}


/**
* Creates a new FunkinOptionsButton instance.
*
* @param x The x position of the object.
* @param y The y position of the object.
* @param confirmCallback An optional callback function that will be triggered when the object is clicked.
* @param instant An optional flag that makes the button not play the full animation before calling the callback.
*/
public function new(?x:Float = 0, ?y:Float = 0, ?confirmCallback:Void->Void, instant:Bool = false):Void
{





}

function playHoldAnim():Void
{


}

function playConfirmAnim():Void
{
{
}
else if (confirming)
{
}




new FlxTimer().start(0.05, function(_)
{


animation.onFinish.addOnce(function(name:String)
{
}

function playOutAnim():Void
{

}

public function resetCallbacks():Void
{


}

override function destroy():Void
{


}
}
