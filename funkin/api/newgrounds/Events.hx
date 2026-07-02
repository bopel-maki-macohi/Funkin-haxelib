

/**
* Use Newgrounds to perform basic telemetry. Ignore if not logged in to Newgrounds.
*/
class Events
{

public static function logEvent(eventName:String):Void
{
{

{
}
}
}

static function onEventLogged(eventName:String, outcome:CallOutcome<LogEventData>)
{
switch (outcome)
{
case SUCCESS(data):
case FAIL(outcome):
switch (outcome)
{
case HTTP(error):
case RESPONSE(error):
case RESULT(error):
switch (error.code)
{
case 103: // Invalid custom event name
default:
}
}
}
}

public static inline function logStartGame():Void
{
}

public static inline function logStartSong(songId:String, variation:String):Void
{
}

public static inline function logFailSong(songId:String, variation:String):Void
{
}

public static inline function logCompleteSong(songId:String, variation:String):Void
{
}

public static inline function logStartLevel(levelId:String):Void
{
}

public static inline function logCompleteLevel(levelId:String):Void
{
}

public static inline function logEarnRank(rankName:String):Void
{
}

public static inline function logWatchCartoon():Void
{
}


public static inline function logOpenCredits():Void
{
}
}
