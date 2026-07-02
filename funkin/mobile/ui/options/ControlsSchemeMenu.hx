

/**
* Represents the controls scheme menu.
* In this menu, you can change your controls scheme.
*/
class ControlsSchemeMenu extends MusicBeatSubState
{
/**
* Text that displays current scheme's name.
*/

/**
* A camera for buttons.
*/

/**
* A camera for hitbox showcases group.
*/

/**
* A button that is changed depending if you are in the hitbox demo or not.
*/

/**
* Group of hitbox showcase selection items.
*/

/**
* An object used for selecting the current hitbox scheme.
*/

/**
* Returns true, if player is currently in hitbox demonstration.
*/

/**
* An array of every single scheme.
*/

/**
* Current selected index
*/

/**
* Touch X position when touch was just pressed. Resets on release.
*/

/**
* Touch X distance between dragStartingX and current touch position. Resets on release.
*/

/**
* Represents the background shader for the menu, utilizing HSV color adjustments.
*/

public override function create():Void
{




for (i in 0...availableSchemes.length)
{
{
}
}




}

/**
* Setups every needed camera.
*/
function setupCameras():Void
{




}

/**
* Setups the hitbox showcase items.
*/
function setupHitboxShowcases():Void
{

for (i in 0...availableSchemes.length)
{
}


}

/**
* Creates or recreates a scheme menu button.
* @param isDemoScreen Returns true, if player is currently in hitbox demo.
*/
function createButton(isDemoScreen:Bool):Void
{

{
}
else
{
}

}

/**
* Called when current hitbox has been selected.
*/
function onSelectHitbox():Void
{



}

/**
* Called when the current button is pressed and player is not in demo right now.
*/
function onHitboxDemo():Void
{


hitboxShowcases.forEach(function(hitboxShowcase:HitboxShowcase)
{




hitbox.forEachAlive(function(hint:FunkinHint)
{

}

/**
* Called when the current button is pressed and player is in demo right now.
*/
function onHitboxDemoBack():Void
{


hitboxShowcases.forEach(function(hitboxShowcase:HitboxShowcase)
{



}

/**
* Updates selection using currentIndex.
* @param change Used to change currentIndex.
*/
function setSelection(index:Int):Void
{

{
}
else
{
}



hitboxShowcases.forEach(function(hitboxShowcase:HitboxShowcase)
{
}

/**
* Handles touch dragging.
*/
function handleDrag():Void
{


{
}

}

/**
* Handles all the touch inputs.
*/
function handleInputs():Void
{



{

}
}

/**
* HitboxShowcases X position when the player just pressed on the screen.
* Used for dragging.
*/

public override function update(elapsed:Float):Void
{



{



}
else
{
hitboxShowcases.x = MathUtil.smoothLerpPrecision(hitboxShowcases.x, (-1500 * currentIndex) + (-1500 / (availableSchemes.length + 1) * currentIndex),
}
}
}
