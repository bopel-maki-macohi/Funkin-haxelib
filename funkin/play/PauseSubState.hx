package funkin.play;


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
};

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
}, {text: 'Exit to Menu', callback: quitToMenu},];

/**
* Pause menu entries for when the game is paused in the Chart Editor preview.
*/
text: 'Restart Song',
callback: restartPlayState
}, {text: 'Return to Chart Editor', callback: quitToChartEditor},];

/**
* Pause menu entries for when the user selects "Change Difficulty".
*/
text: 'Back',
callback: switchMode.bind(_, Standard)
} // Other entries are added dynamically.
];

/**
* Pause menu entries for when the game is paused during a video cutscene.
*/
text: 'Skip Cutscene',
callback: skipVideoCutscene
}, {text: 'Restart Cutscene', callback: restartVideoCutscene}, {text: 'Exit to Menu', callback: quitToMenu},];

/**
* Pause menu entries for when the game is paused during a conversation.
*/
text: 'Skip Dialogue',
callback: skipConversation
}, {text: 'Restart Dialogue', callback: restartConversation}, {text: 'Exit to Menu', callback: quitToMenu},];

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
musicSuffix = '';
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
super();
this.currentMode = params?.mode ?? Standard;
this.lostFocus = params?.lostFocus ?? false;
this.onPause = onPause;
}


/**
* Called when the state is first loaded.
*/
public override function create():Void
{

AdMobUtil.addBanner(extension.admob.AdmobBannerSize.BANNER, extension.admob.AdmobBannerAlign.TOP_LEFT);


super.create();

startPauseMusic();


buildBackground();

buildMetadata();

regenerateMenu();

transitionIn();

startCharterTimer();
}

/**
* Called every frame.
* @param elapsed The time elapsed since the last frame, in seconds.
*/
public override function update(elapsed:Float):Void
{
super.update(elapsed);

handleInputs();
}

/**
* Called when the state is closed.
*/
public override function destroy():Void
{
super.destroy();
charterFadeTween.cancel();
charterFadeTween = null;
dataFadeTimer.cancel();
dataFadeTimer = null;
hapticTimer.cancel();
hapticTimer = null;
pauseMusic.stop();
onPause = null;
}


/*#if FEATURE_MOBILE_ADVERTISEMENTS
function onBannerEvent(event:extension.admob.AdmobEvent):Void
{

{
{

scale = Math.max(scale, 1);
scale = Math.min(scale, 1);

failedAdPlaceHolder = new FunkinSprite(0, 0);
failedAdPlaceHolder.makeSolidColor(Math.floor(320 * scale), Math.floor(50 * scale), FlxColor.RED);
failedAdPlaceHolder.updateHitbox();
failedAdPlaceHolder.screenCenter(X);
failedAdPlaceHolder.scrollFactor.set(0, 0);
add(failedAdPlaceHolder);
}
}
else if (failedAdPlaceHolder != null && members.indexOf(failedAdPlaceHolder) != -1)
{
remove(failedAdPlaceHolder);
}
}
/**
* Play the pause music.
*/
function startPauseMusic():Void
{
pauseMusic = FunkinSound.load(pauseMusicPath, 0, true, true);

{
}

pauseMusic.play(false, FlxG.random.int(0, Std.int(pauseMusic.length / 2)));
pauseMusic.fadeIn(MUSIC_FADE_IN_TIME, 0, MUSIC_FINAL_VOLUME);
}

/**
* Called when the game loses focus. Used to temporarily pause the sound.
*/
public override function onFocusLost():Void
{
super.onFocusLost();
}

/**
* Called when the game loses focus. Used to temporarily pause the sound.
*/
public override function onFocus():Void
{
super.onFocus();
}

/**
* Render the semi-transparent black background.
*/
function buildBackground():Void
{
background = new FunkinSprite(0, 0);
background.makeSolidColor(camera.width, camera.height, FlxColor.BLACK);
background.alpha = 0.0;
background.scrollFactor.set(0, 0);
background.updateHitbox();
add(background);

pauseButton = FunkinSprite.createSparrow(0, 0, "pauseButton");
pauseButton.animation.addByIndices('idle', 'pause', [0], "", 24, false);
pauseButton.animation.addByIndices('hold', 'pause', [5], "", 24, false);
pauseButton.animation.addByIndices('confirm', 'pause',
[6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32], "", 24, false);
pauseButton.scale.set(0.8, 0.8);
pauseButton.updateHitbox();
pauseButton.animation.play("confirm");
pauseButton.setPosition((FlxG.width - pauseButton.width) - 35, 35);

pauseCircle = FunkinSprite.create(0, 0, 'pauseCircle');
pauseCircle.scale.set(0.84, 0.8);
pauseCircle.updateHitbox();
pauseCircle.x = ((pauseButton.x + (pauseButton.width / 2)) - (pauseCircle.width / 2));
pauseCircle.y = ((pauseButton.y + (pauseButton.height / 2)) - (pauseCircle.height / 2));
pauseCircle.alpha = 0.1;

add(pauseCircle);
add(pauseButton);
}

/**
* Render the metadata in the top right.
*/
function buildMetadata():Void
{
metadata = new FlxTypedSpriteGroup<FlxText>();
metadata.scrollFactor.set(0, 0);
add(metadata);

camera.width - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x), 'Song Name');
metadataSong.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.RIGHT);
{
metadataSong.text = '${PlayState.instance.currentChart.songName}';
}
metadataSong.scrollFactor.set(0, 0);
metadata.add(metadataSong);

metadataArtist = new FlxText(20, metadataSong.y + 32, camera.width - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),
'Artist: ${Constants.DEFAULT_ARTIST}');
metadataArtist.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.RIGHT);
{
metadataArtist.text = 'Artist: ${PlayState.instance.currentChart.songArtist}';
}
metadataArtist.scrollFactor.set(0, 0);
metadata.add(metadataArtist);

'Difficulty: ');
metadataDifficulty.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.RIGHT);
{
metadataDifficulty.text += PlayState.instance.currentDifficulty.replace('-', ' ').toTitleCase();
}
metadataDifficulty.scrollFactor.set(0, 0);
metadata.add(metadataDifficulty);

metadataDeaths = new FlxText(20, metadataDifficulty.y + 32, camera.width - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),
'${PlayState.instance?.deathCounter} Blue Balls');
metadataDeaths.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.RIGHT);
metadataDeaths.scrollFactor.set(0, 0);
metadata.add(metadataDeaths);

metadataPractice = new FlxText(20, metadataDeaths.y + 32, camera.width - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x), 'PRACTICE MODE');
metadataPractice.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.RIGHT);
metadataPractice.visible = PlayState.instance?.isPracticeMode ?? false;
metadataPractice.scrollFactor.set(0, 0);
metadata.add(metadataPractice);

offsetText = new FlxText(20, metadataSong.y - 12, (camera.width + 10) - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),
'Global Offset: ${Preferences.globalOffset ?? 0}ms');
offsetText.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, FlxTextAlign.RIGHT);
offsetText.scrollFactor.set(0, 0);

offsetTextInfo = new FlxText(20, offsetText.y + 16, (camera.width + 10) - Math.max(40, funkin.ui.FullScreenScaleMode.gameNotchSize.x),
'Hold SHIFT-UP/DOWN,\nto change the offset.');
offsetTextInfo.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, FlxTextAlign.RIGHT);
offsetTextInfo.scrollFactor.set(0, 0);

offsetText.y = FlxG.height - (offsetText.height + offsetText.height + 40);
offsetTextInfo.y = offsetText.y + offsetText.height + 4;

metadata.add(offsetText);
metadata.add(offsetTextInfo);

metadataArtist.alpha = 0;
metadataPractice.alpha = 0;
metadataSong.alpha = 0;
metadataDifficulty.alpha = 0;
metadataDeaths.alpha = 0;
offsetText.alpha = 0;
offsetTextInfo.alpha = 0;

updateMetadataText();
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
metadataArtist.text = 'Charter: ${Constants.DEFAULT_CHARTER}';
}

FlxTween.tween(metadataArtist, {alpha: 1.0}, CHARTER_FADE_DURATION, {
ease: FlxEase.quartOut,
onComplete: (_) ->
{
startArtistTimer();
}
});
}
});
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
metadataArtist.text = 'Artist: ${Constants.DEFAULT_ARTIST}';
}

FlxTween.tween(metadataArtist, {alpha: 1.0}, CHARTER_FADE_DURATION, {
ease: FlxEase.quartOut,
onComplete: (_) ->
{
startCharterTimer();
}
});
}
});
}


/**
* Perform additional animations to transition the pause menu in when it is first displayed.
*/
function transitionIn():Void
{
FlxTween.tween(background, {alpha: 0.6}, 0.8, {ease: FlxEase.quartOut});

HapticUtil.vibrate(0, 0.05, 0.5);

pauseButton.animation.play("confirm");
pauseCircle.scale.set(0.84 * 1.4, 0.8 * 1.4);
pauseCircle.alpha = 0.4;
FlxTween.tween(pauseCircle.scale, {x: 0.84 * 0.8, y: 0.8 * 0.8}, 0.4, {ease: FlxEase.backInOut});
FlxTween.tween(pauseCircle, {alpha: 0}, 0.6, {ease: FlxEase.quartOut});

hapticTimer.start(0.2, function(_)
{
HapticUtil.vibrate(0, 0.01, 0.5);
});

dataFadeTimer.start(0.3, function(_)
{
transitionMetadataIn();
FlxTween.tween(pauseButton, {alpha: 0}, 0.6, {ease: FlxEase.quartOut});
});
transitionMetadataIn();
}

function transitionMetadataIn():Void
{
for (child in metadata.members)
{
FlxTween.tween(child, {alpha: 1, y: #if mobile child.y - 5 #else child.y + 5 #end}, 1.8, {ease: FlxEase.quartOut, startDelay: delay});
delay += 0.1;
}
}


/**
* Process user inputs every frame.
*/
function handleInputs():Void
{


handleDebugInputs();

{
changeSelection(-1);
}
{
changeSelection(1);
}

{
justOpened = false;
}

handleTouchInputs();

{
currentMenuEntries[currentEntry].callback(this);
}
else if (controls.PAUSE_P)
{
resume(this);
}
}

function handleTouchInputs():Void
{
{
for (i in 0...menuEntryText.members.length)
{

{
currentMenuEntries[currentEntry].callback(this);
HapticUtil.vibrate(0, 0.05, 1);
break;
}

changeSelection(i - currentEntry);
HapticUtil.vibrate(0, 0.01, 0.5);

break;
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
lastOffsetPress += FlxG.elapsed;
{
{
fastOffset = true;
lastOffsetPress = 0;
}

{
offset += (controls.UI_UP_P || controls.UI_UP) ? 1 : -1;

offsetText.text = 'Global Offset: ${Std.int(offset)}ms';
}
}
else
{
offset += ((controls.UI_UP_P || controls.UI_UP) ? 1 : -1) * (FlxG.elapsed * 30);

offsetText.text = 'Global Offset: ${Std.int(offset)}ms';
}


Preferences.globalOffset = Std.int(offset);

}
else
{
fastOffset = false;
lastOffsetPress = 0;
}
}

function handleDebugInputs():Void
{
{
metadata.visible = visible;
menuEntryText.visible = visible;
background.visible = visible;
this.bgColor = visible ? 0x99000000 : 0x00000000; // 60% or fully transparent black
}
}

/**
* Move the current selection up or down.
* @param change The amount to change the selection by, with sign indicating direction.
*/
function changeSelection(change:Int = 0):Void
{
currentEntry += change;

{
}
else
{
}


for (entryIndex in 0...currentMenuEntries.length)
{


text.alpha = isCurrent ? 1.0 : 0.6;

{
FlxTween.globalManager.cancelTweensOf(text);
text.x = 165;
FlxTween.tween(text, {x: 150}, 0.2, {ease: FlxEase.backInOut});
}
FlxTween.globalManager.cancelTweensOf(text);
FlxTween.tween(text, {x: targetX, y: targetY}, 0.33, {ease: FlxEase.quartOut});
}
}


/**
* Clear the current menu entries and regenerate them based on the current mode.
* @param targetMode Optionally specify a mode to switch to before regenerating the menu.
*/
function regenerateMenu(?targetMode:PauseMode):Void
{

this.currentMode = targetMode;

resetSelection();
chooseMenuEntries();
clearAndAddMenuEntries();
updateMetadataText();
changeSelection();
}

/**
* Reset the current selection to the first entry.
*/
function resetSelection():Void
{
this.currentEntry = 0;
}

/**
* Select which menu entries to display based on the current mode.
*/
function chooseMenuEntries():Void
{
switch (this.currentMode)
{
case PauseMode.Standard:
currentMenuEntries = PAUSE_MENU_ENTRIES_STANDARD.clone();
case PauseMode.Charting:
currentMenuEntries = PAUSE_MENU_ENTRIES_CHARTING.clone();
case PauseMode.Difficulty:
{
for (difficulty in difficultiesInVariation)
{
entries.push({text: difficulty.toTitleCase(), callback: (state) -> changeDifficulty(state, difficulty)});
}
}

currentMenuEntries = entries.concat(PAUSE_MENU_ENTRIES_DIFFICULTY.clone());
case PauseMode.Conversation:
currentMenuEntries = PAUSE_MENU_ENTRIES_CONVERSATION.clone();
case PauseMode.Cutscene:
currentMenuEntries = PAUSE_MENU_ENTRIES_VIDEO_CUTSCENE.clone();
}
}

/**
* Clear the `menuEntryText` group and render the current menu entries to it.
* We first create the `menuEntryText` group if it doesn't already exist.
*/
function clearAndAddMenuEntries():Void
{
{
menuEntryText = new FlxTypedSpriteGroup<AtlasText>();
menuEntryText.scrollFactor.set(0, 0);
add(menuEntryText);
}
menuEntryText.clear();

for (entry in currentMenuEntries)
{
{
toRemove.push(entry);
}
else
{


text.scrollFactor.set(0, 0);
text.alpha = 0;
for (letter in text)
{
letter.width *= 1.2;
letter.height *= 1.4;
}
menuEntryText.add(text);

FlxTween.tween(text, {x: 150}, 0.4 * (entryIndex + 1), {ease: FlxEase.expoOut});

entry.sprite = text;
text.scrollFactor.set(0, 0);
text.alpha = 0;
for (letter in text)
{
letter.width *= 2;
letter.height *= 2;
}
menuEntryText.add(text);

entry.sprite = text;

entryIndex++;
}
}
for (entry in toRemove)
{
currentMenuEntries.remove(entry);
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
text.y -= 30;
}
}

switch (this.currentMode)
{
case Standard | Difficulty:
metadataDeaths.text = '${PlayState.instance?.deathCounter} Blue Balls';
case Charting:
metadataDeaths.text = 'Chart Editor Preview';
case Conversation:
metadataDeaths.text = 'Dialogue Paused';
case Cutscene:
metadataDeaths.text = 'Video Paused';
}
}


/**
* Close the pause menu and resume the game.
* @param state The current PauseSubState.
*/
static function resume(state:PauseSubState):Void
{
VideoCutscene.resumeVideo();
AdMobUtil.removeBanner();
state.close();
}

/**
* Switch the pause menu to the indicated mode.
* Create a callback from this using `.bind(_, targetMode)`.
* @param state The current PauseSubState.
* @param targetMode The mode to switch to.
*/
static function switchMode(state:PauseSubState, targetMode:PauseMode):Void
{
state.regenerateMenu(targetMode);
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
PlayStatePlaylist.campaignScore = 0;
PlayStatePlaylist.campaignDifficulty = difficulty;
PlayState.instance.previousDifficulty = PlayState.instance.currentDifficulty;
PlayState.instance.currentDifficulty = PlayStatePlaylist.campaignDifficulty;
FreeplayState.rememberedDifficulty = difficulty;
}

PlayState.instance.needsReset = true;


{
state.allowInput = false;

AdMobUtil.loadInterstitial(function():Void
{
AdMobUtil.PLAYING_COUNTER = 0;

AdMobUtil.removeBanner();

state.allowInput = true;

state.close();
});
}
else
{
AdMobUtil.removeBanner();

state.close();
}
state.close();
}

/**
* Restart the current level, then resume the game.
* @param state The current PauseSubState.
*/
static function restartPlayState(state:PauseSubState):Void
{
PlayState.instance.needsReset = true;


{
state.allowInput = false;

AdMobUtil.loadInterstitial(function():Void
{
AdMobUtil.PLAYING_COUNTER = 0;

AdMobUtil.removeBanner();

state.allowInput = true;

state.close();
});
}
else
{
AdMobUtil.removeBanner();

state.close();
}
state.close();
}

/**
* Force the game into practice mode, then update the pause menu.
* @param state The current PauseSubState.
*/
static function enablePracticeMode(state:PauseSubState):Void
{

PlayState.instance.isPracticeMode = true;
state.regenerateMenu();
}

/**
* Restart the paused video cutscene, then resume the game.
* @param state The current PauseSubState.
*/
static function restartVideoCutscene(state:PauseSubState):Void
{
VideoCutscene.restartVideo();
AdMobUtil.removeBanner();
state.close();
}

/**
* Skip the paused video cutscene, then resume the game.
* @param state The current PauseSubState.
*/
static function skipVideoCutscene(state:PauseSubState):Void
{
VideoCutscene.finishVideo();
AdMobUtil.removeBanner();
state.close();
}

/**
* Restart the paused conversation, then resume the game.
* @param state The current PauseSubState.
*/
static function restartConversation(state:PauseSubState):Void
{

PlayState.instance.currentConversation.resetConversation();
AdMobUtil.removeBanner();
state.close();
}

/**
* Skip the paused conversation, then resume the game.
* @param state The current PauseSubState.
*/
static function skipConversation(state:PauseSubState):Void
{

PlayState.instance.currentConversation.skipConversation();
AdMobUtil.removeBanner();
state.close();
}

/**
* Quit the game and return to the main menu.
* @param state The current PauseSubState.
*/
static function quitToMenu(state:PauseSubState):Void
{
state.allowInput = false;

PlayState.instance.deathCounter = 0;

FlxTransitionableState.skipNextTransIn = true;
FlxTransitionableState.skipNextTransOut = true;

new StoryMenuState(sticker) : (sticker) -> FreeplayState.build(sticker);

{
PlayStatePlaylist.reset();
}


{

{
stickerPackId = playerCharacter.getStickerPackID();
}
}

AdMobUtil.removeBanner();

state.openSubState(new funkin.ui.transition.stickers.StickerSubState({targetState: targetState, stickerPack: stickerPackId}));
}

/**
* Quit the game and return to the chart editor.
* @param state The current PauseSubState.
*/
static function quitToChartEditor(state:PauseSubState):Void
{
AdMobUtil.removeBanner();
PlayState.instance?.forEachPausedSound(s -> s.destroy());
state.close();
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
Standard;

/**
* The menu displayed when the player pauses the game during a song while in charting mode.
*/
Charting;

/**
* The menu displayed when the player moves to change the game's difficulty.
*/
Difficulty;

/**
* The menu displayed when the player pauses the game during a conversation.
*/
Conversation;

/**
* The menu displayed when the player pauses the game during a video cutscene.
*/
Cutscene;
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
};
