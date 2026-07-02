
/**
* A core class which handles tracking score and combo for the current song.
*/
class Highscore
{
/**
* Keeps track of notes hit for the current song
* and how accurate you were with each note (bad, missed, shit, etc.)
*/

/**
* Keeps track of notes hit for the current WEEK / level
* for use with storymode, or likely any other "playlist" esque option
*/

/**
* Produces a new Tallies object which represents the sum of two existing Tallies
* @param newTally The first tally
* @param baseTally The second tally
* @return The combined tally
*/
public static function combineTallies(newTally:Tallies, baseTally:Tallies):Tallies
{


}
}

abstract Tallies(RawTallies)
{
public function new()
{
this = {
combo: 0,
missed: 0,
shit: 0,
bad: 0,
good: 0,
sick: 0,
totalNotes: 0,
totalNotesHit: 0,
maxCombo: 0,
score: 0,
isNewHighscore: false
}
}
}

/**
* A structure object containing the data for highscore tallies.
*/
typedef RawTallies =
{

/**
* How many notes you let scroll by.
*/




/**
* How many notes total that you hit. (NOT how many notes total in the song!)
*/

/**
* How many notes in the current chart
*/
}
