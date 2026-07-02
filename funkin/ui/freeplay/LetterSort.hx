package funkin.ui.freeplay;


class LetterSort extends FlxSpriteGroup
{






public function new(x, y)
{
super(x, y);

grpSeperators = new FlxSpriteGroup();
add(grpSeperators);

leftArrow = new FlxSprite(-20, 15).loadGraphic(Paths.image("freeplay/miniArrow"));
leftArrow.flipX = true;
add(leftArrow);

rightArrow = new FlxSprite(380, 15).loadGraphic(Paths.image("freeplay/miniArrow"));
add(rightArrow);

for (i in 0...5)
{
letter.x += 50;
letter.y += 50;
add(letter);

letterHitbox.cameras = cameras;
letterHitbox.active = false;
letterHitboxes.push(letterHitbox);

letters.push(letter);



letter.color = letter.color.getDarkened(darkness);


sep.color = letter.color.getDarkened(darkness);
grpSeperators.add(sep);
}

letterHitbox.cameras = cameras;
letterHitbox.active = false;
letterHitboxes.push(letterHitbox);

swipeBounds = new FlxObject(440, 60, 460, 80);
swipeBounds.cameras = cameras;
swipeBounds.active = false;

changeSelection(0);
}


inline function get_controls():Controls return PlayerSettings.player1.controls;

override function update(elapsed:Float):Void
{
super.update(elapsed);


{
for (index => letter in letterHitboxes)
{



{
changeSelection(changeValue);

{
changeSelection(changeValue, false);
}
}

break;
}
}

|| (TouchUtil.overlaps(swipeBounds, instance.funnyCam) && SwipeUtil.swipeLeft && !pressedOnCapsule) #end) changeSelection(-1);

|| (TouchUtil.overlaps(swipeBounds, instance.funnyCam) && SwipeUtil.swipeRight && !pressedOnCapsule) #end) changeSelection(1);
}

public function changeSelection(diff:Int = 0, playSound:Bool = true):Void
{
doLetterChangeAnims(diff);


arrowToMove.offset.x = 3 * multiPosOrNeg;

new FlxTimer().start(2 / 24, function(_)
{
arrowToMove.offset.x = 0;
});
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
spr.offset.x = offsetNum;
});
};



for (sep in grpSeperators.members)
{
ezTimer(0, sep, positions[0] * multiPosOrNeg);
ezTimer(1, sep, positions[1] * multiPosOrNeg);
ezTimer(2, sep, positions[2] * multiPosOrNeg);
ezTimer(3, sep, positions[3] * multiPosOrNeg);
}

for (index => letter in letters)
{
letter.offset.x = positions[0] * multiPosOrNeg;

new FlxTimer().start(1 / 24, function(_)
{
letter.offset.x = positions[1] * multiPosOrNeg;
});

new FlxTimer().start(2 / 24, function(_)
{
letter.offset.x = positions[2] * multiPosOrNeg;
});

{
ezTimer(3, letter, 0);
continue;
}

ezTimer(3, letter, positions[3] * multiPosOrNeg);
}

curSelection += diff;

for (letter in letters)
letter.changeLetter(diff, curSelection);

}

private function set_instance(value:FreeplayState):FreeplayState
{
instance = value;

{
swipeBounds.cameras = [value.funnyCam];
}
else
{
swipeBounds.cameras = cameras;
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
super(x, y);

loadTextureAtlas("freeplay/sortedLetters");

regexLetters = alphabet.split('_');
regexLetters.insert(0, 'ALL');
regexLetters.insert(0, 'fav');
regexLetters.insert(0, '#');

animLetters = regexLetters.map(animLetter -> animLetter.replace('-', ''));

{
this.anim.play(animLetters[letterInd] + " move", true);
curLetter = letterInd;

{
this.anim.pause();
}

this.anim.onFinish.add(function(name:String)
{
this.anim.play(animLetters[curLetter] + " move", true);
});
}
}

/**
* Changes the letter graphic/anim, used in the LetterSort class above
* @param diff -1 or 1, to go left or right in the animation array
* @param curSelection what the current letter selection is, to play the bouncing anim if it matches the current letter
*/
public function changeLetter(diff:Int = 0, ?curSelection:Int):Void
{
curLetter += diff;



switch (animLetters[curLetter])
{
case "IL":
animName = "IL move";
case "s":
animName = "S move";
case "t":
animName = "T move";
}

this.anim.play(animName, true);
{
this.anim.pause();
}
}

/**
* Offset the letter.
*/
override function getScreenPosition(?result:FlxPoint, ?camera:FlxCamera):FlxPoint
{
output.x -= 50;
output.y -= 60;
}
}
