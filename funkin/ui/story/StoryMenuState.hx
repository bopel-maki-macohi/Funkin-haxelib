package funkin.ui.story;


class StoryMenuState extends MusicBeatState
{





//
//

/**
* The title of the level at the top.
*/

/**
* The score text at the top.
*/

/**
* The mode text at the top-middle.
*/

/**
* The list of songs on the left.
*/

/**
* The titles of the levels in the middle.
*/

/**
* The props in the center.
*/

/**
* The background behind the props.
*/

/**
* The left arrow of the difficulty selector.
*/

/**
* The right arrow of the difficulty selector.
*/

/**
* The text of the difficulty selector.
*/

/**
* List of available level IDs.
*/




public function new(?stickers:StickerSubState = null)
{
super();

{
stickerSubState = stickers;
}
}

override function create():Void
{
super.create();

levelList = LevelRegistry.instance.listSortedLevelIds();
levelList = levelList.filter(function(id)
{

});

difficultySprites = new Map<String, FlxSprite>();

transIn = FlxTransitionableState.defaultTransIn;
transOut = FlxTransitionableState.defaultTransOut;

playMenuMusic();

{
this.persistentUpdate = true;
this.persistentDraw = true;

openSubState(stickerSubState);
stickerSubState.degenStickers();
}

persistentUpdate = persistentDraw = true;

rememberSelection();

updateData();

levelTitles = new FlxTypedGroup<LevelTitle>();
levelTitles.zIndex = 15;
add(levelTitles);

updateBackground();

black.zIndex = levelBackground.zIndex - 1;
add(black);

levelProps = new FlxTypedGroup<LevelProp>();
levelProps.zIndex = 1000;
add(levelProps);

updateProps();

tracklistText = new FlxText(0, levelBackground.x + levelBackground.height + 100, 0, "Tracks", 32);
tracklistText.setFormat('VCR OSD Mono', 32);
tracklistText.alignment = CENTER;
tracklistText.color = 0xFFE55777;
add(tracklistText);

scoreText = new FlxText(Math.max(FullScreenScaleMode.gameNotchSize.x, 10), 10, 0, 'HIGH SCORE: 42069420');
scoreText.setFormat('VCR OSD Mono', 32);
scoreText.zIndex = 1000;
add(scoreText);

levelTitleText = new FlxText(Math.max((FlxG.width * 0.7), FlxG.width - FullScreenScaleMode.gameNotchSize.x), 10, 0, 'LEVEL 1');
levelTitleText.setFormat('VCR OSD Mono', 32, FlxColor.WHITE, RIGHT);
levelTitleText.alpha = 0.7;
levelTitleText.zIndex = 1000;
add(levelTitleText);

buildLevelTitles();

leftDifficultyArrow = new FlxSprite(FlxG.width - (useNotch ? (FullScreenScaleMode.gameNotchSize.x) + 410 : 410), 480);
leftDifficultyArrow.frames = Paths.getSparrowAtlas('storymenu/ui/arrows');
leftDifficultyArrow.animation.addByPrefix('idle', 'leftIdle0');
leftDifficultyArrow.animation.addByPrefix('press', 'leftConfirm0');
leftDifficultyArrow.animation.play('idle');
add(leftDifficultyArrow);

buildDifficultySprite(Constants.DEFAULT_DIFFICULTY);
buildDifficultySprite();

rightDifficultyArrow = new FlxSprite(FlxG.width - (useNotch ? FullScreenScaleMode.gameNotchSize.x * 1.5 : 35), leftDifficultyArrow.y);
rightDifficultyArrow.frames = leftDifficultyArrow.frames;
rightDifficultyArrow.animation.addByPrefix('idle', 'rightIdle0');
rightDifficultyArrow.animation.addByPrefix('press', 'rightConfirm0');
rightDifficultyArrow.animation.play('idle');
add(rightDifficultyArrow);

add(difficultySprite);

updateText();
changeDifficulty();
changeLevel();
refresh();


addBackButton(FlxG.width - 230, FlxG.height - 170, FlxColor.WHITE, goBack, 0.7);

}

function rememberSelection():Void
{
{
currentLevelId = rememberedLevelId;
}
{
currentDifficultyId = rememberedDifficulty;
}
}

function playMenuMusic():Void
{
FunkinSound.playMusic('freakyMenu', {
overrideExisting: true,
restartTrack: false,
persist: true
});
}

function updateData():Void
{
currentLevel = LevelRegistry.instance.fetchEntry(currentLevelId);
isLevelUnlocked = currentLevel == null ? false : currentLevel.isUnlocked();
}

function buildDifficultySprite(?diff:String):Void
{
remove(difficultySprite);
difficultySprite = difficultySprites.get(diff);
{
difficultySprite = new FlxSprite(leftDifficultyArrow.x + leftDifficultyArrow.width + 10, leftDifficultyArrow.y);

{
difficultySprite.frames = Paths.getSparrowAtlas('storymenu/difficulties/${diff}');
difficultySprite.animation.addByPrefix('idle', 'idle0', 24, true);
}
else
{
difficultySprite.loadGraphic(Paths.image('storymenu/difficulties/${diff}'));
}

difficultySprites.set(diff, difficultySprite);

difficultySprite.x += (difficultySprites.get(Constants.DEFAULT_DIFFICULTY).width - difficultySprite.width) / 2;
}
difficultySprite.alpha = 0;

difficultySprite.y = leftDifficultyArrow.y - 15;
targetY -= (difficultySprite.height - difficultySprites.get(Constants.DEFAULT_DIFFICULTY).height) / 2;
FlxTween.tween(difficultySprite, {y: targetY, alpha: 1}, 0.07);

add(difficultySprite);
}

function buildLevelTitles():Void
{
levelTitles.clear();

for (levelIndex in 0...levelList.length)
{


levelTitleItem.targetY = ((levelTitleItem.height + 20) * levelIndex);
levelTitleItem.screenCenter(X);
levelTitles.add(levelTitleItem);
}
}

override function update(elapsed:Float):Void
{
Conductor.instance.update();

highScoreLerp = Std.int(MathUtil.snap(MathUtil.smoothLerpPrecision(highScoreLerp, highScore, elapsed, 0.307), highScore, 1));

scoreText.text = 'LEVEL SCORE: ${FlxStringUtil.formatMoney(highScoreLerp, false, commaSeparated)}';

levelTitleText.text = currentLevel.getTitle();

levelTitleText.x = FlxG.width - (levelTitleText.width + Math.max(10, FullScreenScaleMode.gameNotchSize.x)); // Right align.

handleKeyPresses();

{
}

super.update(elapsed);
}

function handleKeyPresses():Void
{

{
{
{
changeLevel(-1);
changeDifficulty(0);
}

{
changeLevel(1);
changeDifficulty(0);
}

{
changeLevel(levelList.length);
changeDifficulty(0);
}

{
changeLevel(-levelList.length);
changeDifficulty(0);
}


{
changeLevel(-wheelAmount);
}

|| (SwipeUtil.swipeRight && TouchUtil.touch != null && TouchUtil.touch.deltaViewY < 10 && TouchUtil.touch.deltaViewY > -10)
|| (TouchUtil.pressAction(rightDifficultyArrow, null, false)) #end)
{
&& !TouchUtil.pressAction(rightDifficultyArrow, null, false)) TouchUtil.touch._startY = TouchUtil.touch.viewY;
changeDifficulty(1);
}

|| (SwipeUtil.swipeLeft && TouchUtil.touch != null && TouchUtil.touch.deltaViewY < 10 && TouchUtil.touch.deltaViewY > -10)
|| (TouchUtil.pressAction(leftDifficultyArrow, null, false)) #end)
{
&& !TouchUtil.pressAction(leftDifficultyArrow, null, false)) TouchUtil.touch._startY = TouchUtil.touch.viewY;
changeDifficulty(-1);
}

{
rightDifficultyArrow.animation.play('press');
}
else
{
rightDifficultyArrow.animation.play('idle');
}

{
leftDifficultyArrow.animation.play('press');
}
else
{
leftDifficultyArrow.animation.play('idle');
}
}

{
selectLevel();
}

{
for (i in 0...levelTitles.members.length)
{


(item == selectedItem) ? selectLevel() : changeLevel(i - levelList.indexOf(currentLevelId));
}
}
}

}

/**
* Changes the selected level.
* @param change +1 (down), -1 (up)
*/
function changeLevel(change:Int = 0):Void
{

currentIndex += change;


currentLevelId = levelList[currentIndex];
rememberedLevelId = currentLevelId;

updateData();

for (index in 0...levelTitles.members.length)
{

{
currentLevelTitle = item;
item.alpha = 1.0;
}
else
{
item.alpha = 0.6;
}
}


repositionTitles();
updateText();
updateBackground(previousLevelId);
updateProps();
refresh();
}

/**
* Changes the selected difficulty.
* @param change +1 (right) to increase difficulty, -1 (left) to decrease difficulty
*/
function changeDifficulty(change:Int = 0):Void
{


currentIndex += change;


currentDifficultyId = difficultyList[currentIndex];
rememberedDifficulty = currentDifficultyId;

{
leftDifficultyArrow.visible = false;
rightDifficultyArrow.visible = false;
}
else
{
leftDifficultyArrow.visible = true;
rightDifficultyArrow.visible = true;
}

{
buildDifficultySprite();
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
}

updateText();
refresh();
}


function funnyMusicThing():Void
{
{
}
else
{
}
}

public override function dispatchEvent(event:ScriptEvent):Void
{
super.dispatchEvent(event);

{
for (prop in levelProps.members)
{
ScriptEventDispatcher.callEvent(prop, event);
}
}
}

function selectLevel():Void
{
{
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}


selectedLevel = true;

FunkinSound.playOnce(Paths.sound('confirmMenu'));

currentLevelTitle.isFlashing = true;

for (prop in levelProps.members)
{
prop.playConfirm();
}

Paths.setCurrentLevel(currentLevel.id);

PlayStatePlaylist.playlistSongIds = currentLevel.getSongs();
PlayStatePlaylist.isStoryMode = true;
PlayStatePlaylist.campaignScore = 0;



PlayStatePlaylist.campaignId = currentLevel.id;
PlayStatePlaylist.campaignTitle = currentLevel.getTitle();
PlayStatePlaylist.campaignDifficulty = currentDifficultyId;

Highscore.talliesLevel = new funkin.Highscore.Tallies();

new FlxTimer().start(1, function(tmr:FlxTimer)
{
FlxTween.tween(backButton, {alpha: 0}, 0.2, {ease: FlxEase.quadOut});

FlxTransitionableState.skipNextTransIn = false;
FlxTransitionableState.skipNextTransOut = false;


{
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: PlayStatePlaylist.campaignDifficulty,
targetVariation: targetVariation
}, true);
});
});
}

function updateBackground(?previousLevelId:String = ''):Void
{
{
levelBackground = currentLevel.buildBackground();
levelBackground.x = 0;
levelBackground.y = 56;
levelBackground.zIndex = 100;
levelBackground.alpha = 1.0; // Not hidden.
add(levelBackground);
}
else
{

{
{
FlxTween.cancelTweensOf(levelBackground);
FlxTween.color(levelBackground, 0.9, levelBackground.color, currentColor, {ease: FlxEase.quartOut});
}
else
{
}
}
else
{

FlxTween.tween(oldBackground, {alpha: 0.0}, 0.6, {
ease: FlxEase.linear,
onComplete: function(_)
{
remove(oldBackground);
}
});

levelBackground = currentLevel.buildBackground();
levelBackground.x = 0;
levelBackground.y = 56;
levelBackground.alpha = 0.0; // Hidden to start.
levelBackground.zIndex = 100;
add(levelBackground);

FlxTween.tween(levelBackground, {alpha: 1.0}, 0.6, {
ease: FlxEase.linear
});
}
}
}

function updateProps():Void
{
for (ind => prop in currentLevel.buildProps(levelProps.members))
{
prop.x += (FullScreenScaleMode.gameCutoutSize.x / 4);
prop.zIndex = 1000;
}

refresh();
}

function updateText():Void
{
tracklistText.text = 'TRACKS\n\n';
tracklistText.text += currentLevel.getSongDisplayNames(currentDifficultyId).join('\n');

tracklistText.screenCenter(X);
tracklistText.x -= (FlxG.width * 0.33);

highScore = levelScore?.score ?? 0;
}

function goBack():Void
{

exitingMenu = true;
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}

/**
* Reposition titles based on the currently selected one.
*/
function repositionTitles()
{

levelTitles.members[currentIndex].targetY = 480;

{
for (i in 0...currentIndex)
{
levelTitles.members[itemIndex].targetY = nextItem.targetY - Math.max(levelTitles.members[itemIndex].height + 20, 125);
}
}

{
for (i in (currentIndex + 1)...levelTitles.members.length)
{
levelTitles.members[i].targetY = previousItem.targetY + (previousItem.height + 20);
}
}
}
}
