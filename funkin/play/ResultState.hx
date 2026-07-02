

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
{
sprite:FunkinSprite,
delay:Float



/**
* The music playing in the background of the state.
*/





function get_isChartingMode():Bool
{
else
}

public function new(params:ResultsStateParams)
{














}

override function create():Void
{








new FlxTimer().start(8 / 24, _ ->
{

playerCharacterId = PlayerRegistry.instance.getCharacterOwnerId(params.characterId) ?? 'bf';
playerCharacter = PlayerRegistry.instance.fetchEntry(playerCharacterId);


for (animData in playerAnimationDatas)
{

{
}


{
}
switch (animData.renderType)
{
case 'animateatlas':


else


{
}



{
animation.anim.onFinish.add((_name:String) ->
{
{
}
}
else if (animData.loopFrameLabel != null)
{
animation.anim.onFinish.add((_name:String) ->
{
{
animation.anim.play(animData.loopFrameLabel ?? '', true); // unpauses this anim, since it's on PlayOnce!
}
}
else if (animData.loopFrame != null)
{
animation.anim.onFinish.add((_name:String) ->
{
{
animation.anim.play("", true, false, animData.loopFrame ?? 0); // unpauses this anim, since it's on PlayOnce!
}
}

characterAtlasAnimations.push({
sprite: animation,
delay: animData.delay ?? 0.0,
forceLoop: (animData.loopFrame ?? -1) == 0,
startFrameLabel: (animData.startFrameLabel ?? ""),
sound: (animData.sound ?? "")
case 'sparrow':

else



{
animation.animation.onFinish.add((_name:String) ->
{
{
}
}

characterSparrowAnimations.push({
sprite: animation,
delay: animData.delay ?? 0.0
}
}









resultsAnim.animation.addByPrefix("result", "results instance 1", 24, false);
new FlxTimer().start(6 / 24, _ ->
{

new FlxTimer().start(21 / 24, _ ->
{

new FlxTimer().start(36 / 24, _ ->
{
scorePopin.animation.onFinish.add(anim -> {

new FlxTimer().start(37 / 24, _ ->
{

new FlxTimer().start(rank.getBFDelay(), _ ->
{

new FlxTimer().start(rank.getFlashDelay(), _ ->
{


new FlxTimer().start(rank.getHighscoreDelay(), _ ->
{
{
}
else
{
}



/**
* NOTE: We display how many notes were HIT, not how many notes there were in total.
*
*/


{
}









for (ind => rating in ratingGrp.members)
{
new FlxTimer().start((0.3 * ind) + 1.20, _ ->
{
}


new FlxTimer().start(rank.getMusicDelay(), _ ->
{

{


introMusicAudio = FunkinSound.load(introMusic, 1.0, false, true, true, () ->
{
else // Play the results music as a looped sound instead (that we cancel before closing and returning to the chart editor)
{
false; // Why is this necessary for this to work?
}
}
else
{
startingVolume: 1.0,
overrideExisting: true,
restartTrack: true
else
{
}
}




}

function getMusicPath(playerCharacter:Null<PlayableCharacter>, rank:ScoringRank):String
{
}


function startRankTallySequence():Void
{



FlxTween.tween(clearPercentCounter, {curNumber: clearPercentTarget}, 58 / 24, {
ease: FlxEase.quartOut,
onUpdate: _ ->
{
{

}
},
onComplete: _ ->
{




new FlxTimer().start(0.4, _ ->
{


new FlxTimer().start(0.25, _ ->
{
FlxTween.tween(clearPercentCounter, {alpha: 0}, 0.5, {
startDelay: 0.5,
ease: FlxEase.quartOut,
onComplete: _ ->
{
}

}

{
}
else
{

ratingsPopin.animation.onFinish.add(anim -> {

}

}

function displayRankText():Void
{



new FlxTimer().start(30 / 24, _ ->
{

for (i in 0...12)
{

}

}

function afterRankTallySequence():Void
{

for (atlas in characterAtlasAnimations)
{
new FlxTimer().start(atlas.delay, _ ->
{
{

}
}

for (sprite in characterSparrowAnimations)
{
new FlxTimer().start(sprite.delay, _ ->
{
}
}

function timerThenSongName(timerLength:Float = 3.0, autoScroll:Bool = true):Void
{




{
}


new FlxTimer().start(timerLength, _ ->
{


}

function showSmallClearPercent():Void
{
{
new FlxTimer().start(0.4, _ ->
{

}

new FlxTimer().start(2.5, _ ->
{
}


override function draw():Void
{



}

override function update(elapsed:Float):Void
{

{


{
}
}

{
{
{
}
close(); // IF we are a substate, we will close ourselves. This is used from ResultsDebugSubState
}
else if (introMusicAudio != null)
{

FlxTween.tween(introMusicAudio, {volume: 0}, 0.8, {
onComplete: _ ->
{
{
}
}
FlxTween.tween(introMusicAudio, {pitch: 3}, 0.1, {
onComplete: _ ->
{
}
}
else if (FlxG.sound.music != null)
{
FlxTween.tween(FlxG.sound.music, {volume: 0}, 0.8, {
onComplete: _ ->
{
}
FlxTween.tween(FlxG.sound.music, {pitch: 3}, 0.1, {
onComplete: _ ->
{
}
}




{
}
{
}

{
{


for (charId in newCharacters)
{
}
}
else
{
targetStateFactory = () -> new StickerSubState({
targetState: (sticker) -> new StoryMenuState(sticker),
stickerPack: stickerPackId
}
}
else
{

{

{
PlayState.instance?.close();
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
}
else
{
{
PlayState.instance?.close();
}
targetStateFactory = () -> new StickerSubState({
targetState: (sticker) -> FreeplayState.build(null, sticker),
stickerPack: stickerPackId
}
}

{

AdMobUtil.loadInterstitial(function():Void
{


}
else
{
}
}

}

function transitionToState(targetState:FlxState, targetStateFactory:Null<Void->StickerSubState>, shouldTween:Bool, shouldUseSubstate:Bool):Void
{
{
FlxTween.tween(rankBg, {alpha: 1}, 0.5, {
ease: FlxEase.expoOut,
onComplete: function(_)
{

{
}

{
}
else
{
{
else
}
}
}
else
{

{
}

{
}
else
{
{
else
}
}
}

function requestReview():Void
{
{

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
