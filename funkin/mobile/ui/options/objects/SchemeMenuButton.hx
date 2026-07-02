

/**
* Represents a button in the scheme menu, specifically designed for mobile touch input.
* The button displays text and allows selection through touch or an external callback.
*/
class SchemeMenuButton extends FlxSpriteGroup
{
/**
* The visual body of the button.
*/

/**
* The text displayed on the button.
*/

/**
* Signal dispatched when the button is selected. Additional behavior can be added by subscribing to this signal.
*/

/**
* Indicates if the button is currently processing a selection (to avoid multiple triggers).
*/

/**
* Creates a new SchemeMenuButton instance.
*
* @param xPos The x position of the button.
* @param yPos The y position of the button.
* @param labelText The text displayed on the button.
* @param onClick An optional callback function that will be triggered when the button is clicked.
*/
public function new(?xPos:Float = 0, ?yPos:Float = 0, labelText:String, ?onClick:Void->Void):Void
{




}

public override function update(elapsed:Float):Void
{

{


FlxFlicker.flicker(this, 1, 0.06, true, false, function(_)
{
}
}
}
