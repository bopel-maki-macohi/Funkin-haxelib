package funkin.util.plugins;


/**
* Handles global display of the Newgrounds medal popup.
*/
class NewgroundsMedalPlugin extends FlxTypedContainer<FlxBasic> implements ConsoleClass
{
/**
* The current instance of the Medal plugin singleton.
*/





public function new()
{
super();



medal = FunkinSprite.createTextureAtlas((MEDAL_X) + (FullScreenScaleMode.gameCutoutSize.x / 2), MEDAL_Y, "ui/medal", {
swfMode: true,
filterQuality: HIGH
});

pointsLabel = new FlxText((171 + MEDAL_X) + (FullScreenScaleMode.gameCutoutSize.x / 2), 17 + MEDAL_Y, 50, 12, false);
pointsLabel.fieldHeight = 18;
pointsLabel.systemFont = "Arial";
pointsLabel.bold = true;
pointsLabel.italic = true;
pointsLabel.alignment = "right";

pointsLabel.text = "100";
pointsLabel.visible = false;
pointsLabel.scrollFactor.set();

nameLabel = new FlxText((73 + MEDAL_X) + (FullScreenScaleMode.gameCutoutSize.x / 2), 37 + MEDAL_Y, 0, 26);
nameLabel.font = Paths.font("ShareTechMono-Regular.ttf");
nameLabel.letterSpacing = -2;

nameLabel.text = "Ono Boners Deluxe";
nameLabel.clipRect = FlxRect.get(0, 0, 164, 35.2);

nameLabel.visible = false;
nameLabel.scrollFactor.set();

medal.scrollFactor.set();
medal.visible = false;

medal.anim.onFrameLabel.add(function(label:String)
{
switch (label)
{
case "show":
pointsLabel.visible = true;
nameLabel.visible = true;
{
textSpeed = (nameLabel.text.length * (nameLabel.size + 2) * 1.25) / nameLabel.clipRect.width * 10;
moveText = true;
}
case "fade":
FunkinSound.playOnce(Paths.sound('NGFadeOut'), 1.0);
case "hide":
pointsLabel.visible = false;
nameLabel.visible = false;
moveText = false;
nameLabel.offset.x = 0;
nameLabel.clipRect.x = 0;
nameLabel.resetFrame();
}
});

medal.anim.onFinish.add(function(name:String)
{
medal.visible = false;
});

add(medal);
add(pointsLabel);
add(nameLabel);

}

/**
* Update the positions of the medal atlas in case the resolution changes!
*/
function updatePositions():Void
{
medal.x = MEDAL_X + (FullScreenScaleMode.gameCutoutSize.x / 2);
pointsLabel.x = (175 + MEDAL_X) + (FullScreenScaleMode.gameCutoutSize.x / 2);
nameLabel.x = (79 + MEDAL_X) + (FullScreenScaleMode.gameCutoutSize.x / 2);
}

override public function update(elapsed:Float)
{
super.update(elapsed);
{

nameLabel.offset.x += textX;
nameLabel.clipRect.x += textX;
nameLabel.resetFrame();
}
}

/**
* Initializes the Newgrounds Medal plugin instance.
*/
public static function initialize():Void
{
instance = new NewgroundsMedalPlugin();

instance.medal.anim.onFinish.add(function(name:String)
{
{
instance.medalQueue.shift()();
}
});
}

/**
* Plays the medal animation.
* @param points Amount of points to display
* @param name The name of the medal to display
* @param graphic The FlxGraphic for the medal icon
*/
public static function play(points:Int = 100, name:String = "I LOVE CUM I LOVE CUM I LOVE CUM I LOVE CUM", ?graphic:FlxGraphic)
{

{
instance.pointsLabel.visible = false;
instance.nameLabel.visible = false;
instance.pointsLabel.text = Std.string(points);
instance.nameLabel.text = name;
instance.updatePositions();

FunkinSound.playOnce(Paths.sound('NGFadeIn'), 1.0);
instance.medal.anim.play("");

instance.medal.visible = true;
instance.medal.replaceSymbolGraphic("NGMEDAL", graphic);
}

else
instance.medalQueue.push(playMedal);
}
}
