


/**
* Utility functions for working with song data, including note data, event data, metadata, etc.
*/
class SongDataUtils
{
/**
* Given an array of SongNoteData objects, return a new array of SongNoteData objects
* whose timestamps are shifted by the given amount.
* Does not mutate the original array.
*
* @param notes The notes to modify.
* @param offset The time difference to apply in milliseconds.
*/
public static function offsetSongNoteData(notes:Array<SongNoteData>, offset:Float):Array<SongNoteData>
{
{

}

/**
* Given an array of SongEventData objects, return a new array of SongEventData objects
* whose timestamps are shifted by the given amount.
* Does not mutate the original array.
*
* @param events The events to modify.
* @param offset The time difference to apply in milliseconds.
*/
public static function offsetSongEventData(events:Array<SongEventData>, offset:Float):Array<SongEventData>
{
{
}

/**
* Given an array of SongNoteData objects, return a new array of SongNoteData objects
* which excludes any notes whose timestamps are outside of the given range.
* @param notes The notes to modify.
* @param startTime The start of the range in milliseconds.
* @param endTime The end of the range in milliseconds.
* @return The filtered array of notes.
*/
public static function clampSongNoteData(notes:Array<SongNoteData>, startTime:Float, endTime:Float):Array<SongNoteData>
{
{
}

/**
* Given an array of SongEventData objects, return a new array of SongEventData objects
* which excludes any events whose timestamps are outside of the given range.
* @param events The events to modify.
* @param startTime The start of the range in milliseconds.
* @param endTime The end of the range in milliseconds.
* @return The filtered array of events.
*/
public static function clampSongEventData(events:Array<SongEventData>, startTime:Float, endTime:Float):Array<SongEventData>
{
{
}

/**
* Return a new array without a certain subset of notes from an array of SongNoteData objects.
* Does not mutate the original array.
*
* @param notes The array of notes to be subtracted from.
* @param subtrahend The notes to remove from the `notes` array. Yes, subtrahend is a real word.
*/
public static function subtractNotes(notes:Array<SongNoteData>, subtrahend:Array<SongNoteData>)
{

{
for (x in subtrahend)
{
}


}

/**
* Return a new array without a certain subset of events from an array of SongEventData objects.
* Does not mutate the original array.
*
* @param events The array of events to be subtracted from.
* @param subtrahend The events to remove from the `events` array. Yes, subtrahend is a real word.
*/
public static function subtractEvents(events:Array<SongEventData>, subtrahend:Array<SongEventData>)
{

{
for (x in subtrahend)
{
}
}

/**
* Create an array of notes whose note data is flipped (player becomes opponent and vice versa)
* Does not mutate the original array.
*/
public static function flipNotes(notes:Array<SongNoteData>, strumlineSize:Int = 4):Array<SongNoteData>
{
{

else

}

/**
* Create an array of notes whose note data is mirrored.
* Does not mutate the original array.
*
* @param flip Flip the notes if the notes given are in both strumlines, so that result isn't inverted when mirrored.
* @param mirrorX Mirror along the X axis, aka the directions of the notes.
* @param mirrorY Mirror along the Y axis, aka the time of the notes.
*/
public static function mirrorNotes(notes:Array<SongNoteData>, strumlineSize:Int = 4, flip:Bool = false, mirrorX:Bool = true,
mirrorY:Bool = true):Array<SongNoteData>
{
for (note in notes)
{
{
}
}

{
}

{

{
else
}
{
}

}

/**
* Prepare an array of notes to be used as the clipboard data.
*
* Offset the provided array of notes such that the first note is at 0 milliseconds.
*/
public static function buildNoteClipboard(notes:Array<SongNoteData>, ?timeOffset:Int):Array<SongNoteData>
{
}

/**
* Prepare an array of events to be used as the clipboard data.
*
* Offset the provided array of events such that the first event is at 0 milliseconds.
*/
public static function buildEventClipboard(events:Array<SongEventData>, ?timeOffset:Int):Array<SongEventData>
{
}

/**
* Sort an array of notes by strum time.
*/
public static function sortNotes(notes:Array<SongNoteData>, desc:Bool = false):Array<SongNoteData>
{
notes.sort(function(a:SongNoteData, b:SongNoteData):Int
{
}

/**
* Sort an array of events by strum time.
*/
public static function sortEvents(events:Array<SongEventData>, desc:Bool = false):Array<SongEventData>
{
events.sort(function(a:SongEventData, b:SongEventData):Int
{
}

/**
* Sort an array of notes by strum time.
*/
public static function sortTimeChanges(timeChanges:Array<SongTimeChange>, desc:Bool = false):Array<SongTimeChange>
{
timeChanges.sort(function(a:SongTimeChange, b:SongTimeChange):Int
{
}

/**
* Serialize note and event data and write it to the clipboard.
*/
public static function writeItemsToClipboard(data:SongClipboardItems):Void
{


}

/**
* Read an array of note data from the clipboard and deserialize it.
*/
public static function readItemsFromClipboard():SongClipboardItems
{


{
for (error in parser.errors)
valid: false,
notes: [],
events: []
}
else
{
}
}

/**
* Filter a list of notes to only include notes that are within the given time range.
*/
public static function getNotesInTimeRange(notes:Array<SongNoteData>, start:Float, end:Float):Array<SongNoteData>
{
{
}

/**
* Filter a list of events to only include events that are within the given time range.
*/
public static function getEventsInTimeRange(events:Array<SongEventData>, start:Float, end:Float):Array<SongEventData>
{
{
}

/**
* Filter a list of notes to only include notes whose data is within the given range, inclusive.
*/
public static function getNotesInDataRange(notes:Array<SongNoteData>, start:Int, end:Int):Array<SongNoteData>
{
{
}

/**
* Filter a list of notes to only include notes whose data is one of the given values.
*/
public static function getNotesWithData(notes:Array<SongNoteData>, data:Array<Int>):Array<SongNoteData>
{
{
}

/**
* Filter a list of events to only include events whose kind is one of the given values.
*/
public static function getEventsWithKind(events:Array<SongEventData>, kinds:Array<String>):Array<SongEventData>
{
{
}
}

typedef SongClipboardItems =
{
}
