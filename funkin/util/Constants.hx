

/**
* A store of unchanging, globally relevant values.
*/
class Constants
{
/**
* ENGINE AND VERSION DATA
*/

/**
* The title of the game, for debug printing purposes.
* Change this if you're making an engine.
*/

/**
* The current version number of the game.
* Modify this in the `project.xml` file.
*/

/**
* The generatedBy string embedded in the chart files made by this application.
*/

static function get_GENERATED_BY():String
{
}

/**
* A suffix to add to the game version.
* Add a suffix to prototype builds and remove it for releases.
*/

static function get_VERSION():String
{
}
static function get_VERSION():String
{
}

/**
* Whether or not the game is a debug build.
*/

/**
* URL DATA
*/

/**
* Link to buy merch for the game.
* This is usually fetched from the Newgrounds API but we use this as a fallback.
*/

/**
* Link to download the game on Itch.io.
*/

/**
* Link to play the game on Newgrounds.
*/

/**
* Link to the game's page on Kickstarter.
*/

/**
* REPOSITORY DATA
*/

/**
* The current Git branch.
*/

/**
* The current Git commit hash.
*/


/**
* The current library versions, as provided by hmm.
*/

/**
* COLORS
*/

/**
* The color used by the enemy health bar.
*/

/**
* The color used by the player health bar.
*/

/**
* The base colors used by notes.
*/
0xFF00EEFF, // down (1)
0xFF00CC00, // up (2)
0xFFCC1111 // right (3)

/**
* Color for the preloader background
*/

/**
* Color for the preloader progress bar
*/

/**
* Color for the preloader site lock background
*/

/**
* Color for the preloader site lock foreground
*/

/**
* Color for the preloader site lock text
*/

/**
* Color for the preloader site lock link
*/

/**
* GAME DEFAULTS
*/

/**
* Default difficulty for charts.
*/

/**
* Default list of difficulties for charts.
* Assumes no Erect mode, etc.
*/

/**
* Default list of difficulties for Erect mode.
*/

/**
* List of all difficulties used by the base game.
* Includes Erect and Nightmare.
*/

/**
* Default player character for charts.
*/

/**
* Default player character for health icons.
*/

/**
* Default stage for charts.
*/

/**
* Default song for if the PlayState messes up.
*/

/**
* Default variation for charts.
*/

/**
* Standardized variations for charts
*/

/**
* Default sticker pack for transitions
*/

/**
* The default intensity multiplier for camera bops.
* Prolly needs to be tuned bc it's a multiplier now.
*/

/**
* The default rate for camera zooms (in beats per zoom).
*/

/**
* The default offset of camera zooms (in beats).
*/

/**
* The default rate for characters or props (in beats per dance).
*/

/**
* The default BPM for charts, so things don't break if none is specified.
*/

/**
* The default name for songs.
*/

/**
* The default artist for songs.
*/

/**
* The default charter for songs.
*/

/**
* The default note style for songs.
*/

/**
* The default freeplay style for characters.
*/

/**
* The default pixel note style for songs.
*/

/**
* The default album for songs in Freeplay.
*/

/**
* The default name for the OST in Freeplay.
*/

/**
* The default preview start time for the songs in Freeplay.
*/

/**
* The default preview end time for the songs in Freeplay.
*/

/**
* The default timing format for songs.
*/

/**
* The default scroll speed for songs.
*/

/**
* Default numerator for the time signature.
*/

/**
* Default denominator for the time signature.
*/

/**
* ANIMATIONS
*/

/**
* A suffix used for animations played when an animation would loop.
*/

/**
* A suffix used for animations played when an animation would end before transitioning to another.
*/

/**
* TIMING
*/

/**
* A magic number used when calculating scroll speed and note distances.
*/

/**
* The maximum interval within which a note can be hit, in milliseconds.
*/

/**
* Constant for the number of seconds in a minute.
*
* sex per min
*/

/**
* Constant for the number of milliseconds in a second.
*/

/**
* The number of microseconds in a millisecond.
*/

/**
* The number of microseconds in a second.
*/

/**
* The number of nanoseconds in a microsecond.
*/

/**
* The number of nanoseconds in a millisecond.
*/

/**
* The number of nanoseconds in a second.
*/

/**
* Duration, in milliseconds, until toast notifications are automatically hidden.
*/

/**
* Duration to wait before autosaving the chart.
*/

/**
* Number of steps in a beat.
* The note length of a step varies based on the time signature denominator.
*/

/**
* All MP3 decoders introduce a playback delay of `528` samples,
* which at 44,100 Hz (samples per second) is ~12 ms.
*/

/**
* Each step of the preloader has to be on screen at least this long.
*
* 0 = The preloader immediately moves to the next step when it's ready.
* 1 = The preloader waits for 1 second before moving to the next step.
*     The progress bare is automatically rescaled to match.
*/

/**
* Time (in seconds) to wait on the Title Screen before entering the Attract State.
*/

/**
* HEALTH VALUES
*/

/**
* The player's maximum health.
* If the player is at this value, they can't gain any more health.
*/

/**
* The player's starting health.
*/

/**
* The player's minimum health.
* If the player is at or below this value, they lose.
*/

/**
* The amount of health the player gains when hitting a note with the KILLER rating.
*/
public static final HEALTH_KILLER_BONUS:Float = 2.0 / 100.0 * HEALTH_MAX; // +2.0%

/**
* The amount of health the player gains when hitting a note with the SICK rating.
*/
public static final HEALTH_SICK_BONUS:Float = 1.5 / 100.0 * HEALTH_MAX; // +1.0%

/**
* The amount of health the player gains when hitting a note with the GOOD rating.
*/
public static final HEALTH_GOOD_BONUS:Float = 0.75 / 100.0 * HEALTH_MAX; // +0.75%

/**
* The amount of health the player gains when hitting a note with the BAD rating.
*/
public static final HEALTH_BAD_BONUS:Float = 0.0 / 100.0 * HEALTH_MAX; // +0.0%

/**
* The amount of health the player gains when hitting a note with the SHIT rating.
* If negative, the player will actually lose health.
*/
public static final HEALTH_SHIT_BONUS:Float = -1.0 / 100.0 * HEALTH_MAX; // -1.0%

/**
* The amount of health the player gains, while holding a hold note, per second.
*/
public static final HEALTH_HOLD_BONUS_PER_SECOND:Float = 6.0 / 100.0 * HEALTH_MAX; // +6.0% / second

/**
* The amount of health the player loses upon missing a note.
*/
public static final HEALTH_MISS_PENALTY:Float = -4.0 / 100.0 * HEALTH_MAX; // 4.0%

/**
* The amount of health the player loses upon pressing a key when no note is there.
*/
public static final HEALTH_GHOST_MISS_PENALTY:Float = -4.0 / 100.0 * HEALTH_MAX; // 2.0%

/**
* The amount of health the player loses upon letting go of a hold note, per second remaining.
*/
public static final HEALTH_HOLD_DROP_PENALTY_PER_SECOND:Float = 0 / 100.0 * HEALTH_MAX; // -4.5% / second

/**
* The maximum amount of health the player can lose upon letting go of a hold note.
*/
public static final HEALTH_HOLD_DROP_PENALTY_MAX:Float = 0 / 100.0 * HEALTH_MAX; // -10.0%

/**
* The amount of health the player loses upon hitting a mine.
*/
public static final HEALTH_MINE_PENALTY:Float = -15.0 / 100.0 * HEALTH_MAX; // 15.0%

/**
* SCORE VALUES
*/

/**
* The amount of score the player loses for pressing a key when no note is there.
*/

/**
* The amount of score the player gains for every second they hold a hold note.
* A fraction of this value is granted every frame.
*/

/**
* The amount of score the player loses upon letting go of a hold note, per second remaining.
*/

/**
* The minimum amount of the hold note, in milliseconds, before the player gets penalized for letting go of it early.
*/



/**
* FILE EXTENSIONS
*/

/**
* The file extension used when exporting chart files.
*
* - "I made a new file format"
* - "Actually new or just a renamed ZIP?"
*/

/**
* The file extension used when exporting stage files.
*/

/**
* The file extension used when loading audio files.
*/

/**
* The file extension used when loading video files.
*/

/**
* The file extension used when loading image files.
*/

/**
* The file extension used when loading data files.
*/

/**
* OTHER
*/

/**
* Duration, in seconds, after the player's section ends before the player can spam without penalty.
*/

/**
* The level the volume should be reduced to when the game loses focus.
*/

/**
* Otherwise known as "The FuckCunt Variable"
*/

/**
* The maximum number of previous file paths for the Chart Editor to remember.
*/

/**
* The separator between an asset library and the asset path.
*/

/**
* The scale factor to use when increasing the size of pixel art graphics.
*/

/**
* The volume at which to play the countdown before the song starts.
*/

/**
* The horizontal offset of the strumline from the left edge of the screen.
*/

/**
* The vertical offset of the strumline from the top edge of the screen.
*/

/**
* The rate at which the camera lerps to its target.
* 0.04 = 4% of distance per frame.
*/

/**
* Default period value for vibration.
*/

/**
* Default duration value for vibration.
*/

/**
* Min vibration amplitude.
*/

/**
* Default vibration amplitude.
*/

/**
* Max vibration amplitude.
*/

/**
* Default vibration sharpness.
*/

/**
* The path where our save data will be stored.
*/

/**
* The name of our save slot.
*/

/**
* The legacy path where our save data was saved. Used for backwards compatibility.
*/

/**
* The legacy save slot name, used for backwards compatibility.
*/

/**
* We always use this save slot.
* Alter this if you want to use a different save slot.
*/
}
