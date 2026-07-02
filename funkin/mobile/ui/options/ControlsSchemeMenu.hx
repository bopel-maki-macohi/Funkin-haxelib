package funkin.mobile.ui.options;


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
super.create();


hsv.hue = -0.6;
hsv.saturation = 0.9;
hsv.value = 3.6;

menuBG.shader = hsv;
menuBG.setGraphicSize(Std.int(FlxG.width * 1.1));
menuBG.updateHitbox();
menuBG.screenCenter();
menuBG.scrollFactor.set(0, 0);
add(menuBG);

for (i in 0...availableSchemes.length)
{
{
currentIndex = i;
break;
}
}

schemeNameText = new AtlasText(FlxG.width * 0.05, FlxG.height * 0.05, availableSchemes[currentIndex], AtlasFont.BOLD);
add(schemeNameText);

setupCameras();

setupHitboxShowcases();

createButton(false);
}

/**
* Setups every needed camera.
*/
function setupCameras():Void
{
mainCamera.bgColor = FlxColor.BLACK;


camControls = new FunkinCamera('camControls');
camControls.bgColor = 0x0;

camButtons = new FunkinCamera('camButtons');
camButtons.bgColor = 0x0;

camHitboxes = new FunkinCamera('camHitboxes');
camHitboxes.setScale(0.5, 0.5);
camHitboxes.bgColor = 0x0;
}

/**
* Setups the hitbox showcase items.
*/
function setupHitboxShowcases():Void
{
hitboxShowcases = new FlxTypedSpriteGroup<HitboxShowcase>();
hitboxShowcases.x = (-1500 * currentIndex) + (-1500 / (availableSchemes.length + 1) * currentIndex);

for (i in 0...availableSchemes.length)
{
hitboxShowcase.x = Math.floor(FlxG.width * -0.16 + (1500 * (i * FullScreenScaleMode.wideScale.x)));
hitboxShowcases.add(hitboxShowcase);
}

hitboxShowcases.cameras = [camHitboxes];
add(hitboxShowcases);

itemNavHitbox = new FunkinSprite(FlxG.width * 0.295).makeSolidColor(Std.int(FlxG.width * 0.25), Std.int(FlxG.height * 0.25), FlxColor.GREEN);
itemNavHitbox.cameras = [camButtons];
itemNavHitbox.updateHitbox();
itemNavHitbox.screenCenter(Y);
itemNavHitbox.visible = false;
add(itemNavHitbox);
}

/**
* Creates or recreates a scheme menu button.
* @param isDemoScreen Returns true, if player is currently in hitbox demo.
*/
function createButton(isDemoScreen:Bool):Void
{

{
currentButton = new SchemeMenuButton(FlxG.width * 0.83, FlxG.height * 0.03, 'BACK', onHitboxDemoBack);
currentButton.text.x -= 5;
}
else
{
currentButton = new SchemeMenuButton(FlxG.width * 0.83, FlxG.height * 0.83, 'DEMO', onHitboxDemo);
currentButton.text.x -= 10;
}

add(currentButton);
}

/**
* Called when current hitbox has been selected.
*/
function onSelectHitbox():Void
{
currentButton.busy = true;

Preferences.controlsScheme = availableSchemes[currentIndex];

FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;

}

/**
* Called when the current button is pressed and player is not in demo right now.
*/
function onHitboxDemo():Void
{
isInDemo = true;

FlxTween.tween(hsv, {hue: 0, saturation: 0, value: 0.5}, 0.5);

hitboxShowcases.forEach(function(hitboxShowcase:HitboxShowcase)
{
hitboxShowcase.visible = false;
});

schemeNameText.visible = false;

createButton(true);

addHitbox(true, false, availableSchemes[currentIndex]);

hitbox.forEachAlive(function(hint:FunkinHint)
{

});
}

/**
* Called when the current button is pressed and player is in demo right now.
*/
function onHitboxDemoBack():Void
{
isInDemo = false;

FlxTween.tween(hsv, {hue: -0.6, saturation: 0.9, value: 3.6}, 0.5);

hitboxShowcases.forEach(function(hitboxShowcase:HitboxShowcase)
{
hitboxShowcase.visible = true;
});

schemeNameText.visible = true;

createButton(false);

}

/**
* Updates selection using currentIndex.
* @param change Used to change currentIndex.
*/
function setSelection(index:Int):Void
{

{
currentIndex = newIndex;
}
else
{
}

FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);

schemeNameText.text = availableSchemes[currentIndex];

hitboxShowcases.forEach(function(hitboxShowcase:HitboxShowcase)
{
hitboxShowcase.selectionIndex = currentIndex;
});
}

/**
* Handles touch dragging.
*/
function handleDrag():Void
{


{
dragStartingX = 0;
dragDistance = 0;
}

}

/**
* Handles all the touch inputs.
*/
function handleInputs():Void
{


handleDrag();

{
hitboxShowcases.members[currentIndex].onPress();

currentButton.busy = true;
}
}

/**
* HitboxShowcases X position when the player just pressed on the screen.
* Used for dragging.
*/

public override function update(elapsed:Float):Void
{
super.update(elapsed);

handleInputs();


{
hitboxShowcases.x = MathUtil.smoothLerpPrecision(hitboxShowcases.x, showcasesTargetX, elapsed, 0.5);

hitboxShowcases.x = hitboxShowcases.x.clamp(minShowcasesX, 400);


}
else
{
hitboxShowcases.x = MathUtil.smoothLerpPrecision(hitboxShowcases.x, (-1500 * currentIndex) + (-1500 / (availableSchemes.length + 1) * currentIndex),
elapsed, 0.5);
}
}
}
