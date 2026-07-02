

/**
* The state used to display the credits scroll.
*/
class CreditsState extends MusicBeatState
{
/**
* The height the credits should start at.
* Make this an instanced variable so it gets set by the constructor.
*/

/**
* The padding on each side of the screen.
*/

/**
* The width of the screen the credits should maximally fill up.
* Make this an instanced variable so it gets set by the constructor.
*/

/**
* The font to use to display the text.
* To use a font from the `assets` folder, use `Paths.font(...)`.
* Choose something that will render Unicode properly.
*/

/**
* The size of the font.
*/


/**
* The color of the text itself.
*/

/**
* The color of the text's outline.
*/

/**
* The speed the credits scroll at, in pixels per second.
*/

/**
* The speed the credits scroll at while accept keybind or spacebar is held, in pixels per second.
*/

/**
* The speed the credits scroll at while the pause keybind is held, in pixels per second.
*/

/**
* The actual sprites and text used to display the credits.
*/



public function new()
{
}

public override function create():Void
{



for (entry in CreditsDataHandler.CREDITS_DATA.entries)
{
entriesToBuild.push({
data: entry,
lineIndexToBuild: 0,
backerIndexToBuild: 0,
hasBuiltHeader: (entry.header == null),
hasBuiltBody: (entry.body.length == 0),
hasBuiltBackers: (!entry.appendBackers || backersToBuild.length == 0)
}

bg.color = 0xFFB57EDC; // Lavender




FunkinSound.playMusic('freeplayRandom', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: true,
loop: true

}


function buildCreditsEntryLine(entry:CreditsEntry):Void
{
{
}

{

{
}
}

{

{
}
}
}

function buildCreditsLine(text:String, yPos:Float, header:Bool, side:CreditsSide = CreditsSide.Center):FlxText
{


}

function killOffScreenLines():Void
{
creditsGroup.forEachExists(function(creditsLine:FlxSprite)
{
{
}
}

function buildNextLine():Void
{
{
}

{
}


{
}


}

public override function update(elapsed:Float):Void
{


{
{
}
else if (controls.PAUSE || FlxG.keys.pressed.SHIFT)
{
}
else
{
}
}
{
}
}

function hasEnded():Bool
{
}

function exit():Void
{
}

public override function destroy():Void
{
}
}

enum CreditsSide
{
}

typedef CreditsEntry =
{
}
