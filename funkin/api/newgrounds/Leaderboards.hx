package funkin.api.newgrounds;


/**
* Handles interactions with the leaderboards on the Newgrounds website.
*/
class Leaderboards
{
/**
* Retrieve the leaderboard data via the Newgrounds API.
* @return The leaderboard data.
*/
public static function listLeaderboardData():Map<Leaderboard, LeaderboardData>
{
{
}

}

/**
* Submit a score to Newgrounds.
* @param leaderboard The leaderboard to submit to.
* @param score The score to submit.
* @param tag An optional tag to attach to the score.
*/
public static function submitScore(leaderboard:Leaderboard, score:Int, ?tag:String):Void
{
{
}

{
{
leaderboardData.postScore(score, function(outcome:Outcome<CallError>):Void
{
switch (outcome)
{
case SUCCESS:
case FAIL(error):
}
});
}
}
}

/**
* Request to receive scores from Newgrounds.
* @param leaderboard The leaderboard to fetch scores from.
* @param params Additional parameters for fetching the score.
*/
public static function requestScores(leaderboard:Leaderboard, ?params:RequestScoresParams)
{



leaderboardData.requestScores(params?.limit ?? 10, params?.skip ?? 0, params?.period ?? ALL, params?.social ?? false, params?.tag, user,
function(outcome:Outcome<CallError>):Void
{
switch (outcome)
{
case SUCCESS:

case FAIL(error):
}
});
}

/**
* Submit a score for a Story Level to Newgrounds.
*
* @param levelId The ID for the story level.
* @param difficultyId The current difficulty.
* @param score The score to submit.
*/
public static function submitLevelScore(levelId:String, difficultyId:String, score:Int):Void
{
Leaderboards.submitScore(Leaderboard.getLeaderboardByLevel(levelId), score, tag);
}

/**
* Submit a score for a song to Newgrounds.
*
* @param songId The ID for the song.
* @param difficultyId The current difficulty.
* @param score The score to submit.
*/
public static function submitSongScore(songId:String, difficultyId:String, score:Int):Void
{
Leaderboards.submitScore(Leaderboard.getLeaderboardBySong(songId, difficultyId), score, tag);
}
}

/**
* Wrapper for `Leaderboards` that prevents submitting scores.
*/
class LeaderboardsSandboxed
{
/**
* Get the leaderboard for a given song and difficulty.
*
* @param songId The ID for the song.
* @param difficultyId The current difficulty, suffixed with the variation, like `easy-pico` or `nightmare`.
* @return The Leaderboard ID for the given level and difficulty.
*/
public static function getLeaderboardBySong(songId:String, difficultyId:String):Leaderboard
{
}

/**
* Get the leaderboard for a given story level and difficulty.
* @param levelId The ID for the story level.
* @return The Leaderboard ID for the given level and difficulty.
*/
public static function getLeaderboardByLevel(levelId:String):Leaderboard
{
}

/**
* Request to receive scores from Newgrounds.
* @param leaderboard The leaderboard to fetch scores from.
* @param params Additional parameters for fetching the score.
*/
public function requestScores(leaderboard:Leaderboard, params:RequestScoresParams)
{
Leaderboards.requestScores(leaderboard, params);
}
}

/**
* Additional parameters for `Leaderboards.requestScores()`
*/
typedef RequestScoresParams =
{
/**
* How many scores to include in a list.
* @default `10`
*/

/**
* How many scores to skip before starting the list.
* @default `0`
*/

/**
* The time-frame to pull the scores from.
* @default `Period.ALL`
*/

/**
* If true, only scores by the user and their friends will be loaded. Ignored if no user is set.
* @default `false`
*/

/**
* An optional tag to filter the results by.
* @default `null`
*/

/**
* If true, only the scores from the currently logged in user will be loaded.
* Additionally, if `social` is set to true, the scores of the user's friend will be loaded.
* @default `false`
*/

}

/**
* An enumeration of Newgrounds leaderboards for the game's levels and songs.
*/
enum abstract Leaderboard(Int) from Int to Int
{
/**
* Represents an undefined or invalid leaderboard.
*/

//
//

//
//










/**
* Get the numeric ID for the leaderboard on the Newgrounds site.
* @return The numeric ID for the leaderboard.
*/
public function getId():Int
{
}

/**
* Get the leaderboard for a given level and difficulty.
* @param levelId The ID for the story level.
* @return The Leaderboard ID for the given level and difficulty.
*/
public static function getLeaderboardByLevel(levelId:String):Leaderboard
{
switch (levelId)
{
case "week1":
case "week2":
case "week3":
case "week4":
case "week5":
case "week6":
case "week7":
case "weekend1":
default:
}
}

/**
* Get the leaderboard for a given song and difficulty.
*
* @param songId The ID for the song.
* @param difficulty The current difficulty, suffixed with the variation, like `easy-pico` or `nightmare`.
* @return The Leaderboard ID for the given level and difficulty.
*/
public static function getLeaderboardBySong(songId:String, difficulty:String):Leaderboard
{

{
}
else if (Constants.DEFAULT_DIFFICULTY_LIST_ERECT.contains(difficulty))
{
}

switch (variation)
{
case "pico":
switch (songId)
{
case "bopeebo":
case "fresh":
case "dadbattle":
case "spookeez":
case "south":
case "pico":
case "philly-nice":
case "blammed":
case "cocoa":
case "eggnog":
case "senpai":
case "roses":
case "ugh":
case "guns":
case "stress":
default:
}
case "bf":
switch (songId)
{
case "darnell":
case "lit-up":
default:
}
case "erect":
switch (songId)
{
case "bopeebo":
case "fresh":
case "dadbattle":
case "spookeez":
case "south":
case "pico":
case "philly-nice":
case "blammed":
case "satin-panties":
case "high":
case "cocoa":
case "eggnog":
case "senpai":
case "roses":
case "thorns":
case "ugh":
case "darnell":
default:
}
case "default":
switch (songId)
{
case "tutorial":
case "bopeebo":
case "fresh":
case "dadbattle":
case "spookeez":
case "south":
case "monster":
case "pico":
case "philly-nice":
case "blammed":
case "satin-panties":
case "high":
case "milf":
case "cocoa":
case "eggnog":
case "winter-horrorland":
case "senpai":
case "roses":
case "thorns":
case "ugh":
case "guns":
case "stress":
case "darnell":
case "lit-up":
case "2hot":
case "blazin":
case "spaghetti":
default:
}
default:
}
}
}
