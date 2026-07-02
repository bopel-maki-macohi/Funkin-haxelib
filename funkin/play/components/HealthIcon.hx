package funkin.play.components;


/**
* This is a rework of the health icon with the following changes:
* - The health icon now owns its own state logic. It queries health and updates the sprite itself,
*   rather than relying on PlayState to command it.
* - The health icon now supports animations.
* 	 - The health icon will now search for a SparrowV2 (XML) spritesheet, and use that for rendering if it can.
* 	 - If it can't find a spritesheet, it will the old format; a two-frame 300x150 image.
*   - If the spritesheet is found, the health icon will attempt to load and use the following animations as appropriate:
* 		 - `idle`, `winning`, `losing`, `toWinning`, `fromWinning`, `toLosing`, `fromLosing`
* - The health icon is now easier to control via scripts.
* 	 - Set `autoUpdate` to false to prevent the health icon from changing its own animations.
*   - Once `autoUpdate` is false, you can manually call `playAnimation()` to play a specific animation.
*     - i.e. `PlayState.instance.iconP1.playAnimation("losing")`
*   - Scripts can also utilize all functionality that a normal FlxSprite would have access to, such as adding supplimental animations.
*     - i.e. `PlayState.instance.iconP1.animation.addByPrefix("jumpscare", "jumpscare", 24, false);`
* @author EliteMasterEric
*/
class HealthIcon extends FunkinSprite
{
/**
* The character this icon is representing.
* Setting this variable will automatically update the graphic.
*/

/**
* Whether this health icon should automatically update its state based on the character's health.
* Note that turning this off means you have to manually do the following:
* - Boping the icon on the beat.
* - Switching between winning/losing/idle animations.
* - Repositioning the icon as health changes.
*/

/**
* Since the `scale` of the sprite dynamically changes over time,
* this value allows you to set a relative scale for the icon.
* @default 1x scale = 150px width and height.
*/

/**
* Apply the "bop" animation once every X steps.
* Defaults to once per beat.
*/

/**
* The amount, in degrees, to rotate the icon by when boping.
* ERIC NOTE: I experimented with this a bit but ended up turning it off,
* but why not leave it in for the script kiddies?
*/

/**
* The player the health icon is attached to.
*/

/**
* Whether the sprite is pixel art or not.
*/

/**
* Whether this is a legacy icon or not.
*/

/**
* At this amount of health, play the Winning animation instead of the idle.
*/

/**
* At this amount of health, play the Losing animation instead of the idle.
*/

/**
* The maximum health of the player.
*/

/**
* The size of a non-pixel icon when using the legacy format.
* Remember, modern icons can be any size.
*/
public static final HEALTH_ICON_SIZE:Int = 150;

/**
* The size of a pixel icon when using the legacy format.
* Remember, modern icons can be any size.
*/

/**
* The amount, in percent, to scale the icon by when bopping.
*/

/**
* shitty hardcoded value for a specific positioning!!!
*/


/**
* Tween, that makes icon *bop*.
*/

public function new(char:Null<String>, playerId:Int = 0)
{
super(0, 0);
this.playerId = playerId;
this.size = new FlxCallbackPoint(onSetSize);
this.scrollFactor.set();
size.set(1.0, 1.0);
this.characterId = char;
}

function onSetSize(value:FlxPoint):Void
{
snapToTargetSize();
}

function set_characterId(value:Null<String>):String
{

characterId = value ?? Constants.DEFAULT_HEALTH_ICON;
}

function set_isPixel(value:Bool):Bool
{

isPixel = value;
}

/**
* Easter egg; press 9 in the PlayState to use the old player icon.
*/
public function toggleOldIcon():Void
{
{
isPixel = playState.currentStage.getBoyfriend()?.isPixel ?? false;
playState.currentStage.getBoyfriend()?.initHealthIcon(false);
}
else
{
characterId = 'bf-old';
isPixel = false;
loadCharacter(characterId);
}

snapToTargetSize();
}

/**
* Use the provided CharacterHealthIconData to configure this health icon's appearance.
* @param data The data to use to configure this health icon.
*/
public function configure(data:Null<HealthIconData>):Void
{
{
this.characterId = Constants.DEFAULT_HEALTH_ICON;
this.isPixel = false;

loadCharacter(characterId);

this.size.set(1.0, 1.0);
this.iconOffset.set();
this.flipX = false;
this.updatePosition();
}
else
{
this.characterId = data.id;
this.isPixel = data.isPixel ?? false;

loadCharacter(characterId);

this.size.set(data.scale ?? 1.0, data.scale ?? 1.0);
{
this.iconOffset.set(data.offsets[0], data.offsets[1]);
}
else
{
this.iconOffset.set(0, 0);
}

this.flipX = data.flipX ?? false; // Face the OTHER way by default, since that is more common.
this.updatePosition();
}
}

/**
* Called by Flixel every frame. Includes logic to manage the currently playing animation.
*/
override function update(elapsed:Float):Void
{
super.update(elapsed);

{

this.angle = MathUtil.smoothLerpPrecision(this.angle, 0, dt, 0.512);
}

this.updatePosition();
}

/*
* Immediately snap the health icon to its target size without lerping.
*/
public function snapToTargetSize():Void
{
bopTween?.cancel();
{
setGraphicSize(Std.int(HEALTH_ICON_SIZE * this.size.x), 0);
}
else
{
setGraphicSize(0, Std.int(HEALTH_ICON_SIZE * this.size.y));
}
updateHitbox();
}

override public function updateHitbox():Void
{
super.updateHitbox();
offset += iconOffset;
}

/**
* Update the position (and status) of the health icon.
*/
public function updatePosition():Void
{
{
switch (playerId)
{
case 0: // Boyfriend
updateHealthIcon(PlayState.instance.health);
this.x = PlayState.instance.healthBar.x
+ (PlayState.instance.healthBar.width * (FlxMath.remapToRange(PlayState.instance.healthBar.value, 0, 2, 100, 0) * 0.01) - POSITION_OFFSET);
case 1: // Dad
updateHealthIcon(MAXIMUM_HEALTH - PlayState.instance.health);
this.x = PlayState.instance.healthBar.x
+ (PlayState.instance.healthBar.width * (FlxMath.remapToRange(PlayState.instance.healthBar.value, 0, 2, 100, 0) * 0.01))
- (this.width - POSITION_OFFSET);
}
this.y = PlayState.instance.healthBar.y - (this.height / 2); // - (PlayState.instance.healthBar.height / 2)
}
}

/**
* Called on every step.
* @param curStep The current step number.
*/
public function onStepHit(curStep:Int):Void
{
{
bopTween?.cancel();
setGraphicSize(Std.int(this.width + (HEALTH_ICON_SIZE * this.size.x * BOP_SCALE)), 0);
bopTween = FlxTween.num(this.width + (HEALTH_ICON_SIZE * this.size.x * BOP_SCALE), HEALTH_ICON_SIZE * this.size.x,
Math.min(Conductor.instance.stepLengthMs * 0.002, .175), {
onComplete: _ -> bopTween = null
}, value ->
{
setGraphicSize(Std.int(value), 0);
this.updateHitbox();
this.updatePosition();
});
this.updateHitbox();
this.updatePosition();

this.angle += bopAngle * (playerId == 0 ? 1 : -1);
}
}

function updateHealthIcon(health:Float):Void
{


switch (getCurrentAnimation())
{
case Idle:
{
playAnimation(ToLosing, Losing);
}
else if (health > WINNING_THRESHOLD)
{
playAnimation(ToWinning, Winning);
}
else
{
playAnimation(Idle);
}
case Winning:
{
playAnimation(FromWinning, Idle);
}
else
{
playAnimation(Winning, Idle);
}
case Losing:
else
{
playAnimation(Losing, Idle);
}
case ToLosing:
{
playAnimation(Losing, Idle);
}
case ToWinning:
{
playAnimation(Winning, Idle);
}
case FromLosing | FromWinning:
{
playAnimation(Idle);
}
case '':
playAnimation(Idle);
default:
playAnimation(Idle);
}
}

/**
* Load health icon animations from a Sparrow XML file (the kind used by characters)
* Note that this is looking for SPECIFIC animation names, so you may need to modify the XML.
* @param charId
*/
function loadAnimationNew():Void
{
this.animation.addByPrefix(Idle, Idle, 24, true);
this.animation.addByPrefix(Winning, Winning, 24, true);
this.animation.addByPrefix(Losing, Losing, 24, true);
this.animation.addByPrefix(ToWinning, ToWinning, 24, false);
this.animation.addByPrefix(ToLosing, ToLosing, 24, false);
this.animation.addByPrefix(FromWinning, FromWinning, 24, false);
this.animation.addByPrefix(FromLosing, FromLosing, 24, false);
}

/**
* Load health icon animations using the legacy format.
* Simply assumes two icons, the idle and losing icons.
* @param charId
*/
function loadAnimationOld():Void
{
this.animation.add(Idle, [0], 0, false, false);
this.animation.add(Losing, [1], 0, false, false);
{
this.animation.add(Winning, [2], 0, false, false);
}
}

function iconExists(charId:String):Bool
{
}

function isNewSpritesheet(charId:String):Bool
{
}

function loadCharacter(charId:Null<String>):Void
{
{
characterId = Constants.DEFAULT_HEALTH_ICON;
charId = characterId;
}

isLegacyStyle = !isNewSpritesheet(charId);


{
loadSparrow('icons/icon-$charId');

loadAnimationNew();
}
else
{
loadGraphic(Paths.image('icons/icon-$charId'), true, isPixel ? PIXEL_ICON_SIZE : HEALTH_ICON_SIZE, isPixel ? PIXEL_ICON_SIZE : HEALTH_ICON_SIZE);

loadAnimationOld();
}

this.antialiasing = !isPixel;
}

/**
* Plays the animation with the given name.
* @param name The name of the animation to play.
* @param fallback The fallback animation to play if the given animation is not found.
* @param restart Whether to forcibly restart the animation if it is already playing.
*/
public function playAnimation(name:String, fallback:String = null, restart = false):Void
{
{
this.animation.play(name, restart, false, 0);
}

{
this.animation.play(fallback, restart, false, 0);
}

}
}

/**
* The current state of the health
*/
enum abstract HealthIconState(String) to String from String
{
/**
* Indicates the health icon is in the default animation.
* Plays as long as health is between 20% and 80%.
*/

/**
* Indicates the health icon is playing the Winning animation.
* Plays as long as health is above 80%.
*/

/**
* Indicates the health icon is playing the Losing animation.
* Plays as long as health is below 20%.
*/

/**
* Indicates that the health icon is transitioning between `idle` and `winning`.
* The next animation will play once the current animation finishes.
*/

/**
* Indicates that the health icon is transitioning between `idle` and `losing`.
* The next animation will play once the current animation finishes.
*/

/**
* Indicates that the health icon is transitioning between `winning` and `idle`.
* The next animation will play once the current animation finishes.
*/

/**
* Indicates that the health icon is transitioning between `losing` and `idle`.
* The next animation will play once the current animation finishes.
*/
}
