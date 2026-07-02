package funkin.api.newgrounds;


/**
* Handles interactions with the medals on the Newgrounds website.
*/
class Medals
{
/**
* A cache for the medal data fetched from the local `medals.json`.
*/

/**
* Retrieve the leaderboard data via the Newgrounds API.
* @return The leaderboard data.
*/
public static function listMedalData():Map<Medal, MedalData>
{

{
}

}

/**
* Awards the player a specific medal, updating their Newgrounds account and
* displaying the corresponding popup.
* @param medal The medal to be awarded.
*/
public static function award(medal:Medal):Void
{
{
{
}
else if (!medalData.unlocked)
{
medalData.sendUnlock();

BitmapData.loadFromFile("https:" + medalData.icon).onComplete(function(bmp:BitmapData)
{
medalGraphic.persist = true;
NewgroundsMedalPlugin.play(medalData.value, medalData.name, medalGraphic);
});

{
})[0];


str = str.replace("data:image/png;base64,", "").trim();
{
medalGraphic = FlxGraphic.fromBitmapData(bitmapData);
medalGraphic.persist = true;
}

NewgroundsMedalPlugin.play(medalData.value, medalData.name, medalGraphic);
}
else
{
}
}
else
{
}
}

/**
* Loads the full medal data from local JSON data.
*/
public static function loadMedalJSON():Void
{


parser.ignoreUnknownVariables = false;
parser.fromJson(jsonString, jsonPath);

{
for (error in parser.errors)
funkin.data.DataError.printError(error);
medalJSON = [];
}
else
{
medalJSON = parser.value;
}
}

/**
* Fetches the data for a medal from the Newgrounds API.
* @param medal The ID of the medal to fetch.
* @return The fetched medal data.
*/
public static function fetchMedalData(medal:Medal):Null<FetchedMedalData>
{
{
}

id: medalData.id,
name: medalData.name,
description: medalData.description,
icon: medalData.icon,
value: medalData.value,
difficulty: medalData.difficulty,
secret: medalData.secret,
unlocked: medalData.unlocked
}
}

/**
* Awards the player a medal for completing a specific story level.
* @param id The level ID for the story level that was completed.
*/
public static function awardStoryLevel(id:String):Void
{
{
}
Medals.award(medal);
}
}

/**
* Wrapper for `Medals` that prevents awarding medals.
*/
class MedalsSandboxed
{
/**
* Fetches the data for a medal from the Newgrounds API.
* @param medal The ID of the medal to fetch.
* @return The fetched medal data.
*/
public static function fetchMedalData(medal:Medal):Null<FetchedMedalData>
{
}

/**
* Retrieves the medal for completing a specific story level.
* @param id The ID for the story level that was completed.
* @return The medal to award.
*/
public static function getMedalByStoryLevel(id:String):Medal
{
}

/**
* Lists all medals aside from the `Unknown` one.
* @return An array of all medals.
*/
public static function getAllMedals():Array<Medal>
{
}
}

/**
* Contains data for a Medal, but excludes functions like `sendUnlock()`.
*/
typedef FetchedMedalData =
{
}

/**
* Represents NG Medal data in a JSON format.
*/
typedef MedalJSON =
{
/**
* Medal ID to use for release builds
*/

/**
* Medal ID to use for testing builds
*/

/**
* The English name for the medal
*/

/**
* The English name for the medal
*/
}

/**
* An enumeration of all the game's medals.
*/
enum abstract Medal(Int) from Int to Int
{
/**
* Represents an undefined or invalid medal.
*/

/**
* I Said Funkin'!
* Start the game for the first time.
*/

/**
* That's How You Do It!
* Beat Tutorial in Story Mode (on any difficulty).
*/

/**
* More Like Daddy Queerest
* Beat Week 1 in Story Mode (on any difficulty).
*/

/**
* IT IS THE SPOOKY MONTH
* Beat Week 2 in Story Mode (on any difficulty).
*/

/**
* Pico Funny
* Beat Week 3 in Story Mode (on any difficulty).
*/

/**
* Mommy Must Murder
* Beat Week 4 in Story Mode (on any difficulty).
*/

/**
* Yule Tide Joy
* Beat Week 5 in Story Mode (on any difficulty).
*/

/**
* A Visual Novelty
* Beat Week 6 in Story Mode (on any difficulty).
*/

/**
* I <3 JohnnyUtah
* Beat Week 7 in Story Mode (on any difficulty).
*/

/**
* Yo, Really Think So?
* Beat Weekend 1 in Story Mode (on any difficulty).
*/

/**
* Eat It Up!
* Beat Collab 1 in Story Mode (on any difficulty).
*/

/**
* Stay Funky
* Press TAB in Freeplay and unlock your first character.
*/

/**
* A Challenger Appears
* Beat any Pico remix in Freeplay (on any difficulty).
*/

/**
* De-Stressing
* Beat Stress (Pico Mix) in Freeplay (on Normal difficulty or higher).
*/

/**
* L
* Earn a Loss rating on any song (on any difficulty).
*/

/**
* Getting Freaky
* Earn a Perfect rating on any song on Hard difficulty or higher.
* NOTE: Should also be awarded for a Gold Perfect because otherwise that would be annoying.
*/

/**
* You Should Drink More Water
* Earn a Golden Perfect rating on any song on Hard difficulty or higher.
*/

/**
* Harder Than Hard
* Beat any Erect remix in Freeplay on Erect or Nightmare difficulty.
*/

/**
* The Rap God
* Earn a Gold Perfect rating on any song on Nightmare difficulty.
*/

/**
* Just like the game!
* Get freaky on a Friday.
* NOTE: You must beat at least one song on any difficulty.
*/

/**
* Nice
* Earn a rating of EXACTLY 69% (good luck).
*/

/**
* @return The internal ID for the medal.
*/
public function getId():Int
{
}

/**
* Retrieves the medal for completing a specific story level.
* @param levelId The ID for the story level that was completed.
* @return The medal to award.
*/
public static function getMedalByStoryLevel(levelId:String):Medal
{
switch (levelId)
{
case "tutorial":
case "week1":
case "week2":
case "week3":
case "week4":
case "week5":
case "week6":
case "week7":
case "weekend1":
case "sserafim":
default:
}
}

/**
* Lists all medals aside from the `Unknown` one.
* @return An array of all medals.
*/
public static function getAllMedals():Array<Medal>
{
[StartGame, StoryTutorial, StoryWeek1, StoryWeek2, StoryWeek3, StoryWeek4, StoryWeek5, StoryWeek6, StoryWeek7, StoryWeekend1, CharSelect, FreeplayPicoMix, FreeplayStressPico, LossRating, PerfectRatingHard, GoldPerfectRatingHard, ErectDifficulty, GoldPerfectRatingNightmare, FridayNight, Nice];
}
}
