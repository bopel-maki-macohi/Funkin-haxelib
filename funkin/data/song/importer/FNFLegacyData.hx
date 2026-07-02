

/**
* A data structure representing a song in the old chart format.
* This only works for charts compatible with Week 7, so you'll need a custom program
* to handle importing charts from mods or other engines.
*/
class FNFLegacyData
{
}

class LegacySongData
{



public function new()
{
}

public function toString():String
{
{
case Right(data):
}
}

typedef LegacyScrollSpeeds =
{

typedef LegacyNoteData =
{
/**
* The easy difficulty.
*/

/**
* The normal difficulty.
*/

/**
* The hard difficulty.
*/

typedef LegacyNoteSection =
{
/**
* Whether the section is a must-hit section.
* If true, 0-3 are boyfriends notes, 4-7 are opponents notes.
* If false, 0-3 are opponents notes, 4-7 are boyfriends notes.
*/

/**
* Array of note data:
* - Direction
* - Time (ms)
* - Sustain Duration (ms)
* - Note kind (true = "alt", or string)
*/



}

/**
* Notes in the old format are stored as an Array<Dynamic>
* We use a custom parser to manage this.
*/
class LegacyNote
{

public function new(time:Float, data:Int, ?length:Float, ?alt:Bool)
{

}

public inline function getKind():String
{
}

public function toString():String
{
}
}
