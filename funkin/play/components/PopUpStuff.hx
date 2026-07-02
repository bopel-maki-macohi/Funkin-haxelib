

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

}

public function displayRating(daRating:Null<String>)
{









FlxTween.tween(rating, {alpha: 0}, 0.2, {
onComplete: function(tween:FlxTween)
{
},
startDelay: Conductor.instance.beatLengthMs * 0.001,
ease: fadeEase
}

public function displayCombo(combo:Int = 0):Void
{

{
}


for (digit in seperatedScore)
{







FlxTween.tween(numScore, {alpha: 0}, 0.2, {
onComplete: function(tween:FlxTween)
{
},
startDelay: Conductor.instance.beatLengthMs * 0.002,
ease: fadeEase

}
}
}
