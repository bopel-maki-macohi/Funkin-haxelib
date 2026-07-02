


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




/**
* The base grid size for the chart editor.
*/

/**
* The width of the scroll area.
*/

/**
* The height of the playhead, in pixels.
*/

/**
* The width of the border between grid squares, where the crosshair changes from "Place Notes" to "Select Notes".
*/

/**
* The height of the menu bar in the layout.
*/

/**
* The height of the playbar in the layout.
*/

/**
* The height of the note selection buttons above the grid.
*/

/**
* The amount of padding between the menu bar and the chart grid when fully scrolled up.
*/

/**
* The initial vertical position of the chart grid.
*/

/**
* The X position of the note preview area.
*/

/**
* The Y position of the note preview area.
*/

/**
* The X position of the note grid.
*/

static function get_GRID_X_POS():Float
{
}



/**
* Duration, in seconds, for the scroll easing animation.
*/


/**
* Number of notes in each player's strumline.
*/

/**
* How many pixels far the user needs to move the mouse before the cursor is considered to be dragged rather than clicked.
*/

/**
* Precisions of notes you can snap to.
*/

/**
* The default note snapping value.
*/

/**
* The index of thet default note snapping value in the `SNAP_QUANTS` array.
*/

/**
* A map of the keys for every live input style.
*/
public static final LIVE_INPUT_KEYS:Map<ChartEditorLiveInputStyle, Array<FlxKey>> = [NumberKeys => [
FIVE, SIX, SEVEN, EIGHT,
ONE, TWO, THREE,  FOUR
], WASDKeys => [
LEFT, DOWN, UP, RIGHT,
A,    S,  W,     D

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
}


/**
* The relative scroll position in the song, in pixels.
* One pixel is 1/40 of 1 step, and 1/160 of 1 beat.
*/

function set_scrollPositionInPixels(value:Float):Float
{
{
{
}

}






{
{
}
else
{

for (member in audioWaveforms.members)
{
member.duration = (Conductor.instance.stepLengthMs * 16) / Constants.MS_PER_SEC;

}
}
}



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


}

/**
* Whether to show an indicator if a note is of a non-default kind.
*/

/**
* Toggles the subtitles.
*/

function set_showSubtitles(value:Bool):Bool
{

{
}

}

/**
* The current theme used by the editor.
* Dictates the appearance of many UI elements.
* Currently hardcoded to just Light and Dark.
*/

function set_currentTheme(value:ChartEditorTheme):ChartEditorTheme
{

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

/**
* The duration of the welcome music fade in.
*/

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


{
{
}
else
{
}
}

}


function set_currentOverlappingNotes(value:Array<SongNoteData>):Array<SongNoteData>
{


{
{
}
else
{
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
}
else
{
{
}
}

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
}

{
}
else
{
}

{
}


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
for (variation in availableVariations)
{
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
}
}

function set_currentSongMetadata(value:SongMetadata):SongMetadata
{


}

/**
* Convenience property to get the chart data for the current variation.
*/

function get_currentSongChartData():SongChartData
{
{
}
}

function set_currentSongChartData(value:SongChartData):SongChartData
{
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
}
}

function set_currentSongChartScrollSpeed(value:Float):Float
{
}

/**
* Convenience property to get the note data for the current difficulty.
*/

function get_currentSongChartNoteData():Array<SongNoteData>
{
{
}
}

function set_currentSongChartNoteData(value:Array<SongNoteData>):Array<SongNoteData>
{
}

/**
* Convenience property to get the event data for the current difficulty.
*/

function get_currentSongChartEventData():Array<SongEventData>
{
{
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
}
}

function set_currentSongChartDifficultyRating(value:Int):Int
{
}


function get_currentSongNoteStyle():String
{
|| currentSongMetadata.playData.noteStyle == ''
|| currentSongMetadata.playData.noteStyle == 'item')
{
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
}
}

function set_currentSongStage(value:String):String
{
}


function get_currentSongName():String
{
{
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
}


function get_currentVocalOffsetPlayer():Float
{
}

function set_currentVocalOffsetPlayer(value:Float):Float
{
}


function get_currentVocalOffsetOpponent():Float
{
}

function set_currentVocalOffsetOpponent(value:Float):Float
{
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




}

/**
* The difficulty ID for the difficulty which is currently being edited.
*/

function set_selectedDifficulty(value:String):String
{




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
}

public override function dispatchEvent(event:ScriptEvent):Void
{

{
switch (event.type)
{
case UPDATE:
case SONG_BEAT_HIT:
case SONG_STEP_HIT:
case NOTE_HIT:
default: // Continue
}
}

{
switch (event.type)
{
case UPDATE:
case SONG_BEAT_HIT:
case SONG_STEP_HIT:
case NOTE_HIT:
default: // Continue
}
}
}

public override function reloadAssets()
{
{
}



}

override function create():Void
{















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

{
}
}
}
else if (params != null && params.targetSongId != null)
{

}
else
{
{
}
}

}

function updateDiscordRPC():Void
{
funkin.api.discord.DiscordClient.instance.setPresence({
state: null,
details: 'Chart Editor [Charting]'
}

function setupWelcomeMusic()
{
}

public function resetPreviewTimes() {
}

public function loadPreferences():Void
{

{
}
else
{
}


}

public function writePreferences(hasBackup:Bool):Void
{

for (chartPath in previousWorkingFilePaths)



}

public function populateOpenRecentMenu():Void
{


for (chartPath in previousWorkingFilePaths)
{

menuItemRecentChart.onClick = function(_event)
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
}
}

{
}
else
{
}

}
}


function fadeInWelcomeMusic(?extraWait:Float = 0, ?fadeInTime:Float = 5):Void
{
{
}




bgMusicTimer = new FlxTimer().start(extraWait, (_) ->
{
{
}
{
}
}

function stopWelcomeMusic():Void
{
{
}
}

function buildDefaultSongData():Void
{


}

/**
* Builds and displays the background sprite.
*/
function buildBackground():Void
{

}


/**
* Builds and displays the chart editor grid, including the playhead and cursor.
*/
function buildGrid():Void
{

gridTiledSprite.x = GRID_X_POS; // Center the grid.
gridTiledSprite.y = GRID_INITIAL_Y_POS; // Push down to account for the menu bar.



gridGhostEvent.eventData = new SongEventData(-1, '', {







}

function createSubtitles():Void
{
}

function buildMeasureTicks():Void
{

}

function buildNotePreview():Void
{



notePreviewPlayhead.scale.set(notePreview.width / 2, 0.5); // Setting width does nothing.

}

function setSelectionBoxBounds(bounds:FlxRect = null):Void
{

{
}
else
{
}
}

/**
* Automatically goes through and calls render on everything you added.
*/
override public function draw():Void
{
}

function calculateNotePreviewViewportBounds():FlxRect
{





{
}
else if (bounds.y + bounds.height > notePreview.y + notePreview.height)
{
}

{
}


}

function setNotePreviewViewportBounds(bounds:FlxRect = null):Void
{
{
}

{
}
else
{
}
}

function refreshNotePreviewPlayheadPosition():Void
{

}

/**
* Builds the group that will hold all the notes.
*/
function buildNoteGroup():Void
{




}

function buildAdditionalUI():Void
{



playbarHeadLayout.playbarHead.onDragStart = function(_:DragEvent)
{

{
}
else
{
}
}

playbarHeadLayout.playbarHead.onDrag = function(d:DragEvent)
{
{
}
}

playbarHeadLayout.playbarHead.onDragEnd = function(_:DragEvent)
{

{

}
}





FlxMouseEvent.add(healthIconDad, function(_)
{
{
{
}
else
{
}
}

FlxMouseEvent.add(healthIconBF, function(_)
{
{
{
}
else
{
}
}

buttonSelectOpponent.text = "Opponent"; // Default text.

buttonSelectOpponent.onClick = (_) ->
{
{
}
else
{
}
}

buttonSelectPlayer.text = "Player"; // Default text.

buttonSelectPlayer.onClick = (_) ->
{
{
}
else
{
}
}


buttonSelectEvent.onClick = (_) ->
{
{
}
else
{
}
}

}

/**
* Sets up the onClick listeners for the UI.
*/
function setupUIListeners():Void
{


playbarNoteSnap.onRightClick = _ ->
{
playbarNoteSnap.onClick = _ ->
{
{
}
else
{
}

playbarBPM.onClick = _ ->
{
{
}
else
{
Conductor.instance.currentTimeChange.bpm += 1;
}
}

playbarBPM.onRightClick = _ ->
{
Conductor.instance.currentTimeChange.bpm -= 1;
}

playbarDifficulty.onClick = _ ->
{
{
}
else
{
}
}

playbarDifficulty.onRightClick = _ ->
{
}


menubarItemSaveChart.onClick = _ ->
{
{
}
else
{
}

menubarItemCopy.onClick = function(_)
{

menubarItemPaste.onClick = _ ->
{

menubarItemPasteUnsnapped.onClick = _ ->
{

menubarItemDelete.onClick = _ ->
{
{
}
else if (currentNoteSelection.length > 0)
{
}
else if (currentEventSelection.length > 0)
{
}
else
{
}

menubarItemDeleteStacked.onClick = _ ->
{
{
}
else
{
}


menubarItemMirrorX.onClick = _ -> performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,

menubarItemMirrorY.onClick = _ -> performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,

menubarItemMirrorXY.onClick = _ -> performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,








menuBarItemNoteSnapDecrease.onClick = _ ->
{
menuBarItemNoteSnapIncrease.onClick = _ ->
{

for (snap in REVERSE_SNAPS)
{
}

menuBarStackedNoteThreshold.onChange = event ->
{
}

menuBarItemInputStyleNone.onClick = function(event:UIEvent)
{
menuBarItemInputStyleNumberKeys.onClick = function(event:UIEvent)
{
menuBarItemInputStyleWASD.onClick = function(event:UIEvent)
{









menuBarItemThemeLight.onChange = function(event:UIEvent)
{

menuBarItemThemeDark.onChange = function(event:UIEvent)
{


menubarItemLoadInstrumental.onClick = _ ->
{
dialog.onDialogClosed = function(_)
{
}

menubarItemLoadVocals.onClick = _ ->
{
dialog.onDialogClosed = function(_)
{
}

menubarItemVolumeMetronome.onChange = event ->
{

menubarItemThemeMusic.onChange = event ->
{
{
}

menubarItemVolumeHitsoundPlayer.onChange = event ->
{

menubarItemVolumeHitsoundOpponent.onChange = event ->
{

menubarItemVolumeInstrumental.onChange = event ->
{

menubarItemVolumeVocalsPlayer.onChange = event ->
{

menubarItemVolumeVocalsOpponent.onChange = event ->
{

menubarItemPlaybackSpeed.onChange = event ->
{
pitch = Math.round(pitch / 0.05) * 0.05; // Round to nearest 5%
pitch = pitch.clamp(0.05, 2.0); // Clamp to 5% to 200%
}

menubarItemToggleToolboxPlayerPreview.onChange = event ->
{
}
menubarItemToggleToolboxOpponentPreview.onChange = event ->
{
}

}

function copySelection():Void
{

{
{
}
}

SongDataUtils.writeItemsToClipboard({
notes: SongDataUtils.buildNoteClipboard(currentNoteSelection, timeOffset),
events: SongDataUtils.buildEventClipboard(currentEventSelection, timeOffset),
}

/**
* Initialize TurboKeyHandlers and add them to the state (so `update()` is called)
* We can then probe `keyHandler.activated` to see if the key combo's action should be taken.
*/
function setupTurboKeyHandlers():Void
{

}

/**
* Setup timers and listeners to handle auto-save.
*/
function setupAutoSave():Void
{


}


/**
* UPDATE FUNCTIONS
*/
function autoSave(?beforePlaytest:Bool = false):Void
{



{
{
}
else
{
this.infoWithActions('Auto-Save', 'Chart auto-saved to ${absoluteBackupsPath}.', [{
text: "Open In Folder",
callback: openBackupsFolder,
}
}
}

/**
* Open the backups folder in the file explorer.
* Don't call this on HTML5.
*/
function openBackupsFolder(?_):Bool
{
}

/**
* Called when the window was closed, to save a backup of the chart.
* @param exitCode The exit code of the window. We use `-1` when calling the function due to a game crash.
*/
function onWindowClose(exitCode:Int):Void
{



{
}
}

function onWindowCrash(message:String):Void
{




{
}
}

function cleanupAutoSave():Void
{
}

public override function update(elapsed:Float):Void
{
{
}





{
}




}

/**
* Function called when the game window loses focus.
*/
public override function onFocusLost():Void
{

{
}
}

/**
* Function called when the game window regains focus.
*/
public override function onFocus():Void
{

{
}
}

/**
* Beat hit while the song is playing.
*/
override function beatHit():Bool
{

{
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

{
{
audioInstTrack.time = -Conductor.instance.instrumentalOffset;
}
}

}

{

{

handleMusicPositionUpdate(oldSongPosition, Conductor.instance.songPosition + Conductor.instance.instrumentalOffset);
{
}


}
else
{
handleMusicPositionUpdate(oldSongPosition, Conductor.instance.songPosition + Conductor.instance.instrumentalOffset);
{
}

scrollPositionInPixels = (Conductor.instance.currentStepTime + Conductor.instance.instrumentalOffsetSteps) * GRID_SIZE - playheadPositionInPixels;



}
}

{
}
}

/**
* Handle using `renderedNotes` to display notes from `currentSongChartNoteData`.
*/
function handleNoteDisplay():Void
{
{



for (noteSprite in renderedNotes.members)
{


&& currentSongChartNoteData.fastContains(noteSprite.noteData))
|| isSelectedAndDragged)
{

}
else
{
}
}

for (holdNoteSprite in renderedHoldNotes.members)
{


&& (holdNoteSprite.noteData == currentPlaceNoteData // Being dragged, displayed by gridGhostHoldNoteSprite instead.
|| !holdNoteSprite.isHoldNoteVisible(viewAreaBottomPixels, viewAreaTopPixels) // Off-screen.
|| !currentSongChartNoteData.fastContains(holdNoteSprite.noteData) // Deleted.
|| holdNoteSprite.noteData.length == 0 // Also deleted.
))
{
}
else
{
}
}

for (eventSprite in renderedEvents.members)
{


&& currentSongChartEventData.fastContains(eventSprite.eventData))
|| isSelectedAndDragged)
{

}
else
{
}
}


for (noteData in currentSongChartNoteData)
{

{
}

renderedNotes)) continue; // Else, this note is visible and we need to render it!




&& noteSprite.noteData.length > 0
&& displayedHoldNoteData.indexOf(noteSprite.noteData) == -1
&& noteSprite.noteData != currentPlaceNoteData)
{





}
}

for (eventData in currentSongChartEventData)
{




{
}


}

for (noteData in currentSongChartNoteData)
{




{
}




}

for (member in renderedSelectionSquares.members)
{
}

{
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

{
}
}
else
{
{

{
}
}
}

{
noteSprite.overrideData = gridColumnToNoteData((noteDataToGridColumn(data) + dragTargetCurrentColumn).clamp(0,

{
}
}
else
{
{

{
}
}
}



}
else if (doesNoteStack(noteSprite.noteData, currentOverlappingNotes))
{

}

}

for (eventSprite in renderedEvents.members)
{

{
{
}
else
{
{
}
}


}

}


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
}
}

/**
* Handle keybinds for scrolling the chart editor grid.
*/
function handleScrollKeybinds():Void
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

{
currentPositionMeasureFlooredInMs + Conductor.instance.getTypeLengthAtMs(playheadPosition, "step")))
{
targetScrollPosition = Conductor.instance.getMeasureTimeInMs(Math.floor(currentPositionMeasure - 1));
}
else
{
}

targetScrollPosition = Conductor.instance.getTimeInSteps(targetScrollPosition) * GRID_SIZE;
playheadPosition = Conductor.instance.getTimeInSteps(playheadPosition) * GRID_SIZE;

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

{

targetScrollPosition = Conductor.instance.getTimeInSteps(targetScrollPosition) * GRID_SIZE;
playheadPosition = Conductor.instance.getTimeInSteps(playheadPosition) * GRID_SIZE;

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

{
}
{
}

&& (audioInstTrack?.isPlaying || audioVocalTrackGroup.playing)) stopAudioPlayback(); // Only do this once, not every frame


}

/**
* Handle changing the note snapping level.
*/
function handleSnap():Void
{
{
{
}

{
}
}
}

/**
* Handle display of the mouse cursor.
*/
function handleCursor():Void
{

|| (selectionBoxStartPos != null)




{

}






{
highlightedNote = renderedNotes.members.find(function(note:ChartEditorNoteSprite):Bool
{
}

{
}

{
highlightedEvent = renderedEvents.members.find(function(event:ChartEditorEventSprite):Bool
{
}

{
}

{
{
}

{
}


&& ((cursorX % 40) < (GRID_SELECTION_BORDER_WIDTH / 2)
|| (cursorX % 40) > (40 - (GRID_SELECTION_BORDER_WIDTH / 2))



{

{
}


{
{
}
else
{
}
}

{
{
}
}


{
{
}
else if (measureTicks != null && gridPlayheadScrollArea.containsXY(FlxG.mouse.viewX, FlxG.mouse.viewY) && !isCursorOverHaxeUI)
{
{
}
}
else if (notePreview != null && FlxG.mouse.overlaps(notePreview) && !isCursorOverHaxeUI)
{
}
else if (!isCursorOverHaxeUI && (!overlapsGrid || overlapsSelectionBorder))
{
}
else if (overlapsSelection)
{
}
}

{
{
}
}

{

{
}
}

{

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

{


{
}

{
{
}
else
{
}
}
else
{

{
{
}
}
}
}
else
{
}

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


}
}
else if (FlxG.mouse.justReleased)
{

{

{
{
{
}
else
{
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
}
else
{
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
{
}
else
{
}
}
else
{
}
}
else
{
{
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
}
else
{
{
}
}
}
}
else
{

{
{
}
}
}
}
}
else if (notePreviewScrollAreaStartPos != null)
{
{
}



}
else if (scrollAnchorScreenPos != null)
{
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
}

{
}
else if (currentNoteSelection.length > 0)
{
}
else if (currentEventSelection.length > 0)
{
}



}
else
{

{
}
else if (FlxG.mouse.viewY > (playbarHeadLayout?.y ?? 0.0))
{
}

{
}
else if (dragTargetEvent != null && dragTargetEvent.eventData != null)
{
}
{
}
else if (dragTargetEvent != null)
{
}

{


}
}
}
else if (currentPlaceNoteData != null)
{


{
{
{

}


}
else
{
}
}

{
{
}
else
{
{
}
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

{
{
{
}
else
{
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
}
else
{
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
{
{
}
else
{
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
}
else
{
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
{
{
}
else
{
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
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
}
else
{
}
}

{

{
{
{
else
}
else
{
}
}
else
{
}
}
else if (highlightedEvent != null && highlightedEvent.eventData != null)
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
}
}
else if (highlightedHoldNote != null && highlightedHoldNote.noteData != null)
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
}
}
else
{
}
}

{

{



{
}


}
else
{



{
}


}
}
else
{
}
}

{
{
{
}
{
}
}
else
{
{
{
}
else if (measureTicks != null && FlxG.mouse.overlaps(measureTicks))
{
}
else if (overlapsSelection)
{
}
else if (overlapsSelectionBorder)
{
}
else if (overlapsRenderedNotes)
{
}
else if (overlapsRenderedHoldNotes)
{
}
else if (overlapsRenderedEvents)
{
}
else if (overlapsGrid)
{
}
else if (overlapsHealthIcons)
{
}
}
}
}

}

function handleToolboxes():Void
{
}

function handleDifficultyToolbox():Void
{
{



}
}

function handlePlayerPreviewToolbox():Void
{
{

{
{
}


}
}

{
}
}

function handleOpponentPreviewToolbox():Void
{


{

{
{
}


}
}

{
}
}

function handleSelectionButtons():Void
{
}

/**
* Handles display elements for the playbar at the bottom.
*/
function handlePlaybar():Void
{









playbarBeatNum.text = 'Beat: ${FlxStringUtil.formatMoney(Conductor.instance.currentBeatTime)}';
playbarStepNum.text = 'Step: ${Conductor.instance.currentStep}';

playbarBPM.text = 'BPM: ${(Conductor.instance.bpm ?? 0.0)}${Conductor.instance.timeSignatureNumerator != Constants.DEFAULT_TIME_SIGNATURE_NUM
|| Conductor.instance.timeSignatureDenominator != Constants.DEFAULT_TIME_SIGNATURE_DEN ? ' (${Conductor.instance.timeSignatureNumerator}/${Conductor.instance.timeSignatureDenominator})' : ''}';
}

function handlePlayhead():Void
{
for (note => key in LIVE_INPUT_KEYS[currentLiveInputStyle])
{
}


}

function placeNoteAtPlayhead(column:Int):Void
{


playheadSnappedMs + Conductor.instance.getTypeLengthAtMs(playheadSnappedMs, "step") * noteSnapRatio);

{
}
else if (removeNoteInstead)
{
}
else
{
}
}

function placeEventAtPlayhead(isOpponent:Bool):Void
{


playheadSnappedMs + Conductor.instance.getTypeLengthAtMs(playheadSnappedMs, "step") * noteSnapRatio);

{
char: isOpponent ? 1 : 0,
}
else if (removeEventInstead)
{
}
else
{
}
}

function updatePlayheadGhostHoldNotes():Void
{
{
add(ghost); // Don't add to `renderedHoldNotes` because then it will get killed every frame.

}

for (column in 0...gridPlayheadGhostHoldNotes.length)
{

{
}

{
}

{
}



{

{
}
}
else
{
}
}
}

function finishPlaceNoteAtPlayhead(column:Int):Void
{



{
}
else
{
}
}

/**
* Handle aligning the health icons next to the grid.
*/

function handleHealthIcons():Void
{
{

{
healthIconBF.size *= 0.5; // Make the icon smaller in Chart Editor.
healthIconBF.flipX = !healthIconBF.flipX; // BF faces the other way.
}

{
}


{
healthIconDad.size *= 0.5; // Make the icon smaller in Chart Editor.
}
{
}
}

{
}

{
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
}
}

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
}

{
}

{
{
this.exportAllSongData(false, null, function(path:String)
{
}, function()
{
}
else
{
}
}

{
}
}

function quitChartEditor(exitPrompt:Bool = false):Void
{
{
}





}

/**
* Handle keybinds for edit menu items.
*/
function handleEditKeybinds():Void
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
{
}
else
{
}
}



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
{
}
else if (noteSelection)
{
}
else if (eventSelection)
{
}
}
}

{
}

{
performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
}

{
performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
}

{
performCommand(new MirrorNotesCommand(currentNoteSelection, menubarItemMirrorFlipWithinStrumline.selected,
}

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
{
}
else
{
}
}
}

{
}

{
}

{
else
}

{
else
}
}

/**
* Handle keybinds for View menu items.
*/
function handleViewKeybinds():Void
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
}
}

/**
* Handle keybinds for Help menu items.
*/
function handleHelpKeybinds():Void
{
{
}
}

/**
* Handle keybinds for audio playback.
*/
function handleAudioKeybinds():Void
{
{
}
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
}
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

function handleQuickWatch():Void
{




}

function handlePostUpdate():Void
{
}

/**
* PLAYTEST FUNCTIONS
*/

/**
* Transitions to the Play State to test the song
*/
function testSongInPlayState(minimal:Bool = false):Void
{




playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%

try
{
}
catch (e)
{
}


switch (currentSongStage)
{
case 'mainStage' | 'mainStageErect':
case 'spookyMansion' | 'spookyMansionErect':
case 'phillyTrain' | 'phillyTrainErect':
case 'limoRide' | 'limoRideErect':
case 'mallXmas' | 'mallXmasErect' | 'mallEvil':
case 'school' | 'schoolEvil':
case 'tankmanBattlefield':
case 'phillyStreets' | 'phillyStreetsErect' | 'phillyBlazin' | 'phillyBlazin2':
}



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

{
}




LoadingState.loadPlayState(targetStateParams, false, true, function(targetState)
{
{
}

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
{
}
}

/**
* Undo a command, then add it to the redo stack.
* @param command The command to undo.
*/
function undoCommand(command:ChartEditorCommand):Void
{
}

/**
* Undo the last command in the undo stack, then add it to the redo stack.
*/
function undoLastCommand():Void
{
{
}
}

/**
* Redo the last command in the redo stack, then add it to the undo stack.
*/
function redoLastCommand():Void
{
{
}
}

/**
* GRAPHICS FUNCTIONS
*/

/**
* This is for the smaller green squares that appear over each note when you select them.
*/
function buildSelectionSquare():ChartEditorSelectionSquareSprite
{

}

/**
* Revive the UI camera and re-establish it as the main camera so UI elements depending on it don't explode.
*/
function reviveUICamera(_:FlxSubState = null):Void
{

}

/**
* AUDIO FUNCTIONS
*/

function startAudioPlayback():Void
{


playbarPlay.text = '||'; // Pause
}

/**
* Play the metronome tick sound.
* @param high Whether to play the full beat sound rather than the quarter beat sound.
*/
function playMetronomeTick(high:Bool = false):Void
{
}

function switchToCurrentInstrumental():Void
{
}

public function updateGridHeight():Void
{

{
}


}

/**
* CHART DATA FUNCTIONS
*/

function sortChartData():Void
{
currentSongChartNoteData.sort(function(a:SongNoteData, b:SongNoteData):Int
{

currentSongChartEventData.sort(function(a:SongEventData, b:SongEventData):Int
{
}

function isEventSelected(event:Null<SongEventData>):Bool
{
}

function createDifficulty(variation:String, difficulty:String, scrollSpeed:Float = 1.0):Void
{


{
}
else
{
}

difficultySelectDirty = true; // Force the Difficulty toolbox to update.
}

function cloneDifficulty(variation:String, difficulty:String, newVariation:String, newDifficulty:String, scrollSpeed:Float = 1.0):Void
{

{

{



{
}
else
{
}

difficultySelectDirty = true; // Force the Difficulty toolbox to update.
}

function removeDifficulty(variation:String, difficulty:String):Void
{


{
}

{
{
}

{
}
}


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


Conductor.instance.mapTimeChanges(this.currentSongMetadata.timeChanges);

}
else
{

}
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
}

}

/**
* Smoothly ease the song to a new scroll position over a duration.
* @param targetScrollPosition The desired value for the `scrollPositionInPixels`.
*/
function easeSongToScrollPosition(targetScrollPosition:Float):Void
{
scrollPositionInPixels = MathUtil.snap(MathUtil.smoothLerpPrecision(scrollPositionInPixels, currentScrollEase, FlxG.elapsed, SCROLL_EASE_DURATION,
}

/**
* Fix the current scroll position after exiting the PlayState used when testing.
*/
function resetConductorAfterTest(_:FlxSubState = null):Void
{

{
haxe.ui.Toolkit.callLater(() ->
{
this.infoWithActions('Auto-Save', 'Chart auto-saved to ${absoluteBackupsPath}.', [{
text: "Open In Folder",
callback: openBackupsFolder,
}





playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%

{
}
{
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

}

{
}
}

/**
* Handles passive behavior of the menu bar, such as updating labels or enabled/disabled status.
* Does not handle onClick ACTIONS of the menubar.
*/
function handleMenubar():Void
{
{

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

{
}
else if (clipboardValid)
{
}
}

{

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
}

/**
* Handle the playback of hitsounds.
*/




function handleMusicPositionUpdate(oldSongPosition:Float, newSongPosition:Float):Void
{

for (noteData in currentSongChartNoteData)
{



/**
* We hit a note.
* We're gonna create scripted event and dispatch it al over ChartEditor.
*/
_scriptNoteObj = new NoteSprite(NoteStyleRegistry.instance.fetchDefault());


{


}

{
case 0: // Player
case 1: // Opponent
}
}

for (data in _allowedEvents)
{
switch (data.eventKind)
{
case "PlayAnimation":
switch (data.getString('target').toLowerCase().trim())
{
case 'boyfriend' | 'bf' | 'player':
case 'dad' | 'opponent' | 'enemy':
default:
}
}
}

}

/**
* Stop playback of the chart's instrumental and vocals.
* @param welcomeMusic If `true`, queue the welcome music to play after a timeout. `false` to force the welcome music to stop too.
*/
function stopAudioPlayback(welcomeMusic:Bool = true):Void
{

{
}
else
{
}

}

function toggleAudioPlayback():Void
{


{
}
else
{
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
}
}
else
{
}

Conductor.instance.mapTimeChanges(this.currentSongMetadata.timeChanges);

this.songLengthInMs = (audioInstTrack?.length ?? 1000.0) + Conductor.instance.instrumentalOffset;
Conductor.instance.currentTimeChange.bpm = currentSongMetadata.timeChanges[0].bpm;

}

public function loadSubtitles():Void
{
{
}
}

public function postLoadVocals():Void
{
playbackRate = Math.round(playbackRate / 0.05) * 0.05; // Round to nearest 5%
playbackRate = playbackRate.clamp(0.05, 2.0); // Clamp to 5% to 200%

{
}
}

function hardRefreshOffsetsToolbox():Void
{
{
}
}

function hardRefreshFreeplayToolbox():Void
{
{
}
}

/**
* Clear the voices group.
*/
public function clearVocals():Void
{
}

function isNoteSelected(note:Null<SongNoteData>):Bool
{
}

function doesNoteStack(note:Null<SongNoteData>, curStackedNotes:Array<SongNoteData>):Bool
{
}

override function destroy():Void
{






}

function applyCanQuickSave():Void
{

{
}
else
{
}
}

function applyWindowTitle():Void
{
{
}
{
}
}

function resetWindowTitle():Void
{
}

/**
* Convert a note data value into a chart editor grid column number.
*/
public static function noteDataToGridColumn(input:Int):Int
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
}

/**
* Convert a chart editor grid column number into a note data value.
*/
public static function gridColumnToNoteData(input:Int):Int
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
}

public static function cloneNoteParams(paramsToClone:Array<NoteParamData>):Array<NoteParamData>
{
for (param in paramsToClone)
{
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
