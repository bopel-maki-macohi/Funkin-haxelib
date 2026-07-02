

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



medal = FunkinSprite.createTextureAtlas((MEDAL_X) + (FullScreenScaleMode.gameCutoutSize.x / 2), MEDAL_Y, "ui/medal", {
swfMode: true,
filterQuality: HIGH







medal.anim.onFrameLabel.add(function(label:String)
{
switch (label)
{
case "show":
{
}
case "fade":
case "hide":
}

medal.anim.onFinish.add(function(name:String)
{


}

/**
* Update the positions of the medal atlas in case the resolution changes!
*/
function updatePositions():Void
{
}

override public function update(elapsed:Float)
{
{

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

instance.medal.anim.play("");

instance.medal.visible = true;
instance.medal.replaceSymbolGraphic("NGMEDAL", graphic);
}

else
instance.medalQueue.push(playMedal);
}
}
