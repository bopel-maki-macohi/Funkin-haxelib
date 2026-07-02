

class LetterSort extends FlxSpriteGroup
{






public function new(x, y)
{




for (i in 0...5)
{







}



}



override function update(elapsed:Float):Void
{


{
for (index => letter in letterHitboxes)
{



{

{
}
}

}
}

|| (TouchUtil.overlaps(swipeBounds, instance.funnyCam) && SwipeUtil.swipeLeft && !pressedOnCapsule) #end) changeSelection(-1);

|| (TouchUtil.overlaps(swipeBounds, instance.funnyCam) && SwipeUtil.swipeRight && !pressedOnCapsule) #end) changeSelection(1);
}

public function changeSelection(diff:Int = 0, playSound:Bool = true):Void
{



new FlxTimer().start(2 / 24, function(_)
{
}

/**
* Buncho timers and stuff to move the letters and seperators
* Seperated out so we can call it again on letters with songs within them
* @param diff
*/
function doLetterChangeAnims(diff:Int):Void
{
{
new FlxTimer().start(frameNum / 24, function(_)
{



for (sep in grpSeperators.members)
{
}

for (index => letter in letters)
{

new FlxTimer().start(1 / 24, function(_)
{

new FlxTimer().start(2 / 24, function(_)
{

{
}

}


for (letter in letters)

}

private function set_instance(value:FreeplayState):FreeplayState
{
instance = value;

{
}
else
{
}

}
}

/**
* The actual FunkinSprite for the letters, with their animation code stuff and regex stuff
*/
class FreeplayLetter extends FunkinSprite
{
/**
* A preformatted array of letter strings, for use when doing regex
* ex: ['A-B', 'C-D', 'E-H', 'I-L' ...]
*/

/**
* A preformatted array of the letters, for use when accessing symbol animation info
* ex: ['AB', 'CD', 'EH', 'IL' ...]
*/

/**
* The current letter in the regexLetters array this FreeplayLetter is on
*/

public function new(x:Float, y:Float, ?letterInd:Int, curSelected:Int = 0)
{




{

{
}

this.anim.onFinish.add(function(name:String)
{
}
}

/**
* Changes the letter graphic/anim, used in the LetterSort class above
* @param diff -1 or 1, to go left or right in the animation array
* @param curSelection what the current letter selection is, to play the bouncing anim if it matches the current letter
*/
public function changeLetter(diff:Int = 0, ?curSelection:Int):Void
{



switch (animLetters[curLetter])
{
case "IL":
case "s":
case "t":
}

{
}
}

/**
* Offset the letter.
*/
override function getScreenPosition(?result:FlxPoint, ?camera:FlxCamera):FlxPoint
{
}
}
