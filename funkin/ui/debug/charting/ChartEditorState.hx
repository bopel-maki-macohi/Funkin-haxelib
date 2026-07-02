package funkin.ui.debug.charting;


using Lambda;

/**
* A state dedicated to allowing the user to create and edit song charts.
* Built with HaxeUI for use by both developers and modders.
*
* Some functionality is split into handler classes to help maintain my sanity.
*
* @author EliteMasterEric
*/

class ChartEditorState extends UIState // UIState derives from MusicBeatState
{
/**
* CONSTANTS
*/
public static final CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT:String = Paths.ui('chart-editor/toolbox/difficulty');

public static final CHART_EDITOR_TOOLBOX_PLAYER_PREVIEW_LAYOUT:String = Paths.ui('chart-editor/toolbox/player-preview');
public static final CHART_EDITOR_TOOLBOX_OPPONENT_PREVIEW_LAYOUT:String = Paths.ui('chart-editor/toolbox/opponent-preview');
public static final CHART_EDITOR_TOOLBOX_METADATA_LAYOUT:String = Paths.ui('chart-editor/toolbox/metadata');
public static final CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT:String = Paths.ui('chart-editor/toolbox/offsets');
public static final CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT:String = Paths.ui('chart-editor/toolbox/note-data');
public static final CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT:String = Paths.ui('chart-editor/toolbox/event-data');
public static final CHART_EDITOR_TOOLBOX_FREEPLAY_LAYOUT:String = Paths.ui('chart-editor/toolbox/freeplay');
public static final CHART_EDITOR_TOOLBOX_PLAYTEST_PROPERTIES_LAYOUT:String = Paths.ui('chart-editor/toolbox/playtest-properties');

public static final SUPPORTED_MUSIC_FORMATS:Array<String> = #if sys ['ogg'] #else ['mp3'] #end;


/**
* The base grid size for the chart editor.
*/
public static final GRID_SIZE:Int = 40;

/**
* The width of the scroll area.
*/
public static final PLAYHEAD_SCROLL_AREA_WIDTH:Int = Std.int(GRID_SIZE);

/**
* The height of the playhead, in pixels.
*/
public static final PLAYHEAD_HEIGHT:Int = Std.int(GRID_SIZE / 8);

/**
* The width of the border between grid squares, where the crosshair changes from "Place Notes" to "Select Notes".
*/
public static final GRID_SELECTION_BORDER_WIDTH:Int = 6;

/**
* The height of the menu bar in the layout.
*/
public static final MENU_BAR_HEIGHT:Int = 32;

/**
* The height of the playbar in the layout.
*/
public static final PLAYBAR_HEIGHT:Int = 48;

/**
* The height of the note selection buttons above the grid.
*/
public static final NOTE_SELECT_BUTTON_HEIGHT:Int = 32;

/**
* The amount of padding between the menu bar and the chart grid when fully scrolled up.
*/
public static final GRID_TOP_PAD:Int = NOTE_SELECT_BUTTON_HEIGHT + 4;

/**
* The initial vertical position of the chart grid.
*/
public static final GRID_INITIAL_Y_POS:Int = MENU_BAR_HEIGHT + GRID_TOP_PAD;

/**
* The X position of the note preview area.
*/
public static final NOTE_PREVIEW_X_POS:Int = 320;

/**
* The Y position of the note preview area.
*/
public static final NOTE_PREVIEW_Y_POS:Int = GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT + 4;

/**
* The X position of the note grid.
*/

static function get_GRID_X_POS():Float
{
}

public static final CURSOR_COLOR:FlxColor = 0xE0FFFFFF;
public static final PREVIEW_BG_COLOR:FlxColor = 0xFF303030;
public static final PLAYHEAD_SCROLL_AREA_COLOR:FlxColor = 0xFF682B2F;
public static final SPECTROGRAM_COLOR:FlxColor = 0xFFFF0000;
public static final PLAYHEAD_COLOR:FlxColor = 0xC0BD0231;


/**
* Duration, in seconds, for the scroll easing animation.
*/
public static final SCROLL_EASE_DURATION:Float = 0.4;


/**
* Number of notes in each player's strumline.
*/
public static final STRUMLINE_SIZE:Int = 4;

/**
* How many pixels far the user needs to move the mouse before the cursor is considered to be dragged rather than clicked.
*/
public static final DRAG_THRESHOLD:Float = 16.0;

/**
* Precisions of notes you can snap to.
*/
public static final SNAP_QUANTS:Array<Int> = [4, 8, 12, 16, 20, 24, 32, 48, 64, 96, 192];

/**
* The default note snapping value.
*/
public static final BASE_QUANT:Int = 16;

/**
* The index of thet default note snapping value in the `SNAP_QUANTS` array.
*/
public static final BASE_QUANT_INDEX:Int = 3;

/**
* A map of the keys for every live input style.
*/
public static final LIVE_INPUT_KEYS:Map<ChartEditorLiveInputStyle, Array<FlxKey>> = [NumberKeys => [
FIVE, SIX, SEVEN, EIGHT,
ONE, TWO, THREE,  FOUR
], WASDKeys => [
LEFT, DOWN, UP, RIGHT,
A,    S,  W,     D
], None => []];

/**
* INSTANCE DATA
*/

/**
* The length of the current instrumental, in milliseconds.
*/

function get_songLengthInMs():Float
{
}

function set_songLengthInMs(value:Float):Float
{
this.songLengthInMs = value;

resetPreviewTimes();
updateGridHeight();

}

/**
* The length of the current instrumental, converted to steps.
* Dependant on BPM, because the size of a grid square does not change with BPM but the length of a beat does.
*/

function get_songLengthInSteps():Float
{
}

function set_songLengthInSteps(value:Float):Float
{
songLengthInMs = Conductor.instance.getStepTimeInMs(value);
}

/**
* The length of the current instrumental, in PIXELS.
* Dependant on BPM, because the size of a grid square does not change with BPM but the length of a beat does.
*/

function get_songLengthInPixels():Int
{
}

function set_songLengthInPixels(value:Int):Int
{
songLengthInSteps = value / GRID_SIZE;
}


/**
* The relative scroll position in the song, in pixels.
* One pixel is 1/40 of 1 step, and 1/160 of 1 beat.
*/

function set_scrollPositionInPixels(value:Float):Float
{
{
{
playheadPositionInPixels -= amount;
}

value = 0;
}





this.scrollPositionInPixels = value;

{
{
gridTiledSprite.y = -scrollPositionInPixels + (GRID_INITIAL_Y_POS);
}
else
{
gridTiledSprite.y = -scrollPositionInPixels + (GRID_INITIAL_Y_POS);

for (member in audioWaveforms.members)
{
member.time = scrollPositionInMs / Constants.MS_PER_SEC;
member.duration = (Conductor.instance.stepLengthMs * 16) / Constants.MS_PER_SEC;

}
}
}

renderedNotes.setPosition(gridTiledSprite?.x ?? 0.0, gridTiledSprite?.y ?? 0.0);
renderedHoldNotes.setPosition(gridTiledSprite?.x ?? 0.0, gridTiledSprite?.y ?? 0.0);
renderedEvents.setPosition(gridTiledSprite?.x ?? 0.0, gridTiledSprite?.y ?? 0.0);
renderedSelectionSquares.setPosition(gridTiledSprite?.x ?? 0.0, gridTiledSprite?.y ?? 0.0);

setNotePreviewViewportBounds(calculateNotePreviewViewportBounds());
refreshNotePreviewPlayheadPosition();

}

/**
* The relative scroll position in the song, converted to steps.
* NOT dependant on BPM, because the size of a grid square does not change with BPM.
*/

function get_scrollPositionInSteps():Float
{
}

function set_scrollPositionInSteps(value:Float):Float
{
scrollPositionInPixels = value * GRID_SIZE;
}

/**
* The relative scroll position in the song, converted to milliseconds.
* DEPENDANT on BPM, because the duration of a grid square changes with BPM.
*/

function get_scrollPositionInMs():Float
{
}

function set_scrollPositionInMs(value:Float):Float
{
scrollPositionInSteps = Conductor.instance.getTimeInSteps(value);
}


/**
* The position of the playhead, in pixels, relative to the `scrollPositionInPixels`.
* `0` means playhead is at the top of the grid.
* `40` means the playhead is 1 grid length below the base position.
* `-40` means the playhead is 1 grid length above the base position.
*/

function set_playheadPositionInPixels(value:Float):Float
{

this.playheadPositionInPixels = value;

gridPlayhead.y = this.playheadPositionInPixels + GRID_INITIAL_Y_POS;

updatePlayheadGhostHoldNotes();
refreshNotePreviewPlayheadPosition();

}

/**
* playheadPosition, converted to steps.
* NOT dependant on BPM, because the size of a grid square does not change with BPM.
*/

function get_playheadPositionInSteps():Float
{
}

function set_playheadPositionInSteps(value:Float):Float
{
playheadPositionInPixels = value * GRID_SIZE;
}

/**
* playheadPosition, converted to milliseconds.
* DEPENDANT on BPM, because the duration of a grid square changes with BPM.
*/

function get_playheadPositionInMs():Float
{
}

function set_playheadPositionInMs(value:Float):Float
{
playheadPositionInSteps = Conductor.instance.getTimeInSteps(value);
}


/**
* Whether a skip button has been pressed on the playbar, and which one.
* `null` if no button has been pressed.
* This will be used to update the scrollPosition (in the same function that handles the scroll wheel), then cleared.
*/

/**
* Whether the head of the playbar is currently being dragged with the mouse by the user.
*/

/**
* Whether music was playing before we started dragging the playbar head.
* If so, then when we stop dragging the playbar head, we should resume song playback.
*/


/**
* The note kind to use for notes being placed in the chart. Defaults to `null`.
*/

/**
* The note params to use for notes being placed in the chart. Defaults to `[]`.
*/

/**
* The event type to use for events being placed in the chart. Defaults to `''`.
*/

/**
* The event data to use for events being placed in the chart.
*/

/**
* The internal index of what note snapping value is in use.
* Increment to make placement more preceise and decrement to make placement less precise.
*/

/**
* The current note snapping value.
* For example, `32` when snapping to 32nd notes.
*/

function get_noteSnapQuant():Int
{
}

/**
* The ratio of the current note snapping value to the default.
* For example, `32` becomes `0.5` when snapping to 16th notes.
*/

function get_noteSnapRatio():Float
{
}

/**
* The currently selected live input style.
*/

/**
* If true, playtesting a chart will skip to the current playhead position.
*/

/**
* If true, playtesting a chart will let you "gameover" / die when you lose ur health!
*/

/**
* If true, playtesting a chart will make the computer do it for you!
*/

/**
* If true, after playtesting a chart the results screen will show your score.
*/

/**
* If true, playtesting a chart will use the audio settings that were set here.
*/

/**
* Enables or disables the "debugger" popup that appears when you run into a flixel error.
*/

/**
* Whether song scripts should be enabled during playtesting.
* You should probably check the box if the song has custom mechanics.
*/

/**
* Whether we are CURRENTLY playtesting a chart.
*/

function get_isPlaytesting():Bool
{
}


/**
* Whether the current view is in downscroll mode.
*/

function set_isViewDownscroll(value:Bool):Bool
{
isViewDownscroll = value;

noteDisplayDirty = true;
notePreviewDirty = true;
notePreviewViewportBoundsDirty = true;
this.scrollPositionInPixels = this.scrollPositionInPixels;
healthIconsDirty = true;

}

/**
* Whether to show an indicator if a note is of a non-default kind.
*/

/**
* Toggles the subtitles.
*/

function set_showSubtitles(value:Bool):Bool
{
showSubtitles = value;

{
subtitles.exists = showSubtitles;
}

}

/**
* The current theme used by the editor.
* Dictates the appearance of many UI elements.
* Currently hardcoded to just Light and Dark.
*/

function set_currentTheme(value:ChartEditorTheme):ChartEditorTheme
{

currentTheme = value;
this.updateTheme();
}

/**
* The character sprite in the Player Preview window.
* `null` until accessed.
*/

/**
* The character sprite in the Opponent Preview window.
* `null` until accessed.
*/


/**
* Whether the user is focused on an input in the Haxe UI, and inputs are being fed into it.
* If the user clicks off the input, focus will leave.
*/

function get_isHaxeUIFocused():Bool
{
}

/**
* Whether the user's mouse cursor is hovering over a SOLID component of the HaxeUI.
* If so, we can ignore certain mouse events underneath.
*/

function get_isCursorOverHaxeUI():Bool
{
}

/**
* The value of `isCursorOverHaxeUI` from the previous frame.
* This is useful because we may have just clicked a menu item, causing the menu to disappear.
*/

/**
* Set by ChartEditorDialogHandler, used to prevent background interaction while a dialog is open.
*/

/**
* The Dialog components representing the currently available tool windows.
* Dialogs are retained here even when collapsed or hidden.
*/

/**
* The camera component we're using for this state.
*/


/**
* Play the welcome music or not.
*/

/**
* The duration before the welcome music starts to fade back in after the user stops playing music in the chart editor.
*/
public static final WELCOME_MUSIC_FADE_IN_DELAY:Float = 10;

/**
* The duration of the welcome music fade in.
*/
public static final WELCOME_MUSIC_FADE_IN_DURATION:Float = 20;

/**
* Whether to play a metronome sound while the playhead is moving, and what volume.
*/

/**
* The volume to play the player's hitsounds at.
*/

/**
* The volume to play the opponent's hitsounds at.
*/

/**
* The audio volume before it was toggled to zero.
* Metronome, hitsounds (player and enemy), instrumental, vocals (player and enemy)
*/

/**
* Whether hitsounds are enabled for at least one character.
*/

function get_hitsoundsEnabled():Bool
{
}



/**
* A timer used to auto-save the chart after a period of inactivity.
*/


/**
* Whether the user's last mouse click was on the playhead scroll area.
*/

/**
* Where the user's last mouse click was on the note preview scroll area.
* `null` if the user isn't clicking on the note preview.
*/

/**
* The current process that is lerping the scroll position.
*/

/**
* The position where the user middle clicked to place a scroll anchor.
* Scroll each frame with speed based on the distance between the mouse and the scroll anchor.
* `null` if no scroll anchor is present.
*/


/**
* The SongNoteData which is currently being placed.
* `null` if the user isn't currently placing a note.
* As the user drags, we will update this note's sustain length, and finalize the note when they release.
*/

function set_currentPlaceNoteData(value:Null<SongNoteData>):Null<SongNoteData>
{
noteDisplayDirty = true;

}

/**
* The SongNoteData which is currently being placed, for each column.
* `null` if the user isn't currently placing a note.
* As the user moves down, we will update this note's sustain length, and finalize the note when they release.
*/

/**
* Defines how "close" two notes must be to be considered stacked, based on steps.
* For example, setting this to `0.5` (16/32) will highlight notes half a step apart.
* Setting it to `0` only highlights notes that are nearly perfectly aligned.
* In the dropdown menu, the threshold is based on note snaps instead.
* For example, `0.5` would be displayed as `1/32`, and `0` would show as `Exact`.
*/


/**
* The note sprite we are currently moving, if any.
*/

/**
* The song event sprite we are currently moving, if any.
*/

/**
* The amount of vertical steps the note sprite has moved by since the user started dragging.
*/

/**
* The amount of horizontal columns the note sprite has moved by since the user started dragging.
*/


/**
* The current length of the hold note we are dragging, in steps.
* Play a sound when this value changes.
*/

/**
* The current length of the hold note we are placing with the playhead, in steps.
* Play a sound when this value changes.
*/

/**
* Flip-flop to alternate between two stretching sounds.
*/


/**
* The notes which are currently in the user's selection.
*/

function set_currentNoteSelection(value:Array<SongNoteData>):Array<SongNoteData>
{

currentNoteSelection = value;

{
{
notePreview.addSelectedNotes(currentNoteSelection, songLengthInPixels);
}
else
{
notePreviewDirty = true;
}
}

}


function set_currentOverlappingNotes(value:Array<SongNoteData>):Array<SongNoteData>
{

currentOverlappingNotes = value;

{
{
notePreview.addOverlappingNotes(currentOverlappingNotes, songLengthInPixels);
}
else
{
notePreviewDirty = true;
}
}

}

/**
* The events which are currently in the user's selection.
*/

/**
* The position where the user clicked to start a selection.
* `null` if the user isn't currently selecting anything.
* The selection box extends from this point to the current mouse position.
*/


/**
* The list of command previously performed. Used for undoing previous actions.
*/

/**
* The list of commands that have been undone. Used for redoing previous actions.
*/


/**
* Whether the note display render group has been modified and needs to be updated.
* This happens when we scroll or add/remove notes, and need to update what notes are displayed and where.
*/


/**
* Whether the selected characters have been modified and the health icons need to be updated.
*/

/**
* Whether the waveforms were modified and need to be updated.
*/

/**
* Whether the note preview graphic needs to be FULLY rebuilt.
*/

function set_notePreviewDirty(value:Bool):Bool
{
}


/**
* Whether the chart has been modified since it was last saved.
* Used to determine whether to auto-save, etc.
*/

function set_saveDataDirty(value:Bool):Bool
{

{
autoSaveTimer = new FlxTimer().start(Constants.AUTOSAVE_TIMER_DELAY_SEC, (_) -> autoSave());
}
else
{
{
autoSaveTimer.cancel();
autoSaveTimer.destroy();
autoSaveTimer = null;
}
}

saveDataDirty = value;
applyWindowTitle();
}


function get_shouldShowBackupAvailableDialog():Bool
{
}

function set_shouldShowBackupAvailableDialog(value:Bool):Bool
{
}

/**
* A list of previous working file paths.
* Also known as the "recent files" list.
* The first element is [null] if the current working file has not been saved anywhere yet.
*/

function set_previousWorkingFilePaths(value:Array<Null<String>>):Array<Null<String>>
{
previousWorkingFilePaths = value;
applyWindowTitle();
populateOpenRecentMenu();
applyCanQuickSave();
}

/**
* The current file path which the chart editor is working with.
* If `null`, the current chart has not been saved yet.
*/

function get_currentWorkingFilePath():Null<String>
{
}

function set_currentWorkingFilePath(value:Null<String>):Null<String>
{

{
previousWorkingFilePaths = previousWorkingFilePaths.filter(function(x:Null<String>):Bool
{
});
}

{
previousWorkingFilePaths.remove(value);
previousWorkingFilePaths.unshift(value);
}
else
{
previousWorkingFilePaths.unshift(value);
}

{
previousWorkingFilePaths.pop();
}

populateOpenRecentMenu();
applyWindowTitle();

}

/**
* Whether the difficulty tree view in the toolbox has been modified and needs to be updated.
* This happens when we add/remove difficulties.
*/

/**
* Whether the character select view in the toolbox has been modified and needs to be updated.
* This happens when we add/remove characters.
*/

/**
* Whether the player preview toolbox have been modified and need to be updated.
* This happens when we switch characters.
*/

/**
* Whether the opponent preview toolbox have been modified and need to be updated.
* This happens when we switch characters.
*/

/**
* Whether the undo/redo histories have changed since the last time the UI was updated.
*/

/**
* Whether the selection has changed and the edit buttons need to be updated.
*/

/**
* Whether the clipboard has changed and the paste buttons need to be updated.
*/

/**
* Whether the clipboard is valid and contains a json of notes and events.
*/


/**
* If true, we are currently in the process of quitting the chart editor.
* Skip any update functions as most of them will call a crash.
*/


/**
* Handler used to track how long the user has been holding the undo keybind.
*/

/**
* Variable used to track how long the user has been holding the redo keybind.
*/

/**
* Variable used to track how long the user has been holding the up keybind.
*/

/**
* Variable used to track how long the user has been holding the down keybind.
*/

/**
* Variable used to track how long the user has been holding the W keybind.
*/

/**
* Variable used to track how long the user has been holding the S keybind.
*/

/**
* Variable used to track how long the user has been holding the page-up keybind.
*/

/**
* Variable used to track how long the user has been holding the page-down keybind.
*/

/**
* Variable used to track how long the user has been holding up on the dpad.
*/

/**
* Variable used to track how long the user has been holding down on the dpad.
*/

/**
* Variable used to track how long the user has been holding left on the dpad.
*/

/**
* Variable used to track how long the user has been holding right on the dpad.
*/

/**
* Variable used to track how long the user has been holding up on the left stick.
*/

/**
* Variable used to track how long the user has been holding down on the left stick.
*/

/**
* Variable used to track how long the user has been holding left on the left stick.
*/

/**
* Variable used to track how long the user has been holding right on the left stick.
*/

/**
* Variable used to track how long the user has been holding up on the right stick.
*/

/**
* Variable used to track how long the user has been holding down on the right stick.
*/

/**
* Variable used to track how long the user has been holding left on the right stick.
*/

/**
* Variable used to track how long the user has been holding right on the right stick.
*/

/**
* AUDIO AND SOUND DATA
*/

/**
* The chill audio track that plays in the chart editor.
* Plays when the main music is NOT being played.
*/

/**
* The audio track for the instrumental.
* Replaced when switching instrumentals.
* `null` until an instrumental track is loaded.
*/

/**
* The raw byte data for the instrumental audio tracks.
* Key is the instrumental name.
* `null` until an instrumental track is loaded.
*/

/**
* The audio track for the vocals.
* `null` until vocal track(s) are loaded.
* When switching characters, the elements of the VoicesGroup will be swapped to match the new character.
*/

/**
* The audio waveform visualization for the inst/vocals.
* `null` until vocal track(s) are loaded.
* When switching characters, the elements will be swapped to match the new character.
*/

/**
* A map of the audio tracks for each character's vocals.
* - Keys are `characterId-variation` (with `characterId` being the default variation).
* - Values are the byte data for the audio track.
*/

/**
* CHART DATA
*/

/**
* The song manifest data.
* If none already exists, it's initialized with the current song name in lower-kebab-case.
*/


function get_songManifestData():ChartManifestData
{
}

function set_songManifestData(value:ChartManifestData):ChartManifestData
{
}

/**
* The song metadata.
* - Keys are the variation IDs. At least one (`default`) must exist.
* - Values are the relevant metadata, ready to be serialized to JSON.
*/

/**
* Updates the current song's play data variations list.
*/
function refreshPlayDataVariations():Void
{
songVariations.clear();
for (variation in availableVariations)
{
songVariations.push(variation);
}
}

/**
* Retrieves the list of variations for the current song.
*/

function get_availableVariations():Array<String>
{
}

/**
* Retrieves the list of difficulties for the current variation of the current song.
* ONLY CONTAINS DIFFICULTIES FOR THE CURRENT VARIATION so if on the default variation, erect/nightmare won't be included.
*/

function get_availableDifficulties():Array<String>
{
}

function getAvailableDifficulties(variation:String):Array<String>
{
}

/**
* Retrieves the list of (suffixed) difficulties for ALL variations of the current song.
*/

function get_allDifficulties():Array<String>
{
{
[for (diff in (m?.playData?.difficulties ?? [])) '$diff-$x'];
}];
}

/**
* The song chart data.
* - Keys are the variation IDs. At least one (`default`) must exist.
* - Values are the relevant chart data, ready to be serialized to JSON.
*/

/**
* Convenience property to get the chart data for the current variation.
*/

function get_currentSongMetadata():SongMetadata
{
{
result = new SongMetadata('Default Song Name', Constants.DEFAULT_ARTIST, Constants.DEFAULT_CHARTER, selectedVariation);
songMetadata.set(selectedVariation, result);
}
}

function set_currentSongMetadata(value:SongMetadata):SongMetadata
{
songMetadata.set(selectedVariation, value);

resetPreviewTimes();

}

/**
* Convenience property to get the chart data for the current variation.
*/

function get_currentSongChartData():SongChartData
{
{
result = new SongChartData([Constants.DEFAULT_DIFFICULTY => 1.0], [], [Constants.DEFAULT_DIFFICULTY => []]);
songChartData.set(selectedVariation, result);
}
}

function set_currentSongChartData(value:SongChartData):SongChartData
{
songChartData.set(selectedVariation, value);
{
for (key in keys)
{
}
}
}

/**
* Convenience property to get (and set) the scroll speed for the current difficulty.
*/

function get_currentSongChartScrollSpeed():Float
{
{
currentSongChartData.scrollSpeed.set(selectedDifficulty, 1.0);
}
}

function set_currentSongChartScrollSpeed(value:Float):Float
{
currentSongChartData.scrollSpeed.set(selectedDifficulty, value);
}

/**
* Convenience property to get the note data for the current difficulty.
*/

function get_currentSongChartNoteData():Array<SongNoteData>
{
{
result = [];
currentSongChartData.notes.set(selectedDifficulty, result);
}
}

function set_currentSongChartNoteData(value:Array<SongNoteData>):Array<SongNoteData>
{
currentSongChartData.notes.set(selectedDifficulty, value);
}

/**
* Convenience property to get the event data for the current difficulty.
*/

function get_currentSongChartEventData():Array<SongEventData>
{
{
currentSongChartData.events = [];
}
}

function set_currentSongChartEventData(value:Array<SongEventData>):Array<SongEventData>
{
}

/**
* Convenience property to get the rating for this difficulty in the Freeplay menu.
*/

function get_currentSongChartDifficultyRating():Int
{
{
currentSongMetadata.playData.ratings.set(selectedDifficulty, 0);
}
}

function set_currentSongChartDifficultyRating(value:Int):Int
{
currentSongMetadata.playData.ratings.set(selectedDifficulty, value);
}


function get_currentSongNoteStyle():String
{
|| currentSongMetadata.playData.noteStyle == ''
|| currentSongMetadata.playData.noteStyle == 'item')
{
currentSongMetadata.playData.noteStyle = Constants.DEFAULT_NOTE_STYLE;
}
}

function set_currentSongNoteStyle(value:String):String
{
}


function get_currentSongFreeplayPreviewStart():Float
{
}

function set_currentSongFreeplayPreviewStart(value:Float):Float
{
}


function get_currentSongFreeplayPreviewEnd():Float
{
}

function set_currentSongFreeplayPreviewEnd(value:Float):Float
{
}


function get_currentSongStage():String
{
{
currentSongMetadata.playData.stage = 'mainStage';
}
}

function set_currentSongStage(value:String):String
{
}


function get_currentSongName():String
{
{
currentSongMetadata.songName = 'New Song';
}
}

function set_currentSongName(value:String):String
{
}


function get_currentSongId():String
{
}

function getDefaultSongId():String
{
}


function get_currentSongArtist():String
{
{
currentSongMetadata.artist = 'Unknown';
}
}

function set_currentSongArtist(value:String):String
{
}

/**
* Convenience property to get the player charId for the current variation.
*/

function get_currentPlayerChar():String
{
{
currentSongMetadata.playData.characters.player = Constants.DEFAULT_CHARACTER;
}
}

function set_currentPlayerChar(value:String):String
{
}

/**
* Convenience property to get the opponent charId for the current variation.
*/

function get_currentOpponentChar():String
{
{
currentSongMetadata.playData.characters.opponent = Constants.DEFAULT_CHARACTER;
}
}

function set_currentOpponentChar(value:String):String
{
}

/**
* Convenience property to get the song offset data for the current variation.
*/

function get_currentSongOffsets():SongOffsets
{
{
currentSongMetadata.offsets = new SongOffsets();
}
}

function set_currentSongOffsets(value:SongOffsets):SongOffsets
{
}


function get_currentInstrumentalOffset():Float
{
}

function set_currentInstrumentalOffset(value:Float):Float
{
currentSongOffsets.setInstrumentalOffset(value);
}


function get_currentVocalOffsetPlayer():Float
{
}

function set_currentVocalOffsetPlayer(value:Float):Float
{
currentSongOffsets.setVocalOffset(currentPlayerChar, value);
}


function get_currentVocalOffsetOpponent():Float
{
}

function set_currentVocalOffsetOpponent(value:Float):Float
{
currentSongOffsets.setVocalOffset(currentOpponentChar, value);
}

/**
* The variation ID for the difficulty which is currently being edited.
*/

/**
* Setter called when we are switching variations.
* We will likely need to switch instrumentals as well.
*/
function set_selectedVariation(value:String):String
{
selectedVariation = value;

noteDisplayDirty = true;
notePreviewDirty = true;
noteTooltipsDirty = true;
notePreviewViewportBoundsDirty = true;

currentNoteSelection = [];
currentEventSelection = [];

switchToCurrentInstrumental();
postLoadInstrumental();

}

/**
* The difficulty ID for the difficulty which is currently being edited.
*/

function set_selectedDifficulty(value:String):String
{

selectedDifficulty = value;

noteDisplayDirty = true;
notePreviewDirty = true;
noteTooltipsDirty = true;
notePreviewViewportBoundsDirty = true;

currentNoteSelection = [];
currentEventSelection = [];

}

/**
* The instrumental ID which is currently selected.
*/

function get_currentInstrumentalId():String
{
}

function set_currentInstrumentalId(value:String):String
{
}

/**
* HAXEUI COMPONENTS
*/

/**
* The layout containing the playbar.
* Constructed manually and added to the layout so we can control its position.
*/


/**
* The menubar at the top of the screen.
*/

/**
* The `File -> New Chart` menu item.
*/

/**
* The `File -> Open Chart` menu item.
*/

/**
* The `File -> Open Recent` menu.
*/

/**
* The `File -> Save Chart` menu item.
*/

/**
* The `File -> Save Chart As` menu item.
*/

/**
* The `File -> Preferences` menu item.
*/

/**
* The `File -> Exit` menu item.
*/

/**
* The `Edit -> Undo` menu item.
*/

/**
* The `Edit -> Redo` menu item.
*/

/**
* The `Edit -> Cut` menu item.
*/

/**
* The `Edit -> Copy` menu item.
*/

/**
* The `Edit -> Paste` menu item.
*/

/**
* The `Edit -> Paste Unsnapped` menu item.
*/

/**
* The `Edit -> Delete` menu item.
*/

/**
* The `Edit -> Delete Stacked Notes` menu item.
*/

/**
* The `Edit -> Flip Notes` menu item.
*/

/**
* The `Edit -> Mirror Notes -> X Axis` menu item.
*/

/**
* The `Edit -> Mirror Notes -> Y Axis` menu item.
*/

/**
* The `Edit -> Mirror Notes -> XY Axis` menu item.
*/

/**
* The `Edit -> Mirror Notes -> Flip Within Strumline` menu checkbox.
*/

/**
* The `Edit -> Select All` menu item.
*/

/**
* The `Edit -> Select Inverse` menu item.
*/

/**
* The `Edit -> Select None` menu item.
*/

/**
* The `Edit -> Select Region` menu item.
*/

/**
* The `Edit -> Select Before Playhead` menu item.
*/

/**
* The `Edit -> Select After Playhead` menu item.
*/

/**
* The `Edit -> Decrease Note Snap Precision` menu item.
*/

/**
* The `Edit -> Decrease Note Snap Precision` menu item.
*/

/**
* The `Edit -> Stacked Note Threshold` menu dropdown
*/

/**
* The `View -> Downscroll` menu item.
*/

/**
* The `View -> Note Kind Indicator` menu item.
*/

/**
* The `View -> Subtitles` menu item.
*/

/**
* The `View -> Waveforms` menu item.
*/

/**
* The `View -> Increase Difficulty` menu item.
*/

/**
* The `View -> Decrease Difficulty` menu item.
*/

/**
* The `Audio -> Play/Pause` menu item.
*/

/**
* The `Audio -> Load Instrumental` menu item.
*/

/**
* The `Audio -> Load Vocals` menu item.
*/

/**
* The `Audio -> Metronome Volume` label.
*/

/**
* The `Audio -> Metronome Volume` slider.
*/

/**
* The `Audio -> Play Theme Music` menu checkbox.
*/

/**
* The `Audio -> Player Hitsound Volume` label.
*/

/**
* The `Audio -> Enemy Hitsound Volume` label.
*/

/**
* The `Audio -> Player Hitsound Volume` slider.
*/

/**
* The `Audio -> Enemy Hitsound Volume` slider.
*/

/**
* The `Audio -> Instrumental Volume` label.
*/

/**
* The `Audio -> Instrumental Volume` slider.
*/

/**
* The `Audio -> Player Volume` label.
*/

/**
* The `Audio -> Enemy Volume` label.
*/

/**
* The `Audio -> Player Volume` slider.
*/

/**
* The `Audio -> Enemy Volume` slider.
*/

/**
* The `Audio -> Playback Speed` label.
*/

/**
* The `Audio -> Playback Speed` slider.
*/

/**
* The label by the playbar telling the song position.
*/

/**
* The label by the playbar telling the current beat rounded to 2
*/

/**
* The label by the playbar telling the current step
*/

/**
* The label by the playbar telling the song time remaining.
*/

/**
* The label by the playbar telling the note snap.
*/

/**
* The button by the playbar to jump to the start of the song.
*/

/**
* The button by the playbar to jump backwards in the song.
*/

/**
* The button by the playbar to play or pause the song.
*/

/**
* The button by the playbar to jump forwards in the song.
*/

/**
* The button by the playbar to jump to the end of the song.
*/

/**
* The button above the grid that does nothing currently. Used for covering up the measure ticks being cut off :)
* Constructed manually and added to the layout so we can control its position.
*/

/**
* The button above the grid that selects all notes on the opponent's side.
* Constructed manually and added to the layout so we can control its position.
*/

/**
* The button above the grid that selects all notes on the player's side.
* Constructed manually and added to the layout so we can control its position.
*/

/**
* The button above the grid that selects all song events.
* Constructed manually and added to the layout so we can control its position.
*/

/**
* The slider above the grid that sets the volume of the player's sounds.
* Constructed manually and added to the layout so we can control its position.
*/

/**
* The slider above the grid that sets the volume of the opponent's sounds.
* Constructed manually and added to the layout so we can control its position.
*/

/**
* RENDER OBJECTS
*/

/**
* The group containing the visulizers! */

/**
* The IMAGE used for the grid. Updated by ChartEditorThemeHandler.
*/

/**
* The IMAGE used for the selection squares. Updated by ChartEditorThemeHandler.
* Used three ways:
* 1. A sprite is given this bitmap and placed over selected notes.
* 2. Same as above but for notes that are overlapped by another.
* 3. The image is split and used for a 9-slice sprite for the selection box.
*/

/**
* The IMAGE used for the note preview bitmap. Updated by ChartEditorThemeHandler.
* The image is split and used for a 9-slice sprite for the box over the note preview.
*/

/**
* The IMAGE used for the offset ticks. Updated by ChartEditorThemeHandler.
*/

/**
* The tiled sprite used to display the grid.
* The height is the length of the song, and scrolling is done by simply the sprite.
*/

/**
* The measure ticks area. Includes the numbers and the background sprite.
*/

/**
* The playhead representing the current position in the song.
* Can move around on the grid independently of the view.
*/

/**
* A sprite used to indicate the note that will be placed on click.
*/

/**
* A sprite used to indicate the hold note that will be placed on click.
*/

/**
* A sprite used to indicate the hold note that will be placed on button release.
*/

/**
* A sprite used to indicate the event that will be placed on click.
*/

/**
* The sprite used to display the note preview area.
* We move this up and down to scroll the preview.
*/

/**
* The rectangular sprite used for representing the current viewport on the note preview.
* We move this up and down and resize it to represent the visible area.
*/

/**
* The thin sprite used for representing the playhead on the note preview.
* We move this up and down to represent the current position.
*/

/**
* Whether the note preview playhead is currently being dragged with the mouse by the user.
*/

/**
* The rectangular sprite used for rendering the selection box.
* Uses a 9-slice to stretch the selection box to the correct size without warping.
*/

/**
* The opponent's health icon.
*/

/**
* The player's health icon.
*/

/**
* The text that pop's up when copying something
*/

/**
* The purple background sprite.
*/

/**
* The subtitles to display song's lyrics.
*/

/**
* The sprite group containing the note graphics.
* Only displays a subset of the data from `currentSongChartNoteData`,
* and kills notes that are off-screen to be recycled later.
*/

/**
* The sprite group containing the hold note graphics.
* Only displays a subset of the data from `currentSongChartNoteData`,
* and kills notes that are off-screen to be recycled later.
*/

/**
* The sprite group containing the song events.
* Only displays a subset of the data from `currentSongChartEventData`,
* and kills events that are off-screen to be recycled later.
*/


/**
* LIFE CYCLE FUNCTIONS
*/

/**
* The params which were passed in when the Chart Editor was initialized.
*/

public function new(?params:ChartEditorParams)
{
super();
this.params = params;
}

public override function dispatchEvent(event:ScriptEvent):Void
{
super.dispatchEvent(event);

{
switch (event.type)
{
case UPDATE:
currentPlayerCharacterPlayer.onUpdate(cast event);
case SONG_BEAT_HIT:
currentPlayerCharacterPlayer.onBeatHit(cast event);
case SONG_STEP_HIT:
currentPlayerCharacterPlayer.onStepHit(cast event);
case NOTE_HIT:
currentPlayerCharacterPlayer.onNoteHit(cast event);
default: // Continue
}
}

{
switch (event.type)
{
case UPDATE:
currentOpponentCharacterPlayer.onUpdate(cast event);
case SONG_BEAT_HIT:
currentOpponentCharacterPlayer.onBeatHit(cast event);
case SONG_STEP_HIT:
currentOpponentCharacterPlayer.onStepHit(cast event);
case NOTE_HIT:
currentOpponentCharacterPlayer.onNoteHit(cast event);
default: // Continue
}
}
}

public override function reloadAssets()
{
{
super.reloadAssets();
}

funkin.modding.PolymodHandler.forceReloadAssets();

this.resetSubState();

testSongInPlayState(PlayState.lastParams.minimalMode);
}

override function create():Void
{
super.create();
this.root.zIndex = 100;


setupWelcomeMusic();

Cursor.show();

loadPreferences();

uiCamera = new FunkinCamera('chartEditorUI');

buildDefaultSongData();

buildBackground();

this.updateTheme();

buildGrid();
buildMeasureTicks();
buildNotePreview();

buildAdditionalUI();
populateOpenRecentMenu();
this.applyPlatformShortcutText();

createSubtitles();

setupUIListeners();
setupTurboKeyHandlers();

setupAutoSave();

refresh();

{
{
{
this.success('Loaded Chart', 'Loaded chart (${params.fnfcTargetPath})');
}
else
{
this.warning('Loaded Chart', 'Loaded chart with issues (${params.fnfcTargetPath})\n${result.join("\n")}');
}
}
else
{
this.error('Failure', 'Failed to load chart (${params.fnfcTargetPath})');

{
this.openBackupAvailableDialog(welcomeDialog);
}
}
}
else if (params != null && params.targetSongId != null)
{
this.loadSongAsTemplate(params.targetSongId, targetSongDifficulty, targetSongVariation);

scrollPositionInMs = Math.min(params.targetSongPosition ?? 0, songLengthInMs);
currentScrollEase = scrollPositionInPixels;
moveSongToScrollPosition();
}
else
{
{
this.openBackupAvailableDialog(welcomeDialog);
}
}

updateDiscordRPC();
}

function updateDiscordRPC():Void
{
funkin.api.discord.DiscordClient.instance.setPresence({
state: null,
details: 'Chart Editor [Charting]'
});
}

function setupWelcomeMusic()
{
this.welcomeMusic.loadEmbedded(Paths.music('chartEditorLoop/chartEditorLoop'));
this.welcomeMusic.looped = true;
}

public function resetPreviewTimes() {
currentSongFreeplayPreviewStart = (currentSongMetadata?.playData?.previewStart ?? Constants.DEFAULT_PREVIEW_START_TIME);
currentSongFreeplayPreviewEnd = (currentSongMetadata?.playData?.previewEnd ?? Constants.DEFAULT_PREVIEW_END_TIME);
}

public function loadPreferences():Void
{

{
previousWorkingFilePaths = [null].concat(save.chartEditorPreviousFiles.value);
}
else
{
previousWorkingFilePaths = [currentWorkingFilePath].concat(save.chartEditorPreviousFiles.value);
}

noteSnapQuantIndex = save.chartEditorNoteQuant.value;
currentLiveInputStyle = save.chartEditorLiveInputStyle.value;
isViewDownscroll = save.chartEditorDownscroll.value;
showNoteKindIndicators = save.chartEditorShowNoteKinds.value;
showSubtitles = save.chartEditorShowSubtitles.value;
playtestStartTime = save.chartEditorPlaytestStartTime.value;
playtestAudioSettings = save.chartEditorPlaytestAudioSettings.value;
playtestShowResults = save.chartEditorPlaytestResultsSettings.value;
currentTheme = save.chartEditorTheme.value;
metronomeVolume = save.chartEditorMetronomeVolume.value;
hitsoundVolumePlayer = save.chartEditorHitsoundVolumePlayer.value;
hitsoundVolumeOpponent = save.chartEditorHitsoundVolumeOpponent.value;
shouldPlayWelcomeMusic = save.chartEditorThemeMusic.value;

menubarItemVolumeInstrumental.value = Std.int(save.chartEditorInstVolume.value * 100);
menubarItemVolumeVocalsPlayer.value = Std.int(save.chartEditorPlayerVoiceVolume.value * 100);
menubarItemVolumeVocalsOpponent.value = Std.int(save.chartEditorOpponentVoiceVolume.value * 100);
menubarItemPlaybackSpeed.value = Math.round(save.chartEditorPlaybackSpeed.value * 100.0);
}

public function writePreferences(hasBackup:Bool):Void
{

for (chartPath in previousWorkingFilePaths)
save.chartEditorPreviousFiles.value = filteredWorkingFilePaths;

save.chartEditorHasBackup.value = hasBackup;

save.chartEditorNoteQuant.value = noteSnapQuantIndex;
save.chartEditorLiveInputStyle.value = currentLiveInputStyle;
save.chartEditorDownscroll.value = isViewDownscroll;
save.chartEditorShowNoteKinds.value = showNoteKindIndicators;
save.chartEditorPlaytestStartTime.value = playtestStartTime;
save.chartEditorPlaytestAudioSettings.value = playtestAudioSettings;
save.chartEditorPlaytestResultsSettings.value = playtestShowResults;
save.chartEditorTheme.value = currentTheme;
save.chartEditorMetronomeVolume.value = metronomeVolume;
save.chartEditorHitsoundVolumePlayer.value = hitsoundVolumePlayer;
save.chartEditorHitsoundVolumeOpponent.value = hitsoundVolumeOpponent;
save.chartEditorThemeMusic.value = shouldPlayWelcomeMusic;

save.chartEditorInstVolume.value = menubarItemVolumeInstrumental.value / 100.0;
save.chartEditorPlayerVoiceVolume.value = menubarItemVolumeVocalsPlayer.value / 100.0;
save.chartEditorOpponentVoiceVolume.value = menubarItemVolumeVocalsOpponent.value / 100.0;
save.chartEditorPlaybackSpeed.value = menubarItemPlaybackSpeed.value / 100.0;
}

public function populateOpenRecentMenu():Void
{

menubarOpenRecent.removeAllComponents();

for (chartPath in previousWorkingFilePaths)
{

menuItemRecentChart.text = chartPath;
menuItemRecentChart.onClick = function(_event)
{
{
{
this.success('Loaded Chart', 'Loaded chart (${chartPath.toString()})');
}
else
{
this.warning('Loaded Chart', 'Loaded chart with issues (${chartPath.toString()})\n${result.join("\n")}');
}
}
else
{
this.error('Failure', 'Failed to load chart (${chartPath.toString()})');
}
}

{
menuItemRecentChart.disabled = true;
}
else
{
menuItemRecentChart.disabled = false;
}

menubarOpenRecent.addComponent(menuItemRecentChart);
}
menubarOpenRecent.hide();
}


function fadeInWelcomeMusic(?extraWait:Float = 0, ?fadeInTime:Float = 5):Void
{
{
stopWelcomeMusic();
}




bgMusicTimer = new FlxTimer().start(extraWait, (_) ->
{
{
this.welcomeMusic.play();
this.welcomeMusic.fadeIn(fadeInTime, 0, 1.0);
}
{
bgMusicTimer.cancel();
bgMusicTimer = null;
}
});
}

function stopWelcomeMusic():Void
{
{
bgMusicTimer.cancel();
bgMusicTimer = null;
}
this.welcomeMusic.pause();
}

function buildDefaultSongData():Void
{
selectedVariation = Constants.DEFAULT_VARIATION;
selectedDifficulty = Constants.DEFAULT_DIFFICULTY;

songMetadata = new Map<String, SongMetadata>();

songChartData = new Map<String, SongChartData>();
}

/**
* Builds and displays the background sprite.
*/
function buildBackground():Void
{
menuBG = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
add(menuBG);

menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
menuBG.updateHitbox();
menuBG.screenCenter();
menuBG.scrollFactor.set(0, 0);
menuBG.zIndex = -100;
}


/**
* Builds and displays the chart editor grid, including the playhead and cursor.
*/
function buildGrid():Void
{

gridTiledSprite = new FlxTiledSprite(gridBitmap, gridBitmap.width, 1000, false, true);
gridTiledSprite.x = GRID_X_POS; // Center the grid.
gridTiledSprite.y = GRID_INITIAL_Y_POS; // Push down to account for the menu bar.
add(gridTiledSprite);
gridTiledSprite.zIndex = 10;

gridGhostNote = new ChartEditorNoteSprite(this, true);
gridGhostNote.alpha = 0.6;
gridGhostNote.noteData = new SongNoteData(0, 0, 0, "", []);
gridGhostNote.visible = false;
add(gridGhostNote);
gridGhostNote.zIndex = 21;

gridGhostHoldNote = new ChartEditorHoldNoteSprite(this);
gridGhostHoldNote.alpha = 0.6;
gridGhostHoldNote.noteData = null;
gridGhostHoldNote.visible = false;
add(gridGhostHoldNote);
gridGhostHoldNote.zIndex = 21;

gridGhostEvent = new ChartEditorEventSprite(this, true);
gridGhostEvent.alpha = 0.6;
gridGhostEvent.eventData = new SongEventData(-1, '', {
});
gridGhostEvent.visible = false;
add(gridGhostEvent);
gridGhostEvent.zIndex = 22;

buildNoteGroup();

add(gridPlayhead);
gridPlayhead.zIndex = 30;

gridPlayhead.setPosition(GRID_X_POS, playheadBaseYPos);
playheadSprite.x = -PLAYHEAD_SCROLL_AREA_WIDTH;
playheadSprite.y = 0;
gridPlayhead.add(playheadSprite);

playheadBlock.x = -PLAYHEAD_SCROLL_AREA_WIDTH;
playheadBlock.y = -PLAYHEAD_HEIGHT / 2;
gridPlayhead.add(playheadBlock);

healthIconDad = new HealthIcon(currentSongMetadata.playData.characters.opponent);
healthIconDad.autoUpdate = false;
healthIconDad.size.set(0.5, 0.5);
add(healthIconDad);
healthIconDad.zIndex = 30;

healthIconBF = new HealthIcon(currentSongMetadata.playData.characters.player);
healthIconBF.autoUpdate = false;
healthIconBF.size.set(0.5, 0.5);
healthIconBF.flipX = true;
add(healthIconBF);
healthIconBF.zIndex = 30;

add(audioWaveforms);
}

function createSubtitles():Void
{
subtitles = new Subtitles(0, 78);
subtitles.zIndex = 100;
subtitles.cameras = [uiCamera];
add(subtitles);
}

function buildMeasureTicks():Void
{
measureTicks = new ChartEditorMeasureTicks(this);
measureTicks.x = gridTiledSprite.x - measureTicksWidth;
measureTicks.zIndex = 20;
add(measureTicks);

handleMeasureTickPosition();
}

function buildNotePreview():Void
{
notePreview = new ChartEditorNotePreview(notePreviewHeight);
notePreview.x = NOTE_PREVIEW_X_POS;
notePreview.y = NOTE_PREVIEW_Y_POS;
add(notePreview);


notePreviewViewport.scrollFactor.set(0, 0);
add(notePreviewViewport);
notePreviewViewport.zIndex = 30;

notePreviewPlayhead = new FlxSprite().makeGraphic(2, 2, 0xFFFF0000);
notePreviewPlayhead.scrollFactor.set(0, 0);
notePreviewPlayhead.scale.set(notePreview.width / 2, 0.5); // Setting width does nothing.
notePreviewPlayhead.updateHitbox();
notePreviewPlayhead.x = notePreview.x;
notePreviewPlayhead.y = notePreview.y;
add(notePreviewPlayhead);
notePreviewPlayhead.zIndex = 31;

setNotePreviewViewportBounds(calculateNotePreviewViewportBounds());
}

function setSelectionBoxBounds(bounds:FlxRect = null):Void
{
throw 'ERROR: Tried to set selection box bounds, but selectionBoxSprite is null! Check ChartEditorThemeHandler.updateTheme().';

{
selectionBoxSprite.visible = false;
selectionBoxSprite.x = -9999;
selectionBoxSprite.y = -9999;
}
else
{
selectionBoxSprite.visible = true;
selectionBoxSprite.x = bounds.x;
selectionBoxSprite.y = bounds.y;
selectionBoxSprite.width = bounds.width;
selectionBoxSprite.height = bounds.height;
}
}

/**
* Automatically goes through and calls render on everything you added.
*/
override public function draw():Void
{
super.draw();
}

function calculateNotePreviewViewportBounds():FlxRect
{


bounds.x = notePreview.x;
bounds.width = notePreview.width;

bounds.y = notePreview.y + (notePreview.height * (scrollPositionInPixels / songLengthInPixels));

bounds.height = notePreview.height * (FlxG.height / songLengthInPixels);

{
bounds.height -= notePreview.y - bounds.y;
bounds.y = notePreview.y;
}
else if (bounds.y + bounds.height > notePreview.y + notePreview.height)
{
bounds.height -= (bounds.y + bounds.height) - (notePreview.y + notePreview.height);
}

{
bounds.y -= MIN_HEIGHT - bounds.height;
bounds.height = MIN_HEIGHT;
}


}

function setNotePreviewViewportBounds(bounds:FlxRect = null):Void
{
{
}

{
notePreviewViewport.visible = false;
notePreviewViewport.x = -9999;
notePreviewViewport.y = -9999;
}
else
{
notePreviewViewport.visible = true;
notePreviewViewport.x = bounds.x;
notePreviewViewport.y = bounds.y;
notePreviewViewport.width = bounds.width;
notePreviewViewport.height = bounds.height;
}
}

function refreshNotePreviewPlayheadPosition():Void
{

notePreviewPlayhead.y = notePreview.y + (notePreview.height * ((scrollPositionInPixels + playheadPositionInPixels) / songLengthInPixels));
}

/**
* Builds the group that will hold all the notes.
*/
function buildNoteGroup():Void
{

renderedHoldNotes.setPosition(gridTiledSprite.x, gridTiledSprite.y);
add(renderedHoldNotes);
renderedHoldNotes.zIndex = 24;

renderedNotes.setPosition(gridTiledSprite.x, gridTiledSprite.y);
add(renderedNotes);
renderedNotes.zIndex = 25;

renderedEvents.setPosition(gridTiledSprite.x, gridTiledSprite.y);
add(renderedEvents);
renderedEvents.zIndex = 25;

renderedSelectionSquares.setPosition(gridTiledSprite.x, gridTiledSprite.y);
add(renderedSelectionSquares);
renderedSelectionSquares.zIndex = 26;
}

function buildAdditionalUI():Void
{
playbarHeadLayout = new ChartEditorPlaybarHead();

playbarHeadLayout.zIndex = 110;
playbarHeadLayout.width = FlxG.width - 8;
playbarHeadLayout.height = 10;
playbarHeadLayout.x = 4;
playbarHeadLayout.y = FlxG.height - 48 - 8;

playbarHeadLayout.playbarHead.allowFocus = false;
playbarHeadLayout.playbarHead.width = FlxG.width;
playbarHeadLayout.playbarHead.height = 10;
playbarHeadLayout.playbarHead.styleString = 'padding-left: 0px; padding-right: 0px; border-left: 0px; border-right: 0px;';
playbarHeadLayout.playbarHead.min = 0;

playbarHeadLayout.playbarHead.onDragStart = function(_:DragEvent)
{
playbarHeadDragging = true;

{
playbarHeadDraggingWasPlaying = true;
stopAudioPlayback();
}
else
{
playbarHeadDraggingWasPlaying = false;
}
}

playbarHeadLayout.playbarHead.onDrag = function(d:DragEvent)
{
{
currentScrollEase = d.value;
easeSongToScrollPosition(currentScrollEase);
}
}

playbarHeadLayout.playbarHead.onDragEnd = function(_:DragEvent)
{
playbarHeadDragging = false;

{
playbarHeadDraggingWasPlaying = false;

startAudioPlayback();
}
}

add(playbarHeadLayout);

txtCopyNotif = new FlxText(0, 0, 0, '', 24);
txtCopyNotif.setBorderStyle(OUTLINE, 0xFF074809, 1);
txtCopyNotif.color = 0xFF52FF77;
txtCopyNotif.zIndex = 120;
add(txtCopyNotif);


this.setupNotifications();

FlxMouseEvent.add(healthIconDad, function(_)
{
{
{
this.setToolboxState(CHART_EDITOR_TOOLBOX_OPPONENT_PREVIEW_LAYOUT, true);
}
else
{
this.openCharacterDropdown(CharacterType.DAD, true);
}
}
});

FlxMouseEvent.add(healthIconBF, function(_)
{
{
{
this.setToolboxState(CHART_EDITOR_TOOLBOX_PLAYER_PREVIEW_LAYOUT, true);
}
else
{
this.openCharacterDropdown(CharacterType.BF, true);
}
}
});

buttonSelectOpponent = new Button();
buttonSelectOpponent.allowFocus = false;
buttonSelectOpponent.text = "Opponent"; // Default text.
buttonSelectOpponent.x = GRID_X_POS;
buttonSelectOpponent.y = GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT;
buttonSelectOpponent.width = GRID_SIZE * 4;
buttonSelectOpponent.height = NOTE_SELECT_BUTTON_HEIGHT;
buttonSelectOpponent.tooltip = "Click to set selection to all notes on this side.\nShift-click to add all notes on this side to selection.";
buttonSelectOpponent.zIndex = 110;
add(buttonSelectOpponent);

buttonSelectOpponent.onClick = (_) ->
{
notesToSelect = SongDataUtils.getNotesInDataRange(notesToSelect, STRUMLINE_SIZE, STRUMLINE_SIZE * 2 - 1);
{
performCommand(new SelectItemsCommand(notesToSelect, []));
}
else
{
performCommand(new SetItemSelectionCommand(notesToSelect, []));
}
}

buttonSelectPlayer = new Button();
buttonSelectPlayer.allowFocus = false;
buttonSelectPlayer.text = "Player"; // Default text.
buttonSelectPlayer.x = buttonSelectOpponent.x + buttonSelectOpponent.width;
buttonSelectPlayer.y = buttonSelectOpponent.y;
buttonSelectPlayer.width = GRID_SIZE * 4;
buttonSelectPlayer.height = NOTE_SELECT_BUTTON_HEIGHT;
buttonSelectPlayer.tooltip = "Click to set selection to all notes on this side.\nShift-click to add all notes on this side to selection.";
buttonSelectPlayer.zIndex = 110;
add(buttonSelectPlayer);

buttonSelectPlayer.onClick = (_) ->
{
notesToSelect = SongDataUtils.getNotesInDataRange(notesToSelect, 0, STRUMLINE_SIZE - 1);
{
performCommand(new SelectItemsCommand(notesToSelect, []));
}
else
{
performCommand(new SetItemSelectionCommand(notesToSelect, []));
}
}

buttonSelectEvent = new Button();
buttonSelectEvent.allowFocus = false;
buttonSelectEvent.icon = Paths.image('ui/chart-editor/events/Default');
buttonSelectEvent.iconPosition = "top";
buttonSelectEvent.x = buttonSelectPlayer.x + buttonSelectPlayer.width;
buttonSelectEvent.y = buttonSelectPlayer.y;
buttonSelectEvent.width = GRID_SIZE;
buttonSelectEvent.height = NOTE_SELECT_BUTTON_HEIGHT;
buttonSelectEvent.tooltip = "Click to set selection to all events.\nShift-click to add all events to selection.";
buttonSelectEvent.zIndex = 110;
add(buttonSelectEvent);

buttonSelectEvent.onClick = (_) ->
{
{
performCommand(new SelectItemsCommand([], currentSongChartEventData));
}
else
{
performCommand(new SetItemSelectionCommand([], currentSongChartEventData));
}
}

buttonSelectDummy = new Button();
buttonSelectDummy.allowFocus = false;
buttonSelectDummy.x = buttonSelectOpponent.x - GRID_SIZE;
buttonSelectDummy.y = buttonSelectEvent.y;
buttonSelectDummy.width = GRID_SIZE;
buttonSelectDummy.height = NOTE_SELECT_BUTTON_HEIGHT;
buttonSelectDummy.zIndex = 110;
add(buttonSelectDummy);
}

/**
* Sets up the onClick listeners for the UI.
*/
function setupUIListeners():Void
{

playbarStart.onClick = _ -> playbarButtonPressed = 'playbarStart';
playbarBack.onClick = _ -> playbarButtonPressed = 'playbarBack';
playbarPlay.onClick = _ -> toggleAudioPlayback();
playbarForward.onClick = _ -> playbarButtonPressed = 'playbarForward';
playbarEnd.onClick = _ -> playbarButtonPressed = 'playbarEnd';

playbarNoteSnap.onRightClick = _ ->
{
noteSnapQuantIndex--;
};
playbarNoteSnap.onClick = _ ->
{
{
noteSnapQuantIndex = BASE_QUANT_INDEX;
}
else
{
noteSnapQuantIndex++;
}
};

playbarBPM.onClick = _ ->
{
{
this.setToolboxState(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT, true);
}
else
{
Conductor.instance.currentTimeChange.bpm += 1;
this.refreshToolbox(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
}
}

playbarBPM.onRightClick = _ ->
{
Conductor.instance.currentTimeChange.bpm -= 1;
this.refreshToolbox(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
}

playbarDifficulty.onClick = _ ->
{
{
this.setToolboxState(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT, true);
}
else
{
incrementDifficulty(-1);
this.refreshToolbox(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);
}
}

playbarDifficulty.onRightClick = _ ->
{
incrementDifficulty(1);
this.refreshToolbox(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);
}


menubarItemNewChart.onClick = _ -> this.openWelcomeDialog(true);
menubarItemOpenChart.onClick = _ -> this.openBrowseFNFC(true);
menubarItemSaveChart.onClick = _ ->
{
{
this.exportAllSongData(true, currentWorkingFilePath);
}
else
{
this.exportAllSongData(false, null);
}
};
menubarItemSaveChartAs.onClick = _ -> this.exportAllSongData(false, null);
menubarItemExit.onClick = _ -> quitChartEditor(true);

menubarItemUndo.onClick = _ -> undoLastCommand();
menubarItemRedo.onClick = _ -> redoLastCommand();
menubarItemCopy.onClick = function(_)
{
copySelection();
};
menubarItemCut.onClick = _ -> performCommand(new CutItemsCommand(currentNoteSelection, currentEventSelection));

menubarItemPaste.onClick = _ ->
{
performCommand(new PasteItemsCommand(targetSnappedMs));
};

menubarItemPasteUnsnapped.onClick = _ ->
{
performCommand(new PasteItemsCommand(targetMs));
};

menubarItemDelete.onClick = _ ->
{
{
performCommand(new RemoveItemsCommand(currentNoteSelection, currentEventSelection));
}
else if (currentNoteSelection.length > 0)
{
performCommand(new RemoveNotesCommand(currentNoteSelection));
}
else if (currentEventSelection.length > 0)
{
performCommand(new RemoveEventsCommand(currentEventSelection));
}
else
{
}
};

menubarItemDeleteStacked.onClick = _ ->
{
{
performCommand(new RemoveEventsCommand(currentEventSelection));
}
else
{
performCommand(new RemoveStackedNotesCommand(currentNoteSelection.length > 0 ? currentNoteSelection : null));
}
};

menubarItemFlipNotes.onClick = _ -> performCommand(new FlipNotesCommand(currentNoteSelection));

menubarItemMirrorX.onClick = _ -> performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
!menubarItemMirrorFlipWithinStrumline.selected, true, false));

menubarItemMirrorY.onClick = _ -> performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
!menubarItemMirrorFlipWithinStrumline.selected, false, true));

menubarItemMirrorXY.onClick = _ -> performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
!menubarItemMirrorFlipWithinStrumline.selected, true, true));

menubarItemSelectAllNotes.onClick = _ -> performCommand(new SelectAllItemsCommand(true, false));

menubarItemSelectAllEvents.onClick = _ -> performCommand(new SelectAllItemsCommand(false, true));

menubarItemSelectInverse.onClick = _ -> performCommand(new InvertSelectedItemsCommand());

menubarItemSelectNone.onClick = _ -> performCommand(new DeselectAllItemsCommand());

menubarItemSelectBeforePlayhead.onClick = _ -> performCommand(new SelectAllItemsBetweenTimeCommand(scrollPositionInMs + playheadPositionInMs, true, true, true));

menubarItemSelectAfterPlayhead.onClick = _ -> performCommand(new SelectAllItemsBetweenTimeCommand(scrollPositionInMs + playheadPositionInMs, false, true, true));

menubarItemPlaytestFull.onClick = _ -> testSongInPlayState(false);
menubarItemPlaytestMinimal.onClick = _ -> testSongInPlayState(true);

menuBarItemNoteSnapDecrease.onClick = _ ->
{
noteSnapQuantIndex--;
};
menuBarItemNoteSnapIncrease.onClick = _ ->
{
noteSnapQuantIndex++;
};

for (snap in REVERSE_SNAPS)
{
menuBarStackedNoteThreshold.dataSource.add({text: '1/$snap'});
}

menuBarStackedNoteThreshold.onChange = event ->
{
stackedNoteThreshold = selectedIdx == -1 ? 0 : BASE_QUANT / REVERSE_SNAPS[selectedIdx];
noteDisplayDirty = true;
notePreviewDirty = true;
}

menuBarItemInputStyleNone.onClick = function(event:UIEvent)
{
currentLiveInputStyle = None;
};
menuBarItemInputStyleNone.selected = currentLiveInputStyle == None;
menuBarItemInputStyleNumberKeys.onClick = function(event:UIEvent)
{
currentLiveInputStyle = NumberKeys;
};
menuBarItemInputStyleNumberKeys.selected = currentLiveInputStyle == NumberKeys;
menuBarItemInputStyleWASD.onClick = function(event:UIEvent)
{
currentLiveInputStyle = WASDKeys;
};
menuBarItemInputStyleWASD.selected = currentLiveInputStyle == WASDKeys;

menubarItemAbout.onClick = _ -> this.openAboutDialog();
menubarItemWelcomeDialog.onClick = _ -> this.openWelcomeDialog(true);

menubarItemGoToBackupsFolder.onClick = _ -> this.openBackupsFolder();
menubarItemGoToBackupsFolder.disabled = true;

menubarItemUserGuide.onClick = _ -> this.openUserGuideDialog();

menubarItemDownscroll.onClick = event -> isViewDownscroll = event.value;
menubarItemDownscroll.selected = isViewDownscroll;

menubarItemViewIndicators.onClick = event -> showNoteKindIndicators = menubarItemViewIndicators.selected;
menubarItemViewIndicators.selected = showNoteKindIndicators;

menubarItemViewSubtitles.onClick = event -> showSubtitles = menubarItemViewSubtitles.selected;
menubarItemViewSubtitles.selected = showSubtitles;

menubarItemViewWaveforms.onClick = event -> audioWaveforms.visible = menubarItemViewWaveforms.selected;
menubarItemViewWaveforms.selected = audioWaveforms.visible;

menubarItemDifficultyUp.onClick = _ -> incrementDifficulty(1);
menubarItemDifficultyDown.onClick = _ -> incrementDifficulty(-1);

menuBarItemThemeLight.onChange = function(event:UIEvent)
{
};
menuBarItemThemeLight.selected = currentTheme == ChartEditorTheme.Light;

menuBarItemThemeDark.onChange = function(event:UIEvent)
{
};
menuBarItemThemeDark.selected = currentTheme == ChartEditorTheme.Dark;

menubarItemPlayPause.onClick = _ -> toggleAudioPlayback();

menubarItemLoadInstrumental.onClick = _ ->
{
dialog.onDialogClosed = function(_)
{
this.isHaxeUIDialogOpen = false;
this.switchToCurrentInstrumental();
this.postLoadInstrumental();
}
};

menubarItemLoadVocals.onClick = _ ->
{
dialog.onDialogClosed = function(_)
{
this.isHaxeUIDialogOpen = false;
this.switchToCurrentInstrumental();
this.postLoadInstrumental();
}
};

menubarItemVolumeMetronome.onChange = event ->
{
metronomeVolume = volume;
menubarLabelVolumeMetronome.text = 'Metronome - ${Std.int(event.value)}%';
};
menubarItemVolumeMetronome.value = Std.int(metronomeVolume * 100);
previousAudioVolumes[0] = Std.int(metronomeVolume * 100);

menubarItemThemeMusic.onChange = event ->
{
shouldPlayWelcomeMusic = event.value;
{
fadeInWelcomeMusic(WELCOME_MUSIC_FADE_IN_DELAY, WELCOME_MUSIC_FADE_IN_DURATION);
}
};
menubarItemThemeMusic.selected = shouldPlayWelcomeMusic;

menubarItemVolumeHitsoundPlayer.onChange = event ->
{
hitsoundVolumePlayer = volume;
menubarLabelVolumeHitsoundPlayer.text = 'Player - ${Std.int(event.value)}%';
};
menubarItemVolumeHitsoundPlayer.value = Std.int(hitsoundVolumePlayer * 100);
previousAudioVolumes[1] = Std.int(hitsoundVolumePlayer * 100);

menubarItemVolumeHitsoundOpponent.onChange = event ->
{
hitsoundVolumeOpponent = volume;
menubarLabelVolumeHitsoundOpponent.text = 'Enemy - ${Std.int(event.value)}%';
};
menubarItemVolumeHitsoundOpponent.value = Std.int(hitsoundVolumeOpponent * 100);
previousAudioVolumes[2] = Std.int(hitsoundVolumeOpponent * 100);

menubarItemVolumeInstrumental.onChange = event ->
{
menubarLabelVolumeInstrumental.text = 'Instrumental - ${Std.int(event.value)}%';
};
previousAudioVolumes[3] = menubarItemVolumeInstrumental.value;

menubarItemVolumeVocalsPlayer.onChange = event ->
{
audioVocalTrackGroup.playerVolume = volume;
menubarLabelVolumeVocalsPlayer.text = 'Player - ${Std.int(event.value)}%';
};
previousAudioVolumes[4] = menubarItemVolumeVocalsPlayer.value;

menubarItemVolumeVocalsOpponent.onChange = event ->
{
audioVocalTrackGroup.opponentVolume = volume;
menubarLabelVolumeVocalsOpponent.text = 'Enemy - ${Std.int(event.value)}%';
};
previousAudioVolumes[5] = menubarItemVolumeVocalsOpponent.value;

menubarItemPlaybackSpeed.onChange = event ->
{
pitch = Math.round(pitch / 0.05) * 0.05; // Round to nearest 5%
pitch = pitch.clamp(0.05, 2.0); // Clamp to 5% to 200%
audioVocalTrackGroup.pitch = pitch;
menubarLabelPlaybackSpeed.text = 'Playback Speed - ${pitchDisplay}x';
}

menubarItemToggleToolboxDifficulty.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT, event.value);
menubarItemToggleToolboxMetadata.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT, event.value);
menubarItemToggleToolboxOffsets.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT, event.value);
menubarItemToggleToolboxNoteData.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_NOTE_DATA_LAYOUT, event.value);
menubarItemToggleToolboxEventData.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_EVENT_DATA_LAYOUT, event.value);
menubarItemToggleToolboxFreeplay.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_FREEPLAY_LAYOUT, event.value);
menubarItemToggleToolboxPlaytestProperties.onChange = event -> this.setToolboxState(CHART_EDITOR_TOOLBOX_PLAYTEST_PROPERTIES_LAYOUT, event.value);
menubarItemToggleToolboxPlayerPreview.onChange = event ->
{
this.setToolboxState(CHART_EDITOR_TOOLBOX_PLAYER_PREVIEW_LAYOUT, event.value);
playerPreviewDirty = event.value;
}
menubarItemToggleToolboxOpponentPreview.onChange = event ->
{
this.setToolboxState(CHART_EDITOR_TOOLBOX_OPPONENT_PREVIEW_LAYOUT, event.value);
opponentPreviewDirty = event.value;
}

}

function copySelection():Void
{
clipboardDirty = true;
clipboardValid = true;

{
{
timeOffset = Std.int(currentEventSelection[0].time);
}
}

SongDataUtils.writeItemsToClipboard({
notes: SongDataUtils.buildNoteClipboard(currentNoteSelection, timeOffset),
events: SongDataUtils.buildEventClipboard(currentEventSelection, timeOffset),
});
}

/**
* Initialize TurboKeyHandlers and add them to the state (so `update()` is called)
* We can then probe `keyHandler.activated` to see if the key combo's action should be taken.
*/
function setupTurboKeyHandlers():Void
{
add(undoKeyHandler);
add(redoKeyHandler);
add(upKeyHandler);
add(downKeyHandler);
add(wKeyHandler);
add(sKeyHandler);
add(pageUpKeyHandler);
add(pageDownKeyHandler);

add(dpadUpGamepadHandler);
add(dpadDownGamepadHandler);
add(dpadLeftGamepadHandler);
add(dpadRightGamepadHandler);
add(leftStickUpGamepadHandler);
add(leftStickDownGamepadHandler);
add(leftStickLeftGamepadHandler);
add(leftStickRightGamepadHandler);
add(rightStickUpGamepadHandler);
add(rightStickDownGamepadHandler);
add(rightStickLeftGamepadHandler);
add(rightStickRightGamepadHandler);
}

/**
* Setup timers and listeners to handle auto-save.
*/
function setupAutoSave():Void
{
WindowUtil.windowExit.add(onWindowClose);

CrashHandler.errorSignal.add(onWindowCrash);
CrashHandler.criticalErrorSignal.add(onWindowCrash);

saveDataDirty = false;
}


/**
* UPDATE FUNCTIONS
*/
function autoSave(?beforePlaytest:Bool = false):Void
{

saveDataDirty = false;

writePreferences(needsAutoSave);

{
this.exportAllSongData(true, null);
{
displayAutosavePopup = true;
}
else
{
displayAutosavePopup = false;
this.infoWithActions('Auto-Save', 'Chart auto-saved to ${absoluteBackupsPath}.', [{
text: "Open In Folder",
callback: openBackupsFolder,
}]);
}
}
}

/**
* Open the backups folder in the file explorer.
* Don't call this on HTML5.
*/
function openBackupsFolder(?_):Bool
{
FileUtil.openFolder(absoluteBackupsPath);
}

/**
* Called when the window was closed, to save a backup of the chart.
* @param exitCode The exit code of the window. We use `-1` when calling the function due to a game crash.
*/
function onWindowClose(exitCode:Int):Void
{


writePreferences(needsAutoSave);

{
this.exportAllSongData(true, null);
}
}

function onWindowCrash(message:String):Void
{



writePreferences(needsAutoSave);

{
this.exportAllSongData(true, null);
}
}

function cleanupAutoSave():Void
{
WindowUtil.windowExit.remove(onWindowClose);
CrashHandler.errorSignal.remove(onWindowCrash);
CrashHandler.criticalErrorSignal.remove(onWindowCrash);
}

public override function update(elapsed:Float):Void
{
{
quitChartEditor();
}

super.update(elapsed);


handleMusicPlayback(elapsed);
handleNoteDisplay();

handleScrollKeybinds();
handleCursor();

{
handleSnap();
handlePlayhead();
handleEditKeybinds();
}

handleMenubar();
handleToolboxes();
handlePlaybar();
handleNotePreview();
handleHealthIcons();
handleWaveforms();

handleFileKeybinds();
handleViewKeybinds();
handleTestKeybinds();
handleHelpKeybinds();
handleAudioKeybinds();

handleQuickWatch();

handlePostUpdate();
}

/**
* Function called when the game window loses focus.
*/
public override function onFocusLost():Void
{
super.onFocusLost();

{
stopAudioPlayback(false);
}
}

/**
* Function called when the game window regains focus.
*/
public override function onFocus():Void
{
super.onFocus();

{
fadeInWelcomeMusic(WELCOME_MUSIC_FADE_IN_DELAY, WELCOME_MUSIC_FADE_IN_DURATION);
}
}

/**
* Beat hit while the song is playing.
*/
override function beatHit():Bool
{

{
playMetronomeTick(currentMeasureTime >= currentStepTime - msTreshold && currentMeasureTime <= currentStepTime + msTreshold);
}


}

/**
* Step hit while the song is playing.
*/
override function stepHit():Bool
{

{
}


}

/**
* UPDATE HANDLERS
*/

/**
* Handle syncronizing the conductor with the music playback.
*/
function handleMusicPlayback(elapsed:Float):Void
{
{
audioInstTrack.update(elapsed);

{
{
audioInstTrack.time = -Conductor.instance.instrumentalOffset;
}
}

&& currentScrollEase != scrollPositionInPixels) easeSongToScrollPosition(currentScrollEase);
}

{
currentScrollEase = scrollPositionInPixels;

{

updateSongTime();
handleMusicPositionUpdate(oldSongPosition, Conductor.instance.songPosition + Conductor.instance.instrumentalOffset);
{
audioVocalTrackGroup.time = audioInstTrack.time;
}

playheadPositionInPixels += diffStepTime * GRID_SIZE;

}
else
{
updateSongTime();
handleMusicPositionUpdate(oldSongPosition, Conductor.instance.songPosition + Conductor.instance.instrumentalOffset);
{
audioVocalTrackGroup.time = audioInstTrack.time;
}

scrollPositionInPixels = (Conductor.instance.currentStepTime + Conductor.instance.instrumentalOffsetSteps) * GRID_SIZE - playheadPositionInPixels;


noteDisplayDirty = true;

setNotePreviewViewportBounds(calculateNotePreviewViewportBounds());
}
}

{
toggleAudioPlayback();
}
}

/**
* Handle using `renderedNotes` to display notes from `currentSongChartNoteData`.
*/
function handleNoteDisplay():Void
{
{
noteDisplayDirty = false;

renderedNotes.flipX = (isViewDownscroll);


for (noteSprite in renderedNotes.members)
{


&& currentSongChartNoteData.fastContains(noteSprite.noteData))
|| isSelectedAndDragged)
{
displayedNoteData.push(noteSprite.noteData);

noteSprite.updateNotePosition(renderedNotes);
}
else
{
noteSprite.kill();
}
}
displayedNoteData.insertionSort(SortUtil.noteDataByTime.bind(FlxSort.ASCENDING));

for (holdNoteSprite in renderedHoldNotes.members)
{


&& (holdNoteSprite.noteData == currentPlaceNoteData // Being dragged, displayed by gridGhostHoldNoteSprite instead.
|| !holdNoteSprite.isHoldNoteVisible(viewAreaBottomPixels, viewAreaTopPixels) // Off-screen.
|| !currentSongChartNoteData.fastContains(holdNoteSprite.noteData) // Deleted.
|| holdNoteSprite.noteData.length == 0 // Also deleted.
))
{
holdNoteSprite.kill();
}
else
{
displayedHoldNoteData.push(holdNoteSprite.noteData);
holdNoteSprite.setHeightDirectly(holdNoteHeight);
holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}
}
displayedHoldNoteData.insertionSort(SortUtil.noteDataByTime.bind(FlxSort.ASCENDING));

for (eventSprite in renderedEvents.members)
{


&& currentSongChartEventData.fastContains(eventSprite.eventData))
|| isSelectedAndDragged)
{
displayedEventData.push(eventSprite.eventData);

eventSprite.updateEventPosition(renderedEvents);
eventSprite.playAnimation(eventSprite.eventData.eventKind);
}
else
{
eventSprite.kill();
}
}
displayedEventData.insertionSort(SortUtil.eventDataByTime.bind(FlxSort.ASCENDING));


for (noteData in currentSongChartNoteData)
{

{
continue;
}

renderedNotes)) continue; // Else, this note is visible and we need to render it!

noteSprite.parentState = this;

noteSprite.noteData = noteData;
noteSprite.noteStyle = NoteKindManager.getNoteStyleId(noteData.kind, currentSongNoteStyle) ?? currentSongNoteStyle;
noteSprite.overrideStepTime = null;
noteSprite.overrideData = null;

noteSprite.updateNotePosition(renderedNotes);

&& noteSprite.noteData.length > 0
&& displayedHoldNoteData.indexOf(noteSprite.noteData) == -1
&& noteSprite.noteData != currentPlaceNoteData)
{


holdNoteSprite.noteData = noteSprite.noteData;
holdNoteSprite.overrideStepTime = null;
holdNoteSprite.overrideData = null;
holdNoteSprite.noteDirection = noteSprite.noteData.getDirection();

holdNoteSprite.setHeightDirectly(noteLengthPixels);

holdNoteSprite.noteStyle = NoteKindManager.getNoteStyleId(noteSprite.noteData.kind, currentSongNoteStyle) ?? currentSongNoteStyle;

holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}
}

for (eventData in currentSongChartEventData)
{



eventSprite.parentState = this;

{
eventData.value = migrateEventEaseDirectionFields(eventData.value);
}

eventSprite.eventData = eventData;
eventSprite.overrideStepTime = null;

eventSprite.x += renderedEvents.x;
eventSprite.y += renderedEvents.y;
eventSprite.updateTooltipPosition();
}

for (noteData in currentSongChartNoteData)
{




{
}


holdNoteSprite.noteData = noteData;
holdNoteSprite.overrideStepTime = null;
holdNoteSprite.overrideData = null;
holdNoteSprite.noteDirection = noteData.getDirection();
holdNoteSprite.setHeightDirectly(noteLengthPixels);

holdNoteSprite.noteStyle = NoteKindManager.getNoteStyleId(noteData.kind, currentSongNoteStyle) ?? currentSongNoteStyle;

holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}

for (member in renderedSelectionSquares.members)
{
member.kill();
}

{
currentOverlappingNotes = SongNoteDataUtils.listStackedNotes(currentSongChartNoteData, stackedNoteThreshold);
}

for (noteSprite in renderedNotes.members)
{

{

{
for (holdNote in renderedHoldNotes.members)
{
}
}

{
noteSprite.overrideStepTime = (stepTime + dragTargetCurrentStep).clamp(0, songLengthInSteps - (1 * noteSnapRatio));
noteSprite.updateNotePosition(renderedNotes);

{
holdNoteSprite.overrideStepTime = noteSprite.overrideStepTime;
holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}
}
else
{
{
noteSprite.overrideStepTime = null;
noteSprite.updateNotePosition(renderedNotes);

{
holdNoteSprite.overrideStepTime = null;
holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}
}
}

{
noteSprite.overrideData = gridColumnToNoteData((noteDataToGridColumn(data) + dragTargetCurrentColumn).clamp(0,
ChartEditorState.STRUMLINE_SIZE * 2 - 1));
noteSprite.updateNotePosition(renderedNotes);

{
holdNoteSprite.overrideData = noteSprite.overrideData;
holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}
}
else
{
{
noteSprite.overrideData = null;
noteSprite.updateNotePosition(renderedNotes);

{
holdNoteSprite.overrideData = null;
holdNoteSprite.noteDirection = noteSprite.noteData.getDirection();
holdNoteSprite.updateHoldNoteGraphic();
holdNoteSprite.updateHoldNotePosition(renderedHoldNotes);
}
}
}


selectionSquare.noteData = noteSprite.noteData;
selectionSquare.eventData = null;
selectionSquare.x = noteSprite.x;
selectionSquare.y = noteSprite.y;
selectionSquare.width = GRID_SIZE;
selectionSquare.color = FlxColor.WHITE;

selectionSquare.height = (stepLength <= 0) ? GRID_SIZE : ((stepLength + 1) * GRID_SIZE);
}
else if (doesNoteStack(noteSprite.noteData, currentOverlappingNotes))
{

selectionSquare.noteData = noteSprite.noteData;
selectionSquare.eventData = null;
selectionSquare.x = noteSprite.x;
selectionSquare.y = noteSprite.y;
selectionSquare.width = selectionSquare.height = GRID_SIZE;
selectionSquare.color = FlxColor.RED;
}

}

for (eventSprite in renderedEvents.members)
{

{
{
eventSprite.overrideStepTime = (stepTime + dragTargetCurrentStep).clamp(0, songLengthInSteps);
eventSprite.updateEventPosition(renderedEvents);
}
else
{
{
eventSprite.overrideStepTime = null;
eventSprite.updateEventPosition(renderedEvents);
}
}


selectionSquare.noteData = null;
selectionSquare.eventData = eventSprite.eventData;
selectionSquare.x = eventSprite.x;
selectionSquare.y = eventSprite.y;
selectionSquare.width = eventSprite.width;
selectionSquare.height = eventSprite.height;
selectionSquare.color = FlxColor.WHITE;
}

}

noteTooltipsDirty = false;

renderedNotes.sort(FlxSort.byY, FlxSort.DESCENDING); // TODO: .group.insertionSort()

renderedEvents.sort(FlxSort.byY, FlxSort.DESCENDING); // TODO: .group.insertionSort()
}
}

/**
* Migrates old event data with ease and without easeDir fields, so we split them into ease and easeDir here.
*/
function migrateEventEaseDirectionFields(eventValues:Dynamic):Dynamic
{
{
eventValues.ease = SongEvent.EASE_TYPE_DIR_REGEX.matchedLeft();
eventValues.easeDir = SongEvent.EASE_TYPE_DIR_REGEX.matched(0);
}
}

/**
* Handle keybinds for scrolling the chart editor grid.
*/
function handleScrollKeybinds():Void
{


{



scrollAmount = ANCHOR_SCROLL_SPEED * verticalDistance;
shouldPause = true;
}

{
scrollAmount = -50 * FlxG.mouse.wheel;
shouldPause = true;
}

{
scrollAmount = -GRID_SIZE * 4;
shouldPause = true;
}
{
scrollAmount = GRID_SIZE * 4;
shouldPause = true;
}

{
scrollAmount = -GRID_SIZE * 4;
shouldPause = true;
}
{
scrollAmount = GRID_SIZE * 4;
shouldPause = true;
}

{
scrollAmount = -GRID_SIZE * noteSnapRatio;
shouldPause = true;
}
{
scrollAmount = GRID_SIZE * noteSnapRatio;
shouldPause = true;
}

{
playheadAmount = -GRID_SIZE * noteSnapRatio;
shouldPause = true;
}
{
playheadAmount = GRID_SIZE * noteSnapRatio;
shouldPause = true;
}

{
currentPositionMeasureFlooredInMs + Conductor.instance.getTypeLengthAtMs(playheadPosition, "step")))
{
targetScrollPosition = Conductor.instance.getMeasureTimeInMs(Math.floor(currentPositionMeasure - 1));
}
else
{
targetScrollPosition = currentPositionMeasureFlooredInMs;
}

targetScrollPosition = Conductor.instance.getTimeInSteps(targetScrollPosition) * GRID_SIZE;
playheadPosition = Conductor.instance.getTimeInSteps(playheadPosition) * GRID_SIZE;

{
playheadAmount = targetScrollPosition - playheadPosition;
}
else
{
scrollAmount = targetScrollPosition - playheadPosition;
}
}

{
funcJumpUp(false);
shouldPause = true;
}
{
funcJumpUp(true);
shouldPause = true;
}
{
playbarButtonPressed = '';
funcJumpUp(false);
shouldPause = true;
}

{

targetScrollPosition = Conductor.instance.getTimeInSteps(targetScrollPosition) * GRID_SIZE;
playheadPosition = Conductor.instance.getTimeInSteps(playheadPosition) * GRID_SIZE;

{
playheadAmount = targetScrollPosition - playheadPosition;
}
else
{
scrollAmount = targetScrollPosition - playheadPosition;
}
}

{
funcJumpDown(false);
shouldPause = true;
}
{
funcJumpDown(true);
shouldPause = true;
}
{
playbarButtonPressed = '';
funcJumpDown(false);
shouldPause = true;
}

{
scrollAmount *= 2;
}
{
scrollAmount /= 4;
}

{
playheadAmount = scrollAmount;
scrollAmount = 0;
shouldPause = false;
}

{
scrollAmount = 0 - this.scrollPositionInPixels;
playheadAmount = 0 - this.playheadPositionInPixels;
shouldPause = true;
}
{
playbarButtonPressed = '';
scrollAmount = 0 - this.scrollPositionInPixels;
playheadAmount = 0 - this.playheadPositionInPixels;
shouldPause = true;
}

{
scrollAmount = this.songLengthInPixels - this.scrollPositionInPixels;
shouldPause = true;
}
{
playbarButtonPressed = '';
scrollAmount = this.songLengthInPixels - this.scrollPositionInPixels;
shouldPause = true;
}

shouldEase = true;
&& (audioInstTrack?.isPlaying || audioVocalTrackGroup.playing)) stopAudioPlayback(); // Only do this once, not every frame


}

/**
* Handle changing the note snapping level.
*/
function handleSnap():Void
{
{
{
noteSnapQuantIndex--;
}

{
noteSnapQuantIndex++;
}
}
}

/**
* Handle display of the mouse cursor.
*/
function handleCursor():Void
{

|| (selectionBoxStartPos != null)
|| (dragTargetNote != null || dragTargetEvent != null);




{

}






{
highlightedNote = renderedNotes.members.find(function(note:ChartEditorNoteSprite):Bool
{
});
}

{
overlapsRenderedNotes = false;
}

{
highlightedEvent = renderedEvents.members.find(function(event:ChartEditorEventSprite):Bool
{
});
}

{
overlapsRenderedEvents = false;
}

{
{
});
}

{
overlapsRenderedHoldNotes = false;
}


&& ((cursorX % 40) < (GRID_SELECTION_BORDER_WIDTH / 2)
|| (cursorX % 40) > (40 - (GRID_SELECTION_BORDER_WIDTH / 2))
|| (cursorY % 40) < (GRID_SELECTION_BORDER_WIDTH / 2) || (cursorY % 40) > (40 - (GRID_SELECTION_BORDER_WIDTH / 2)));



{
});

{
overlapsSelection = true;
}


{
{
scrollAnchorScreenPos = new FlxPoint(FlxG.mouse.x, FlxG.mouse.y);
selectionBoxStartPos = null;
}
else
{
scrollAnchorScreenPos = null;
}
}

{
{
performCommand(new AddNewTimeChangeCommand(currentTimeChangeIndex, scrollPositionInMs + playheadPositionInMs));
this.success('New Time Change', '${undoHistory[undoHistory.length - 1].toString()} ms');
}
}


{
{
scrollAnchorScreenPos = null;
}
else if (measureTicks != null && gridPlayheadScrollArea.containsXY(FlxG.mouse.viewX, FlxG.mouse.viewY) && !isCursorOverHaxeUI)
{
gridPlayheadScrollAreaPressed = true;
{
playbarHeadDraggingWasPlaying = true;
stopAudioPlayback();
}
}
else if (notePreview != null && FlxG.mouse.overlaps(notePreview) && !isCursorOverHaxeUI)
{
notePreviewScrollAreaStartPos = new FlxPoint(FlxG.mouse.viewX, FlxG.mouse.viewY);
}
else if (!isCursorOverHaxeUI && (!overlapsGrid || overlapsSelectionBorder))
{
selectionBoxStartPos = new FlxPoint(FlxG.mouse.viewX, FlxG.mouse.viewY);
targetCursorMode = Crosshair;
}
else if (overlapsSelection)
{
}
}

{
gridPlayheadScrollAreaPressed = false;
{
playbarHeadDraggingWasPlaying = false;
startAudioPlayback();
}
}

{
notePreviewScrollAreaStartPos = null;
notePreviewPlayHeadDragging = false;

{
playbarHeadDraggingWasPlaying = false;
startAudioPlayback();
}
}

{
this.playheadPositionInPixels = FlxG.mouse.viewY - (GRID_INITIAL_Y_POS);
moveSongToScrollPosition();

}



{


{
{


{
{
}
else if (i >= STRUMLINE_SIZE)
{
}
else if (i >= 0)
{
}
else
{
}
});

{
notesToSelect = SongDataUtils.getNotesInTimeRange(notesToSelect, Math.min(cursorMsStart, cursorMs), Math.max(cursorMsStart, cursorMs));
notesToSelect = SongDataUtils.getNotesWithData(notesToSelect, columns);


{
eventsToSelect = currentSongChartEventData;
eventsToSelect = SongDataUtils.getEventsInTimeRange(eventsToSelect, Math.min(cursorMsStart, cursorMs), Math.max(cursorMsStart, cursorMs));
}

{
{
performCommand(new SelectItemsCommand(notesToSelect, eventsToSelect));
}
else
{
performCommand(new SetItemSelectionCommand(notesToSelect, eventsToSelect));
}
}
else
{

{
{
performCommand(new DeselectAllItemsCommand());
}
}
}
}
else
{
}

selectionBoxStartPos = null;
setSelectionBoxBounds();
}
else
{

{
currentScrollEase -= diff * 0.5; // Too fast!
}
else if (FlxG.mouse.viewY > (playbarHeadLayout?.y ?? 0.0))
{
currentScrollEase += (diff * 0.5); // Too fast!
}

selectionRect.x = Math.min(FlxG.mouse.viewX, selectionBoxStartPos.x);
selectionRect.y = Math.min(Math.max(0, selectionBoxStartPos.y), FlxG.mouse.viewY);
selectionRect.width = Math.abs(FlxG.mouse.viewX - selectionBoxStartPos.x);
selectionRect.height = Math.abs(FlxG.mouse.viewY - Math.max(Math.min(FlxG.height, selectionBoxStartPos.y), 0));
setSelectionBoxBounds(selectionRect);

targetCursorMode = Crosshair;
}
}
else if (FlxG.mouse.justReleased)
{
selectionBoxStartPos = null;
setSelectionBoxBounds();

{

{
{
{
performCommand(new DeselectItemsCommand([highlightedNote.noteData], []));
}
else
{
performCommand(new SelectItemsCommand([highlightedNote.noteData], []));
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
performCommand(new DeselectItemsCommand([], [highlightedEvent.eventData]));
}
else
{
performCommand(new SelectItemsCommand([], [highlightedEvent.eventData]));
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
{
performCommand(new DeselectItemsCommand([highlightedHoldNote.noteData], []));
}
else
{
performCommand(new SelectItemsCommand([highlightedHoldNote.noteData], []));
}
}
else
{
}
}
else
{
{
performCommand(new SetItemSelectionCommand([highlightedNote.noteData], []));
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
performCommand(new SetItemSelectionCommand([], [highlightedEvent.eventData]));
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
performCommand(new SetItemSelectionCommand([highlightedHoldNote.noteData], []));
}
else
{
{
performCommand(new DeselectAllItemsCommand());
}
}
}
}
else
{

{
{
performCommand(new DeselectAllItemsCommand());
}
}
}
}
}
else if (notePreviewScrollAreaStartPos != null)
{
notePreviewPlayHeadDragging = true;
{
playbarHeadDraggingWasPlaying = true;
stopAudioPlayback();
}

targetCursorMode = Grabbing;

0, songLengthInPixels);

currentScrollEase = clickedPosInPixels;
easeSongToScrollPosition(currentScrollEase);
}
else if (scrollAnchorScreenPos != null)
{
targetCursorMode = Scroll;
}
else if (dragTargetNote != null || dragTargetEvent != null)
{
{
{
dragDistanceMs = Conductor.instance.getStepTimeInMs(dragTargetNote.noteData.getStepTime() + dragDistanceSteps) - dragTargetNote.noteData.time;
}
else if (dragTargetEvent != null && dragTargetEvent.eventData != null)
{
dragDistanceMs = Conductor.instance.getStepTimeInMs(dragTargetEvent.eventData.getStepTime() + dragDistanceSteps) - dragTargetEvent.eventData.time;
}

{
dragTargetNote = null;
dragTargetEvent = null;
dragTargetCurrentStep = 0;
dragTargetCurrentColumn = 0;
}

{
performCommand(new MoveItemsCommand(currentNoteSelection, currentEventSelection, dragDistanceMs, dragDistanceColumns));
}
else if (currentNoteSelection.length > 0)
{
performCommand(new MoveNotesCommand(currentNoteSelection, dragDistanceMs, dragDistanceColumns));
}
else if (currentEventSelection.length > 0)
{
performCommand(new MoveEventsCommand(currentEventSelection, dragDistanceMs));
}

dragTargetNote = null;
dragTargetEvent = null;

noteDisplayDirty = true;

dragTargetCurrentStep = 0;
dragTargetCurrentColumn = 0;
}
else
{
targetCursorMode = Grabbing;

{
currentScrollEase -= (diff * 0.5);
}
else if (FlxG.mouse.viewY > (playbarHeadLayout?.y ?? 0.0))
{
currentScrollEase += (diff * 0.5);
}

{
stepTime = dragTargetNote.noteData.getStepTime();
}
else if (dragTargetEvent != null && dragTargetEvent.eventData != null)
{
stepTime = dragTargetEvent.eventData.getStepTime();
}
{
data = dragTargetNote.noteData.data;
noteGridPos = noteDataToGridColumn(data);
}
else if (dragTargetEvent != null)
{
data = ChartEditorState.STRUMLINE_SIZE * 2 + 1;
}

{
this.playSound(Paths.sound('chartingSounds/noteLay'));

dragTargetCurrentStep = dragDistanceSteps;
dragTargetCurrentColumn = dragDistanceColumns;

noteDisplayDirty = true;
}
}
}
else if (currentPlaceNoteData != null)
{


{
{
{
this.playStretchySound();

dragLengthCurrent = dragLengthSteps;
}


gridGhostHoldNote.visible = true;
gridGhostHoldNote.noteData = currentPlaceNoteData;
gridGhostHoldNote.noteDirection = currentPlaceNoteData.getDirection();
gridGhostHoldNote.setHeightDirectly(dragLengthPixels, sameHold);
gridGhostHoldNote.noteStyle = NoteKindManager.getNoteStyleId(currentPlaceNoteData.kind, currentSongNoteStyle) ?? currentSongNoteStyle;
gridGhostHoldNote.updateHoldNotePosition(renderedHoldNotes);
gridGhostHoldNote.updateHoldNoteGraphic();
}
else
{
gridGhostHoldNote.visible = false;
gridGhostHoldNote.setHeightDirectly(0);
}
}

{
{
this.playSound(Paths.sound('chartingSounds/stretchSNAP_UI'));
performCommand(new ExtendNoteLengthCommand(currentPlaceNoteData, dragLengthMs));
}
else
{
{
this.playSound(Paths.sound('chartingSounds/stretchSNAP_UI'));
performCommand(new ExtendNoteLengthCommand(currentPlaceNoteData, 0));
}
}

currentPlaceNoteData = null;
}
else
{
}
}
else
{
{
{

{
{
{
performCommand(new DeselectItemsCommand([highlightedNote.noteData], []));
}
else
{
performCommand(new SelectItemsCommand([highlightedNote.noteData], []));
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
performCommand(new DeselectItemsCommand([], [highlightedEvent.eventData]));
}
else
{
performCommand(new SelectItemsCommand([], [highlightedEvent.eventData]));
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
{
performCommand(new DeselectItemsCommand([highlightedHoldNote.noteData], []));
}
else
{
performCommand(new SelectItemsCommand([highlightedHoldNote.noteData], []));
}
}
else
{
}
}
else
{
{
{
dragTargetNote = highlightedNote;
}
else
{
performCommand(new SetItemSelectionCommand([highlightedNote.noteData], []));
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
dragTargetEvent = highlightedEvent;
}
else
{
performCommand(new SetItemSelectionCommand([], [highlightedEvent.eventData]));
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
currentPlaceNoteData = highlightedHoldNote.noteData;
}
else
{

{

performCommand(new AddEventsCommand([newEventData], pressingControl()));
}
else
{
ChartEditorState.cloneNoteParams(noteParamsToPlace));

performCommand(new AddNotesCommand([newNoteData], pressingControl()));

currentPlaceNoteData = newNoteData;
}
}
}
}
else
{
}
}

|| (FlxG.mouse.pressedRight && (FlxG.mouse.deltaX > 0 || FlxG.mouse.deltaY > 0));
{

{
{
|| (isHighlightedNoteSelected && currentNoteSelection.length == 1);
{
else
this.openNoteContextMenu(FlxG.mouse.viewX, FlxG.mouse.viewY, highlightedNote.noteData);
}
else
{
this.openSelectionContextMenu(FlxG.mouse.viewX, FlxG.mouse.viewY);
}
}
else
{
performCommand(new RemoveNotesCommand([highlightedNote.noteData]));
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
|| (isHighlightedEventSelected && currentEventSelection.length == 1);
{
this.openEventContextMenu(FlxG.mouse.viewX, FlxG.mouse.viewY, highlightedEvent.eventData);
}
else
{
this.openSelectionContextMenu(FlxG.mouse.viewX, FlxG.mouse.viewY);
}
}
else
{
performCommand(new RemoveEventsCommand([highlightedEvent.eventData]));
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
{
|| (isHighlightedNoteSelected && currentNoteSelection.length == 1);
{
this.openHoldNoteContextMenu(FlxG.mouse.viewX, FlxG.mouse.viewY, highlightedHoldNote.noteData);
}
else
{
this.openSelectionContextMenu(FlxG.mouse.viewX, FlxG.mouse.viewY);
}
}
else
{
this.playSound(Paths.sound('chartingSounds/stretchSNAP_UI'));
performCommand(new ExtendNoteLengthCommand(highlightedHoldNote.noteData, 0));
}
}
else
{
}
}

|| overlapsRenderedEvents;
{

{



{
eventData.eventKind = eventKindToPlace;
}
eventData.time = cursorSnappedMs;

gridGhostEvent.visible = true;
gridGhostEvent.eventData = eventData;
gridGhostEvent.updateEventPosition(renderedEvents);

targetCursorMode = Cell;
}
else
{


ChartEditorState.cloneNoteParams(noteParamsToPlace));

{
noteData.kind = noteKindToPlace;
noteData.params = noteParamsToPlace;
noteData.data = cursorColumn;
gridGhostNote.noteStyle = NoteKindManager.getNoteStyleId(noteData.kind, currentSongNoteStyle) ?? currentSongNoteStyle;
gridGhostNote.playNoteAnimation();
}
noteData.time = cursorSnappedMs;

gridGhostNote.visible = true;
gridGhostNote.noteData = noteData;
gridGhostNote.updateNotePosition(renderedNotes);

targetCursorMode = Cell;
}
}
else
{
}
}

{
{
{
targetCursorMode = Grabbing;
}
{
targetCursorMode = Crosshair;
}
}
else
{
{
{
targetCursorMode = Pointer;
}
else if (measureTicks != null && FlxG.mouse.overlaps(measureTicks))
{
targetCursorMode = Pointer;
}
else if (overlapsSelection)
{
targetCursorMode = Pointer;
}
else if (overlapsSelectionBorder)
{
targetCursorMode = Crosshair;
}
else if (overlapsRenderedNotes)
{
targetCursorMode = Pointer;
}
else if (overlapsRenderedHoldNotes)
{
targetCursorMode = Pointer;
}
else if (overlapsRenderedEvents)
{
targetCursorMode = Pointer;
}
else if (overlapsGrid)
{
targetCursorMode = Cell;
}
else if (overlapsHealthIcons)
{
targetCursorMode = Pointer;
}
}
}
}

Cursor.cursorMode = targetCursorMode ?? Default;
}

function handleToolboxes():Void
{
handleDifficultyToolbox();
handlePlayerPreviewToolbox();
handleOpponentPreviewToolbox();
}

function handleDifficultyToolbox():Void
{
{
difficultySelectDirty = false;



difficultyToolbox.updateTree();
}
}

function handlePlayerPreviewToolbox():Void
{
{
playerPreviewDirty = false;

{
{
healthIconBF.characterId = currentSongMetadata.playData.characters.player;
}

charPlayer.loadCharacter(currentSongMetadata.playData.characters.player);
charPlayer.characterType = CharacterType.BF;
charPlayer.flip = true;
charPlayer.targetScale = 0.5;

charPreviewToolbox.title = 'Player Preview - ${charPlayer.charName}';
charPreviewToolbox.invalidateComponentLayout();
}
}

{
charPreviewToolbox.width = charPlayer.width + 32;
charPreviewToolbox.height = charPlayer.height + 64;
}
currentPlayerCharacterPlayer = charPlayer;
}

function handleOpponentPreviewToolbox():Void
{


{
opponentPreviewDirty = false;

{
{
healthIconDad.characterId = currentSongMetadata.playData.characters.opponent;
}

charPlayer.loadCharacter(currentSongMetadata.playData.characters.opponent);
charPlayer.characterType = CharacterType.DAD;
charPlayer.flip = false;
charPlayer.targetScale = 0.5;

charPreviewToolbox.title = 'Opponent Preview - ${charPlayer.charName}';
charPreviewToolbox.invalidateComponentLayout();
}
}

{
charPreviewToolbox.width = charPlayer.width + 32;
charPreviewToolbox.height = charPlayer.height + 64;
}
currentOpponentCharacterPlayer = charPlayer;
}

function handleSelectionButtons():Void
{
buttonSelectOpponent.y = GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT - 2;
buttonSelectPlayer.y = GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT - 2;
buttonSelectEvent.y = GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT - 2;
}

/**
* Handles display elements for the playbar at the bottom.
*/
function handlePlaybar():Void
{


playbarHeadLayout.playbarHead.pos = currentScrollEase;

playbarHeadLayout.playbarHead.max = songLengthInPixels;

playbarHeadLayout.x = 4;
playbarHeadLayout.y = FlxG.height - 48 - 8;





playbarBeatNum.text = 'Beat: ${FlxStringUtil.formatMoney(Conductor.instance.currentBeatTime)}';
playbarStepNum.text = 'Step: ${Conductor.instance.currentStep}';

playbarNoteSnap.text = '1/${noteSnapQuant}';
playbarDifficulty.text = difftext;
playbarBPM.text = 'BPM: ${(Conductor.instance.bpm ?? 0.0)}${Conductor.instance.timeSignatureNumerator != Constants.DEFAULT_TIME_SIGNATURE_NUM
|| Conductor.instance.timeSignatureDenominator != Constants.DEFAULT_TIME_SIGNATURE_DEN ? ' (${Conductor.instance.timeSignatureNumerator}/${Conductor.instance.timeSignatureDenominator})' : ''}';
}

function handlePlayhead():Void
{
for (note => key in LIVE_INPUT_KEYS[currentLiveInputStyle])
{
else if (FlxG.keys.checkStatus(key, JUST_RELEASED)) finishPlaceNoteAtPlayhead(note);
}


updatePlayheadGhostHoldNotes();
}

function placeNoteAtPlayhead(column:Int):Void
{


playheadSnappedMs + Conductor.instance.getTypeLengthAtMs(playheadSnappedMs, "step") * noteSnapRatio);
notesAtPos = SongDataUtils.getNotesWithData(notesAtPos, [column]);

{
performCommand(new AddNotesCommand([newNoteData], pressingControl()));
currentLiveInputPlaceNoteData[column] = newNoteData;
}
else if (removeNoteInstead)
{
performCommand(new RemoveNotesCommand(notesAtPos));
}
else
{
}
}

function placeEventAtPlayhead(isOpponent:Bool):Void
{


playheadSnappedMs + Conductor.instance.getTypeLengthAtMs(playheadSnappedMs, "step") * noteSnapRatio);
eventsAtPos = SongDataUtils.getEventsWithKind(eventsAtPos, ['FocusCamera']);

{
char: isOpponent ? 1 : 0,
});
performCommand(new AddEventsCommand([newEventData], pressingControl()));
}
else if (removeEventInstead)
{
performCommand(new RemoveEventsCommand(eventsAtPos));
}
else
{
}
}

function updatePlayheadGhostHoldNotes():Void
{
{
ghost.alpha = 0.6;
ghost.noteData = null;
ghost.visible = false;
ghost.zIndex = 21;
add(ghost); // Don't add to `renderedHoldNotes` because then it will get killed every frame.

gridPlayheadGhostHoldNotes.push(ghost);
refresh();
}

for (column in 0...gridPlayheadGhostHoldNotes.length)
{

{
ghostHold.noteData = null;
}

{
ghostHold.noteData = targetNoteData.clone();
ghostHold.noteDirection = ghostHold.noteData.getDirection();
ghostHold.visible = true;
ghostHold.alpha = 0.6;
ghostHold.setHeightDirectly(0);
ghostHold.noteStyle = NoteKindManager.getNoteStyleId(ghostHold.noteData.kind, currentSongNoteStyle) ?? currentSongNoteStyle;
ghostHold.updateHoldNotePosition(renderedHoldNotes);
}

{
ghostHold.visible = false;
ghostHold.setHeightDirectly(0);
playheadDragLengthCurrent[column] = 0;
continue;
}



{
ghostHold.noteData.length = newNoteLength;

{
this.playStretchySound();
playheadDragLengthCurrent[column] = targetNoteLengthStepsInt;
}
ghostHold.visible = true;
ghostHold.alpha = 0.6;
ghostHold.setHeightDirectly(targetNoteLengthPixels, true);
ghostHold.updateHoldNotePosition(renderedHoldNotes);
}
else
{
ghostHold.visible = false;
ghostHold.setHeightDirectly(0);
playheadDragLengthCurrent[column] = 0;
continue;
}
}
}

function finishPlaceNoteAtPlayhead(column:Int):Void
{



{
currentLiveInputPlaceNoteData[column] = null;
gridPlayheadGhostHoldNotes[column].noteData = null;
}
else
{
this.playSound(Paths.sound('chartingSounds/stretchSNAP_UI'));
performCommand(new ExtendNoteLengthCommand(currentLiveInputPlaceNoteData[column], newNoteLength));
currentLiveInputPlaceNoteData[column] = null;
gridPlayheadGhostHoldNotes[column].noteData = null;
}
}

/**
* Handle aligning the health icons next to the grid.
*/

function handleHealthIcons():Void
{
{
_charIconData = currentPlayerCharacterPlayer?.character?._data ?? CharacterDataParser.fetchCharacterData(currentSongMetadata.playData.characters.player);

{
healthIconBF.configure(_charIconData?.healthIcon);
healthIconBF.size *= 0.5; // Make the icon smaller in Chart Editor.
healthIconBF.flipX = !healthIconBF.flipX; // BF faces the other way.
}

{
buttonSelectPlayer.text = _charIconData?.name ?? 'Player';
}

_charIconData = currentOpponentCharacterPlayer?.character?._data ?? CharacterDataParser.fetchCharacterData(currentSongMetadata.playData.characters.opponent);

{
healthIconDad.configure(_charIconData?.healthIcon);
healthIconDad.size *= 0.5; // Make the icon smaller in Chart Editor.
}
{
buttonSelectOpponent.text = _charIconData?.name ?? 'Opponent';
}
waveformsDirty = true;
healthIconsDirty = false;
_charIconData = null;
}

{
healthIconBF.x = (gridTiledSprite == null) ? (0) : (gridTiledSprite.x + gridTiledSprite.width);
healthIconBF.y = (gridTiledSprite == null) ? (0) : (GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT + 8) + yOffset;
}

{
healthIconDad.x = (gridTiledSprite == null) ? (0) : (measureTicks.x - healthIconDad.width);
healthIconDad.y = (gridTiledSprite == null) ? (0) : (GRID_INITIAL_Y_POS - NOTE_SELECT_BUTTON_HEIGHT + 8) + yOffset;
}
}

/**
* Handle waveforms aligning based on the health icons position.
*/
function handleWaveforms()
{

for (waveform in audioWaveforms.members)
{
waveform.x = switch (waveform.iconId)
{
case BF: healthIconBF != null ? healthIconBF.x : 840 + FullScreenScaleMode.gameCutoutSize.x * 0.5;
case DAD: healthIconDad != null ? healthIconDad.x : 360 + FullScreenScaleMode.gameCutoutSize.x * 0.5;
default: 0;
}
}

waveformsDirty = false;
}

/**
* Handle keybinds for File menu items.
*/
function handleFileKeybinds():Void
{
&& FlxG.keys.justPressed.N
&& !isHaxeUIDialogOpen
&& !FlxG.keys.pressed.SHIFT
&& !FlxG.keys.pressed.ALT)
{
this.openWelcomeDialog(true);
}

{
this.openBrowseFNFC(true);
}

{
{
this.exportAllSongData(false, null, function(path:String)
{
this.success('Saved Chart', 'Chart saved successfully to ${path}.');
}, function()
{
});
}
else
{
this.exportAllSongData(true, currentWorkingFilePath);
this.success('Saved Chart', 'Chart saved successfully to ${currentWorkingFilePath}.');
}
}

{
quitChartEditor(true);
}
}

function quitChartEditor(exitPrompt:Bool = false):Void
{
{
this.openLeaveConfirmationDialog();
}

autoSave();

this.hideAllToolboxes();

stopWelcomeMusic();

resetWindowTitle();

criticalFailure = true;
}

/**
* Handle keybinds for edit menu items.
*/
function handleEditKeybinds():Void
{
{
undoLastCommand();
}

{
redoLastCommand();
}

{
performCommand(new CopyItemsCommand(currentNoteSelection, currentEventSelection));
}

{
performCommand(new CutItemsCommand(currentNoteSelection, currentEventSelection));
}

{
{
scrollPositionInMs + playheadPositionInMs;
}
else
{
targetSnappedMs;
}
performCommand(new PasteItemsCommand(targetMs));
}


delete = delete || FlxG.keys.justPressed.BACKSPACE;

{

{
{
performCommand(new RemoveEventsCommand(currentEventSelection));
}
else
{
performCommand(new RemoveStackedNotesCommand(noteSelection ? currentNoteSelection : null));
}
}
else
{
{
performCommand(new RemoveItemsCommand(currentNoteSelection, currentEventSelection));
}
else if (noteSelection)
{
performCommand(new RemoveNotesCommand(currentNoteSelection));
}
else if (eventSelection)
{
performCommand(new RemoveEventsCommand(currentEventSelection));
}
}
}

{
performCommand(new FlipNotesCommand(currentNoteSelection));
}

{
performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
!menubarItemMirrorFlipWithinStrumline.selected, true, true));
}

{
performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
!menubarItemMirrorFlipWithinStrumline.selected, true, false));
}

{
performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
!menubarItemMirrorFlipWithinStrumline.selected, false, true));
}

{
{
{
performCommand(new SelectItemsCommand([], currentSongChartEventData));
}
else
{
performCommand(new SelectAllItemsCommand(false, true));
}
}
else
{
{
performCommand(new SelectItemsCommand(currentSongChartNoteData, []));
}
else
{
performCommand(new SelectAllItemsCommand(true, false));
}
}
}

{
performCommand(new InvertSelectedItemsCommand());
}

{
performCommand(new DeselectAllItemsCommand());
}

{
performCommand(new DeselectAllItemsBetweenTimeCommand(scrollPositionInMs + playheadPositionInMs, true, true, true));
else
performCommand(new SelectAllItemsBetweenTimeCommand(scrollPositionInMs + playheadPositionInMs, true, true, true));
}

{
performCommand(new DeselectAllItemsBetweenTimeCommand(scrollPositionInMs + playheadPositionInMs, false, true, true));
else
performCommand(new SelectAllItemsBetweenTimeCommand(scrollPositionInMs + playheadPositionInMs, false, true, true));
}
}

/**
* Handle keybinds for View menu items.
*/
function handleViewKeybinds():Void
{
{
{
incrementDifficulty(-1);
}
{
incrementDifficulty(1);
}
}
else
{
}
}

/**
* Small helper for MacOS, "WINDOWS" is keycode 15, which maps to "COMMAND" on Mac, which is more often used than "CONTROL"
* Everywhere else, it just returns `FlxG.keys.pressed.CONTROL`
* @return Bool
*/
function pressingControl():Bool
{
}

/**
* Handle keybinds for the Test menu items.
*/
function handleTestKeybinds():Void
{
{
this.hideAllToolboxes();
testSongInPlayState(minimal);
}
}

/**
* Handle keybinds for Help menu items.
*/
function handleHelpKeybinds():Void
{
{
this.openUserGuideDialog();
}
}

/**
* Handle keybinds for audio playback.
*/
function handleAudioKeybinds():Void
{
{
previousAudioVolumes[0] = menubarItemVolumeMetronome.value;
menubarItemVolumeMetronome.value = (menubarItemVolumeMetronome.value == 0) ? (oldValue > menubarItemVolumeMetronome.value) ? oldValue : 100 : 0;
}
{
previousAudioVolumes[1] = menubarItemVolumeHitsoundPlayer.value;
previousAudioVolumes[2] = menubarItemVolumeHitsoundOpponent.value;
{
{
menubarItemVolumeHitsoundPlayer.value = (oldBFValue > menubarItemVolumeHitsoundPlayer.value) ? oldBFValue : 100;
menubarItemVolumeHitsoundOpponent.value = (oldDadValue > menubarItemVolumeHitsoundOpponent.value) ? oldDadValue : 100;
}
else
{
menubarItemVolumeHitsoundPlayer.value = 0;
menubarItemVolumeHitsoundOpponent.value = 0;
}
}
else
{
menubarItemVolumeHitsoundPlayer.value = (oldBFValue > menubarItemVolumeHitsoundPlayer.value) ? oldBFValue : 100;
menubarItemVolumeHitsoundOpponent.value = (oldDadValue > menubarItemVolumeHitsoundOpponent.value) ? oldDadValue : 100;
}
}
{
previousAudioVolumes[3] = menubarItemVolumeInstrumental.value;
menubarItemVolumeInstrumental.value = (menubarItemVolumeInstrumental.value == 0) ? (oldValue > menubarItemVolumeInstrumental.value) ? oldValue : 100 : 0;
}
{
previousAudioVolumes[4] = menubarItemVolumeVocalsPlayer.value;
menubarItemVolumeVocalsPlayer.value = (menubarItemVolumeVocalsPlayer.value == 0) ? (oldValue > menubarItemVolumeVocalsPlayer.value) ? oldValue : 100 : 0;
oldValue = previousAudioVolumes[5];
previousAudioVolumes[5] = menubarItemVolumeVocalsOpponent.value;
menubarItemVolumeVocalsOpponent.value = (menubarItemVolumeVocalsOpponent.value == 0) ? (oldValue > menubarItemVolumeVocalsOpponent.value) ? oldValue : 100 : 0;
}
{
previousAudioVolumes[4] = menubarItemVolumeVocalsPlayer.value;
menubarItemVolumeVocalsPlayer.value = (menubarItemVolumeVocalsPlayer.value == 0) ? (oldValue > menubarItemVolumeVocalsPlayer.value) ? oldValue : 100 : 0;
}
{
previousAudioVolumes[5] = menubarItemVolumeVocalsOpponent.value;
menubarItemVolumeVocalsOpponent.value = (menubarItemVolumeVocalsOpponent.value == 0) ? (oldValue > menubarItemVolumeVocalsOpponent.value) ? oldValue : 100 : 0;
}
}

function handleQuickWatch():Void
{




}

function handlePostUpdate():Void
{
wasCursorOverHaxeUI = isCursorOverHaxeUI;
}

/**
* PLAYTEST FUNCTIONS
*/

/**
* Transitions to the Play State to test the song
*/
function testSongInPlayState(minimal:Bool = false):Void
{
autoSave(true);

cast(this.getToolbox(CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT), ChartEditorOffsetsToolbox)?.pauseAudioPreview();

stopAudioPlayback(false);


playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%

try
{
targetSong = Song.buildRaw(currentSongId, songMetadata.values(), selectedVariation, songChartData, playtestSongScripts, false);
}
catch (e)
{
this.error('Could Not Playtest', 'Got an error trying to playtest the song.\n${e}');
}

PlayStatePlaylist.reset();

switch (currentSongStage)
{
case 'mainStage' | 'mainStageErect':
PlayStatePlaylist.campaignId = 'week1';
case 'spookyMansion' | 'spookyMansionErect':
PlayStatePlaylist.campaignId = 'week2';
case 'phillyTrain' | 'phillyTrainErect':
PlayStatePlaylist.campaignId = 'week3';
case 'limoRide' | 'limoRideErect':
PlayStatePlaylist.campaignId = 'week4';
case 'mallXmas' | 'mallXmasErect' | 'mallEvil':
PlayStatePlaylist.campaignId = 'week5';
case 'school' | 'schoolEvil':
PlayStatePlaylist.campaignId = 'week6';
case 'tankmanBattlefield':
PlayStatePlaylist.campaignId = 'week7';
case 'phillyStreets' | 'phillyStreetsErect' | 'phillyBlazin' | 'phillyBlazin2':
PlayStatePlaylist.campaignId = 'weekend1';
}
Paths.setCurrentLevel(PlayStatePlaylist.campaignId);

subStateClosed.add(reviveUICamera);
subStateClosed.add(resetConductorAfterTest);

FlxTransitionableState.skipNextTransIn = false;
FlxTransitionableState.skipNextTransOut = false;

targetSong: targetSong,
targetDifficulty: selectedDifficulty,
targetVariation: selectedVariation,
practiceMode: playtestPracticeMode,
botPlayMode: playtestBotPlayMode,
playtestResults: playtestShowResults,
minimalMode: minimal,
startTimestamp: startTimestamp,
playbackRate: playbackRate,
overrideMusic: true,
};

{
}

uiCamera.kill();

this.persistentUpdate = false;
this.persistentDraw = false;

Cursor.hide();

LoadingState.loadPlayState(targetStateParams, false, true, function(targetState)
{
{
targetState.instrumentalVolume = (menubarItemVolumeInstrumental.value / 100.0) ?? 1.0;
targetState.playerVocalsVolume = (menubarItemVolumeVocalsPlayer.value / 100.0) ?? 1.0;
targetState.opponentVocalsVolume = (menubarItemVolumeVocalsOpponent.value / 100.0) ?? 1.0;
}

targetState.vocals = audioVocalTrackGroup;
});
}

/**
* COMMAND FUNCTIONS
*/

/**
* Perform (or redo) a command, then add it to the undo stack.
*
* @param command The command to perform.
* @param purgeRedoStack If `true`, the redo stack will be cleared after performing the command.
*/
function performCommand(command:ChartEditorCommand, purgeRedoStack:Bool = true):Void
{
command.execute(this);
{
undoHistory.push(command);
commandHistoryDirty = true;
}
}

/**
* Undo a command, then add it to the redo stack.
* @param command The command to undo.
*/
function undoCommand(command:ChartEditorCommand):Void
{
command.undo(this);
redoHistory.push(command);
commandHistoryDirty = true;
}

/**
* Undo the last command in the undo stack, then add it to the redo stack.
*/
function undoLastCommand():Void
{
{
}
undoCommand(command);
}

/**
* Redo the last command in the redo stack, then add it to the undo stack.
*/
function redoLastCommand():Void
{
{
}
performCommand(command, false);
}

/**
* GRAPHICS FUNCTIONS
*/

/**
* This is for the smaller green squares that appear over each note when you select them.
*/
function buildSelectionSquare():ChartEditorSelectionSquareSprite
{
throw "ERROR: Tried to build selection square, but selectionSquareBitmap is null! Check ChartEditorThemeHandler.updateSelectionSquare()";

result.loadGraphic(selectionSquareBitmap);
}

/**
* Revive the UI camera and re-establish it as the main camera so UI elements depending on it don't explode.
*/
function reviveUICamera(_:FlxSubState = null):Void
{
uiCamera.revive();
uiCamera.onResize();

add(this.root);
}

/**
* AUDIO FUNCTIONS
*/

function startAudioPlayback():Void
{

cast(this.getToolbox(CHART_EDITOR_TOOLBOX_OFFSETS_LAYOUT), ChartEditorOffsetsToolbox)?.pauseAudioPreview();
stopWelcomeMusic();
audioVocalTrackGroup.play(false, audioInstTrack.time);

playbarPlay.text = '||'; // Pause
}

/**
* Play the metronome tick sound.
* @param high Whether to play the full beat sound rather than the quarter beat sound.
*/
function playMetronomeTick(high:Bool = false):Void
{
this.playSound(Paths.sound('chartingSounds/metronome${high ? '1' : '2'}'), metronomeVolume);
}

function switchToCurrentInstrumental():Void
{
this.switchToInstrumental(currentInstrumentalId, currentSongMetadata.playData.characters.player, currentSongMetadata.playData.characters.opponent);
}

public function updateGridHeight():Void
{

{
gridTiledSprite.height = songLengthInPixels;
measureTicks.setHeight(gridTiledSprite.height);
}

currentSongChartNoteData = SongDataUtils.clampSongNoteData(currentSongChartNoteData, 0.0, songCutoffPointMs);
currentSongChartEventData = SongDataUtils.clampSongEventData(currentSongChartEventData, 0.0, songCutoffPointMs);

scrollPositionInPixels = 0;
playheadPositionInPixels = 0;
notePreviewDirty = true;
notePreviewViewportBoundsDirty = true;
noteDisplayDirty = true;
moveSongToScrollPosition();
}

/**
* CHART DATA FUNCTIONS
*/

function sortChartData():Void
{
currentSongChartNoteData.sort(function(a:SongNoteData, b:SongNoteData):Int
{
});

currentSongChartEventData.sort(function(a:SongEventData, b:SongEventData):Int
{
});
}

function isEventSelected(event:Null<SongEventData>):Bool
{
}

function createDifficulty(variation:String, difficulty:String, scrollSpeed:Float = 1.0):Void
{


{
resultChartData = new SongChartData([difficulty => scrollSpeed], [], [difficulty => []]);
songChartData.set(variation, resultChartData);
}
else
{
resultChartData.scrollSpeed.set(difficulty, scrollSpeed);
resultChartData.notes.set(difficulty, []);
}

difficultySelectDirty = true; // Force the Difficulty toolbox to update.
}

function cloneDifficulty(variation:String, difficulty:String, newVariation:String, newDifficulty:String, scrollSpeed:Float = 1.0):Void
{

{
createDifficulty(newVariation, newDifficulty, scrollSpeed);
};

{
createDifficulty(newVariation, newDifficulty, scrollSpeed);
};


newVariationMetadata.playData.difficulties.push(newDifficulty);

{
newChartData = new SongChartData([newDifficulty => scrollSpeed], [], [newDifficulty => newNoteData]);
songChartData.set(newVariation, newChartData);
}
else
{
newChartData.scrollSpeed.set(newDifficulty, scrollSpeed);
newChartData.notes.set(newDifficulty, newNoteData);
}

difficultySelectDirty = true; // Force the Difficulty toolbox to update.
}

function removeDifficulty(variation:String, difficulty:String):Void
{


{
resultChartData.scrollSpeed.remove(difficulty);
resultChartData.notes.remove(difficulty);
}

{
{
songMetadata.remove(variation);
songChartData.remove(variation);
}

{
}
}

|| !variationMetadata.playData.difficulties.contains(selectedDifficulty)) selectedDifficulty = variationMetadata.playData.difficulties[0];

refreshPlayDataVariations();
difficultySelectDirty = true; // Force the Difficulty toolbox to update.
}

function incrementDifficulty(change:Int):Void
{

{
}




{
}

{
}

{

{

performCommand(new SwitchDifficultyCommand(selectedDifficulty, prevDifficulty, selectedVariation, prevVariation));

Conductor.instance.mapTimeChanges(this.currentSongMetadata.timeChanges);
updateTimeSignature();

this.refreshToolbox(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
this.refreshToolbox(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);
}
else
{
performCommand(new SwitchDifficultyCommand(selectedDifficulty, prevDifficulty, selectedVariation, selectedVariation));

this.refreshToolbox(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
this.refreshToolbox(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);
}
}
else
{

{

performCommand(new SwitchDifficultyCommand(selectedDifficulty, nextDifficulty, selectedVariation, nextVariation));

this.refreshToolbox(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
this.refreshToolbox(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);
}
else
{
performCommand(new SwitchDifficultyCommand(selectedDifficulty, nextDifficulty, selectedVariation, selectedVariation));

this.refreshToolbox(CHART_EDITOR_TOOLBOX_DIFFICULTY_LAYOUT);
this.refreshToolbox(CHART_EDITOR_TOOLBOX_METADATA_LAYOUT);
}
}

}

/**
* SCROLLING FUNCTIONS
*/

/**
* When setting the scroll position, except when automatically scrolling during song playback,
* we need to update the conductor's current step time and the timestamp of the audio tracks.
*/
function moveSongToScrollPosition():Void
{
{
audioInstTrack.time = scrollPositionInMs + playheadPositionInMs - Conductor.instance.instrumentalOffset;
updateSongTime();
audioVocalTrackGroup.time = audioInstTrack.time;
}

noteDisplayDirty = true;
}

/**
* Smoothly ease the song to a new scroll position over a duration.
* @param targetScrollPosition The desired value for the `scrollPositionInPixels`.
*/
function easeSongToScrollPosition(targetScrollPosition:Float):Void
{
currentScrollEase = Math.max(0, targetScrollPosition);
currentScrollEase = Math.min(currentScrollEase, songLengthInPixels);
scrollPositionInPixels = MathUtil.snap(MathUtil.smoothLerpPrecision(scrollPositionInPixels, currentScrollEase, FlxG.elapsed, SCROLL_EASE_DURATION,
1 / 1000), currentScrollEase, 1 / 1000);
moveSongToScrollPosition();
}

/**
* Fix the current scroll position after exiting the PlayState used when testing.
*/
function resetConductorAfterTest(_:FlxSubState = null):Void
{
this.persistentUpdate = true;
this.persistentDraw = true;

{
displayAutosavePopup = false;
haxe.ui.Toolkit.callLater(() ->
{
this.infoWithActions('Auto-Save', 'Chart auto-saved to ${absoluteBackupsPath}.', [{
text: "Open In Folder",
callback: openBackupsFolder,
}]);
});
}

moveSongToScrollPosition();

fadeInWelcomeMusic(WELCOME_MUSIC_FADE_IN_DELAY, WELCOME_MUSIC_FADE_IN_DURATION);

Cursor.show();


playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%

{
audioInstTrack.volume = instTargetVolume;
audioInstTrack.pitch = playbackRate;
audioInstTrack.onComplete = null;
}
{
audioVocalTrackGroup.playerVolume = vocalPlayerTargetVolume;
audioVocalTrackGroup.opponentVolume = vocalOpponentTargetVolume;
audioVocalTrackGroup.pitch = playbackRate;
}
}

/**
* Updates the Conductor instance and checkes for time signature changes.
*/
function updateSongTime():Void
{
Conductor.instance.update(audioInstTrack.time, false);
|| Conductor.instance.timeSignatureDenominator != oldTimeSignatureDen)
{
updateTimeSignature();
}
}

/**
* Updates the measure tick bitmap forcibly to make sure it's correct.
*/
function updateTimeSignature():Void
{
}

/**
* Handle positioning the measure ticks sprite.
*/
function handleMeasureTickPosition():Void
{
measureTicks.y = gridTiledSprite?.y;
}

/**
* HAXEUI FUNCTIONS
*/

/**
* STATIC FUNCTIONS
*/

function handleNotePreview():Void
{
{
notePreviewDirty = false;

notePreview.erase();
notePreview.addNotes(currentSongChartNoteData, songLengthInPixels);
notePreview.addOverlappingNotes(currentOverlappingNotes, songLengthInPixels);
notePreview.addSelectedNotes(currentNoteSelection, songLengthInPixels);
notePreview.addEvents(currentSongChartEventData, songLengthInPixels);
}

{
setNotePreviewViewportBounds(calculateNotePreviewViewportBounds());
notePreviewViewportBoundsDirty = false;
}
}

/**
* Handles passive behavior of the menu bar, such as updating labels or enabled/disabled status.
* Does not handle onClick ACTIONS of the menubar.
*/
function handleMenubar():Void
{
{
commandHistoryDirty = false;

{
menubarItemUndo.disabled = true;
menubarItemUndo.text = 'Undo';
}
else
{
menubarItemUndo.disabled = false;
menubarItemUndo.text = 'Undo ${undoHistory[undoHistory.length - 1].toString()}';
}

{
menubarItemRedo.disabled = true;
menubarItemRedo.text = 'Redo';
}
else
{
menubarItemRedo.disabled = false;
menubarItemRedo.text = 'Redo ${redoHistory[redoHistory.length - 1].toString()}';
}
}
{
clipboardDirty = false;

{
menubarItemPaste.disabled = true;
menubarItemPasteUnsnapped.disabled = true;
clipboardValid = false;
}
else if (clipboardValid)
{
menubarItemPaste.disabled = false;
menubarItemPasteUnsnapped.disabled = false;
}
}

{
editButtonsDirty = false;

{
menubarItemCopy.disabled = false;
menubarItemCut.disabled = false;
menubarItemDelete.disabled = false;
menubarItemSelectNone.disabled = false;
}
else
{
menubarItemCopy.disabled = true;
menubarItemCut.disabled = true;
menubarItemDelete.disabled = true;
menubarItemSelectNone.disabled = true;
}
{
menubarItemFlipNotes.disabled = false;
}
else
{
menubarItemFlipNotes.disabled = true;
}
}
}

/**
* Handle the playback of hitsounds.
*/




function handleMusicPositionUpdate(oldSongPosition:Float, newSongPosition:Float):Void
{
_currentEvents = SongDataUtils.getEventsInTimeRange(currentSongChartEventData, oldSongPosition, newSongPosition);
_allowedEvents = SongDataUtils.getEventsWithKind(_currentEvents, _allowedEventsNames);

for (noteData in currentSongChartNoteData)
{

continue;


/**
* We hit a note.
* We're gonna create scripted event and dispatch it al over ChartEditor.
*/
_scriptNoteObj = new NoteSprite(NoteStyleRegistry.instance.fetchDefault());
_scriptNoteObj.noteData = noteData;
_scriptNoteObj.kill();
_scriptNoteObj.direction = _scriptNoteObj.noteData?.getDirection() ?? 0;
_scriptNoteObj.scrollFactor.set();

_noteScriptEvent = new HitNoteScriptEvent(_scriptNoteObj, 0.0, 0, (noteData.getStrumlineIndex() == 0 ? 'perfect' : 'sick'), false, 0);
dispatchEvent(_noteScriptEvent);

{
_scriptNoteObj.destroy();
_scriptNoteObj = null;

_noteScriptEvent = null;

continue;
}

{
case 0: // Player
case 1: // Opponent
}
}
_scriptNoteObj?.destroy();
_scriptNoteObj = null;

_noteScriptEvent = null;
for (data in _allowedEvents)
{
switch (data.eventKind)
{
case "PlayAnimation":
switch (data.getString('target').toLowerCase().trim())
{
case 'boyfriend' | 'bf' | 'player':
_eventTarget = currentPlayerCharacterPlayer;
case 'dad' | 'opponent' | 'enemy':
_eventTarget = currentOpponentCharacterPlayer;
default:
}
}
}

_currentEvents = null;
_allowedEvents.resize(0);
_eventTarget = null;
}

/**
* Stop playback of the chart's instrumental and vocals.
* @param welcomeMusic If `true`, queue the welcome music to play after a timeout. `false` to force the welcome music to stop too.
*/
function stopAudioPlayback(welcomeMusic:Bool = true):Void
{

audioVocalTrackGroup.pause();
{
fadeInWelcomeMusic(WELCOME_MUSIC_FADE_IN_DELAY, WELCOME_MUSIC_FADE_IN_DURATION);
}
else
{
stopWelcomeMusic();
}

playbarPlay.text = '>';
}

function toggleAudioPlayback():Void
{

currentScrollEase = this.scrollPositionInPixels;

{
stopAudioPlayback();
}
else
{
startAudioPlayback();
}
}

public function postLoadInstrumental():Void
{
playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%
{
audioInstTrack.onComplete = function()
{
{
audioInstTrack.pause();
audioInstTrack.time = audioInstTrack.length;
}
audioVocalTrackGroup.pause();
};
audioInstTrack.volume = instTargetVolume;
audioInstTrack.pitch = playbackRate;
}
else
{
}

Conductor.instance.mapTimeChanges(this.currentSongMetadata.timeChanges);
updateTimeSignature();

this.songLengthInMs = (audioInstTrack?.length ?? 1000.0) + Conductor.instance.instrumentalOffset;
Conductor.instance.currentTimeChange.bpm = currentSongMetadata.timeChanges[0].bpm;

healthIconsDirty = true;
playerPreviewDirty = true;
opponentPreviewDirty = true;
}

public function loadSubtitles():Void
{
{
subtitlesFile += '-${selectedVariation}';
}
subtitles.assignSubtitles(subtitlesFile, audioInstTrack);
}

public function postLoadVocals():Void
{
playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%

{
audioVocalTrackGroup.playerVolume = vocalPlayerTargetVolume;
audioVocalTrackGroup.opponentVolume = vocalOpponentTargetVolume;
audioVocalTrackGroup.pitch = playbackRate;
}
}

function hardRefreshOffsetsToolbox():Void
{
{
offsetsToolbox.refreshAudioPreview();
offsetsToolbox.refresh();
}
}

function hardRefreshFreeplayToolbox():Void
{
{
freeplayToolbox.refreshAudioPreview();
freeplayToolbox.refresh();
}
}

/**
* Clear the voices group.
*/
public function clearVocals():Void
{
audioVocalTrackGroup.clear();
}

function isNoteSelected(note:Null<SongNoteData>):Bool
{
}

function doesNoteStack(note:Null<SongNoteData>, curStackedNotes:Array<SongNoteData>):Bool
{
}

override function destroy():Void
{
super.destroy();

cleanupAutoSave();

this.closeExistingMenu();

Cursor.hide();

ChartEditorNoteSprite.noteFrameCollection = null;


funkin.play.GameOverSubState.reset();
funkin.play.PauseSubState.reset();
funkin.play.Countdown.reset();
}

function applyCanQuickSave():Void
{

{
menubarItemSaveChart.disabled = true;
}
else
{
menubarItemSaveChart.disabled = false;
}
}

function applyWindowTitle():Void
{
{
inner = cwfp;
}
{
inner += '*';
}
WindowUtil.setWindowTitle('Friday Night Funkin\' Chart Editor - ${inner}');
}

function resetWindowTitle():Void
{
WindowUtil.setWindowTitle('Friday Night Funkin\'');
}

/**
* Convert a note data value into a chart editor grid column number.
*/
public static function noteDataToGridColumn(input:Int):Int
{
{
input = (ChartEditorState.STRUMLINE_SIZE * 2 + 1);
}
else
{
{
input -= ChartEditorState.STRUMLINE_SIZE;
}
else
{
input += ChartEditorState.STRUMLINE_SIZE;
}
}
}

/**
* Convert a chart editor grid column number into a note data value.
*/
public static function gridColumnToNoteData(input:Int):Int
{
{
input = (ChartEditorState.STRUMLINE_SIZE * 2 + 1);
}
else
{
{
input -= ChartEditorState.STRUMLINE_SIZE;
}
else
{
input += ChartEditorState.STRUMLINE_SIZE;
}
}
}

public static function cloneNoteParams(paramsToClone:Array<NoteParamData>):Array<NoteParamData>
{
for (param in paramsToClone)
{
params.push(param.clone());
}
}
}

/**
* Available input modes for the chart editor state. Numbers/arrows/WASD available for other keybinds.
*/
enum abstract ChartEditorLiveInputStyle(String)
{
/**
* No hotkeys to place notes at the playbar.
*/

/**
* 1/2/3/4 to place notes on opponent's side, 5/6/7/8 to place notes on player's side.
*/

/**
* WASD to place notes on opponent's side, Arrow keys to place notes on player's side.
*/
}

typedef ChartEditorParams =
{
/**
* If non-null, load this song immediately instead of the welcome screen.
*/

/**
* If non-null, load this song immediately instead of the welcome screen.
*/

/**
* If non-null, load this difficulty immediately instead of the default difficulty.
*/

/**
* If non-null, load this variation immediately instead of the default variation.
*/

/**
* If non-null, set this as the song position immediately instead of the default song position.
*/
};

/**
* Available themes for the chart editor state.
*/
enum abstract ChartEditorTheme(String)
{
/**
* The default theme for the chart editor.
*/

/**
* A theme which introduces darker colors.
*/
}
