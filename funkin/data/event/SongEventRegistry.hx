package funkin.data.event;


/**
* This class statically handles the parsing of internal and scripted song event handlers.
*/
class SongEventRegistry
{
/**
* Every built-in event class must be added to this list.
* Thankfully, with the power of `ClassMacro`, this is done automatically.
*/

/**
* Map of internal handlers for song events.
* These may be either `ScriptedSongEvents` or built-in classes extending `SongEvent`.
*/

public static function loadEventCache():Void
{
clearEventCache();

//
//
registerBaseEvents();
registerScriptedEvents();
}

static function registerBaseEvents()
{
for (eventCls in BUILTIN_EVENTS)
{


{
eventCache.set(event.id, event);
}
else
{
}
}
}

static function registerScriptedEvents()
{

for (eventCls in scriptedEventClassNames)
{

{
eventCache.set(event.id, event);
}
else
{
}
}
}

public static function listEventIds():Array<String>
{
}

public static function listEvents():Array<SongEvent>
{
}

public static function getEvent(id:String):Null<SongEvent>
{
}

public static function getEventSchema(id:String):Null<SongEventSchema>
{

}

static function clearEventCache()
{
eventCache.clear();
}

public static function handleEvent(data:SongEventData):Void
{

{
eventHandler.handleEvent(data);
}
else
{
}

data.activated = true;
}

public static inline function handleEvents(events:Array<SongEventData>):Void
{
for (event in events)
{
handleEvent(event);
}
}

/**
* Caching the index for the next event to query greatly reduces lag.
* Kinda nasty that it's tied to a static class though.
*/

/**
* Retrieve the list of events to activate this frame.
*
* @param events The list of available song events.
* @param currentTime The current time in milliseconds.
* @param startIndex The index to start querying from.
*   Defaults to the index of the last event handled.
* @return The list of events which haven't been handled yet.
*/
public static function queryEvents(events:Array<SongEventData>, currentTime:Float, ?startIndex:Int):Array<SongEventData>
{
startIndex ??= nextEventIndex;


for (i in startIndex...events.length)
{

{
nextEventIndex = i;
}

result.push(events[i]);
}

}

/**
* The currentTime has jumped far ahead or back.
* If we moved back in time, we need to reset all the events in that space.
* If we moved forward in time, we need to skip all the events in that space.
*/
public static function handleSkippedEvents(events:Array<SongEventData>, currentTime:Float):Void
{
for (event in events)
{
{
event.activated = false;
}

{
event.activated = true;
}
}
}

/**
* Reset activation of all the provided events.
*/
public static function resetEvents(events:Array<SongEventData>):Void
{
events.sort(SortUtil.eventDataByTime.bind(FlxSort.ASCENDING));
nextEventIndex = 0;
allEventHandlers.resize(0);

for (event in events)
{
event.activated = false;

}
}


public static inline function callEvent(scriptEvent:ScriptEvent):Void
{
for (event in allEventHandlers)
{
ScriptEventDispatcher.callEvent(event, scriptEvent);
}
}
}
