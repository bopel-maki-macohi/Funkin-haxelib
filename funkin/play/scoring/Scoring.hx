package funkin.play.scoring;


/**
* Which system to use when scoring and judging notes.
*/
enum abstract ScoringSystem(String)
{
/**
* The scoring system used in versions of the game Week 6 and older.
* Scores the player based on judgement, represented by a step function.
*/

/**
* The scoring system used in Week 7. It has tighter scoring windows than Legacy.
* Scores the player based on judgement, represented by a step function.
*/

/**
* Points Based On Timing scoring system, version 1
* Scores the player based on the offset based on timing, represented by a sigmoid function.
*/
}

/**
* A static class which holds any functions related to scoring.
*/
class Scoring
{
/**
* Determine the score a note receives under a given scoring system.
* @param msTiming The difference between the note's time and when it was hit.
* @param scoringSystem The scoring system to use.
* @return The score the note receives.
*/
public static function scoreNote(msTiming:Float, scoringSystem:ScoringSystem = PBOT1):Int
{
{
case LEGACY: scoreNoteLEGACY(msTiming);
case WEEK7: scoreNoteWEEK7(msTiming);
case PBOT1: scoreNotePBOT1(msTiming);
default:
0;
}
}

/**
* Determine the judgement a note receives under a given scoring system.
* @param msTiming The difference between the note's time and when it was hit.
* @param scoringSystem The scoring system to use.
* @return The judgement the note receives.
*/
public static function judgeNote(msTiming:Float, scoringSystem:ScoringSystem = PBOT1):String
{
{
case LEGACY: judgeNoteLEGACY(msTiming);
case WEEK7: judgeNoteWEEK7(msTiming);
case PBOT1: judgeNotePBOT1(msTiming);
default:
'miss';
}
}

public static function getMissScore(scoringSystem:ScoringSystem = PBOT1):Int
{
{
case LEGACY: LEGACY_MISS_SCORE;
case WEEK7: WEEK7_MISS_SCORE;
case PBOT1: PBOT1_MISS_SCORE;
default:
0;
}
}

/**
* The maximum score a note can receive.
*/
public static final PBOT1_MAX_SCORE:Int = 500;

/**
* The offset of the sigmoid curve for the scoring function.
*/
public static final PBOT1_SCORING_OFFSET:Float = 54.99;

/**
* The slope of the sigmoid curve for the scoring function.
*/
public static final PBOT1_SCORING_SLOPE:Float = 0.080;

/**
* The minimum score a note can receive while still being considered a hit.
*/
public static final PBOT1_MIN_SCORE:Float = 9.0;

/**
* The score a note receives when it is missed.
*/
public static final PBOT1_MISS_SCORE:Int = -100;

/**
* The threshold at which a note hit is considered perfect and always given the max score.
*/
public static final PBOT1_PERFECT_THRESHOLD:Float = 5.0; // 5ms

/**
* The threshold at which a note hit is considered missed.
* `160ms`
*/
public static final PBOT1_MISS_THRESHOLD:Float = 160.0;

/**
* The time within which a note is considered to have been hit with the Killer judgement.
* `~7.5% of the hit window, or 12.5ms`
*/
public static final PBOT1_KILLER_THRESHOLD:Float = 12.5;

/**
* The time within which a note is considered to have been hit with the Sick judgement.
* `~25% of the hit window, or 45ms`
*/
public static final PBOT1_SICK_THRESHOLD:Float = 45.0;

/**
* The time within which a note is considered to have been hit with the Good judgement.
* `~55% of the hit window, or 90ms`
*/
public static final PBOT1_GOOD_THRESHOLD:Float = 90.0;

/**
* The time within which a note is considered to have been hit with the Bad judgement.
* `~85% of the hit window, or 135ms`
*/
public static final PBOT1_BAD_THRESHOLD:Float = 135.0;

/**
* The time within which a note is considered to have been hit with the Shit judgement.
* `100% of the hit window, or 160ms`
*/
public static final PBOT1_SHIT_THRESHOLD:Float = 160.0;

static function scoreNotePBOT1(msTiming:Float):Int
{

{
case(_ > PBOT1_MISS_THRESHOLD) => true:
PBOT1_MISS_SCORE;
case(_ < PBOT1_PERFECT_THRESHOLD) => true:
PBOT1_MAX_SCORE;
default:


score;
}
}

static function judgeNotePBOT1(msTiming:Float):String
{

{
case(_ <= PBOT1_SICK_THRESHOLD) => true:
'sick';
case(_ <= PBOT1_GOOD_THRESHOLD) => true:
'good';
case(_ <= PBOT1_BAD_THRESHOLD) => true:
'bad';
case(_ <= PBOT1_SHIT_THRESHOLD) => true:
'shit';
default:
'miss';
}
}

/**
* The window of time in which a note is considered to be hit, on the Funkin Legacy scoring system.
* Currently equal to 10 frames at 60fps, or ~166ms.
*/
public static final LEGACY_HIT_WINDOW:Float = (10 / 60) * 1000; // 166.67 ms hit window (10 frames at 60fps)

/**
* The threshold at which a note is considered a "Sick" hit rather than another judgement.
* Represented as a percentage of the total hit window.
*/
public static final LEGACY_SICK_THRESHOLD:Float = 0.2;

/**
* The threshold at which a note is considered a "Good" hit rather than another judgement.
* Represented as a percentage of the total hit window.
*/
public static final LEGACY_GOOD_THRESHOLD:Float = 0.75;

/**
* The threshold at which a note is considered a "Bad" hit rather than another judgement.
* Represented as a percentage of the total hit window.
*/
public static final LEGACY_BAD_THRESHOLD:Float = 0.9;

/**
* The score a note receives when hit within the Shit threshold, rather than a miss.
* Represented as a percentage of the total hit window.
*/
public static final LEGACY_SHIT_THRESHOLD:Float = 1.0;

/**
* The score a note receives when hit within the Sick threshold.
*/
public static final LEGACY_SICK_SCORE:Int = 350;

/**
* The score a note receives when hit within the Good threshold.
*/
public static final LEGACY_GOOD_SCORE:Int = 200;

/**
* The score a note receives when hit within the Bad threshold.
*/
public static final LEGACY_BAD_SCORE:Int = 100;

/**
* The score a note receives when hit within the Shit threshold.
*/
public static final LEGACY_SHIT_SCORE:Int = 50;

/**
* The score a note receives when missed.
*/
public static final LEGACY_MISS_SCORE:Int = -10;

static function scoreNoteLEGACY(msTiming:Float):Int
{

{
case(_ < LEGACY_HIT_WINDOW * LEGACY_SICK_THRESHOLD) => true:
LEGACY_SICK_SCORE;
case(_ < LEGACY_HIT_WINDOW * LEGACY_GOOD_THRESHOLD) => true:
LEGACY_GOOD_SCORE;
case(_ < LEGACY_HIT_WINDOW * LEGACY_BAD_THRESHOLD) => true:
LEGACY_BAD_SCORE;
case(_ < LEGACY_HIT_WINDOW * LEGACY_SHIT_THRESHOLD) => true:
LEGACY_SHIT_SCORE;
default:
0;
}
}

static function judgeNoteLEGACY(msTiming:Float):String
{

{
case(_ <= LEGACY_HIT_WINDOW * LEGACY_SICK_THRESHOLD) => true:
'sick';
case(_ <= LEGACY_HIT_WINDOW * LEGACY_GOOD_THRESHOLD) => true:
'good';
case(_ <= LEGACY_HIT_WINDOW * LEGACY_BAD_THRESHOLD) => true:
'bad';
case(_ <= LEGACY_HIT_WINDOW * LEGACY_SHIT_THRESHOLD) => true:
'shit';
default:
'miss';
}
}

/**
* The window of time in which a note is considered to be hit, on the Funkin Classic scoring system.
* Same as L 10 frames at 60fps, or ~166ms.
*/
public static final WEEK7_HIT_WINDOW:Float = LEGACY_HIT_WINDOW;

public static final WEEK7_BAD_THRESHOLD:Float = 0.8; // 80% of the hit window, or ~125ms
public static final WEEK7_GOOD_THRESHOLD:Float = 0.55; // 55% of the hit window, or ~91ms
public static final WEEK7_SICK_THRESHOLD:Float = 0.2; // 20% of the hit window, or ~33ms
public static final WEEK7_MISS_SCORE:Int = -10;
public static final WEEK7_SHIT_SCORE:Int = 50;
public static final WEEK7_BAD_SCORE:Int = 100;
public static final WEEK7_GOOD_SCORE:Int = 200;
public static final WEEK7_SICK_SCORE:Int = 350;

static function scoreNoteWEEK7(msTiming:Float):Int
{

{
case(_ < WEEK7_HIT_WINDOW * WEEK7_SICK_THRESHOLD) => true:
LEGACY_SICK_SCORE;
case(_ < WEEK7_HIT_WINDOW * WEEK7_GOOD_THRESHOLD) => true:
LEGACY_GOOD_SCORE;
case(_ < WEEK7_HIT_WINDOW * WEEK7_BAD_THRESHOLD) => true:
LEGACY_BAD_SCORE;
case(_ < WEEK7_HIT_WINDOW) => true:
LEGACY_SHIT_SCORE;
default:
0;
}

{
}
else if (absTiming < WEEK7_HIT_WINDOW * WEEK7_GOOD_THRESHOLD)
{
}
else if (absTiming < WEEK7_HIT_WINDOW * WEEK7_BAD_THRESHOLD)
{
}
else if (absTiming < WEEK7_HIT_WINDOW)
{
}
else
{
}
}

static function judgeNoteWEEK7(msTiming:Float):String
{
{
}
else if (absTiming <= WEEK7_HIT_WINDOW * WEEK7_GOOD_THRESHOLD)
{
}
else if (absTiming <= WEEK7_HIT_WINDOW * WEEK7_BAD_THRESHOLD)
{
}
else if (absTiming <= WEEK7_HIT_WINDOW)
{
}
else
{
}
}

public static function calculateRank(scoreData:Null<SaveScoreData>):Null<ScoringRank>
{


{
}




{
}
else if (completionAmount >= Constants.RANK_EXCELLENT_THRESHOLD)
{
}
else if (completionAmount >= Constants.RANK_GREAT_THRESHOLD)
{
}
else if (completionAmount >= Constants.RANK_GOOD_THRESHOLD)
{
}
else
{
}
}

/**
* Calculates the "completion" of a song, based on how many GOOD and SICK notes were hit, minus how many were missed
* Top secret funkin crew patented algorithm
* TODO: Could possibly move more of the "tallying" related handling here.
*       In FreeplayState we make sure it's clamped between 0 and 1, and we probably always want to assume that?
*
* @param tallies
* @return Float Completion, as a float value between 0 and 1. If `tallies` is `null`, we return 0;
*/
public static function tallyCompletion(?tallies:SaveScoreTallyData):Float
{
1); // Needs to be clamped to make sure Perfect ranks are saved properly
}
}

enum abstract ScoringRank(String)
{

/**
* Converts ScoringRank to an integer value for comparison.
* Better ranks should be tied to a higher value.
*/
static function getValue(rank:Null<ScoringRank>):Int
{
switch (rank)
{
case PERFECT_GOLD:
case PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
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


/**
* Delay in seconds
*/
public function getMusicDelay():Float
{
switch (abstract)
{
case PERFECT_GOLD | PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getBFDelay():Float
{
switch (abstract)
{
case PERFECT_GOLD | PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getFlashDelay():Float
{
switch (abstract)
{
case PERFECT_GOLD | PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getHighscoreDelay():Float
{
switch (abstract)
{
case PERFECT_GOLD | PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getFreeplayRankIconAsset():String
{
switch (abstract)
{
case PERFECT_GOLD:
case PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getHorTextAsset()
{
switch (abstract)
{
case PERFECT_GOLD:
case PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getVerTextAsset()
{
switch (abstract)
{
case PERFECT_GOLD:
case PERFECT:
case EXCELLENT:
case GREAT:
case GOOD:
case SHIT:
default:
}
}

public function getRankingFreeplayColor()
{
{
case SHIT:
0xFF6044FF;
case GOOD:
0xFFEF8764;
case GREAT:
0xFFEAF6FF;
case EXCELLENT:
0xFFFDCB42;
case PERFECT:
0xFFFF58B4;
case PERFECT_GOLD:
0xFFFFB619;
default:
0xFF6044FF;
}
}

public function toString():String
{
}
}
