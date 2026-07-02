package funkin.mobile.ui.options.objects;


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
super(x, y);

this.index = index;
this.selectionIndex = selectionIndex;

setupObjects(controlsScheme);

alpha = HITBOX_SHOWCASE_ALPHA[selected ? 1 : 0];

}

/**
* Creates and setups every needed object.
*
* @param controlsScheme Hitbox's controls scheme.
*/
function setupObjects(controlsScheme:String):Void
{
bg.screenCenter();
add(bg);

hitbox.forEachAlive(function(hint:FunkinHint):Void
{
});
hitbox.active = false;
add(hitbox);
}

/**
* Called when the object is both selected and pressed.
*/
public function onPress():Void
{
{
busy = true;

FunkinSound.playOnce(Paths.sound('confirmMenu'));

FlxFlicker.flicker(this, 1, 0.06, true, false, function(_)
{
busy = false;
onSelect.dispatch();
});
}
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

alpha = MathUtil.smoothLerpPrecision(alpha, HITBOX_SHOWCASE_ALPHA[selected ? 1 : 0], elapsed, 0.2);
}

function get_selected():Bool
{
}
}
