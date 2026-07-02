package funkin.ui.freeplay;


/**
* The state for the freeplay menu, allowing the player to select any song to play.
*/
class FreeplayState extends MusicBeatSubState
{
//
//

/**
* The current character for this FreeplayState.
* You can't change this without transitioning to a new FreeplayState.
*/


/**
* For the audio preview, the duration of the fade-in effect.
*/
public static final FADE_IN_DURATION:Float = 0.5;

/**
* For the audio preview, the duration of the fade-out effect.
*
*/
public static final FADE_OUT_DURATION:Float = 0.25;

/**
* For the audio preview, the volume at which the fade-in starts.
*/
public static final FADE_IN_START_VOLUME:Float = 0.25;

/**
* For the audio preview, the volume at which the fade-in ends.
*/
public static final FADE_IN_END_VOLUME:Float = 1.0;

/**
* For the audio preview, the volume at which the fade-out starts.
*/
public static final FADE_OUT_END_VOLUME:Float = 0.0;

/**
* For scaling some sprites on wide displays.
*/

/**
* For positioning the DJ on wide displays.
*/
public static final DJ_POS_MULTI:Float = 0.44;

/**
* For positioning the songs list on wide displays.
*/
public static final SONGS_POS_MULTI:Float = 0.75;

/**
* For positioning the difficulty dots.
*/
public static final DEFAULT_DOTS_GROUP_POS:Array<Int> = [260, 170];

/**
* For the audio preview, the time to wait before attempting to load a song preview.
*/
public static final FADE_IN_DELAY:Float = 0.25;




/**
* Currently selected difficulty, in string form.
*/

/**
*  Current variation: default, erect, pico, bf, etc.
*/




/**
*  An array of preview timers, so that we can prevent the timers from overlapping.
*/

/**
* Bit of a utility var to get the currently displayed DifficultySprite
*
* The getter looks like this
* `return grpDifficulties.members.filter(d -> d.difficultyId == currentDifficulty)[0];`
*/

function get_currentDifficultySprite():DifficultySprite
{
}

/**
* Another utility var, this one gets our current selected capsule easily
*/

function get_currentCapsule():SongMenuItem
{
}









/**
* The difficulty we were on when this menu was last accessed.
*/

/**
* The song we were on when this menu was last accessed.
* NOTE: `null` if the last song was `Random`.
*/

/**
* The character we were on when this menu was last accessed.
*/

/**
* The remembered variation we were on when this menu was last accessed.
*/




/**
* The card behind the DJ !
*/

/**
* The backing card that has the toned dots, right now we just use that one dad graphic dave cooked up
*/





public function new(?params:FreeplayStateParams, ?stickers:StickerSubState)
{
{
{
result = PlayerRegistry.instance.fetchEntry(Constants.DEFAULT_CHARACTER);
}
};

currentCharacter = fetchPlayableCharacter();
currentCharacterId = currentCharacter.id;

currentVariation = rememberedVariation;
currentDifficulty = rememberedDifficulty;
styleData = FreeplayStyleRegistry.instance.fetchEntry(currentCharacter.getFreeplayStyleID());
rememberedCharacterId = currentCharacter?.id ?? Constants.DEFAULT_CHARACTER;

fromCharSelect = params?.fromCharSelect ?? false;
fromResultsParams = params?.fromResults;
prepForNewRank = fromResultsParams?.playRankAnim ?? false;

super(FlxColor.TRANSPARENT);

{
stickerSubState = stickers;
forceSkipIntro = true;
}


{
backingCardPrep = new NewCharacterCard(currentCharacterId);
}
else
{
for (cardClass in allScriptedCards)
{
{
backingCardPrep = card;
break;
}
}
}

backingCard = backingCardPrep ?? new BackingCard(currentCharacterId);

albumRoll = new AlbumRoll();
fpScoreDisplay = new FreeplayScore(FlxG.width - (FullScreenScaleMode.gameNotchSize.x + 353), 60, 7, 100, styleData);
rankCamera = new FunkinCamera('rankCamera', 0, 0, FlxG.width, FlxG.height);
funnyCam = new FunkinCamera('freeplayFunny', 0, 0, FlxG.width, FlxG.height);
grpCapsules = new SongItemGroup();
grpDifficulties = new FlxTypedSpriteGroup<DifficultySprite>(-300, 80);

difficultyDots = new FlxTypedSpriteGroup<DifficultyDot>(DEFAULT_DOTS_GROUP_POS[0], DEFAULT_DOTS_GROUP_POS[1]);
letterSort = new LetterSort((CUTOUT_WIDTH * SONGS_POS_MULTI) + 400, 75);
rankBg = new FunkinSprite(0, 0);
rankVignette = new FlxSprite(0, 0).loadGraphic(Paths.image('freeplay/rankVignette'));
sparks = new FlxSprite(0, 0);
sparksADD = new FlxSprite(0, 0);
txtCompletion = new AtlasText(FlxG.width - (FullScreenScaleMode.gameNotchSize.x + 95), 87, '69', AtlasFont.FREEPLAY_CLEAR);

ostName = new FlxText(8 - FullScreenScaleMode.gameNotchSize.x, 8, FlxG.width - 8 - 8, Constants.DEFAULT_OST_NAME, 48);
charSelectHint = new FlxText(-40, 18, FlxG.width - 8 - 8, 'Press [ LOL ] to change characters', 32);

backingImage = FunkinSprite.create(backingCard.pinkBack.width * 0.74, 0, styleData == null ? 'freeplay/freeplayBGweek1-bf' : styleData.getBgAssetKey());

diffSelLeft = new DifficultySelector((CUTOUT_WIDTH * DJ_POS_MULTI) + 20, grpDifficulties.y - 10, false, controls, styleData, uiStateMachine);
diffSelRight = new DifficultySelector((CUTOUT_WIDTH * DJ_POS_MULTI) + 325, grpDifficulties.y - 10, true, controls, styleData, uiStateMachine);
}

override function create():Void
{
super.create();

FlxTransitionableState.skipNextTransIn = true;

funnyCam.filters = [fadeShaderFilter];
funnyCam.filtersEnabled = false;

{
this.persistentUpdate = true;
this.persistentDraw = true;

openSubState(stickerSubState);
stickerSubState.degenStickers();
}

{
this._parentState._constructor = () ->
{
}
}


uiStateMachine.transition(EnteringFreeplay);

songs.push(null);

for (levelId in LevelRegistry.instance.listSortedLevelIds())
{

{
continue;
}

for (songId in level.getSongs())
{

{
continue;
}

songs.push(new FreeplaySongData(songId, level, this));
}
}



backingCard.instance = this;
add(backingCard);
ScriptEventDispatcher.callEvent(backingCard, new ScriptEvent(CREATE, false));
backingCard.applyExitMovers(exitMovers, exitMoversCharSel);

{
createFreeplayDJ((CUTOUT_WIDTH * DJ_POS_MULTI) + 640, 366, currentCharacterId);

{
exitMovers.set([dj], {
x: -dj.width * 1.6,
speed: 0.5
});
add(dj);
exitMoversCharSel.set([dj], {
y: -175,
speed: 0.8,
wait: 0.1
});
}
}

backingImage.shader = angleMaskShader;
backingImage.visible = false;

djHitbox.active = false;
add(djHitbox);
capsuleHitbox.cameras = [funnyCam];
capsuleHitbox.active = false;
add(capsuleHitbox);

add(blackOverlayBullshitLOLXD); // used to mask the text lol!

backingImage.setGraphicSize(0, FlxG.height + 1);
blackOverlayBullshitLOLXD.setGraphicSize(0, FlxG.height + 1);

backingImage.updateHitbox();
blackOverlayBullshitLOLXD.updateHitbox();

exitMovers.set([blackOverlayBullshitLOLXD, backingImage], {
x: FlxG.width * 1.5,
speed: 0.4,
wait: 0
});

exitMoversCharSel.set([blackOverlayBullshitLOLXD, backingImage], {
y: -100,
speed: 0.8,
wait: 0.1
});
add(grpDifficulties);
add(difficultyDots);
add(backingImage);

blackOverlayBullshitLOLXD.shader = backingImage.shader;

rankBg.makeSolidColor(FlxG.width, FlxG.height, 0xD3000000);
add(rankBg);

add(grpCapsules);

exitMovers.set([grpDifficulties], {
x: -300,
speed: 0.25,
wait: 0
});

exitMoversCharSel.set([grpDifficulties], {
y: -270,
speed: 0.8,
wait: 0.1
});

for (diffId in allDifficulties)
{
diffSprite.visible = diffId == Constants.DEFAULT_DIFFICULTY;
diffSprite.height *= 2.5;
grpDifficulties.add(diffSprite);
}

for (i in 0...allDifficulties.length)
{
difficultyDots.add(dot);
}

albumRoll.albumId = null;
albumRoll.visible = false;
albumRoll.applyExitMovers(exitMovers, exitMoversCharSel);
add(albumRoll);

overhangStuff.y -= overhangStuff.height;

{
blackOverlayBullshitLOLXD.visible = false;
overhangStuff.y = -100;
backingCard.skipIntroTween();
}
else
{
FlxTween.tween(overhangStuff, {y: -100}, 0.3, {ease: FlxEase.quartOut});
FlxTween.tween(blackOverlayBullshitLOLXD, {x: backingImage.x}, 0.7, {ease: FlxEase.quintOut});
}

topLeftCornerText.font = 'VCR OSD Mono';
topLeftCornerText.visible = false;

FlxColor.BLACK);
freeplayTxtBg.x = topLeftCornerText.x - 8;
freeplayTxtBg.visible = false;

freeplayArrow = new FlxText(Math.max(FullScreenScaleMode.gameNotchSize.x, 8), 8, 0, '<---', 48);
freeplayArrow.font = 'VCR OSD Mono';
freeplayArrow.visible = false;

ostName.font = 'VCR OSD Mono';
ostName.alignment = RIGHT;
ostName.visible = false;
ostName.shader = new StrokeShader(0xFFFFFFFF, 2, 2);

charSelectHint.alignment = CENTER;
charSelectHint.font = "5by7";
charSelectHint.color = 0xFF5F5F5F;
charSelectHint.text = 'Press [ ${controls.getDialogueNameFromControl(FREEPLAY_CHAR_SELECT, true)} ] to change characters';
else
charSelectHint.text = 'Tap the DJ to change characters';
charSelectHint.text = 'Press [ ${controls.getDialogueNameFromControl(FREEPLAY_CHAR_SELECT, true)} ] to change characters';
{
charSelectHint.y -= 100;
FlxTween.tween(charSelectHint, {y: charSelectHint.y + 100}, 0.8, {ease: FlxEase.quartOut});
}

exitMovers.set([overhangStuff, topLeftCornerText, ostName, charSelectHint, freeplayTxtBg, freeplayArrow], {
y: -overhangStuff.height,
x: 0,
speed: 0.2,
wait: 0
});

exitMoversCharSel.set([overhangStuff, topLeftCornerText, ostName, charSelectHint, freeplayTxtBg, freeplayArrow], {
y: -300,
speed: 0.8,
wait: 0.1
});

topLeftCornerText.shader = sillyStroke;
freeplayArrow.shader = sillyStroke;

fnfHighscoreSpr.frames = Paths.getSparrowAtlas('freeplay/highscore');
fnfHighscoreSpr.animation.addByPrefix('highscore', 'highscore small instance 1', 24, false);
fnfHighscoreSpr.visible = false;
fnfHighscoreSpr.setGraphicSize(0, Std.int(fnfHighscoreSpr.height * 1));
fnfHighscoreSpr.updateHitbox();
add(fnfHighscoreSpr);

new FlxTimer().start(FlxG.random.float(12, 50), function(tmr)
{
fnfHighscoreSpr.animation.play('highscore');
tmr.time = FlxG.random.float(20, 60);
}, 0);

fpScoreDisplay.visible = false;
add(fpScoreDisplay);

clearBoxSprite.visible = false;
add(clearBoxSprite);

txtCompletion.visible = false;
add(txtCompletion);

add(letterSort);
letterSort.visible = false;
letterSort.instance = this;

exitMovers.set([letterSort], {
y: -100,
speed: 0.3
});

exitMoversCharSel.set([letterSort], {
y: -270,
speed: 0.8,
wait: 0.1
});

letterSort.changeSelectionCallback = (str) ->
{
currentCapsule.selected = false;

switch (str)
{
case 'fav':
generateSongList({filterType: FAVORITE}, true, false);
case 'ALL':
generateSongList(null, true, false);
case '#':
generateSongList({filterType: REGEXP, filterData: '0-9'}, true, false);
default:
generateSongList({filterType: REGEXP, filterData: str}, true, false);
}

{
changeSelection();
}
else if (grpCapsules.members.length > 0)
{
curSelected = 1;
changeSelection();
}
};

exitMovers.set([fpScoreDisplay, fnfHighscoreSpr, clearBoxSprite], {
x: FlxG.width,
speed: 0.3
});

exitMovers.set([txtCompletion], {
x: FlxG.width * 1.05,
speed: 0.315
});

exitMoversCharSel.set([fpScoreDisplay, txtCompletion, fnfHighscoreSpr, clearBoxSprite], {
y: -270,
speed: 0.8,
wait: 0.1
});

diffSelLeft.visible = false;
add(diffSelLeft);

diffSelRight.visible = false;
add(diffSelRight);

add(overhangStuff);
add(freeplayArrow);
add(freeplayTxtBg);
add(topLeftCornerText);
add(ostName);

{
add(charSelectHint);
}

{

dispatchEvent(new FreeplayScriptEvent(FREEPLAY_INTRO));


albumRoll.playIntro();
albumRoll.albumId = currentCapsule.freeplayData?.data.getAlbumId(currentDifficulty, currentVariation);

{

FlxTween.color(backingImage, 0.6, 0xFF000000, 0xFFFFFFFF, {
ease: FlxEase.expoOut,
onUpdate: function(_)
{
angleMaskShader.extraColor = backingImage.color;
},
onComplete: function(_)
{
blackOverlayBullshitLOLXD.visible = false;
}
});
}

FlxTween.cancelTweensOf(grpDifficulties);
for (diff in grpDifficulties.group.members)
{
FlxTween.cancelTweensOf(diff);
FlxTween.tween(diff, {x: (CUTOUT_WIDTH * DJ_POS_MULTI) + 90}, 0.6, {ease: FlxEase.quartOut});
diff.y = 80;
diff.visible = diff == currentDifficultySprite;
}
FlxTween.tween(grpDifficulties, {x: (CUTOUT_WIDTH * DJ_POS_MULTI) + 90}, 0.6, {ease: FlxEase.quartOut});

diffSelLeft.visible = true;
diffSelRight.visible = true;
letterSort.visible = true;

exitMovers.set([diffSelLeft, diffSelRight], {
x: -diffSelLeft.width * 2,
speed: 0.26
});

exitMoversCharSel.set([diffSelLeft, diffSelRight], {
y: -270,
speed: 0.8,
wait: 0.1
});

new FlxTimer().start(1 / 24, function(handShit)
{
fnfHighscoreSpr.visible = true;
topLeftCornerText.visible = true;
freeplayTxtBg.visible = true;
ostName.visible = true;
updateOSTName(true);
fpScoreDisplay.visible = true;
fpScoreDisplay.updateScore(0);

clearBoxSprite.visible = true;
txtCompletion.visible = true;
intendedCompletion = 0;

new FlxTimer().start(1.5 / 24, function(bold)
{
sillyStroke.width = 0;
sillyStroke.height = 0;
changeSelection();
});
});

backingImage.visible = true;
backingCard.introDone();

{
rankAnimStart(fromResultsParams, currentCapsule);
albumRoll.skipIntro();
albumRoll.showStars();
}
else if (fromCharSelect || forceSkipIntro)
{
albumRoll.skipIntro();
albumRoll.showStars();
}

refreshDots(5, allDifficulties.indexOf(currentDifficulty), allDifficulties.indexOf(currentDifficulty));
fadeDots(true);

};

generateSongList(null, true);

funnyCam.bgColor = FlxColor.TRANSPARENT;

rankVignette.scale.set(2 * FullScreenScaleMode.wideScale.x, 2 * FullScreenScaleMode.wideScale.y);
rankVignette.updateHitbox();
rankVignette.blend = BlendMode.ADD;
add(rankVignette);
rankVignette.alpha = 0;

forEach(function(bs)
{
bs.cameras = [funnyCam];
});

rankCamera.bgColor = FlxColor.TRANSPARENT;
rankBg.cameras = [rankCamera];
rankBg.alpha = 0;

addBackButton(FlxG.width, FlxG.height - 200, FlxColor.WHITE, goBack, 0.3, true);

FlxTween.tween(backButton, {x: FlxG.width - 230}, 0.5, {ease: FlxEase.expoOut});

{
rankCamera.fade(0xFF000000, 0, false, null, true);
}

{
onDJIntroDone();
forceSkipIntro = false;
}
else
{
{
dj.onIntroDone.add(onDJIntroDone);
}
else
{
onDJIntroDone();
}
}
}

/**
* Dispatches script events to all relevant scripted classes.
* @param event
*/
public override function dispatchEvent(event:ScriptEvent):Void
{
super.dispatchEvent(event);


}

/**
* Create a FreeplayDJ for the current character.
* @param x The X position.
* @param y The Y position.
* @param characterId The character ID to use.
*/
public function createFreeplayDJ(x:Float, y:Float, characterId:String):Void
{

switch (renderType)
{
case "animateatlas":
dj = (scriptClass != "") ? (ScriptedAnimateAtlasFreeplayDJ.scriptInit(scriptClass, x, y,
characterId)) : (new AnimateAtlasFreeplayDJ(x, y, characterId));
case "sparrow":
dj = (scriptClass != "") ? (ScriptedSparrowFreeplayDJ.scriptInit(scriptClass, x, y, characterId)) : (new SparrowFreeplayDJ(x, y, characterId));
case 'multisparrow':
dj = (scriptClass != "") ? (ScriptedMultiSparrowFreeplayDJ.scriptInit(scriptClass, x, y,
characterId)) : (new MultiSparrowFreeplayDJ(x, y, characterId));
case 'packer':
dj = (scriptClass != "") ? (ScriptedPackerFreeplayDJ.scriptInit(scriptClass, x, y, characterId)) : (new PackerFreeplayDJ(x, y, characterId));
case 'custom':
dj = (scriptClass != "") ? (ScriptedBaseFreeplayDJ.scriptInit(scriptClass, x, y, characterId)) :
{
forceSkipIntro = true;
new BaseFreeplayDJ(x, y, characterId);
}; // We can't fallback on any other types, since the assets may be unspecified
}
}


/**
* Given the current filter, rebuild the current song list and display it.
* Automatically takes into account currentDifficulty, character, and variation
*
* @param filterStuff A filter to apply to the song list (regex, startswith, all, favorite)
* @param force Whether the capsules should "jump" back in or not using their animation
* @param onlyIfChanged Only apply the filter if the song list has changed
* @param noJumpIn Will not call the jump-in function, used when changing difficulties to update the song list correctly without this happening twice
*/
public function generateSongList(filterStuff:Null<SongFilter>, force:Bool = false, onlyIfChanged:Bool = true, noJumpIn:Bool = false):Void
{


tempSongs = tempSongs.filter(song ->
{


});

{
{

for (capsule in grpCapsules.members)
{
{
capsule.initPosition(FlxG.width, 0);
capsule.initJumpIn(0, force);
}
}

}
}

currentFilter = filterStuff;

currentFilteredSongs = tempSongs;
curSelected = 0;

grpCapsules.killMembers();

randomCapsule.initRandom(styleData);
randomCapsule.onConfirm = () -> capsuleOnOpenRandom(randomCapsule);

else
randomCapsule.initJumpIn(0, force);

randomCapsule.hsvShader = hsvShader;
grpCapsules.add(randomCapsule);

for (i in 0...tempSongs.length)
{

funnyMenu.initPosition(FlxG.width, 0);
funnyMenu.initData(tempSong, styleData, i + 1);
funnyMenu.onConfirm = () -> capsuleOnOpenDefault(funnyMenu);
funnyMenu.y = funnyMenu.intendedY(i + 1) + 10;
funnyMenu.targetPos.x = funnyMenu.x;
funnyMenu.ID = i;
funnyMenu.capsule.alpha = 0.5;
funnyMenu.hsvShader = hsvShader;
funnyMenu.newText.animation.curAnim.curFrame = 45 - ((i * 4) % 45);

else
funnyMenu.initJumpIn(0, force);

grpCapsules.add(funnyMenu);
}


rememberSelection();
changeSelection();
refreshCapsuleDisplays();

dispatchEvent(new CapsuleScriptEvent(DIFFICULTY_SWITCH, currentCapsule, currentDifficulty, currentVariation));
}

/**
* Filters an array of songs based on a filter
* @param songsToFilter What data to use when filtering
* @param songFilter The filter to apply
* @return Array<FreeplaySongData>
*/
public function sortSongs(songsToFilter:Array<Null<FreeplaySongData>>, songFilter:SongFilter):Array<Null<FreeplaySongData>>
{
{
};

switch (songFilter.filterType)
{
case REGEXP:

songsToFilter = songsToFilter.filter(filteredSong ->
{
});

songsToFilter.sort(filterAlphabetically);

case STARTSWITH:

songsToFilter = songsToFilter.filter(filteredSong ->
{
});
case ALL:
case FAVORITE:
songsToFilter = songsToFilter.filter(filteredSong ->
{
});

default:
}

}


function rankAnimStart(fromResults:FromResultsParams, capsuleToRank:SongMenuItem):Void
{
uiStateMachine.transition(Interacting);
capsuleToRank.sparkle.alpha = 0;

rememberedSongId = fromResults.songId;
rememberedDifficulty = fromResults.difficultyId;
capsuleToRank.fakeRanking.visible = true;
capsuleToRank.fakeRanking.alpha = 0; // If this isn't done, you'd see a tiny E being replaced for the first rank

changeSelection();
changeDiff();

(fromResultsParams?.newRank == SHIT) ? dj?.fistPumpLossIntro() : dj?.fistPumpIntro();

rankCamera.fade(0xFF000000, 0.5, true, null, true);
rankBg.alpha = 1;

{
capsuleToRank.fakeRanking.rank = fromResults.oldRank;
capsuleToRank.fakeBlurredRanking.rank = fromResults.oldRank;

sparks.frames = Paths.getSparrowAtlas('freeplay/sparks');
sparks.animation.addByPrefix('sparks', 'sparks', 24, false);
sparks.visible = false;
sparks.blend = BlendMode.ADD;
sparks.setPosition(517, 134);
sparks.scale.set(0.5, 0.5);
add(sparks);
sparks.cameras = [rankCamera];

sparksADD.visible = false;
sparksADD.frames = Paths.getSparrowAtlas('freeplay/sparksadd');
sparksADD.animation.addByPrefix('sparks add', 'sparks add', 24, false);
sparksADD.setPosition(498, 116);
sparksADD.blend = BlendMode.ADD;
sparksADD.scale.set(0.5, 0.5);
add(sparksADD);
sparksADD.cameras = [rankCamera];
sparksADD.color = fromResults.oldRank.getRankingFreeplayColor();
capsuleToRank.fakeRanking.alpha = 1.0;
}

capsuleToRank.doLerp = false;

originalPos.x = (CUTOUT_WIDTH * SONGS_POS_MULTI) + 320.488;
originalPos.y = 235.6;

capsuleToRank.ranking.visible = false;
capsuleToRank.blurredRanking.visible = false;

HapticUtil.increasingVibrate(Constants.MIN_VIBRATION_AMPLITUDE, Constants.MAX_VIBRATION_AMPLITUDE, 0.6);

rankCamera.zoom = 1.85;
FlxTween.tween(rankCamera, {"zoom": 1.8}, 0.6, {ease: FlxEase.sineIn});

funnyCam.zoom = 1.15;
FlxTween.tween(funnyCam, {"zoom": 1.1}, 0.6, {ease: FlxEase.sineIn});

capsuleToRank.cameras = [rankCamera];

capsuleToRank.setPosition((FlxG.width / 2) - (capsuleToRank.capsule.width / 2), (FlxG.height / 2) - (capsuleToRank.capsule.height / 2));

new FlxTimer().start(0.5, _ ->
{
rankDisplayNew(fromResults, capsuleToRank);
});
}

function rankDisplayNew(fromResults:Null<FromResultsParams>, capsuleToRank:SongMenuItem):Void
{
capsuleToRank.ranking.visible = true;
capsuleToRank.blurredRanking.visible = true;
capsuleToRank.ranking.scale.set(20, 20);
capsuleToRank.blurredRanking.scale.set(20, 20);

{
capsuleToRank.ranking.animation.play(fromResults.newRank.getFreeplayRankIconAsset(), true);
}

FlxTween.tween(capsuleToRank.ranking, {"scale.x": 0.9, "scale.y": 0.9}, 0.1);

{
capsuleToRank.blurredRanking.animation.play(fromResults.newRank.getFreeplayRankIconAsset(), true);
}
FlxTween.tween(capsuleToRank.blurredRanking, {"scale.x": 0.9, "scale.y": 0.9}, 0.1);

new FlxTimer().start(0.1, _ ->
{
{
capsuleToRank.fakeRanking.visible = false;
capsuleToRank.fakeBlurredRanking.visible = false;

sparks.visible = true;
sparksADD.visible = true;
sparks.animation.play('sparks', true);
sparksADD.animation.play('sparks add', true);

sparks.animation.onFinish.add(anim ->
{
sparks.visible = false;
sparksADD.visible = false;
});
}

switch (fromResultsParams?.newRank)
{
case SHIT:
FunkinSound.playOnce(Paths.sound('ranks/rankinbad'));
case PERFECT:
FunkinSound.playOnce(Paths.sound('ranks/rankinperfect'));
case PERFECT_GOLD:
FunkinSound.playOnce(Paths.sound('ranks/rankinperfect'));
default:
FunkinSound.playOnce(Paths.sound('ranks/rankinnormal'));
}
rankCamera.zoom = 1.3;

FlxTween.tween(rankCamera, {"zoom": 1.5}, 0.3, {ease: FlxEase.backInOut});

capsuleToRank.x -= 10;
capsuleToRank.y -= 20;

FlxTween.tween(funnyCam, {"zoom": 1.05}, 0.3, {ease: FlxEase.elasticOut});

capsuleToRank.angle = -3;
FlxTween.tween(capsuleToRank, {angle: 0}, 0.5, {ease: FlxEase.backOut});

IntervalShake.shake(capsuleToRank, 0.3, 1 / 30, 0.1, 0, FlxEase.quadOut);
});

new FlxTimer().start(0.4, _ ->
{
FlxTween.tween(funnyCam, {"zoom": 1}, 0.8, {ease: FlxEase.sineIn});
FlxTween.tween(rankCamera, {"zoom": 1.2}, 0.8, {ease: FlxEase.backIn});
FlxTween.tween(capsuleToRank, {x: originalPos.x - 7, y: originalPos.y - 80}, 0.8 + 0.5, {ease: FlxEase.quartIn});
});

new FlxTimer().start(0.6, _ ->
{
rankAnimSlam(fromResults, capsuleToRank);
});
}

function rankAnimSlam(fromResultsParams:Null<FromResultsParams>, capsuleToRank:SongMenuItem):Void
{
FlxTween.tween(rankBg, {alpha: 0}, 0.5, {ease: FlxEase.expoIn});


switch (fromResultsParams?.newRank)
{
case SHIT:
FunkinSound.playOnce(Paths.sound('ranks/loss'));
case GOOD:
FunkinSound.playOnce(Paths.sound('ranks/good'));
case GREAT:
FunkinSound.playOnce(Paths.sound('ranks/great'));
case EXCELLENT:
FunkinSound.playOnce(Paths.sound('ranks/excellent'));
case PERFECT:
FunkinSound.playOnce(Paths.sound('ranks/perfect'));
case PERFECT_GOLD:
FunkinSound.playOnce(Paths.sound('ranks/perfect'));
default:
FunkinSound.playOnce(Paths.sound('ranks/loss'));
}

FlxTween.tween(capsuleToRank.targetPos, {x: originalPos.x, y: originalPos.y}, 0.5, {ease: FlxEase.expoOut});
new FlxTimer().start(0.5, _ ->
{
HapticUtil.vibrate(Constants.DEFAULT_VIBRATION_PERIOD, Constants.DEFAULT_VIBRATION_DURATION, Constants.MAX_VIBRATION_AMPLITUDE);

funnyCam.shake(0.0045, 0.35);

(fromResultsParams?.newRank == SHIT) ? dj?.fistPumpLoss() : dj?.fistPump();

rankCamera.zoom = 0.8;
funnyCam.zoom = 0.8;
FlxTween.tween(rankCamera, {"zoom": 1}, 1, {ease: FlxEase.elasticOut});
FlxTween.tween(funnyCam, {"zoom": 1}, 0.8, {ease: FlxEase.elasticOut});

for (index => capsule in grpCapsules.members)
{

{
{
FlxTween.cancelTweensOf(capsule);
capsule.fadeAnim(fromResultsParams?.newRank);

rankVignette.color = capsule.getTrailColor();
rankVignette.alpha = 1;
FlxTween.tween(rankVignette, {alpha: 0}, 0.6, {ease: FlxEase.expoOut});

capsule.doLerp = false;
capsule.setPosition(originalPos.x, originalPos.y);
IntervalShake.shake(capsule, 0.6, 1 / 24, 0.12, 0, FlxEase.quadOut, function(_)
{
capsule.doLerp = true;
capsule.cameras = [funnyCam];

uiStateMachine.transition(Idle);
capsule.sparkle.alpha = 0.7;
playCurSongPreview(capsule);
}, null);

FlxTween.tween(capsule, {angle: 0}, 0.5, {ease: FlxEase.backOut});
}
{
new FlxTimer().start(distFromSelected / 20, _ ->
{
capsule.doLerp = false;

capsule.angle = FlxG.random.float(-10 + (distFromSelected * 2), 10 - (distFromSelected * 2));
FlxTween.tween(capsule, {angle: 0}, 0.5, {ease: FlxEase.backOut});

IntervalShake.shake(capsule, 0.6, 1 / 24, 0.12 / (distFromSelected + 1), 0, FlxEase.quadOut, function(_)
{
capsule.doLerp = true;
});
});
}

{
new FlxTimer().start(distFromSelected / 20, _ ->
{
capsule.doLerp = false;

capsule.angle = FlxG.random.float(-10 + (distFromSelected * 2), 10 - (distFromSelected * 2));
FlxTween.tween(capsule, {angle: 0}, 0.5, {ease: FlxEase.backOut});

IntervalShake.shake(capsule, 0.6, 1 / 24, 0.12 / (distFromSelected + 1), 0, FlxEase.quadOut, function(_)
{
capsule.doLerp = true;
});
});
}
}

index += 1;
}
});

new FlxTimer().start(2, _ ->
{
prepForNewRank = false;
});
}


function fadeDots(fadeIn:Bool):Void
{
for (i in 0...difficultyDots.group.members.length)
{
{
difficultyDots.group.members[i].fadeIn();
}
else
{
difficultyDots.group.members[i].fadeOut();
}
}
}

function refreshDots(amount:Int, index:Int, prevIndex:Int):Void
{

{
difficultyDots.x = DEFAULT_DOTS_GROUP_POS[0] - groupOffset * (maxDotsPerRow - 1);
}
else
{
difficultyDots.x = DEFAULT_DOTS_GROUP_POS[0] - groupOffset * (difficultyDots.group.members.length - 1);
}

for (i in 0...difficultyDots.group.members.length)
{

difficultyDots.group.members[i].important = false;

{
targetState = SELECTED;
}
else
{
{
targetState = DESELECTING;
}
else
{
targetState = DESELECTED;
}
}

{
targetType = ERECT;
}

difficultyDots.group.members[i].visible = true;
difficultyDots.group.members[i].x = (CUTOUT_WIDTH * DJ_POS_MULTI) + ((difficultyDots.x + (distance * curDot)) - shiftAmt);
difficultyDots.group.members[i].y = DEFAULT_DOTS_GROUP_POS[1] + distance * curRow;

curDot++;

{
curDot = 0;
curRow++;
}

{
targetType = INACTIVE;
}
else
{
{
{
difficultyDots.group.members[i].important = true;
}
}
}

{
difficultyDots.group.members[i].visible = false;
}

difficultyDots.group.members[i].updateState(targetType, targetState);
}

prevDotAmount = amount;
}

/**
* Updates the OST text according to the album data for the current song and performs an outline animation.
* @param forceAnimation Whether to force the animation to play even if the text is the same.
*/
function updateOSTName(forceAnimation:Bool = false):Void
{
{
ostName.text = newName;

sillyStroke.width = sillyStroke.height = 2;
FlxTimer.wait(1.5 / 24, () ->
{
sillyStroke.width = sillyStroke.height = 0;
});
}
}

function tryOpenCharSelect():Void
{

{
}
else
{
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}

uiStateMachine.transition(Exiting);

FunkinSound.playOnce(Paths.sound('confirmMenu'));

dj?.toCharSelect();


new FlxTimer().start(transitionDelay, _ ->
{
transitionToCharSelect();
});
}

function transitionToCharSelect():Void
{
transitionGradient.scale.set(1280, 1);
transitionGradient.updateHitbox();
transitionGradient.cameras = [rankCamera];
exitMoversCharSel.set([transitionGradient], {
y: -720,
speed: 0.8,
wait: 0.1
});
add(transitionGradient);

for (index => capsule in grpCapsules.members)
{
{
capsule.doLerp = false;
exitMoversCharSel.set([capsule], {
y: -250,
speed: 0.8,
wait: 0.1
});
}
}

fadeDots(false);

backTransitioning = true;
FlxTween.tween(backButton, {alpha: 0}, 0.4, {ease: FlxEase.quadOut});

funnyCam.filtersEnabled = true;
fadeShader.fade(1.0, 0.0, 0.8, {ease: FlxEase.quadIn});

new FlxTimer().start(0.9, _ ->
{
});

for (grpSpr in exitMoversCharSel.keys())
{

for (spr in grpSpr)
{


FlxTween.tween(spr, {y: moveDataY + spr.y}, moveDataSpeed, {ease: FlxEase.backIn});
}
}
backingCard.enterCharSel();
}

function enterFromCharSel():Void
{
uiStateMachine.transition(EnteringFreeplay);

transitionGradient.scale.set(1280, 1);
transitionGradient.updateHitbox();
transitionGradient.cameras = [rankCamera];
exitMoversCharSel.set([transitionGradient], {
y: -720,
speed: 1.5,
wait: 0.1
});
add(transitionGradient);

funnyCam.filtersEnabled = true;
fadeShader.fade(0.0, 1.0, 0.8, {ease: FlxEase.quadIn, onComplete: (twn) -> funnyCam.filtersEnabled = false});

for (grpSpr in exitMoversCharSel.keys())
{

for (spr in grpSpr)
{


spr.y += moveDataY;

FlxTween.tween(spr, {y: spr.y - moveDataY}, moveDataSpeed * 1.2, {
ease: FlxEase.expoOut,
onComplete: (_) ->
{
fromCharSelect = false;

for (capsule in grpCapsules.members)
capsule.doLerp = true;
}
});
}
}

{
dj.resetPosition();
}
}






override function update(elapsed:Float):Void
{
super.update(elapsed);

Conductor.instance.update(FlxG.sound?.music?.time ?? 0.0);

{
{
backButton.animation.play("idle");
backButton.alpha = backButton.restingOpacity;
}
backButton.enabled = uiStateMachine.canInteract();
}

{
hintTimer += elapsed * 2;
charSelectHint.alpha = FlxMath.lerp(0.3, 0.9, targetAmt);
}

{
{
character: currentCharacterId == "pico" ? Constants.DEFAULT_CHARACTER : "pico",
}
}));
}

{
rankAnimStart(fromResultsParams ?? {
playRankAnim: true,
oldRank: currentCapsule.ranking.rank,
newRank: PERFECT_GOLD,
songId: "tutorial",
difficultyId: "hard"
}, currentCapsule);
}

{
|| (TouchUtil.pressAction(djHitbox, funnyCam, false) && !SwipeUtil.swipeAny) #end)
&& !FlxG.debugger.visible)
{
tryOpenCharSelect();
}

}

lerpScoreDisplays();

handleInputs(elapsed);


}

function lerpScoreDisplays():Void
{
lerpScore = MathUtil.snap(MathUtil.smoothLerpPrecision(lerpScore, intendedScore, FlxG.elapsed, 0.2), intendedScore, 1);
lerpCompletion = MathUtil.snap(MathUtil.smoothLerpPrecision(lerpCompletion, intendedCompletion, FlxG.elapsed, 0.5), intendedCompletion, 1 / 100);

{
lerpScore = intendedScore;
}

{
lerpCompletion = intendedCompletion;
}

fpScoreDisplay.updateScore(Std.int(lerpScore));

txtCompletion.text = '${Math.floor(lerpCompletion * 100).clamp(0, 100)}';

switch (txtCompletion.text.length)
{
case 3:
txtCompletion.offset.x = 10;
case 2:
txtCompletion.offset.x = 0;
case 1:
txtCompletion.offset.x = -24;
default:
txtCompletion.offset.x = 0;
}
}


function handleInputs(elapsed:Float):Void
{

handleTouchCapsuleClick();
handleTouchFavoritesAndDifficulties();
handleTouchSelectionScroll(elapsed);

charSelectHint.text = 'Press [ ${controls.getDialogueNameFromControl(FREEPLAY_CHAR_SELECT, true)} ] to change characters';
else
charSelectHint.text = 'Tap the DJ to change characters';
charSelectHint.text = 'Press [ ${controls.getDialogueNameFromControl(FREEPLAY_CHAR_SELECT, true)} ] to change characters';

handleDirectionalInput(elapsed);


{
dj?.onPlayerAction(); // dj?.resetAFKTimer();
changeSelection(-wheelAmount);
}

handleDifficultySwitch();
handleDebugKeys();

{
_pressedOnSelected = false;
_pressedOnCapsule = false;
}

{
_flickEnded = true;
draggingDifficulty = false;
}

{
goBack();
}

{
currentCapsule.onConfirm();
}
}

function handleDirectionalInput(elapsed:Float):Void
{

{
{
{
spamTimer = 0;
changeSelection(upP ? -1 : 1);
}
}
else if (spamTimer >= 0.9)
{
spamming = true;
}
else if (spamTimer <= 0)
{
changeSelection(upP ? -1 : 1);
}

spamTimer += elapsed;
dj?.onPlayerAction(); // dj?.resetAFKTimer();
}
else
{
spamming = false;
spamTimer = 0;
}
}

function handleDifficultySwitch():Void
{


{
dj?.onPlayerAction(); // dj?.resetAFKTimer();
changeDiff(-1);
generateSongList(currentFilter, true, false);
}
else if (rightPressed)
{
dj?.onPlayerAction(); // dj?.resetAFKTimer();
changeDiff(1);
generateSongList(currentFilter, true, false);
}
}

function handleDebugKeys():Void
{
{
uiStateMachine.transition(Exiting);

{
{
});

})}');

{
uiStateMachine.transition(Idle);
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}


curSelected = grpCapsules.members.indexOf(targetSong);
changeSelection(0);
targetSongID = currentCapsule?.freeplayData?.data.id ?? 'unknown';
}
FunkinSound.playOnce(Paths.sound('confirmMenu'));
dj?.onConfirm();
new FlxTimer().start(styleData?.getStartDelay(), function(tmr:FlxTimer)
{
targetSongId: targetSongID,
targetSongDifficulty: currentDifficulty,
targetSongVariation: currentVariation,
}));
});
}

{
uiStateMachine.transition(Exiting);

{

{
});

})}');

{
uiStateMachine.transition(Idle);
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}


curSelected = grpCapsules.members.indexOf(targetSong);
changeSelection(0);
targetSongID = grpCapsules.members[curSelected]?.freeplayData?.data.id ?? 'unknown';
}

{
uiStateMachine.transition(Idle);
}
{
uiStateMachine.transition(Idle);
}

targetStageId: targetDifficulty.stage,
targetBfChar: targetDifficulty.characters.player,
targetGfChar: targetDifficulty.characters.girlfriend,
targetDadChar: targetDifficulty.characters.opponent
}));
}
}

private function handleTouchCapsuleClick():Void
{
{
curSelected = Math.round(curSelectedFloat);

for (i in 0...grpCapsules.members.length)
{


{
capsule.onConfirm();
}
else
{
curSelected = i;
changeSelection(0);
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
HapticUtil.vibrate(0, 0.01, 0.5);
}
break;
}
}

{
_pressedOnSelected = selected != null && TouchUtil.overlaps(selected, funnyCam);
}
}

function handleTouchSelectionScroll(elapsed:Float):Void
{

{
_pressedOnCapsule = true;
}

for (touch in FlxG.touches.list)
{
{
{

dpiScale = dpiScale.clamp(0.5, #if android 1 #else 2 #end);

_moveLength += Math.abs(moveLength);
curSelectedFloat -= moveLength;
updateSongsScroll();
}
}
else if (_moveLength > 0)
{
_moveLength = 0.0;
changeSelection(0);
}
}
{
}

{
{
_flickEnded = false;

dpiScale = dpiScale.clamp(0.5, #if android 1 #else 2 #end);
_moveLength += Math.abs(velocityMove);
curSelectedFloat -= velocityMove;
updateSongsScroll();
}
}
else if (!_flickEnded)
{
_flickEnded = true;
{
_moveLength = 0.0;
changeSelection(0);
}
}

curSelectedFloat = curSelectedFloat.clamp(0, grpCapsules.countLiving() - 1);
curSelected = Math.round(curSelectedFloat);

for (i in 0...grpCapsules.members.length)
{
grpCapsules.members[i].selected = (i == curSelected);
}

{
_flickEnded = true;
{
_moveLength = 0.0;
changeSelection(0);
}
}
}

function handleTouchFavoritesAndDifficulties()
{

{
{
{
draggingDifficulty = true;
dj?.onPlayerAction(); // dj?.resetAFKTimer();
changeDiff(-1, false, true);
_pressedOnSelected = false;
_flickEnded = true;

new FlxTimer().start(0.21, (afteranim) ->
{
currentCapsule.doLerp = true;
generateSongList(currentFilter, true, false, true);
});
new FlxTimer().start(0.3, (afteranim) ->
{
draggingDifficulty = false;
});
}
else if (SwipeUtil.swipeRight)
{
draggingDifficulty = true;
dj?.onPlayerAction(); // dj?.resetAFKTimer();
changeDiff(1, false, true);
_pressedOnSelected = false;
_flickEnded = true;

new FlxTimer().start(0.21, (afteranim) ->
{
currentCapsule.doLerp = true;
generateSongList(currentFilter, true, false, true);
});
new FlxTimer().start(0.3, (afteranim) ->
{
draggingDifficulty = false;
});
}

{
_pressedOnSelected = false;
draggingDifficulty = false;
favoriteSong();
}
}
else
{
currentCapsule.doLerp = true;
}


{
HapticUtil.vibrate(0, 0.01, 0.375, 0.4);
draggingDifficulty = true;
}


currentDifficultySprite.offset.x = MathUtil.smoothLerpPrecision(currentDifficultySprite.offset.x, (TouchUtil.touch.x - _dragOffset) * -1, FlxG.elapsed,
0.2);

{
HapticUtil.vibrate(0, 0.01, 0.2, 0.8);
}
_prevRoundedDragOffset = Std.int((TouchUtil.touch.x - _dragOffset) / vibDist) * vibDist;

{
handleDiffDragRelease(currentDifficultySprite);
}

{
handleDiffBoundaryChange(1);
}
{
handleDiffBoundaryChange(-1);
}

}
else
{
currentDifficultySprite.offset.x = MathUtil.smoothLerpPrecision(currentDifficultySprite.offset.x, 0, FlxG.elapsed, 0.4);
}

diffSelRight.setPress(TouchUtil.overlaps(diffSelRight, funnyCam) && TouchUtil.justPressed);
diffSelLeft.setPress(TouchUtil.overlaps(diffSelLeft, funnyCam) && TouchUtil.justPressed);
}

public override function destroy():Void
{
super.destroy();
clearPreviews();
}

function goBack():Void
{
backTransitioning = true;
{
backButton.alpha = 1;
backButton.animation.play("confirm");
}
uiStateMachine.transition(Exiting);
FlxTween.globalManager.clear();
FlxTimer.globalManager.clear();
dj?.onIntroDone.removeAll();

dispatchEvent(new FreeplayScriptEvent(FREEPLAY_OUTRO));

FunkinSound.playOnce(Paths.sound('cancelMenu'));


backingCard.disappear();
fadeDots(false);

for (grpSpr in exitMovers.keys())
{

for (spr in grpSpr)
{



FlxTween.tween(spr, {x: moveDataX, y: moveDataY}, moveDataSpeed, {ease: FlxEase.expoIn});

longestTimer = Math.max(longestTimer, moveDataSpeed + moveDataWait);
}
}

FlxTween.tween(backButton, {x: FlxG.width + 300}, 0.45, {ease: FlxEase.expoIn});
FlxTween.tween(backButton, {alpha: 0}, 0.3, {ease: FlxEase.quadOut, startDelay: 0.15});

for (caps in grpCapsules.members)
{
caps.doJumpIn = false;
caps.doLerp = false;
caps.doJumpOut = true;
}

{
_parentState.persistentUpdate = false;
_parentState.persistentDraw = true;
}

new FlxTimer().start(longestTimer, (_) ->
{
FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;
{
FunkinSound.playMusic('freakyMenu', {
overrideExisting: true,
restartTrack: false,
persist: true
});
dispatchEvent(new FreeplayScriptEvent(FREEPLAY_CLOSE));
close();
}
else
{
}
});
}

/**
* findClosestDiff will find the closest difficulty to the given diff.
* It will return the index of the closest song in the grpCapsules.members array.
* @param diff
* @return Int
*/
function findClosestDiff(characterVariations:Array<String>, diff:String):Int
{

for (index in 0...grpCapsules.members.length)
{
{
closestIndex = index;
closest = c;
}
}

}

/**
* changeDiff is the root of both difficulty and variation changes/management.
* It will check the difficulty of the current variation, all available variations, and all available difficulties per variation.
* Call generateSongList after this with the right parameters if you want the capsules to do their jump-in animation after changing difficulties.
* @param change
* @param force
* @param capsuleAnim
*/
function changeDiff(change:Int = 0, force:Bool = false, capsuleAnim:Bool = false):Void
{
{
{
uiStateMachine.transition(Interacting);
currentCapsule.doLerp = false;

FlxTween.tween(currentCapsule, {x: currentCapsule.x - movement}, 0.1, {ease: FlxEase.expoOut});
FlxTween.tween(currentCapsule, {x: currentCapsule.x + movement}, 0.1, {ease: FlxEase.expoIn, startDelay: 0.1});
}
}

for (diff in grpDifficulties.group.members)
{

diff.visible = true;

uiStateMachine.transition(Interacting);

FlxTween.tween(diff, {x: newX + (CUTOUT_WIDTH * DJ_POS_MULTI)}, 0.2, {
ease: FlxEase.circInOut,
onComplete: function(_)
{
uiStateMachine.transition(Idle);
diff.x = 90 + (CUTOUT_WIDTH * DJ_POS_MULTI);
diff.visible = false;
}
});
break;
}
{
HapticUtil.vibrate(0, 0.01, 0.5, 0.1);
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
}

currentCapsule.selected = false;




currentDifficultyIndex += change;

currentDifficulty = difficultiesAvailable[currentDifficultyIndex];
{
curSelected = findClosestDiff(characterVariations, difficultiesAvailable[currentDifficultyIndex]);
daSong = currentCapsule.freeplayData;
rememberedSongId = daSong?.data.id;

characterVariations = daSong?.data.getVariationsByCharacter(currentCharacter) ?? Constants.DEFAULT_VARIATION_LIST;
}

for (variation in characterVariations)
{
{
currentVariation = variation;
rememberedVariation = variation;
break;
}
}

{
{
}

intendedScore = songScore?.score ?? 0;
intendedCompletion = Math.max(0, Scoring.tallyCompletion(songScore?.tallies));
rememberedDifficulty = currentDifficulty;
}
else
{
intendedScore = 0;
intendedCompletion = 0.0;
rememberedDifficulty = currentDifficulty;
}

{
intendedCompletion = 0;
}

for (diffSprite in grpDifficulties.group.members)
{




diffSprite.x = (change > 0) ? 500 : -320;
diffSprite.x += (CUTOUT_WIDTH * DJ_POS_MULTI);

FlxTween.tween(diffSprite, {x: 90 + (CUTOUT_WIDTH * DJ_POS_MULTI)}, 0.2, {
ease: FlxEase.circInOut,
onComplete: function(_)
{
_flickEnded = true;
}
});

diffSprite.offset.y += 5;
diffSprite.alpha = 0.5;
new FlxTimer().start(1 / 24, function(swag)
{
diffSprite.alpha = 1;
diffSprite.updateHitbox();
diffSprite.visible = true;
diffSprite.height *= 2.5;
});
}

refreshDots(5, currentDifficultyIndex, prevDifficultyIndex);

{
for (songCapsule in grpCapsules.members)
{

{
songCapsule.initData(songCapsule.freeplayData);
songCapsule.checkClip();
}
}

}

{
albumRoll.albumId = newAlbumId;
albumRoll.skipIntro();
}
updateOSTName();

albumRoll.setDifficultyStars(daSong?.data.getDifficulty(currentDifficulty, currentVariation)?.difficultyRating ?? 0);

currentCapsule.selected = true; // set selected again, so it can run its getter function to initialize movement
}

function handleDiffDragRelease(diff:FlxSprite):Void
{
else if (SwipeUtil.flickRight) handleDiffBoundaryChange(-1);

draggingDifficulty = false;
_dragOffset = 0;
}

function handleDiffBoundaryChange(change:Int):Void
{
dj?.onPlayerAction(); // dj?.resetAFKTimer();
changeDiff(change);
generateSongList(currentFilter, true, false);
_flickEnded = true;
_dragOffset = 0;
draggingDifficulty = false;
}

/**
* Called when hitting ENTER to open the instrumental choice for random capsule
*/
function capsuleOnOpenRandom(randomCapsule:SongMenuItem):Void
{
{
});

{
uiStateMachine.transition(Idle);

FunkinSound.playOnce(Paths.sound('cancelMenu'));
}

uiStateMachine.transition(Exiting);

instSelectMenu = new CapsuleOptionsMenu(this, randomCapsule.targetPos.x + 175, randomCapsule.targetPos.y + 115, instrumentalChoices);
instSelectMenu.cameras = [funnyCam];
instSelectMenu.zIndex = 10000;
add(instSelectMenu);

instSelectMenu.onConfirm = function(instChoice:String)
{
capsuleOnConfirmRandom(availableSongCapsules, instChoice);
}
capsuleOnConfirmRandom(availableSongCapsules, instrumentalChoices[0]);
}

/**
* Called when hitting ENTER on an instrumental choice for random capsule
*/
function capsuleOnConfirmRandom(availableSongCapsules:Array<SongMenuItem>, instChoice:String):Void
{
cleanupInstSelectMenu();

curSelected = grpCapsules.members.indexOf(targetSongCap);
changeSelection(); // Trigger an update. This will also fix the target variation.

{
uiStateMachine.transition(Idle);
}


{
uiStateMachine.transition(Idle);

}

{
targetDifficulty?.variation ?? Constants.DEFAULT_VARIATION) ?? [];

capsuleOnConfirmDefault(targetSongCap, targetInstrumentalId);
}
else
{
capsuleOnConfirmDefault(targetSongCap);
}
}

/**
* Called when hitting ENTER to open the instrumental list.
*/
function capsuleOnOpenDefault(cap:SongMenuItem):Void
{
{
uiStateMachine.transition(Idle);
}
PlayStatePlaylist.campaignId = targetLevelId ?? null;

{
uiStateMachine.transition(Idle);
}


targetDifficulty?.variation ?? Constants.DEFAULT_VARIATION) ?? [];

{
openInstrumentalList(cap, instrumentalIds);

}

capsuleOnConfirmDefault(cap);
}

function openInstrumentalList(cap:SongMenuItem, instrumentalIds:Array<String>):Void
{
uiStateMachine.transition(Interacting);

instSelectMenu = new CapsuleOptionsMenu(this, cap.targetPos.x + 175, cap.targetPos.y + 115, instrumentalIds);
instSelectMenu.cameras = [funnyCam];
instSelectMenu.zIndex = 10000;
add(instSelectMenu);

instSelectMenu.onConfirm = function(targetInstId:String)
{
capsuleOnConfirmDefault(cap, targetInstId);
};
}


public function cleanupInstSelectMenu():Void
{
uiStateMachine.transition(Idle);

{
remove(instSelectMenu);
instSelectMenu = null;
}
}

/**
* Called when hitting ENTER to play the song.
*/
function capsuleOnConfirmDefault(cap:SongMenuItem, ?targetInstId:String):Void
{
uiStateMachine.transition(Exiting);

dispatchEvent(new CapsuleScriptEvent(SONG_SELECTED, currentCapsule, currentDifficulty, currentVariation));

PlayStatePlaylist.isStoryMode = false;

{
uiStateMachine.transition(Idle);
}

PlayStatePlaylist.campaignId = targetLevelId ?? null;

{
uiStateMachine.transition(Idle);
}

{
targetInstId = baseInstrumentalId;
}

FunkinSound.playOnce(Paths.sound('confirmMenu'));
dj?.onConfirm();

currentCapsule.forcePosition();
currentCapsule.confirm();

backingCard.confirm();
fadeDots(false);

{
new FlxTimer().start(0.5, function(tmr)
{
switch (currentCharacterId)
{
case "pico":
allowPicoBulletsVibration = true;
new FlxTimer().start(0.5, function(tmr)
{
allowPicoBulletsVibration = false;
});

default:
HapticUtil.vibrate(Constants.DEFAULT_VIBRATION_PERIOD, Constants.DEFAULT_VIBRATION_DURATION * 5, (Constants.MAX_VIBRATION_AMPLITUDE / 3) * 2.5);
}
});
}

new FlxTimer().start(styleData?.getStartDelay(), function(tmr:FlxTimer)
{
FunkinSound.emptyPartialQueue();

{
backTransitioning = true;
FlxTween.tween(backButton, {alpha: 0}, 0.2, {ease: FlxEase.quadOut});
}
funnyCam.fade(FlxColor.BLACK, 0.2, false, function()
{
Paths.setCurrentLevel(cap?.freeplayData?.levelId);
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: currentDifficulty,
targetVariation: currentVariation,
targetInstrumental: targetInstId,
practiceMode: false,
minimalMode: false,

botPlayMode: FlxG.keys.pressed.SHIFT, mirrored: FlxG.keys.pressed.CONTROL,
botPlayMode: false,
}, true);
});
});
}

function refreshCapsuleDisplays():Void
{
grpCapsules.forEachAlive((cap:SongMenuItem) ->
{
cap.refreshDisplay();
});
}

function rememberSelection():Void
{
{
curSelected = currentFilteredSongs.findIndex(function(song)
{
});

}

{
currentDifficulty = rememberedDifficulty;
}

{
currentVariation = rememberedVariation;
}
}

function updateSongsScroll():Void
{
curSelected = Math.round(curSelectedFloat);

for (index => capsule in grpCapsules.members)
{
index += 1;

capsule.selected = false;
capsule.forceHighlight = index == curSelected + 1;

capsule.targetPos.y = capsule.intendedY(index - curSelectedFloat);
capsule.targetPos.x = capsule.intendedX(index - curSelectedFloat) + (CUTOUT_WIDTH * SONGS_POS_MULTI);
}

{
FunkinSound.playOnce(Paths.sound('scrollMenu'), 0.4);
HapticUtil.vibrate(0, 0.01, 0.5);
dj?.onPlayerAction(); // dj?.resetAFKTimer();
_pressedOnSelected = false;
}
}

function changeSelection(change:Int = 0):Void
{

curSelected += change;
curSelectedFloat = curSelected;

{
curSelected = (SwipeUtil.flickUp && !ControlsHandler.usingExternalInputDevice) ? 0 : grpCapsules.countLiving() - 1;
SwipeUtil.resetSwipeVelocity();
curSelected = grpCapsules.countLiving() - 1;
}
{
curSelected = (SwipeUtil.flickDown && !ControlsHandler.usingExternalInputDevice) ? grpCapsules.countLiving() - 1 : 0;
SwipeUtil.resetSwipeVelocity();
curSelected = 0;
}


intendedScore = songScore?.score ?? 0;

intendedCompletion = Scoring.tallyCompletion(songScore?.tallies);
rememberedSongId = currentCapsule.freeplayData?.data.id;


changeDiff();
currentCapsule.refreshDisplay(currentCapsule.freeplayData == null);

for (index => capsule in grpCapsules.members)
{
index += 1;

capsule.forceHighlight = false;
capsule.selected = index == curSelected + 1;

capsule.curSelected = curSelected;


else if (capsuleIndex > 4) yOffset -= 10;

capsule.targetPos.y = capsule.intendedY(capsuleIndex) - yOffset;
capsule.targetPos.x = capsule.intendedX(capsuleIndex) + (CUTOUT_WIDTH * SONGS_POS_MULTI);
}

{
FlxTimer.wait(FADE_IN_DELAY, playCurSongPreview.bind(currentCapsule));
currentCapsule.selected = true;

}


dispatchEvent(new CapsuleScriptEvent(CAPSULE_SELECTED, currentCapsule, currentDifficulty, currentVariation));
}

public function playCurSongPreview(?daSongCapsule:SongMenuItem):Void
{


clearPreviews();


{
FunkinSound.playMusic('freeplayRandom', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: false
});
}
else
{


songDifficulty?.variation ?? Constants.DEFAULT_VARIATION) ?? [];
{
instSuffix = altInstrumentalIds[0];
}
instSuffix = (instSuffix != '') ? '-$instSuffix' : '';

FunkinSound.playMusic(previewSong.id, {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: false,
mapTimeChanges: false, // The music metadata is not alongside the audio file so this won't work.
pathsFunction: INST,
suffix: instSuffix,
partialParams: {
loadPartial: true,
start: daSongCapsule?.freeplayData?.previewStartTime,
end: daSongCapsule?.freeplayData?.previewEndTime
},
onLoad: function()
{


previewTimers.push(new FlxTimer().start(fadeStart, function(_)
{
}));

previewTimers.push(new FlxTimer().start(FlxG.sound.music.length / 1000, function(_)
{
playCurSongPreview();
}));
},
});
{
Conductor.instance.mapTimeChanges(songDifficulty.timeChanges);
}
}
}

public function clearPreviews()
{
for (timer in previewTimers)
{
}

previewTimers = [];
}

public function switchBackingImage(?freeplaySongData:FreeplaySongData):Void
{
backingImage.loadTextureAsync(path);
}

/**
* Build an instance of `FreeplayState` that is above the `MainMenuState`.
* @return The MainMenuState with the FreeplayState as a substate.
*/
public static function build(?params:FreeplayStateParams, ?stickers:StickerSubState):MusicBeatState
{
CUTOUT_WIDTH = FullScreenScaleMode.gameCutoutSize.x / 1.5;
result = new MainMenuState(true);
result.openSubState(new FreeplayState(params, stickers));
result.persistentUpdate = false;
result.persistentDraw = true;
}

function favoriteSong():Void
{
{
{
selectedCapsule.favIcon.visible = true;
selectedCapsule.favIconBlurred.visible = true;
selectedCapsule.favIcon.animation.play('fav');
selectedCapsule.favIconBlurred.animation.play('fav');
FunkinSound.playOnce(Paths.sound('fav'), 1);
selectedCapsule.checkClip();
selectedCapsule.selected = true; // set selected again, so it can run its getter function to initialize movement
selectedCapsule.updateSelected();
uiStateMachine.transition(Interacting);

selectedCapsule.doLerp = false;
FlxTween.tween(selectedCapsule, {y: selectedCapsule.y - 5}, 0.1, {ease: FlxEase.expoOut});

FlxTween.tween(selectedCapsule, {y: selectedCapsule.y + 5}, 0.1, {
ease: FlxEase.expoIn,
startDelay: 0.1,
onComplete: function(_)
{
selectedCapsule.doLerp = true;
uiStateMachine.transition(Idle);
}
});
}
else
{
selectedCapsule.favIcon.animation.play('fav', true, true, 9);
selectedCapsule.favIconBlurred.animation.play('fav', true, true, 9);
FunkinSound.playOnce(Paths.sound('unfav'), 1);
new FlxTimer().start(0.2, _ ->
{
selectedCapsule.favIcon.visible = false;
selectedCapsule.favIconBlurred.visible = false;
selectedCapsule.checkClip();
selectedCapsule.selected = true; // set selected again, so it can run its getter function to initialize movement
selectedCapsule.updateSelected();
});

uiStateMachine.transition(Interacting);
selectedCapsule.doLerp = false;
FlxTween.tween(selectedCapsule, {y: selectedCapsule.y + 5}, 0.1, {ease: FlxEase.expoOut});
FlxTween.tween(selectedCapsule, {y: selectedCapsule.y - 5}, 0.1, {
ease: FlxEase.expoIn,
startDelay: 0.1,
onComplete: function(_)
{
selectedCapsule.doLerp = true;
uiStateMachine.transition(Idle);
}
});
}
}
}
}

/**
* The difficulty selector arrows to the left and right of the difficulty.
*/
class DifficultySelector extends FlxSprite
{


public function new(x:Float, y:Float, flipped:Bool, controls:Controls, ?styleData:FreeplayStyle, uiStateMachine:UIStateMachine)
{
super(x, y);
this.controls = controls;
this.uiStateMachine = uiStateMachine;
this.whiteShader = new PureColor(FlxColor.WHITE);
this.whiteShader.colorSet = true;

this.frames = Paths.getSparrowAtlas(styleData?.getSelectorAssetKey() ?? "freeplay/freeplaySelector");
animation.addByPrefix('shine', 'arrow pointer loop', 24);
animation.play('shine');

this.flipX = flipped;
}

override function update(elapsed:Float):Void
{

super.update(elapsed);
}

public function setPress(press:Bool):Void
{
{
scale.x = scale.y = 1;
updateHitbox();
}
else
{
offset.y = -5;
this.shader = whiteShader;
scale.x = scale.y = 0.5;
}

pressed = press;
}

override function updateHitbox()
{
super.updateHitbox();
width *= 1.5;
height *= 1.5;
}

function moveShitDown():Void
{
offset.y -= 5;
scale.x = scale.y = 0.5;

this.shader = whiteShader;

new FlxTimer().start(2 / 24, function(tmr)
{
scale.x = scale.y = 1;
updateHitbox();
});
}
}

/**
* Structure for the current song filter.
*/
typedef SongFilter =
{
}

/**
* Possible types to use for the song filter.
*/
enum abstract FilterType(String)
{
/**
* Filter to songs which start with a string
*/

/**
* Filter to songs which match a regular expression
*/

/**
* Filter to songs which are favorited
*/

/**
* Filter to all songs
*/
}

/**
* Data about a specific song in the freeplay menu.
*/
class FreeplaySongData
{
/**
* We used to have a billion fields, but this SongMetadata variable should be all we need
* to be able to get most information about an available song.
* For example, you can get the artist via `data.songArtist`
*
* You can usually get various other particulars of a specific difficulty/variation by
* using data.getDifficulty(), and inputting specifics on your difficulty, variations, etc.
* See the getters here for songCharacter, fullSongName, and songStartingBpm for examples.
*
* @see Song
*/

function get_data():Song
{

}

/**
* The current variation to use in various property functions.
*/

/**
* The level id of the song, useful for sorting from week1 -> week 7 + weekend1
* and for properly loading PlayStatePlaylist for preloading on web
*/

function get_levelId():Null<String>
{
}



/**
* The start time of this song's preview in Freeplay (in range 0 - 1)
*/

/**
* The end time of this song's preview in Freeplay (in range 0 - 1)
*/

/**
* Whether or not the song has been favorited.
*/

/**
* Whether the player has seen/played this song before within freeplay
*/

/**
* The default opponent for the song.
* Does the getter stuff for you depending on your current (or rather, rememberd) variation and difficulty.
*/

/**
* The full song name, dynamically generated depending on your current (or rather, rememberd) variation and difficulty.
*/

/**
* The song's id and variation, combined with a colon. Dynamically generated depending on your current (or rather, rememberd) variation and difficulty.
*/

/**
* The starting BPM of the song, dynamically generated depending on your current (or rather, rememberd) variation and difficulty.
*/




public function new(songId:String, levelData:Level, instance:FreeplayState)
{
this.songId = songId;
_levelId = levelData.id;
this.instance = instance;
}

/**
* Toggle whether or not the song is favorited, then flush to save data.
* @return Whether or not the song is now favorited.
*/
public function toggleFavorite():Bool
{
{
Save.instance.unfavoriteSong(idAndVariation);
}
else
{
Save.instance.favoriteSong(idAndVariation);
}
}

function updateValues(variations:Array<String>):Void
{
}

function get_idAndVariation()
{
}

function get_isFav():Bool
{
}

public function isDifficultyNew(difficulty:String):Bool
{

}

function get_previewStartTime():Float
{


{
prevStart = Constants.DEFAULT_PREVIEW_START_TIME;
}

}

function get_previewEndTime():Float
{


{
prevEnd = Constants.DEFAULT_PREVIEW_END_TIME;
}

}

function get_isNew():Bool
{

}

function get_songCharacter():String
{
}

function get_fullSongName():String
{

}

function get_songStartingBpm():Float
{

}

function get_difficultyRating():Int
{
}

function get_scoringRank():Null<ScoringRank>
{
}

function get_curVariation():String
{


}
}

/**
* Parameters used to initialize the FreeplayState.
*/
typedef FreeplayStateParams =
{
?character:String,
?fromCharSelect:Bool,
?fromResults:FromResultsParams,
};

/**
* A set of parameters for transitioning to the FreeplayState from the ResultsState.
*/
typedef FromResultsParams =
{
/**
* The previous rank the song hand, if any. Null if it had no score before.
*/

/**
* Whether or not to play the rank animation on returning to freeplay.
*/

/**
* The new rank the song has.
*/

/**
* The song ID to play the animation on.
*/

/**
* The difficulty ID to play the animation on.
*/
};

/**
* The map storing information about the exit movers.
*/
typedef ExitMoverData = Map<Array<FlxSprite>, MoveData>;

/**
* The data for an exit mover.
*/
typedef MoveData =
{
}
