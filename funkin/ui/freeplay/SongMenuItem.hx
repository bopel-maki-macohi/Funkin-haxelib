


class SongMenuItem extends FlxSpriteGroup
{


/**
* Modify this by calling `init()`
* If `null`, assume this SongMenuItem is for the "Random Song" option.
*/



















public function new(x:Float, y:Float)
{









for (i in 0...2)
{

}

for (i in 0...3)
{

}






















}

function sparkleEffect(timer:FlxTimer):Void
{
}

function checkWeek():Void
{

{
}



{
}
else
{
for (i in 0...levelId.length)
{
{
}



}
}


}

function createWeekTextGraphic(text:String)
{


}

/**
* Checks whether the song is favorited, and/or has a rank, and adjusts the clipping
* for the scenario when the text could be too long
*/
public function checkClip():Void
{

{
}
else
{
}


switch (clipType)
{
case 2:
case 1:
}
}

function updateBPM(newBPM:Int):Void
{

{
}

for (i in 0...bpmNumbers.length)
{
switch (i)
{
case 0:
{
}
else
{
}

case 1:
{
}
else
{

}
case 2:

default:
}
}
}



function clearUpTrail()
{
{
}
{
}
}

public function fadeAnim(?newRank:ScoringRank):Void
{

FlxTween.tween(evilTrail, {alpha: 0}, 0.6, {
ease: FlxEase.quadOut,
onComplete: function(_)
{
}

}

public function getTrailColor():FlxColor
{
}

public function refreshDisplay(updateRank:Bool = true):Void
{
{
}
else
{
}
}

function updateDifficultyRating(newRating:Int):Void
{

for (i in 0...difficultyNumbers.length)
{
switch (i)
{
case 0:
{
}
else
{
}
case 1:
default:
}
}
}

function updateScoringRank(newRank:Null<ScoringRank>):Void
{


{
}
}

function set_hsvShader(value:HSVShader):HSVShader
{

}

function textAppear():Void
{

new FlxTimer().start(1 / 24, function(_)
{

new FlxTimer().start(2 / 24, function(_)
{
}

function setVisibleGrp(value:Bool):Void
{
for (spr in grpHide.members)
{
}

}

public function initPosition(x:Float, y:Float):Void
{
}

public function initData(freeplayData:Null<FreeplaySongData>, ?styleData:FreeplayStyle = null, index:Int = null):Void
{


{
}



}

public function initRandom(?styleData:FreeplayStyle = null):Void
{
}





public function initJumpIn(maxTimer:Float, ?force:Bool):Void
{

new FlxTimer().start((1 / 24) * maxTimer, function(doShit)
{

{
}
else
{
new FlxTimer().start((xFrames.length / 24) * 2.5, function(_)
{
}
}


public function forcePosition():Void
{





}

override function update(elapsed:Float):Void
{

{

{


}
else if (frameInTypeBeat == xFrames.length)
{
}
}

{

{



}
else if (frameOutTypeBeat == xFrames.length)
{
}
}

{
}


}

/**
* Play any animations associated with selecting this song.
*/
public function confirm():Void
{
{
}
{
}
}

public function intendedX(index:Float):Float
{
}

public function intendedY(index:Float):Float
{
}

function set_selected(value:Bool):Bool
{

{
}
}

function set_forceHighlight(value:Bool):Bool
{
}

public function updateSelected():Void
{



}

public override function kill():Void
{

}
}

class FreeplayRank extends FlxSprite
{

function set_rank(val:Null<ScoringRank>):Null<ScoringRank>
{

{
}
else
{



switch (val)
{
case SHIT:
case GOOD:
case GREAT:
case EXCELLENT:
case PERFECT:
case PERFECT_GOLD:
default:
}
}

}


public function new(x:Float, y:Float)
{





}
}

class CapsuleNumber extends FlxSprite
{

function set_digit(val):Int
{


switch (val)
{
case 1:
case 3:

case 6:

case 4:
case 9:
default:
}
}



public function new(x:Float, y:Float, big:Bool = false, ?initDigit:Int = 0)
{

{
}
else
{
}

for (i in 0...10)
{
}



}
}
