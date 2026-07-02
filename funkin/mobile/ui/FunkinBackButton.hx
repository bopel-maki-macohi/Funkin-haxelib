

class FunkinBackButton extends FunkinButton
{



function get_confirming():Bool
{
}




/**
* Creates a new FunkinBackButton instance.
*
* @param x The x position of the object.
* @param y The y position of the object.
* @param color Button's optional color.
* @param confirmCallback An optional callback function that will be triggered when the object is clicked.
* @param restingOpacity An optional float that is the alpha the button will be when not selected/hovered over.
* @param instant An optional flag that makes the button not play the full animation before calling the callback.
*/
public function new(?x:Float = 0, ?y:Float = 0, ?color:FlxColor = FlxColor.WHITE, ?confirmCallback:Void->Void, ?restingOpacity:Float = 0.3,
instant:Bool = false):Void
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





animation.onFinish.addOnce(function(name:String)
{
}

function playOutAnim():Void
{


FlxTween.tween(this, {alpha: restingOpacity}, 0.5, {
ease: FlxEase.expoOut,
onComplete: function(tween:FlxTween):Void
{
}
}

public function resetCallbacks():Void
{


}

override public function update(elapsed:Float):Void
{

}

override function destroy():Void
{


}
}
