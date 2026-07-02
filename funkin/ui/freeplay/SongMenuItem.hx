package funkin.ui.freeplay;


using StringTools;

class SongMenuItem extends FlxSpriteGroup
{


/**
* Modify this by calling `init()`
* If `null`, assume this SongMenuItem is for the "Random Song" option.
*/



















public function new(x:Float, y:Float)
{
super(x, y);

capsule = new FlxSprite();
capsule.frames = Paths.getSparrowAtlas('freeplay/freeplayCapsule/capsule/freeplayCapsule');
capsule.animation.addByPrefix('selected', 'mp3 capsule w backing0', 24);
capsule.animation.addByPrefix('unselected', 'mp3 capsule w backing NOT SELECTED', 24);
add(capsule);

bpmText = new FlxSprite(144, 87).loadGraphic(Paths.image('freeplay/freeplayCapsule/bpmtext'));
bpmText.setGraphicSize(Std.int(bpmText.width * 0.9));
add(bpmText);

difficultyText = new FlxSprite(414, 87).loadGraphic(Paths.image('freeplay/freeplayCapsule/difficultytext'));
difficultyText.setGraphicSize(Std.int(difficultyText.width * 0.9));
add(difficultyText);

weekText = new FunkinSprite(291, 88);
weekText.scale.set(0.9, 0.9);
weekText.visible = false;
weekText.active = false;
add(weekText);

newText = new FlxSprite(454, 9);
newText.frames = Paths.getSparrowAtlas('freeplay/freeplayCapsule/new');
newText.animation.addByPrefix('newAnim', 'NEW notif', 24, true);
newText.animation.play('newAnim', true);
newText.setGraphicSize(Std.int(newText.width * 0.9));


add(newText);


for (i in 0...2)
{
add(num);

difficultyNumbers.push(num);
}

for (i in 0...3)
{
add(num);

bpmNumbers.push(num);
}

grpHide = new FlxGroup();

fakeRanking = new FreeplayRank(420, 41);
add(fakeRanking);

fakeBlurredRanking = new FreeplayRank(fakeRanking.x, fakeRanking.y);
add(fakeBlurredRanking);

fakeRanking.visible = false;
fakeBlurredRanking.visible = false;

fakeRanking.visible = false;

ranking = new FreeplayRank(420, 41);
add(ranking);

blurredRanking = new FreeplayRank(ranking.x, ranking.y);
add(blurredRanking);

sparkle = new FlxSprite(ranking.x, ranking.y);
sparkle.frames = Paths.getSparrowAtlas('freeplay/sparkle');
sparkle.animation.addByPrefix('sparkle', 'sparkle Export0', 24, false);
sparkle.animation.play('sparkle', true);
sparkle.scale.set(0.8, 0.8);
sparkle.blend = BlendMode.ADD;

sparkle.visible = false;
sparkle.alpha = 0.7;

add(sparkle);



grayscaleShader = new Grayscale(1);


songText = new CapsuleText(capsule.width * 0.26, 45, 'Random', Std.int(40 * realScaled));
add(songText);
grpHide.add(songText);

updateDifficultyRating(FlxG.random.int(0, 20));

pixelIcon = new PixelatedIcon(160, 35);
add(pixelIcon);
grpHide.add(pixelIcon);

favIconBlurred = new FlxSprite(380, 40);
favIconBlurred.frames = Paths.getSparrowAtlas('freeplay/favHeart');
favIconBlurred.animation.addByPrefix('fav', 'favorite heart', 24, false);
favIconBlurred.animation.play('fav');

favIconBlurred.setGraphicSize(50, 50);
favIconBlurred.blend = BlendMode.ADD;
favIconBlurred.visible = false;
add(favIconBlurred);

favIcon = new FlxSprite(favIconBlurred.x, favIconBlurred.y);
favIcon.frames = Paths.getSparrowAtlas('freeplay/favHeart');
favIcon.animation.addByPrefix('fav', 'favorite heart', 24, false);
favIcon.animation.play('fav');
favIcon.setGraphicSize(50, 50);
favIcon.visible = false;
favIcon.blend = BlendMode.ADD;
add(favIcon);

setVisibleGrp(false);

theActualHitbox = new FlxObject(capsule.x + 160, capsule.y - 20, Math.round(capsule.width / 1.4), Math.round(capsule.height / 1.4));
theActualHitbox.cameras = cameras;
theActualHitbox.active = false;
}

function sparkleEffect(timer:FlxTimer):Void
{
sparkle.setPosition(FlxG.random.float(ranking.x - 20, ranking.x + 3), FlxG.random.float(ranking.y - 29, ranking.y + 4));
sparkle.animation.play('sparkle', true);
sparkleTimer = new FlxTimer().start(FlxG.random.float(1.2, 4.5), sparkleEffect);
}

function checkWeek():Void
{
weekText.offset.set(0, 0);

{
weekText.visible = false;
}

weekText.visible = true;


{
levelIdClean = levelIdData.getCapsuleTitle();
}
else
{
for (i in 0...levelId.length)
{
{
levelIdClean += levelId.charAt(i);
continue;
}



levelIdClean += currentChar;
}
}

createWeekTextGraphic(levelIdClean);
weekText.loadGraphic(FlxG.bitmap.get(levelIdClean));

weekText.offset.set(weekTextOffsets[0], weekTextOffsets[1]);
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
favIconBlurred.x = this.x + 370;
favIcon.x = favIconBlurred.x;
clipType += 1;
}
else
{
favIconBlurred.x = favIcon.x = this.x + 405;
}


switch (clipType)
{
case 2:
clipSize = 210;
case 1:
clipSize = 245;
}
songText.clipWidth = clipSize;
}

function updateBPM(newBPM:Int):Void
{

{
shiftX = 186;
}

for (i in 0...bpmNumbers.length)
{
bpmNumbers[i].x = this.x + (shiftX + (i * 11));
switch (i)
{
case 0:
{
bpmNumbers[i].digit = 0;
}
else
{
bpmNumbers[i].digit = Math.floor(newBPM / 100) % 10;
}

case 1:
{
bpmNumbers[i].digit = 0;
}
else
{
bpmNumbers[i].digit = Math.floor(newBPM / 10) % 10;

}
case 2:
bpmNumbers[i].digit = newBPM % 10;

default:
}
bpmNumbers[i].x += tempShift;
}
}



function clearUpTrail()
{
{
FlxTween.cancelTweensOf(impactThing);
remove(impactThing);
impactThing.destroy();
impactThing = null;
}
{
FlxTween.cancelTweensOf(evilTrail);
remove(evilTrail);
evilTrail.destroy();
evilTrail = null;
}
}

public function fadeAnim(?newRank:ScoringRank):Void
{
hasTrail = true;
impactThing = new FunkinSprite(0, 0);
impactThing.frames = capsule.frames;
impactThing.frame = capsule.frame;
impactThing.updateHitbox();
impactThing.alpha = 0;
impactThing.zIndex = capsule.zIndex - 3;
add(impactThing);
FlxTween.tween(impactThing.scale, {x: 2.5, y: 2.5}, 0.5);

evilTrail = new FlxTrail(impactThing, null, 15, 0.03, 0.01, 0.069);
evilTrail.blend = BlendMode.ADD;
evilTrail.zIndex = capsule.zIndex - 5;
FlxTween.tween(evilTrail, {alpha: 0}, 0.6, {
ease: FlxEase.quadOut,
onComplete: function(_)
{
clearUpTrail();
hasTrail = false;
}
});
add(evilTrail);

evilTrail.color = (newRank ?? ranking.rank).getRankingFreeplayColor();
}

public function getTrailColor():FlxColor
{
}

public function refreshDisplay(updateRank:Bool = true):Void
{
{
songText.text = 'Random';
pixelIcon.visible = false;
ranking.visible = false;
favIcon.visible = false;
favIconBlurred.visible = false;
newText.visible = false;
}
else
{
songText.text = freeplayData.fullSongName;
updateBPM(Std.int(freeplayData.songStartingBpm) ?? 0);
updateDifficultyRating(freeplayData.difficultyRating ?? 0);
newText.visible = freeplayData.isNew;
favIcon.visible = freeplayData.isFav;
favIconBlurred.visible = freeplayData.isFav;
checkClip();
}
updateSelected();
}

function updateDifficultyRating(newRating:Int):Void
{

for (i in 0...difficultyNumbers.length)
{
switch (i)
{
case 0:
{
difficultyNumbers[i].digit = 0;
}
else
{
difficultyNumbers[i].digit = Math.floor(newRating / 10);
}
case 1:
difficultyNumbers[i].digit = newRating % 10;
default:
}
}
}

function updateScoringRank(newRank:Null<ScoringRank>):Void
{
sparkle.visible = false;

this.ranking.rank = newRank;
this.blurredRanking.rank = newRank;

{
sparkleTimer = new FlxTimer().start(1, sparkleEffect);
sparkle.visible = true;
}
}

function set_hsvShader(value:HSVShader):HSVShader
{
this.hsvShader = value;
capsule.shader = hsvShader;
songText.shader = hsvShader;

}

function textAppear():Void
{
songText.scale.x = 1.7;
songText.scale.y = 0.2;

new FlxTimer().start(1 / 24, function(_)
{
songText.scale.x = 0.4;
songText.scale.y = 1.4;
});

new FlxTimer().start(2 / 24, function(_)
{
songText.scale.x = songText.scale.y = 1;
});
}

function setVisibleGrp(value:Bool):Void
{
for (spr in grpHide.members)
{
spr.visible = value;
}

updateSelected();
}

public function initPosition(x:Float, y:Float):Void
{
this.x = x;
this.y = y;
}

public function initData(freeplayData:Null<FreeplaySongData>, ?styleData:FreeplayStyle = null, index:Int = null):Void
{
this.freeplayData = freeplayData;


{
capsule.frames = Paths.getSparrowAtlas(styleData.getCapsuleAssetKey());
capsule.animation.addByPrefix('selected', 'mp3 capsule w backing0', 24);
capsule.animation.addByPrefix('unselected', 'mp3 capsule w backing NOT SELECTED', 24);
songText.applyStyle(styleData);
}

updateScoringRank(freeplayData?.scoringRank);
favIcon.animation.curAnim.curFrame = favIcon.animation.curAnim.numFrames - 1;
favIconBlurred.animation.curAnim.curFrame = favIconBlurred.animation.curAnim.numFrames - 1;

refreshDisplay();

checkWeek();
}

public function initRandom(?styleData:FreeplayStyle = null):Void
{
initPosition(FlxG.width, 0);
initData(null, styleData, 1);
y = intendedY(0) + 10;
targetPos.x = x;
alpha = 0;
songText.visible = false;
favIcon.visible = false;
favIconBlurred.visible = false;
ranking.visible = false;
}





public function initJumpIn(maxTimer:Float, ?force:Bool):Void
{
frameInTypeBeat = 0;

new FlxTimer().start((1 / 24) * maxTimer, function(doShit)
{
doJumpIn = true;
doLerp = true;
});

{
visible = true;
capsule.alpha = 1;
setVisibleGrp(true);
}
else
{
new FlxTimer().start((xFrames.length / 24) * 2.5, function(_)
{
visible = true;
capsule.alpha = 1;
setVisibleGrp(true);
});
}
}


public function forcePosition():Void
{
visible = true;
capsule.alpha = 1;
updateSelected();
doLerp = true;
doJumpIn = false;
doJumpOut = false;

frameInTypeBeat = xFrames.length;
frameOutTypeBeat = 0;

capsule.scale.x = xFrames[frameInTypeBeat - 1];
capsule.scale.y = 1 / xFrames[frameInTypeBeat - 1];

x = targetPos.x;
y = targetPos.y;

capsule.scale.x *= realScaled;
capsule.scale.y *= realScaled;

setVisibleGrp(true);
}

override function update(elapsed:Float):Void
{

{
frameInTicker += elapsed;

{
frameInTicker = 0;

capsule.scale.x = xFrames[frameInTypeBeat];
capsule.scale.y = 1 / xFrames[frameInTypeBeat];
targetPos.x = FlxG.width * xPosLerpLol[Std.int(Math.min(frameInTypeBeat, xPosLerpLol.length - 1))];
capsule.scale.x *= realScaled;
capsule.scale.y *= realScaled;

frameInTypeBeat += 1;
}
else if (frameInTypeBeat == xFrames.length)
{
doJumpIn = false;
}
}

{
frameOutTicker += elapsed;

{
frameOutTicker = 0;

capsule.scale.x = xFrames[frameOutTypeBeat];
capsule.scale.y = 1 / xFrames[frameOutTypeBeat];
this.x = FlxG.width * xPosOutLerpLol[Std.int(Math.min(frameOutTypeBeat, xPosOutLerpLol.length - 1))];

capsule.scale.x *= realScaled;
capsule.scale.y *= realScaled;

frameOutTypeBeat += 1;
}
else if (frameOutTypeBeat == xFrames.length)
{
doJumpOut = false;
}
}

{
x = MathUtil.smoothLerpPrecision(x, targetPos.x, elapsed, 0.256);
y = MathUtil.smoothLerpPrecision(y, targetPos.y, elapsed, 0.192);
}

theActualHitbox.x = x + 100;
theActualHitbox.y = y + 20;

super.update(elapsed);
}

/**
* Play any animations associated with selecting this song.
*/
public function confirm():Void
{
{
textAppear();
songText.flickerText();
}
{
pixelIcon.animation.play('confirm');
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

selected = value;
{
updateSelected();
}
}

function set_forceHighlight(value:Bool):Bool
{
forceHighlight = value;
updateSelected();
}

public function updateSelected():Void
{

grayscaleShader.setAmount(isSelected ? 0 : 0.8);
songText.alpha = isSelected ? 1 : 0.6;
songText.blurredText.visible = isSelected ? true : false;
capsule.offset.x = isSelected ? 0 : -5;
capsule.animation.play(isSelected ? "selected" : "unselected");
ranking.alpha = isSelected ? 1 : 0.7;
favIcon.alpha = isSelected ? 1 : 0.6;
favIconBlurred.alpha = isSelected ? 1 : 0;
ranking.color = isSelected ? 0xFFFFFFFF : 0xFFAAAAAA;


}

public override function kill():Void
{
super.kill();

visible = true;
capsule.alpha = 1;
doLerp = false;
doJumpIn = false;
doJumpOut = false;
}
}

class FreeplayRank extends FlxSprite
{

function set_rank(val:Null<ScoringRank>):Null<ScoringRank>
{
rank = val;

{
this.visible = false;
}
else
{
this.visible = true;

animation.play(val.getFreeplayRankIconAsset(), true, false);

centerOffsets(false);

switch (val)
{
case SHIT:
case GOOD:
offset.y -= 8;
case GREAT:
offset.y -= 8;
case EXCELLENT:
case PERFECT:
case PERFECT_GOLD:
default:
centerOffsets(false);
this.visible = false;
}
updateHitbox();
}

}


public function new(x:Float, y:Float)
{
super(x, y);

frames = Paths.getSparrowAtlas('freeplay/rankbadges');

animation.addByPrefix('PERFECT', 'PERFECT rank0', 24, false);
animation.addByPrefix('EXCELLENT', 'EXCELLENT rank0', 24, false);
animation.addByPrefix('GOOD', 'GOOD rank0', 24, false);
animation.addByPrefix('PERFECTSICK', 'PERFECT rank GOLD', 24, false);
animation.addByPrefix('GREAT', 'GREAT rank0', 24, false);
animation.addByPrefix('LOSS', 'LOSS rank0', 24, false);

blend = BlendMode.ADD;

this.rank = null;

scale.set(0.9, 0.9);
updateHitbox();
}
}

class CapsuleNumber extends FlxSprite
{

function set_digit(val):Int
{
animation.play(numToString[val], true, false, 0);

centerOffsets(false);

switch (val)
{
case 1:
offset.x -= 4;
case 3:
offset.x -= 1;

case 6:

case 4:
case 9:
default:
centerOffsets(false);
}
}



public function new(x:Float, y:Float, big:Bool = false, ?initDigit:Int = 0)
{
super(x, y);

{
frames = Paths.getSparrowAtlas('freeplay/freeplayCapsule/bignumbers');
}
else
{
frames = Paths.getSparrowAtlas('freeplay/freeplayCapsule/smallnumbers');
}

for (i in 0...10)
{
animation.addByPrefix(stringNum, '$stringNum', 24, false);
}

this.digit = initDigit;

animation.play(numToString[initDigit], true);

setGraphicSize(Std.int(width * 0.9));
updateHitbox();
}
}
