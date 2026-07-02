

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

{
}
}

override function create():Void
{

levelList = LevelRegistry.instance.listSortedLevelIds();
levelList = levelList.filter(function(id)
{





{

}




















}

function rememberSelection():Void
{
{
}
{
}
}

function playMenuMusic():Void
{
FunkinSound.playMusic('freakyMenu', {
overrideExisting: true,
restartTrack: false,
persist: true
}

function updateData():Void
{
currentLevel = LevelRegistry.instance.fetchEntry(currentLevelId);
}

function buildDifficultySprite(?diff:String):Void
{
{

{
}
else
{
}


}


}

function buildLevelTitles():Void
{

for (levelIndex in 0...levelList.length)
{


}
}

override function update(elapsed:Float):Void
{
Conductor.instance.update();




levelTitleText.x = FlxG.width - (levelTitleText.width + Math.max(10, FullScreenScaleMode.gameNotchSize.x)); // Right align.


{
}

}

function handleKeyPresses():Void
{

{
{
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

|| (SwipeUtil.swipeRight && TouchUtil.touch != null && TouchUtil.touch.deltaViewY < 10 && TouchUtil.touch.deltaViewY > -10)
|| (TouchUtil.pressAction(rightDifficultyArrow, null, false)) #end)
{
}

|| (SwipeUtil.swipeLeft && TouchUtil.touch != null && TouchUtil.touch.deltaViewY < 10 && TouchUtil.touch.deltaViewY > -10)
|| (TouchUtil.pressAction(leftDifficultyArrow, null, false)) #end)
{
}

{
}
else
{
}

{
}
else
{
}
}

{
}

{
for (i in 0...levelTitles.members.length)
{


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





for (index in 0...levelTitles.members.length)
{

{
}
else
{
}
}


}

/**
* Changes the selected difficulty.
* @param change +1 (right) to increase difficulty, -1 (left) to decrease difficulty
*/
function changeDifficulty(change:Int = 0):Void
{





{
}
else
{
}

{
}

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

{
for (prop in levelProps.members)
{
}
}
}

function selectLevel():Void
{
{
}





for (prop in levelProps.members)
{
}







new FlxTimer().start(1, function(tmr:FlxTimer)
{



{
LoadingState.loadPlayState({
targetSong: targetSong,
targetDifficulty: PlayStatePlaylist.campaignDifficulty,
targetVariation: targetVariation
}

function updateBackground(?previousLevelId:String = ''):Void
{
{
levelBackground.alpha = 1.0; // Not hidden.
}
else
{

{
{
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
}

levelBackground.alpha = 0.0; // Hidden to start.

FlxTween.tween(levelBackground, {alpha: 1.0}, 0.6, {
ease: FlxEase.linear
}
}
}

function updateProps():Void
{
for (ind => prop in currentLevel.buildProps(levelProps.members))
{
}

}

function updateText():Void
{


}

function goBack():Void
{

}

/**
* Reposition titles based on the currently selected one.
*/
function repositionTitles()
{


{
for (i in 0...currentIndex)
{
}
}

{
for (i in (currentIndex + 1)...levelTitles.members.length)
{
}
}
}
}
