package funkin.api.newgrounds;


/**
* Use Newgrounds to perform basic telemetry. Ignore if not logged in to Newgrounds.
*/
class Events
{

public static function logEvent(eventName:String):Void
{
{

{
eventHandler.logEvent(sanitizedEventName).addOutcomeHandler(outcomeHandler).send();
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
logEvent('start-game');
}

public static inline function logStartSong(songId:String, variation:String):Void
{
logEvent('start-song_${songId}-${variation}');
}

public static inline function logFailSong(songId:String, variation:String):Void
{
logEvent('blueballs_${songId}-${variation}');
}

public static inline function logCompleteSong(songId:String, variation:String):Void
{
logEvent('complete-song_${songId}-${variation}');
}

public static inline function logStartLevel(levelId:String):Void
{
logEvent('start-level_${levelId}');
}

public static inline function logCompleteLevel(levelId:String):Void
{
logEvent('complete-level_${levelId}');
}

public static inline function logEarnRank(rankName:String):Void
{
logEvent('earn-rank_${rankName}');
}

public static inline function logWatchCartoon():Void
{
logEvent('watch-cartoon');
}


public static inline function logOpenCredits():Void
{
logEvent('open-credits');
}
}
