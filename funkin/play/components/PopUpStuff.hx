package funkin.play.components;


class PopUpStuff extends FlxTypedGroup<FunkinSprite>
{
/**
* The current note style to use. This determines which graphics to display.
* For example, Week 6 uses the `pixel` note style, and mods can create their own.
*/

/**
* Offsets that are applied to all elements, independent of the note style.
* Used to allow scripts to reposition the elements.
*/

override public function new(noteStyle:NoteStyle)
{
super();

this.noteStyle = noteStyle;
}

public function displayRating(daRating:Null<String>)
{


rating.zIndex = 1000;

rating.x = (FlxG.width * 0.474);
rating.x -= rating.width / 2;
rating.y = (FlxG.camera.height * 0.45 - 60);
rating.y -= rating.height / 2;

rating.x += offsets[0];
rating.y += offsets[1];
rating.x += styleOffsets[0];
rating.y += styleOffsets[1];

rating.acceleration.y = 550;
rating.velocity.y -= FlxG.random.int(140, 175);
rating.velocity.x -= FlxG.random.int(0, 10);

rating.graphic.destroyOnNoUse = false;

add(rating);


FlxTween.tween(rating, {alpha: 0}, 0.2, {
onComplete: function(tween:FlxTween)
{
remove(rating, true);
rating.destroy();
},
startDelay: Conductor.instance.beatLengthMs * 0.001,
ease: fadeEase
});
}

public function displayCombo(combo:Int = 0):Void
{

{
seperatedScore.push(tempCombo % 10);
tempCombo = Std.int(tempCombo / 10);
}
seperatedScore.push(0);


for (digit in seperatedScore)
{

numScore.x = (FlxG.width * 0.507) - (36 * daLoop) - 65;
numScore.y = (FlxG.camera.height * 0.44);

numScore.x += offsets[0];
numScore.y += offsets[1];
numScore.x += styleOffsets[0];
numScore.y += styleOffsets[1];

numScore.acceleration.y = FlxG.random.int(250, 300);
numScore.velocity.y -= FlxG.random.int(130, 150);
numScore.velocity.x = FlxG.random.float(-5, 5);

numScore.graphic.destroyOnNoUse = false;

add(numScore);


FlxTween.tween(numScore, {alpha: 0}, 0.2, {
onComplete: function(tween:FlxTween)
{
remove(numScore, true);
numScore.destroy();
},
startDelay: Conductor.instance.beatLengthMs * 0.002,
ease: fadeEase
});

daLoop++;
}
}
}
