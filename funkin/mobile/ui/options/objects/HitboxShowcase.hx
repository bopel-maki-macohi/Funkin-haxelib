

/**
* Represents a showcase hitbox in the scheme menu.
*/
class HitboxShowcase extends FlxSpriteGroup
{
/**
* An array of values for lerping object's alpha.
*/

/**
* Object's own index.
*/

/**
* Current selection's index from menu where this object is used.
*/

/**
* Indicates if object's index is equal to current selection's index.
*/

/**
* Signal dispatched when the object is selected. Additional behavior can be added by subscribing to this signal.
*/

/**
* Indicates if the object is currently processing a selection (to avoid multiple triggers).
*/

/**
* Creates a new HitboxShowcase instance.
*
* @param x The x position of the object.
* @param y The y position of the object.
* @param index An integer used as object's index.
* @param selectionIndex Menu's current selection index.
* @param controlsScheme Hitbox's controls scheme.
* @param onClick An optional callback function that will be triggered when the object is clicked.
*/
public function new(x:Int = 0, y:Int = 0, index:Int, selectionIndex:Int = 0, controlsScheme:String, ?onClick:Void->Void):Void
{




}

/**
* Creates and setups every needed object.
*
* @param controlsScheme Hitbox's controls scheme.
*/
function setupObjects(controlsScheme:String):Void
{

hitbox.forEachAlive(function(hint:FunkinHint):Void
{
}

/**
* Called when the object is both selected and pressed.
*/
public function onPress():Void
{
{


FlxFlicker.flicker(this, 1, 0.06, true, false, function(_)
{
}
}

public override function update(elapsed:Float):Void
{

}

function get_selected():Bool
{
}
}
