

/**
* Handles the note scrollbar preview in the chart editor.
*/
class ChartEditorNotePreview extends FlxSprite
{
//
//



public function new(height:Int)
{
}

/**
* Build the initial sprite for the preview.
*/
function buildBackground():Void
{
}

/**
* Erase all notes from the preview.
*/
public function erase():Void
{
}

/**
* Add a single note to the preview.
* @param note The data for the note.
* @param songLengthInPixels The total length of the song in pixels.
*/
public function addNote(note:SongNoteData, songLengthInPixels:Int, previewType:NotePreviewType = None):Void
{
}

/**
* Add a song event to the preview.
* @param event The data for the event.
* @param songLengthInPixels The total length of the song in pixels.
* @param isSelection If current event is selected, which then it's forced to be yellow.
*/
public function addEvent(event:SongEventData, songLengthInPixels:Int, isSelection:Bool = false):Void
{
}

/**
* Add an array of notes to the preview.
* @param notes The data for the notes.
* @param songLengthInPixels The total length of the song in pixels.
*/
public function addNotes(notes:Array<SongNoteData>, songLengthInPixels:Int):Void
{
for (note in notes)
{
}
}

/**
* Add an array of selected notes to the preview.
* @param notes The data for the notes.
* @param songLengthInPixels The total length of the song in pixels.
*/
public function addSelectedNotes(notes:Array<SongNoteData>, songLengthInPixels:Int):Void
{
for (note in notes)
{
}
}

/**
* Add an array of overlapping notes to the preview.
* @param notes The data for the notes
* @param songLengthInPixels The total length of the song in pixels.
*/
public function addOverlappingNotes(notes:Array<SongNoteData>, songLengthInPixels:Int):Void
{
for (note in notes)
{
}
}

/**
* Add an array of events to the preview.
* @param events The data for the events.
* @param songLengthInPixels The total length of the song in pixels.
*/
public function addEvents(events:Array<SongEventData>, songLengthInPixels:Int):Void
{
for (event in events)
{
}
}

/**
* Add an array of selected events to the preview.
* @param events The data for the events.
* @param songLengthInPixels The total length of the song in pixels.
*/
public function addSelectedEvents(events:Array<SongEventData>, songLengthInPixels:Int):Void
{
for (event in events)
{
}
}

/**
* Draws a note on the preview.
* @param dir Note data.
* @param mustHit False if opponent, true if player.
* @param strumTimeInMs Time in milliseconds to strum the note.
* @param songLengthInPixels Length of the song in pixels.
* @param previewType If the note should forcibly be colored as selected or overlapping.
*/
public function drawNote(dir:Int, mustHit:Bool, strumTimeInMs:Int, songLengthInPixels:Int, previewType:NotePreviewType = None):Void
{
{


switch (previewType)
{
case Selection:
case Overlapping:
default:
}



}

function eraseNote(dir:Int, mustHit:Bool, strumTimeInMs:Int, songLengthInPixels:Int):Void
{



}

inline function drawRect(noteX:Float, noteY:Float, width:Int, height:Int, color:FlxColor):Void
{
}
}

enum NotePreviewType
{
}
