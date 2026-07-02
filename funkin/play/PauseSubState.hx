

/**
* Parameters for initializing the PauseSubState.
*/
typedef PauseSubStateParams =
{
/**
* Which mode to start in. Dictates what entries are displayed.
*/
?mode:PauseMode,

/**
* Whether the game paused because the window lost focus.
*/
?lostFocus:Bool

/**
* The menu displayed when the Play State is paused.
*/
class PauseSubState extends MusicBeatSubState
{

/**
* Pause menu entries for when the game is paused during a song.
*/
text: 'Restart Song',
callback: restartPlayState
}, {
text: 'Change Difficulty',
callback: switchMode.bind(_, Difficulty)
}, {
text: 'Enable Practice Mode',
callback: enablePracticeMode,
filter: () -> !(PlayState.instance?.isPracticeMode ?? false)

/**
* Pause menu entries for when the game is paused in the Chart Editor preview.
*/
text: 'Restart Song',
callback: restartPlayState

/**
* Pause menu entries for when the user selects "Change Difficulty".
*/
text: 'Back',
callback: switchMode.bind(_, Standard)
} // Other entries are added dynamically.

/**
* Pause menu entries for when the game is paused during a video cutscene.
*/
text: 'Skip Cutscene',
callback: skipVideoCutscene

/**
* Pause menu entries for when the game is paused during a conversation.
*/
text: 'Skip Dialogue',
callback: skipConversation

/**
* Duration for the music to fade in when the pause menu is opened.
*/

/**
* The final volume for the music when the pause menu is opened.
*/



/**
* Defines which pause music to use.
*/

/**
* Reset the pause configuration to the default.
*/
public static function reset():Void
{
}


/**
* Disallow input until transitions are complete!
* This prevents the pause menu from immediately closing when opened, among other things.
*/


/**
* The entries currently displayed in the pause menu.
*/

/**
* The index of `currentMenuEntries` that is currently selected.
*/

/**
* The mode that the pause menu is currently in.
*/

/**
* Whether the game paused because the window lost focus.
*/


/**
* The pause button for the game, only appears in Mobile targets. Shows up breifly to finish the pause animation.
*/

/**
* The pause circle for the game, only appears in Mobile targets. Shows up breifly to finish the pause animation.
*/

/**
* The placeholder sprite displayed when an advertisement fails to load or display.
*/

/**
* The semi-transparent black background that appears when the game is paused.
*/

/**
* The metadata displayed in the top right.
*/

/**
* A text object that displays the current practice mode status.
*/

/**
* A text object that displays the current death count.
*/

/**
* A text object which displays the current song's artist.
* Fades to the charter after a period before fading back.
*/

/**
* A text object that displays the current global offset.
*/

/**
* A text object that displays information about the current global offset.
*/

/**
* The actual text objects for the menu entries.
*/

/**
* Callback that gets called once substate gets open.
*/



public function new(?params:PauseSubStateParams, ?onPause:Void->Void)
{
}


/**
* Called when the state is first loaded.
*/
public override function create():Void
{










}

/**
* Called every frame.
* @param elapsed The time elapsed since the last frame, in seconds.
*/
public override function update(elapsed:Float):Void
{

}

/**
* Called when the state is closed.
*/
public override function destroy():Void
{
}


/*#if FEATURE_MOBILE_ADVERTISEMENTS
function onBannerEvent(event:extension.admob.AdmobEvent):Void
{

{
{


}
}
else if (failedAdPlaceHolder != null && members.indexOf(failedAdPlaceHolder) != -1)
{
}
}
/**
* Play the pause music.
*/
function startPauseMusic():Void
{

{
}

}

/**
* Called when the game loses focus. Used to temporarily pause the sound.
*/
public override function onFocusLost():Void
{
}

/**
* Called when the game loses focus. Used to temporarily pause the sound.
*/
public override function onFocus():Void
{
}

/**
* Render the semi-transparent black background.
*/
function buildBackground():Void
{

pauseButton.animation.addByIndices('confirm', 'pause',


}

/**
* Render the metadata in the top right.
*/
function buildMetadata():Void
{

{
metadataSong.text = '${PlayState.instance.currentChart.songName}';
}

metadataArtist = new FlxText(20, metadataSong.y + 32, camera.width - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),
{
metadataArtist.text = 'Artist: ${PlayState.instance.currentChart.songArtist}';
}

{
metadataDifficulty.text += PlayState.instance.currentDifficulty.replace('-', ' ').toTitleCase();
}

metadataDeaths = new FlxText(20, metadataDifficulty.y + 32, camera.width - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),
'${PlayState.instance?.deathCounter} Blue Balls');

metadataPractice.visible = PlayState.instance?.isPracticeMode ?? false;

offsetText = new FlxText(20, metadataSong.y - 12, (camera.width + 10) - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),

offsetTextInfo = new FlxText(20, offsetText.y + 16, (camera.width + 10) - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),




}


function startCharterTimer():Void
{
charterFadeTween = FlxTween.tween(metadataArtist, {alpha: 0.0}, CHARTER_FADE_DURATION, {
startDelay: CHARTER_FADE_DELAY,
ease: FlxEase.quartOut,
onComplete: (_) ->
{
{
metadataArtist.text = 'Charter: ${PlayState.instance.currentChart.charter ?? 'Unknown'}';
}
else
{
}

FlxTween.tween(metadataArtist, {alpha: 1.0}, CHARTER_FADE_DURATION, {
ease: FlxEase.quartOut,
onComplete: (_) ->
{
}
}
}

function startArtistTimer():Void
{
charterFadeTween = FlxTween.tween(metadataArtist, {alpha: 0.0}, CHARTER_FADE_DURATION, {
startDelay: CHARTER_FADE_DELAY,
ease: FlxEase.quartOut,
onComplete: (_) ->
{
{
metadataArtist.text = 'Artist: ${PlayState.instance.currentChart.songArtist}';
}
else
{
}

FlxTween.tween(metadataArtist, {alpha: 1.0}, CHARTER_FADE_DURATION, {
ease: FlxEase.quartOut,
onComplete: (_) ->
{
}
}
}


/**
* Perform additional animations to transition the pause menu in when it is first displayed.
*/
function transitionIn():Void
{



hapticTimer.start(0.2, function(_)
{

dataFadeTimer.start(0.3, function(_)
{
}

function transitionMetadataIn():Void
{
for (child in metadata.members)
{
}
}


/**
* Process user inputs every frame.
*/
function handleInputs():Void
{



{
}
{
}

{
}


{
}
else if (controls.PAUSE_P)
{
}
}

function handleTouchInputs():Void
{
{
for (i in 0...menuEntryText.members.length)
{

{
}


}
}
}

/**
* used to both modify/change offsets, but also to early return so we don't interfere with other inputs while doing so
* TODO: refactor to use state design pattern to handle inputs, see MainMenuState
* @return Bool true if we are currently modifying our offsets (by holding shift and pressing UP or DOWN)
*/
function handleModifyingOffsets():Bool
{
{
{
{
}

{

}
}
else
{

}



}
else
{
}
}

function handleDebugInputs():Void
{
{
this.bgColor = visible ? 0x99000000 : 0x00000000; // 60% or fully transparent black
}
}

/**
* Move the current selection up or down.
* @param change The amount to change the selection by, with sign indicating direction.
*/
function changeSelection(change:Int = 0):Void
{

{
}
else
{
}


for (entryIndex in 0...currentMenuEntries.length)
{



{
}
}
}


/**
* Clear the current menu entries and regenerate them based on the current mode.
* @param targetMode Optionally specify a mode to switch to before regenerating the menu.
*/
function regenerateMenu(?targetMode:PauseMode):Void
{


}

/**
* Reset the current selection to the first entry.
*/
function resetSelection():Void
{
}

/**
* Select which menu entries to display based on the current mode.
*/
function chooseMenuEntries():Void
{
switch (this.currentMode)
{
case PauseMode.Standard:
case PauseMode.Charting:
case PauseMode.Difficulty:
{
for (difficulty in difficultiesInVariation)
{
}
}

case PauseMode.Conversation:
case PauseMode.Cutscene:
}
}

/**
* Clear the `menuEntryText` group and render the current menu entries to it.
* We first create the `menuEntryText` group if it doesn't already exist.
*/
function clearAndAddMenuEntries():Void
{
{
}

for (entry in currentMenuEntries)
{
{
}
else
{


for (letter in text)
{
}


for (letter in text)
{
}


}
}
for (entry in toRemove)
{
}
}


/**
* Update the values for the metadata text in the top right.
*/
function updateMetadataText():Void
{
metadataPractice.visible = PlayState.instance?.isPracticeMode ?? false;

{
for (text in metadata)
{
}
}

switch (this.currentMode)
{
case Standard | Difficulty:
metadataDeaths.text = '${PlayState.instance?.deathCounter} Blue Balls';
case Charting:
case Conversation:
case Cutscene:
}
}


/**
* Close the pause menu and resume the game.
* @param state The current PauseSubState.
*/
static function resume(state:PauseSubState):Void
{
}

/**
* Switch the pause menu to the indicated mode.
* Create a callback from this using `.bind(_, targetMode)`.
* @param state The current PauseSubState.
* @param targetMode The mode to switch to.
*/
static function switchMode(state:PauseSubState, targetMode:PauseMode):Void
{
}

/**
* Switch the game's difficulty to the indicated difficulty, then resume the game.
* @param state The current PauseSubState.
* @param difficulty The difficulty to switch to.
*/
static function changeDifficulty(state:PauseSubState, difficulty:String):Void
{
PlayState.instance.currentSong = SongRegistry.instance.fetchEntry(PlayState.instance.currentSong.id.toLowerCase(),
{variation: PlayState.instance.currentChart.variation});

{
PlayState.instance.previousDifficulty = PlayState.instance.currentDifficulty;
PlayState.instance.currentDifficulty = PlayStatePlaylist.campaignDifficulty;
}

PlayState.instance.needsReset = true;


{

AdMobUtil.loadInterstitial(function():Void
{



}
else
{

}
}

/**
* Restart the current level, then resume the game.
* @param state The current PauseSubState.
*/
static function restartPlayState(state:PauseSubState):Void
{
PlayState.instance.needsReset = true;


{

AdMobUtil.loadInterstitial(function():Void
{



}
else
{

}
}

/**
* Force the game into practice mode, then update the pause menu.
* @param state The current PauseSubState.
*/
static function enablePracticeMode(state:PauseSubState):Void
{

PlayState.instance.isPracticeMode = true;
}

/**
* Restart the paused video cutscene, then resume the game.
* @param state The current PauseSubState.
*/
static function restartVideoCutscene(state:PauseSubState):Void
{
}

/**
* Skip the paused video cutscene, then resume the game.
* @param state The current PauseSubState.
*/
static function skipVideoCutscene(state:PauseSubState):Void
{
}

/**
* Restart the paused conversation, then resume the game.
* @param state The current PauseSubState.
*/
static function restartConversation(state:PauseSubState):Void
{

PlayState.instance.currentConversation.resetConversation();
}

/**
* Skip the paused conversation, then resume the game.
* @param state The current PauseSubState.
*/
static function skipConversation(state:PauseSubState):Void
{

PlayState.instance.currentConversation.skipConversation();
}

/**
* Quit the game and return to the main menu.
* @param state The current PauseSubState.
*/
static function quitToMenu(state:PauseSubState):Void
{

PlayState.instance.deathCounter = 0;



{
}


{

{
}
}


}

/**
* Quit the game and return to the chart editor.
* @param state The current PauseSubState.
*/
static function quitToChartEditor(state:PauseSubState):Void
{
PlayState.instance?.forEachPausedSound(s -> s.destroy());
PlayState.instance?.vocals?.pause();
PlayState.instance?.close(); // This only works because PlayState is a substate!
}
}

/**
* Which set of options the pause menu should display.
*/
enum PauseMode
{
/**
* The menu displayed when the player pauses the game during a song.
*/

/**
* The menu displayed when the player pauses the game during a song while in charting mode.
*/

/**
* The menu displayed when the player moves to change the game's difficulty.
*/

/**
* The menu displayed when the player pauses the game during a conversation.
*/

/**
* The menu displayed when the player pauses the game during a video cutscene.
*/
}

/**
* Represents a single entry in the pause menu.
*/
typedef PauseMenuEntry =
{
/**
* The text to display for this entry.
* TODO: Implement localization.
*/

/**
* The callback to execute when the user selects this entry.
*/

/**
* If this returns true, the entry will be displayed. If it returns false, the entry will be hidden.
*/


/**
* The text object currently displaying this entry.
*/
