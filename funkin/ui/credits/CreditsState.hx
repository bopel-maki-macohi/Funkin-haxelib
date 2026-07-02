package funkin.ui.credits;


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
super();
}

public override function create():Void
{
super.create();

fix.font = CREDITS_FONT;
fix.draw();

backersToBuild = CreditsDataHandler.fetchBackerEntries();

entriesToBuild = [];
for (entry in CreditsDataHandler.CREDITS_DATA.entries)
{
entriesToBuild.push({
data: entry,
lineIndexToBuild: 0,
backerIndexToBuild: 0,
hasBuiltHeader: (entry.header == null),
hasBuiltBody: (entry.body.length == 0),
hasBuiltBackers: (!entry.appendBackers || backersToBuild.length == 0)
});
}

bg.scrollFactor.x = 0;
bg.scrollFactor.y = 0;
bg.setGraphicSize(Std.int(FlxG.width));
bg.updateHitbox();
bg.x = 0;
bg.y = 0;
bg.alpha = 0.1;
bg.visible = true;
bg.color = 0xFFB57EDC; // Lavender

creditsGroup = new FlxSpriteGroup();
creditsGroup.x = Math.max(funkin.ui.FullScreenScaleMode.gameNotchSize.x, SCREEN_PAD);
creditsGroup.y = STARTING_HEIGHT;


add(creditsGroup);

FunkinSound.playMusic('freeplayRandom', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: true,
loop: true
});

addBackButton(FlxG.width - 230, FlxG.height - 200, FlxColor.WHITE, exit, 0.7);
}


function buildCreditsEntryLine(entry:CreditsEntry):Void
{
{
creditsLineY += CREDITS_HEADER_FONT_SIZE + (header.textField.numLines * CREDITS_HEADER_FONT_SIZE);
entry.hasBuiltHeader = true;
}

{
creditsLineY += CREDITS_FONT_SIZE * line.textField.numLines;
entry.lineIndexToBuild++;

{
entry.hasBuiltBody = true;
}
}

{
creditsGroup.add(buildCreditsLine(backer, creditsLineY, false, CreditsSide.Left));
creditsLineY += CREDITS_FONT_SIZE;

entry.backerIndexToBuild++;
{
entry.hasBuiltBackers = true;
}
}
}

function buildCreditsLine(text:String, yPos:Float, header:Bool, side:CreditsSide = CreditsSide.Center):FlxText
{

creditsLine.x = xPos + creditsGroup.x;
creditsLine.y = yPos + creditsGroup.y;
creditsLine.fieldWidth = width;
creditsLine.text = text;
creditsLine.bold = header;
creditsLine.setFormat(CREDITS_FONT, size, CREDITS_FONT_COLOR, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, CREDITS_FONT_STROKE_COLOR, true);

}

function killOffScreenLines():Void
{
creditsGroup.forEachExists(function(creditsLine:FlxSprite)
{
{
creditsLine.kill();
}
});
}

function buildNextLine():Void
{
{
}

{
}

buildCreditsEntryLine(entry);

{
}

entriesToBuild.shift();

creditsLineY += CREDITS_FONT_SIZE * 2.5;
}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

killOffScreenLines();
buildNextLine();

{
{
creditsGroup.y -= CREDITS_SCROLL_FAST_SPEED * elapsed;
}
else if (controls.PAUSE || FlxG.keys.pressed.SHIFT)
{
creditsGroup.y -= CREDITS_SCROLL_PAUSE_SPEED * elapsed;
}
else
{
creditsGroup.y -= CREDITS_SCROLL_BASE_SPEED * elapsed;
}
}
{
exit();
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
super.destroy();
}
}

enum CreditsSide
{
Left;
Center;
Right;
}

typedef CreditsEntry =
{
}
