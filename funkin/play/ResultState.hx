package funkin.play;


/**
* The state for the results screen after a song or week is finished.
*/
class ResultState extends MusicBeatSubState
{






{
sprite:FunkinSprite,
delay:Float,
forceLoop:Bool,
startFrameLabel:String,
sound:String
}> = [];
{
sprite:FunkinSprite,
delay:Float
}> = [];



/**
* The music playing in the background of the state.
*/





function get_isChartingMode():Bool
{
else
}

public function new(params:ResultsStateParams)
{
super();

this.params = params;

rank = Scoring.calculateRank(params.scoreData) ?? SHIT;

cameraBG = new FunkinCamera('resultsBG', 0, 0, FlxG.width, FlxG.height);
cameraScroll = new FunkinCamera('resultsScroll', 0, 0, FlxG.width, Math.round(FlxG.height * 1.2));
cameraEverything = new FunkinCamera('resultsEverything', 0, 0, FlxG.width, FlxG.height);


songName = new FlxBitmapText(FlxBitmapFont.fromMonospace(Paths.image("resultScreen/tardlingSpritesheet"), fontLetters, FlxPoint.get(49, 61)));
songName.text = params.title;
songName.letterSpacing = -15;
songName.angle = -4.4;
songName.zIndex = 1000;
songName.visible = false;

difficulty = new FlxSprite(555 + FullScreenScaleMode.gameNotchSize.x);
difficulty.zIndex = 1000;

clearPercentSmall = new ClearPercentCounter(FlxG.width / 2 + 300, FlxG.height / 2 - 100, 100, true);
clearPercentSmall.zIndex = 1000;
clearPercentSmall.visible = false;

bgFlash = FlxGradient.createGradientFlxSprite(FlxG.width, FlxG.height, [0xFFFFF1A6, 0xFFFFF1BE], 90);

resultsAnim = FunkinSprite.createSparrow(FlxG.width - (1480 + (FullScreenScaleMode.gameCutoutSize.x / 2)), -10, "resultScreen/results");

ratingsPopin = FunkinSprite.createSparrow(-135 + FullScreenScaleMode.gameNotchSize.x, 135, "resultScreen/ratingsPopin");

scorePopin = FunkinSprite.createSparrow(-180 + FullScreenScaleMode.gameNotchSize.x, 515, "resultScreen/scorePopin");

highscoreNew = new FlxSprite(44 + FullScreenScaleMode.gameNotchSize.x, 557);

score = new ResultScore(35 + FullScreenScaleMode.gameNotchSize.x, 305, 10, params.scoreData.score);

rankBg = new FunkinSprite(0, 0);
}

override function create():Void
{

cameraScroll.canvas.rotation = -3.8;

cameraBG.bgColor = FlxColor.MAGENTA;
cameraScroll.bgColor = FlxColor.TRANSPARENT;
cameraEverything.bgColor = FlxColor.TRANSPARENT;


this.camera = cameraEverything;


bg.scrollFactor.set();
bg.zIndex = 10;
bg.cameras = [cameraBG];
add(bg);

bgFlash.scrollFactor.set();
bgFlash.visible = false;
bgFlash.zIndex = 20;
add(bgFlash);

soundSystem.animation.addByPrefix("idle", "sound system", 24, false);
soundSystem.visible = false;
new FlxTimer().start(8 / 24, _ ->
{
soundSystem.animation.play("idle");
soundSystem.visible = true;
});
soundSystem.zIndex = 1100;
add(soundSystem);

playerCharacterId = PlayerRegistry.instance.getCharacterOwnerId(params.characterId) ?? 'bf';
playerCharacter = PlayerRegistry.instance.fetchEntry(playerCharacterId);


for (animData in playerAnimationDatas)
{

{
}


{
animPath = Paths.stripLibrary(animData.assetPath);
animLibrary = Paths.getLibrary(animData.assetPath);
}
switch (animData.renderType)
{
case 'animateatlas':


else
animation = FunkinSprite.createTextureAtlas(xPos, yPos, animPath, animLibrary);


{
animation.applyStageMatrix = true;
}

animation.zIndex = animData.zIndex ?? 500;

animation.scale.set(animData.scale ?? 1.0, animData.scale ?? 1.0);

{
animation.anim.onFinish.add((_name:String) ->
{
{
animation.anim.pause();
}
});
}
else if (animData.loopFrameLabel != null)
{
animation.anim.onFinish.add((_name:String) ->
{
{
animation.anim.play(animData.loopFrameLabel ?? '', true); // unpauses this anim, since it's on PlayOnce!
animation.anim.curAnim.looped = true;
}
});
}
else if (animData.loopFrame != null)
{
animation.anim.onFinish.add((_name:String) ->
{
{
animation.anim.play("", true, false, animData.loopFrame ?? 0); // unpauses this anim, since it's on PlayOnce!
}
});
}

animation.visible = false;
characterAtlasAnimations.push({
sprite: animation,
delay: animData.delay ?? 0.0,
forceLoop: (animData.loopFrame ?? -1) == 0,
startFrameLabel: (animData.startFrameLabel ?? ""),
sound: (animData.sound ?? "")
});
add(animation);
case 'sparrow':

offsets[0] + (FullScreenScaleMode.gameCutoutSize.x / 2), offsets[1]);
else
animation = FunkinSprite.createSparrow(offsets[0] + (FullScreenScaleMode.gameCutoutSize.x / 2), offsets[1], animPath);


animation.animation.addByPrefix('idle', '', 24, false, false, false);

{
animation.animation.onFinish.add((_name:String) ->
{
{
animation.animation.play('idle', true, false, animData.loopFrame ?? 0);
}
});
}

animation.visible = false;
characterSparrowAnimations.push({
sprite: animation,
delay: animData.delay ?? 0.0
});
add(animation);
}
}

difficulty.loadGraphic(Paths.image("resultScreen/" + diffSpr));
add(difficulty);

add(songName);

blackTopBar.loadGraphic(funkin.util.BitmapUtil.createResultsBar());
blackTopBar.y = -blackTopBar.height;
FlxTween.tween(blackTopBar, {y: 0}, 7 / 24, {ease: FlxEase.quartOut, startDelay: 3 / 24, onComplete: _ -> songName.visible = true});
blackTopBar.zIndex = 1010;
add(blackTopBar);

difficulty.y += (blackTopBar.height - 148);
clearPercentSmall.y += (blackTopBar.height - 148);
songName.y += (blackTopBar.height - 148);

speedOfTween.x = -1.0 * Math.cos(angleRad);
speedOfTween.y = -1.0 * Math.sin(angleRad);

timerThenSongName(1.0, false);

songName.shader = maskShaderSongName;
difficulty.shader = maskShaderDifficulty;

maskShaderDifficulty.swagMaskX = difficulty.x - 30;

resultsAnim.animation.addByPrefix("result", "results instance 1", 24, false);
resultsAnim.visible = false;
resultsAnim.zIndex = 1200;
add(resultsAnim);
new FlxTimer().start(6 / 24, _ ->
{
resultsAnim.visible = true;
resultsAnim.animation.play("result");
});

ratingsPopin.animation.addByPrefix("idle", "Categories", 24, false);
ratingsPopin.visible = false;
ratingsPopin.zIndex = 1200;
add(ratingsPopin);
new FlxTimer().start(21 / 24, _ ->
{
ratingsPopin.visible = true;
ratingsPopin.animation.play("idle");
});

scorePopin.animation.addByPrefix("score", "tally score", 24, false);
scorePopin.visible = false;
scorePopin.zIndex = 1200;
add(scorePopin);
new FlxTimer().start(36 / 24, _ ->
{
scorePopin.visible = true;
scorePopin.animation.play("score");
scorePopin.animation.onFinish.add(anim -> {
});
});

new FlxTimer().start(37 / 24, _ ->
{
score.visible = true;
score.animateNumbers();
startRankTallySequence();
});

new FlxTimer().start(rank.getBFDelay(), _ ->
{
afterRankTallySequence();
});

new FlxTimer().start(rank.getFlashDelay(), _ ->
{
displayRankText();
});

highscoreNew.frames = Paths.getSparrowAtlas("resultScreen/highscoreNew");
highscoreNew.animation.addByPrefix("new", "highscoreAnim0", 24, false);
highscoreNew.visible = false;
highscoreNew.updateHitbox();
highscoreNew.zIndex = 1200;
add(highscoreNew);

new FlxTimer().start(rank.getHighscoreDelay(), _ ->
{
{
highscoreNew.visible = true;
highscoreNew.animation.play("new");
highscoreNew.animation.onFinish.add(_ -> highscoreNew.animation.play("new", true, false, 16));
}
else
{
highscoreNew.visible = false;
}
});


ratingGrp.zIndex = 1200;
add(ratingGrp);

/**
* NOTE: We display how many notes were HIT, not how many notes there were in total.
*
*/
ratingGrp.add(totalHit);

ratingGrp.add(maxCombo);

{
totalHit.x -= 30;
maxCombo.x -= 30;
}

hStuf += 2;

hStuf += 2;

0xFF89E59E);
ratingGrp.add(tallySick);

0xFF89C9E5);
ratingGrp.add(tallyGood);

0xFFE6CF8A);
ratingGrp.add(tallyBad);

0xFFE68C8A);
ratingGrp.add(tallyShit);

0xFFC68AE6);
ratingGrp.add(tallyMissed);

score.visible = false;
score.zIndex = 1200;
add(score);

for (ind => rating in ratingGrp.members)
{
rating.visible = false;
new FlxTimer().start((0.3 * ind) + 1.20, _ ->
{
rating.visible = true;
FlxTween.tween(rating, {curNumber: rating.neededNumber}, 0.5, {ease: FlxEase.quartOut});
});
}


new FlxTimer().start(rank.getMusicDelay(), _ ->
{

{


introMusicAudio = FunkinSound.load(introMusic, 1.0, false, true, true, () ->
{
introMusicAudio = null;
musicLoop.play();
FunkinSound.setMusic(musicLoop);
else // Play the results music as a looped sound instead (that we cancel before closing and returning to the chart editor)
{
resultsMusic = musicLoop;
false; // Why is this necessary for this to work?
}
});
}
else
{
startingVolume: 1.0,
overrideExisting: true,
restartTrack: true
});
else
{
resultsMusic = FunkinSound.load(Paths.music(getMusicPath(playerCharacter, rank) + '/' + getMusicPath(playerCharacter, rank)), 1.0, true, false, true);
}
}
});

rankBg.makeSolidColor(FlxG.width, FlxG.height, 0xFF000000);
rankBg.zIndex = 99999;
add(rankBg);

rankBg.alpha = 0;

refresh();

super.create();
}

function getMusicPath(playerCharacter:Null<PlayableCharacter>, rank:ScoringRank):String
{
}


function startRankTallySequence():Void
{
bgFlash.visible = true;
FlxTween.tween(bgFlash, {alpha: 0}, 5 / 24);
clearPercentTarget = Math.floor(clearPercentFloat);

clearPercentLerp = Std.int(Math.max(0, clearPercentTarget - 36));


FlxTween.tween(clearPercentCounter, {curNumber: clearPercentTarget}, 58 / 24, {
ease: FlxEase.quartOut,
onUpdate: _ ->
{
clearPercentLerp = Math.round(clearPercentLerp);
clearPercentCounter.curNumber = Math.round(clearPercentCounter.curNumber);
{
clearPercentLerp = clearPercentCounter.curNumber;
FunkinSound.playOnce(Paths.sound('scrollMenu'));

HapticUtil.vibrate(0, 0.01);
}
},
onComplete: _ ->
{
HapticUtil.vibrate(Constants.DEFAULT_VIBRATION_PERIOD, Constants.DEFAULT_VIBRATION_DURATION * 5, Constants.MAX_VIBRATION_AMPLITUDE);

FunkinSound.playOnce(Paths.sound('confirmMenu'));

clearPercentCounter.curNumber = clearPercentTarget;


clearPercentCounter.flash(true);
new FlxTimer().start(0.4, _ ->
{
clearPercentCounter.flash(false);
});


new FlxTimer().start(0.25, _ ->
{
FlxTween.tween(clearPercentCounter, {alpha: 0}, 0.5, {
startDelay: 0.5,
ease: FlxEase.quartOut,
onComplete: _ ->
{
remove(clearPercentCounter);
}
});

});
}
});
clearPercentCounter.zIndex = 450;
add(clearPercentCounter);

{
}
else
{

ratingsPopin.animation.onFinish.add(anim -> {

});
}

refresh();
}

function displayRankText():Void
{
bgFlash.visible = true;
bgFlash.alpha = 1;
FlxTween.tween(bgFlash, {alpha: 0}, 14 / 24);

rankTextVert.x = FlxG.width - 44;
rankTextVert.y = 100;
rankTextVert.zIndex = 990;
add(rankTextVert);

FlxFlicker.flicker(rankTextVert, 2 / 24 * 3, 2 / 24, true);

new FlxTimer().start(30 / 24, _ ->
{
rankTextVert.velocity.y = -80;
});

for (i in 0...12)
{
rankTextBack.x = FlxG.width / 2 - 320;
rankTextBack.y = 50 + (135 * i / 2) + 10;
rankTextBack.zIndex = 100;
rankTextBack.cameras = [cameraScroll];
add(rankTextBack);

rankTextBack.velocity.x = (i % 2 == 0) ? -7.0 : 7.0;
}

refresh();
}

function afterRankTallySequence():Void
{
showSmallClearPercent();

for (atlas in characterAtlasAnimations)
{
new FlxTimer().start(atlas.delay, _ ->
{
atlas.sprite.visible = true;
atlas.sprite.anim.play(atlas.startFrameLabel);
{

FunkinSound.playOnce(Paths.sound(sndPath, sndLibrary), 1.0);
}
});
}

for (sprite in characterSparrowAnimations)
{
new FlxTimer().start(sprite.delay, _ ->
{
sprite.sprite.visible = true;
sprite.sprite.animation.play('idle', true);
});
}
}

function timerThenSongName(timerLength:Float = 3.0, autoScroll:Bool = true):Void
{
movingSongStuff = false;

difficulty.x = 555 + FullScreenScaleMode.gameNotchSize.x;


difficulty.y = -difficulty.height;
FlxTween.tween(difficulty, {y: diffYTween + (blackTopBar.height - 148)}, 0.5, {ease: FlxEase.expoOut, startDelay: 0.8});

{
clearPercentSmall.x = (difficulty.x + difficulty.width) + 60;
clearPercentSmall.y = -clearPercentSmall.height;
FlxTween.tween(clearPercentSmall, {y: (122 - 5) + (blackTopBar.height - 148)}, 0.5, {ease: FlxEase.expoOut, startDelay: 0.85});
}

songName.y = -songName.height;
FlxTween.tween(songName, {y: (diffYTween - 25 - fuckedupnumber) + ((blackTopBar.height - 148) / 1)}, 0.5, {ease: FlxEase.expoOut, startDelay: 0.9});
songName.x = clearPercentSmall.x + 94;

new FlxTimer().start(timerLength, _ ->
{

speedOfTween.set(0, 0);
FlxTween.tween(speedOfTween, {x: tempSpeed.x, y: tempSpeed.y}, 0.7, {ease: FlxEase.quadIn});

movingSongStuff = (autoScroll);
});
}

function showSmallClearPercent():Void
{
{
add(clearPercentSmall);
clearPercentSmall.visible = true;
clearPercentSmall.flash(true);
new FlxTimer().start(0.4, _ ->
{
clearPercentSmall.flash(false);
});

clearPercentSmall.curNumber = clearPercentTarget;
clearPercentSmall.zIndex = 1000;
refresh();
}

new FlxTimer().start(2.5, _ ->
{
movingSongStuff = true;
});
}


override function draw():Void
{
super.draw();

songName.clipRect = FlxRect.get(Math.max(0, 520 - songName.x), 0, FlxG.width, songName.height);
clearPercentSmall.forEachAlive(spr -> spr.clipRect = FlxRect.get(Math.max(0, 520 - spr.x), 0, FlxG.width, spr.height));


}

override function update(elapsed:Float):Void
{
maskShaderDifficulty.swagSprX = difficulty.x;

{

songName.x += speedX;
difficulty.x += speedX;
clearPercentSmall.x += speedX;
songName.y += speedY;
difficulty.y += speedY;
clearPercentSmall.y += speedY;

{
timerThenSongName();
}
}

{
{
{
introMusicAudio.stop();
introMusicAudio.destroy();
introMusicAudio = null;
}
close(); // IF we are a substate, we will close ourselves. This is used from ResultsDebugSubState
}
else if (introMusicAudio != null)
{
introMusicAudio.onComplete = null;

FlxTween.tween(introMusicAudio, {volume: 0}, 0.8, {
onComplete: _ ->
{
{
introMusicAudio.stop();
introMusicAudio.destroy();
introMusicAudio = null;
}
}
});
FlxTween.tween(introMusicAudio, {pitch: 3}, 0.1, {
onComplete: _ ->
{
FlxTween.tween(introMusicAudio, {pitch: 0.5}, 0.4);
}
});
}
else if (FlxG.sound.music != null)
{
FlxTween.tween(FlxG.sound.music, {volume: 0}, 0.8, {
onComplete: _ ->
{
}
});
FlxTween.tween(FlxG.sound.music, {pitch: 3}, 0.1, {
onComplete: _ ->
{
FlxTween.tween(FlxG.sound.music, {pitch: 0.5}, 0.4);
}
});
}



});

{
stickerPackId = song.getStickerPackId(params?.difficultyId ?? Constants.DEFAULT_DIFFICULTY, params?.variationId ?? Constants.DEFAULT_VARIATION);
}
{
stickerPackId = playerCharacter.getStickerPackID();
}

{
{
targetState = new StoryMenuState(null);


for (charId in newCharacters)
{
shouldTween = true;
targetState = new funkin.ui.charSelect.CharacterUnlockState(charId, targetState);
}
}
else
{
shouldTween = false;
shouldUseSubstate = true;
targetStateFactory = () -> new StickerSubState({
targetState: (sticker) -> new StoryMenuState(sticker),
stickerPack: stickerPackId
});
}
}
else
{

{

shouldTween = true;
{
PlayState.instance?.close();
FlxTimer.globalManager.clear();
FlxTween.globalManager.clear();
this.close();
}
targetState = FreeplayState.build({
{
character: playerCharacterId ?? "bf",
fromResults: {
oldRank: Scoring.calculateRank(params?.prevScoreData),
newRank: rank,
songId: params.songId,
difficultyId: params.difficultyId,
playRankAnim: true
}
}
});
}
else
{
{
PlayState.instance?.close();
FlxTimer.globalManager.clear();
FlxTween.globalManager.clear();
this.close();
}
shouldTween = false;
shouldUseSubstate = true;
targetStateFactory = () -> new StickerSubState({
targetState: (sticker) -> FreeplayState.build(null, sticker),
stickerPack: stickerPackId
});
}
}

{
busy = true;

AdMobUtil.loadInterstitial(function():Void
{
AdMobUtil.PLAYING_COUNTER = 0;

busy = false;

transitionToState(targetState, targetStateFactory, shouldTween, shouldUseSubstate);
});
}
else
{
transitionToState(targetState, targetStateFactory, shouldTween, shouldUseSubstate);
}
transitionToState(targetState, targetStateFactory, shouldTween, shouldUseSubstate);
}

super.update(elapsed);
}

function transitionToState(targetState:FlxState, targetStateFactory:Null<Void->StickerSubState>, shouldTween:Bool, shouldUseSubstate:Bool):Void
{
{
FlxTween.tween(rankBg, {alpha: 1}, 0.5, {
ease: FlxEase.expoOut,
onComplete: function(_)
{
requestReview();

{
targetState = targetStateFactory();
}

{
openSubState(cast targetState);
}
else
{
{
else
funkin.FunkinMemory.purgeCache();
funkin.FunkinMemory.purgeCache(true);
});
}
}
});
}
else
{
requestReview();

{
targetState = targetStateFactory();
}

{
openSubState(cast targetState);
}
else
{
{
else
funkin.FunkinMemory.purgeCache();
funkin.FunkinMemory.purgeCache(true);
});
}
}
}

function requestReview():Void
{
{

InAppReviewUtil.requestReview();
}
}
}

typedef ResultsStateParams =
{
/**
* True if results are for a level, false if results are for a single song.
*/

/**
* A readable title for the song we just played.
* Either "Song Name by Artist Name" or "Week Name"
*/

/**
* The internal song ID for the song we just played.
*/

/**
* The character ID for the song we just played.
* @default `bf`
*/

/**
* Whether the displayed score is a new highscore
*/

/**
* Whether the displayed score is from a song played with Practice Mode enabled.
*/

/**
* Whether the displayed score is from a song played with Bot Play Mode enabled.
*/

/**
* The difficulty ID of the song/week we just played.
* @default `Constants.DEFAULT_DIFFICULTY`
*/

/**
* The variation ID of the song/week we just played.
* @default `Constants.DEFAULT_VARIATION`
*/

/**
* The score, accuracy, and judgements.
*/

/**
* The previous score data, used for rank comparision.
*/

/**
* Forces to do the rank slamming animation in freeplay for debug purposes
*/
};
