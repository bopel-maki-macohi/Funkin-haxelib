

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

/**
* For the audio preview, the duration of the fade-out effect.
*
*/

/**
* For the audio preview, the volume at which the fade-in starts.
*/

/**
* For the audio preview, the volume at which the fade-in ends.
*/

/**
* For the audio preview, the volume at which the fade-out starts.
*/

/**
* For scaling some sprites on wide displays.
*/

/**
* For positioning the DJ on wide displays.
*/

/**
* For positioning the songs list on wide displays.
*/

/**
* For positioning the difficulty dots.
*/

/**
* For the audio preview, the time to wait before attempting to load a song preview.
*/




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


styleData = FreeplayStyleRegistry.instance.fetchEntry(currentCharacter.getFreeplayStyleID());



{
}


{
}
else
{
for (cardClass in allScriptedCards)
{
{
}
}
}






}

override function create():Void
{



{

}

{
this._parentState._constructor = () ->
{
}
}




for (levelId in LevelRegistry.instance.listSortedLevelIds())
{

{
}

for (songId in level.getSongs())
{

{
}

}
}



backingCard.instance = this;

{

{
exitMovers.set([dj], {
x: -dj.width * 1.6,
speed: 0.5
exitMoversCharSel.set([dj], {
y: -175,
speed: 0.8,
wait: 0.1
}
}



add(blackOverlayBullshitLOLXD); // used to mask the text lol!



exitMovers.set([blackOverlayBullshitLOLXD, backingImage], {
x: FlxG.width * 1.5,
speed: 0.4,
wait: 0

exitMoversCharSel.set([blackOverlayBullshitLOLXD, backingImage], {
y: -100,
speed: 0.8,
wait: 0.1




exitMovers.set([grpDifficulties], {
x: -300,
speed: 0.25,
wait: 0

exitMoversCharSel.set([grpDifficulties], {
y: -270,
speed: 0.8,
wait: 0.1

for (diffId in allDifficulties)
{
}

for (i in 0...allDifficulties.length)
{
}



{
}
else
{
}





else
{
}

exitMovers.set([overhangStuff, topLeftCornerText, ostName, charSelectHint, freeplayTxtBg, freeplayArrow], {
y: -overhangStuff.height,
x: 0,
speed: 0.2,
wait: 0

exitMoversCharSel.set([overhangStuff, topLeftCornerText, ostName, charSelectHint, freeplayTxtBg, freeplayArrow], {
y: -300,
speed: 0.8,
wait: 0.1


fnfHighscoreSpr.animation.addByPrefix('highscore', 'highscore small instance 1', 24, false);

new FlxTimer().start(FlxG.random.float(12, 50), function(tmr)
{




letterSort.instance = this;

exitMovers.set([letterSort], {
y: -100,
speed: 0.3

exitMoversCharSel.set([letterSort], {
y: -270,
speed: 0.8,
wait: 0.1

letterSort.changeSelectionCallback = (str) ->
{

switch (str)
{
case 'fav':
case 'ALL':
case '#':
default:
}

{
}
else if (grpCapsules.members.length > 0)
{
}

exitMovers.set([fpScoreDisplay, fnfHighscoreSpr, clearBoxSprite], {
x: FlxG.width,
speed: 0.3

exitMovers.set([txtCompletion], {
x: FlxG.width * 1.05,
speed: 0.315

exitMoversCharSel.set([fpScoreDisplay, txtCompletion, fnfHighscoreSpr, clearBoxSprite], {
y: -270,
speed: 0.8,
wait: 0.1




{
}

{




{

FlxTween.color(backingImage, 0.6, 0xFF000000, 0xFFFFFFFF, {
ease: FlxEase.expoOut,
onUpdate: function(_)
{
},
onComplete: function(_)
{
}
}

for (diff in grpDifficulties.group.members)
{
}


exitMovers.set([diffSelLeft, diffSelRight], {
x: -diffSelLeft.width * 2,
speed: 0.26

exitMoversCharSel.set([diffSelLeft, diffSelRight], {
y: -270,
speed: 0.8,
wait: 0.1

new FlxTimer().start(1 / 24, function(handShit)
{


new FlxTimer().start(1.5 / 24, function(bold)
{


{
}
else if (fromCharSelect || forceSkipIntro)
{
}






forEach(function(bs)
{




{
}

{
}
else
{
{
}
else
{
}
}
}

/**
* Dispatches script events to all relevant scripted classes.
* @param event
*/
public override function dispatchEvent(event:ScriptEvent):Void
{


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
case "sparrow":
case 'multisparrow':
dj = (scriptClass != "") ? (ScriptedMultiSparrowFreeplayDJ.scriptInit(scriptClass, x, y,
case 'packer':
case 'custom':
dj = (scriptClass != "") ? (ScriptedBaseFreeplayDJ.scriptInit(scriptClass, x, y, characterId)) :
{
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



{
{

for (capsule in grpCapsules.members)
{
{
}
}

}
}





else


for (i in 0...tempSongs.length)
{


else

}



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

switch (songFilter.filterType)
{
case REGEXP:

songsToFilter = songsToFilter.filter(filteredSong ->
{


case STARTSWITH:

songsToFilter = songsToFilter.filter(filteredSong ->
{
case ALL:
case FAVORITE:
songsToFilter = songsToFilter.filter(filteredSong ->
{

default:
}

}


function rankAnimStart(fromResults:FromResultsParams, capsuleToRank:SongMenuItem):Void
{

capsuleToRank.fakeRanking.alpha = 0; // If this isn't done, you'd see a tiny E being replaced for the first rank




{


}









new FlxTimer().start(0.5, _ ->
{
}

function rankDisplayNew(fromResults:Null<FromResultsParams>, capsuleToRank:SongMenuItem):Void
{

{
}


{
}

new FlxTimer().start(0.1, _ ->
{
{


sparks.animation.onFinish.add(anim ->
{
}

switch (fromResultsParams?.newRank)
{
case SHIT:
case PERFECT:
case PERFECT_GOLD:
default:
}






new FlxTimer().start(0.4, _ ->
{

new FlxTimer().start(0.6, _ ->
{
}

function rankAnimSlam(fromResultsParams:Null<FromResultsParams>, capsuleToRank:SongMenuItem):Void
{


switch (fromResultsParams?.newRank)
{
case SHIT:
case GOOD:
case GREAT:
case EXCELLENT:
case PERFECT:
case PERFECT_GOLD:
default:
}

new FlxTimer().start(0.5, _ ->
{




for (index => capsule in grpCapsules.members)
{

{
{


IntervalShake.shake(capsule, 0.6, 1 / 24, 0.12, 0, FlxEase.quadOut, function(_)
{


}
{
new FlxTimer().start(distFromSelected / 20, _ ->
{


IntervalShake.shake(capsule, 0.6, 1 / 24, 0.12 / (distFromSelected + 1), 0, FlxEase.quadOut, function(_)
{
}

{
new FlxTimer().start(distFromSelected / 20, _ ->
{


IntervalShake.shake(capsule, 0.6, 1 / 24, 0.12 / (distFromSelected + 1), 0, FlxEase.quadOut, function(_)
{
}
}

}

new FlxTimer().start(2, _ ->
{
}


function fadeDots(fadeIn:Bool):Void
{
for (i in 0...difficultyDots.group.members.length)
{
{
}
else
{
}
}
}

function refreshDots(amount:Int, index:Int, prevIndex:Int):Void
{

{
}
else
{
}

for (i in 0...difficultyDots.group.members.length)
{


{
}
else
{
{
}
else
{
}
}

{
}



{
}

{
}
else
{
{
{
}
}
}

{
}

}

}

/**
* Updates the OST text according to the album data for the current song and performs an outline animation.
* @param forceAnimation Whether to force the animation to play even if the text is the same.
*/
function updateOSTName(forceAnimation:Bool = false):Void
{
{

FlxTimer.wait(1.5 / 24, () ->
{
}
}

function tryOpenCharSelect():Void
{

{
}
else
{
}





new FlxTimer().start(transitionDelay, _ ->
{
}

function transitionToCharSelect():Void
{
exitMoversCharSel.set([transitionGradient], {
y: -720,
speed: 0.8,
wait: 0.1

for (index => capsule in grpCapsules.members)
{
{
exitMoversCharSel.set([capsule], {
y: -250,
speed: 0.8,
wait: 0.1
}
}




new FlxTimer().start(0.9, _ ->
{

for (grpSpr in exitMoversCharSel.keys())
{

for (spr in grpSpr)
{


}
}
}

function enterFromCharSel():Void
{

exitMoversCharSel.set([transitionGradient], {
y: -720,
speed: 1.5,
wait: 0.1


for (grpSpr in exitMoversCharSel.keys())
{

for (spr in grpSpr)
{



FlxTween.tween(spr, {y: spr.y - moveDataY}, moveDataSpeed * 1.2, {
ease: FlxEase.expoOut,
onComplete: (_) ->
{

for (capsule in grpCapsules.members)
}
}
}

{
}
}






override function update(elapsed:Float):Void
{

Conductor.instance.update(FlxG.sound?.music?.time ?? 0.0);

{
{
}
}

{
}

{
{
character: currentCharacterId == "pico" ? Constants.DEFAULT_CHARACTER : "pico",
}
}

{
rankAnimStart(fromResultsParams ?? {
playRankAnim: true,
oldRank: currentCapsule.ranking.rank,
newRank: PERFECT_GOLD,
songId: "tutorial",
difficultyId: "hard"
}

{
|| (TouchUtil.pressAction(djHitbox, funnyCam, false) && !SwipeUtil.swipeAny) #end)
&& !FlxG.debugger.visible)
{
}

}




}

function lerpScoreDisplays():Void
{

{
}

{
}



switch (txtCompletion.text.length)
{
case 3:
case 2:
case 1:
default:
}
}


function handleInputs(elapsed:Float):Void
{


else



{
}


{
}

{
}

{
}

{
}
}

function handleDirectionalInput(elapsed:Float):Void
{

{
{
{
}
}
else if (spamTimer >= 0.9)
{
}
else if (spamTimer <= 0)
{
}

}
else
{
}
}

function handleDifficultySwitch():Void
{


{
}
else if (rightPressed)
{
}
}

function handleDebugKeys():Void
{
{

{
{


{
}


}
new FlxTimer().start(styleData?.getStartDelay(), function(tmr:FlxTimer)
{
targetSongId: targetSongID,
targetSongDifficulty: currentDifficulty,
targetSongVariation: currentVariation,
}

{

{

{


{
}


}

{
}
{
}

targetStageId: targetDifficulty.stage,
targetBfChar: targetDifficulty.characters.player,
targetGfChar: targetDifficulty.characters.girlfriend,
targetDadChar: targetDifficulty.characters.opponent
}
}

private function handleTouchCapsuleClick():Void
{
{

for (i in 0...grpCapsules.members.length)
{


{
}
else
{
}
}
}

{
}
}

function handleTouchSelectionScroll(elapsed:Float):Void
{

{
}

for (touch in FlxG.touches.list)
{
{
{


}
}
else if (_moveLength > 0)
{
}
}
{
}

{
{

}
}
else if (!_flickEnded)
{
{
}
}


for (i in 0...grpCapsules.members.length)
{
}

{
{
}
}
}

function handleTouchFavoritesAndDifficulties()
{

{
{
{

new FlxTimer().start(0.21, (afteranim) ->
{
new FlxTimer().start(0.3, (afteranim) ->
{
}
else if (SwipeUtil.swipeRight)
{

new FlxTimer().start(0.21, (afteranim) ->
{
new FlxTimer().start(0.3, (afteranim) ->
{
}

{
}
}
else
{
}


{
}


currentDifficultySprite.offset.x = MathUtil.smoothLerpPrecision(currentDifficultySprite.offset.x, (TouchUtil.touch.x - _dragOffset) * -1, FlxG.elapsed,

{
}

{
}

{
}
{
}

}
else
{
}

}

public override function destroy():Void
{
}

function goBack():Void
{
{
}





for (grpSpr in exitMovers.keys())
{

for (spr in grpSpr)
{




}
}


for (caps in grpCapsules.members)
{
}

{
}

new FlxTimer().start(longestTimer, (_) ->
{
{
FunkinSound.playMusic('freakyMenu', {
overrideExisting: true,
restartTrack: false,
persist: true
}
else
{
}
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

}
}

for (diff in grpDifficulties.group.members)
{



FlxTween.tween(diff, {x: newX + (CUTOUT_WIDTH * DJ_POS_MULTI)}, 0.2, {
ease: FlxEase.circInOut,
onComplete: function(_)
{
}
}
{
}






{

}

for (variation in characterVariations)
{
{
}
}

{
{
}

}
else
{
}

{
}

for (diffSprite in grpDifficulties.group.members)
{





FlxTween.tween(diffSprite, {x: 90 + (CUTOUT_WIDTH * DJ_POS_MULTI)}, 0.2, {
ease: FlxEase.circInOut,
onComplete: function(_)
{
}

new FlxTimer().start(1 / 24, function(swag)
{
}


{
for (songCapsule in grpCapsules.members)
{

{
}
}

}

{
}


currentCapsule.selected = true; // set selected again, so it can run its getter function to initialize movement
}

function handleDiffDragRelease(diff:FlxSprite):Void
{

}

function handleDiffBoundaryChange(change:Int):Void
{
}

/**
* Called when hitting ENTER to open the instrumental choice for random capsule
*/
function capsuleOnOpenRandom(randomCapsule:SongMenuItem):Void
{
{

{

}



instSelectMenu.onConfirm = function(instChoice:String)
{
}
}

/**
* Called when hitting ENTER on an instrumental choice for random capsule
*/
function capsuleOnConfirmRandom(availableSongCapsules:Array<SongMenuItem>, instChoice:String):Void
{

changeSelection(); // Trigger an update. This will also fix the target variation.

{
}


{

}

{

}
else
{
}
}

/**
* Called when hitting ENTER to open the instrumental list.
*/
function capsuleOnOpenDefault(cap:SongMenuItem):Void
{
{
}

{
}



{

}

}

function openInstrumentalList(cap:SongMenuItem, instrumentalIds:Array<String>):Void
{


instSelectMenu.onConfirm = function(targetInstId:String)
{
}


public function cleanupInstSelectMenu():Void
{

{
}
}

/**
* Called when hitting ENTER to play the song.
*/
function capsuleOnConfirmDefault(cap:SongMenuItem, ?targetInstId:String):Void
{



{
}


{
}

{
}




{
new FlxTimer().start(0.5, function(tmr)
{
switch (currentCharacterId)
{
case "pico":
new FlxTimer().start(0.5, function(tmr)
{

default:
}
}

new FlxTimer().start(styleData?.getStartDelay(), function(tmr:FlxTimer)
{

{
}
funnyCam.fade(FlxColor.BLACK, 0.2, false, function()
{
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: currentDifficulty,
targetVariation: currentVariation,
targetInstrumental: targetInstId,
practiceMode: false,
minimalMode: false,

botPlayMode: FlxG.keys.pressed.SHIFT, mirrored: FlxG.keys.pressed.CONTROL,
botPlayMode: false,
}

function refreshCapsuleDisplays():Void
{
grpCapsules.forEachAlive((cap:SongMenuItem) ->
{
}

function rememberSelection():Void
{
{
curSelected = currentFilteredSongs.findIndex(function(song)
{

}

{
}

{
}
}

function updateSongsScroll():Void
{

for (index => capsule in grpCapsules.members)
{


}

{
}
}

function changeSelection(change:Int = 0):Void
{


{
}
{
}






for (index => capsule in grpCapsules.members)
{





}

{

}


}

public function playCurSongPreview(?daSongCapsule:SongMenuItem):Void
{




{
FunkinSound.playMusic('freeplayRandom', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: false
}
else
{


{
}

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

previewTimers.push(new FlxTimer().start(FlxG.sound.music.length / 1000, function(_)
{
},
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

}

public function switchBackingImage(?freeplaySongData:FreeplaySongData):Void
{
}

/**
* Build an instance of `FreeplayState` that is above the `MainMenuState`.
* @return The MainMenuState with the FreeplayState as a substate.
*/
public static function build(?params:FreeplayStateParams, ?stickers:StickerSubState):MusicBeatState
{
}

function favoriteSong():Void
{
{
{
selectedCapsule.selected = true; // set selected again, so it can run its getter function to initialize movement


FlxTween.tween(selectedCapsule, {y: selectedCapsule.y + 5}, 0.1, {
ease: FlxEase.expoIn,
startDelay: 0.1,
onComplete: function(_)
{
}
}
else
{
new FlxTimer().start(0.2, _ ->
{
selectedCapsule.selected = true; // set selected again, so it can run its getter function to initialize movement

FlxTween.tween(selectedCapsule, {y: selectedCapsule.y - 5}, 0.1, {
ease: FlxEase.expoIn,
startDelay: 0.1,
onComplete: function(_)
{
}
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


}

override function update(elapsed:Float):Void
{

}

public function setPress(press:Bool):Void
{
{
}
else
{
}

}

override function updateHitbox()
{
}

function moveShitDown():Void
{


new FlxTimer().start(2 / 24, function(tmr)
{
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
}

}

function get_previewEndTime():Float
{


{
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

/**
* The map storing information about the exit movers.
*/

/**
* The data for an exit mover.
*/
typedef MoveData =
{
}
