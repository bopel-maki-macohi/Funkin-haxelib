package funkin.util;


/**
* A structure to hold the hit window values.
* @param start The start time of the hit window.
* @param center The center time of the hit window.
* @param end The end time of the hit window.
*/
typedef HitWindow =
{
}

/**
* A structure to hold the result of a hit window check for botplay.
* @param botplayHit True if the note was hit by botplay.
* @param cont True if the game should continue after the hit.
*/
typedef HitWindowRes =
{
}

/**
* GRhythmUtil
* A utility class for processing hit windows, and calculating the y-position of notes.
*/
class GRhythmUtil
{
/**
* Mirror the note direction.
* @param noteData The original note direction.
* @return The mirrored note direction.
*/
public static function mirrorNoteDirection(noteData:Int):Int
{

}

/**
* Get the current hit window for a note.
* @param note The note to get the hit window for.
* @return A HitWindow object containing the start, center, and end times of the hit window.
*/
public static function getHitWindow(note:NoteSprite):HitWindow
{
start: note.strumTime - Constants.HIT_WINDOW_MS,
center: note.strumTime,
end: note.strumTime + Constants.HIT_WINDOW_MS
};
}

/**
* Process the hit window for a note.
* @param note The note to process.
* @param isControlled True if the note is controlled by the player, false otherwise.
* @return A HitWindowRes object containing the result of the hit window check.
*/
public static function processWindow(note:NoteSprite, isControlled:Bool = true, ?inUseConductor:Conductor = null):HitWindowRes
{



{
}

{
note.tooEarly = false;
note.hasMissed = true;
note.mayHit = false;
}



{
note.tooEarly = false;
note.hasMissed = false;
note.mayHit = true;
}

note.tooEarly = true;
note.mayHit = false;
note.hasMissed = false;

}

/**
* Get the y-position of a note based on its strum time.
* @param strumTime The strum time of the note.
* @param scrollSpeed The scroll speed of the strumline.
* @param downscroll Whether the strumline is in downscroll mode.
* @param conductorInUse The conductor to use for calculating the y-position.
* @return The y-position of the note.
*/
public static function getNoteY(strumTime:Float, scrollSpeed:Float, downscroll:Bool = false, ?conductorInUse:Conductor = null):Float
{
}
}
