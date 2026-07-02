

/**
* A static extension which provides utility functions for `Array<SongNoteData>`s.
*/
class SongNoteDataArrayTools
{
/**
* Queries whether the provided `SongNoteData` is contained in the provided array.
* The input array must be already sorted by `time`.
* Vastly more efficient than `array.indexOf`.
* This is not crazy or premature optimization, I'm writing this because `ChartEditorState.handleNoteDisplay` is using like 71% of its CPU time on this.
* @param arr The array to search.
* @param note The note to search for.
* @param predicate
* @return The index of the note in the array, or `-1` if it is not present.
*/
public static function fastIndexOf(input:Array<SongNoteData>, note:SongNoteData):Int
{



{

{
}
else if (midNote.time > note.time)
{
}
else if (midNote == note)
{
}
else
{
{
}

{
}

}
}
}

public static inline function fastContains(input:Array<SongNoteData>, note:SongNoteData):Bool
{
}
}
