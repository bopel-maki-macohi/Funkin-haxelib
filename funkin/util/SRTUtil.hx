


class SubtitleEntry
{

public function new(number:Int = 0, start:Float = 0, end:Float = 0, text:String = "")
{
}

public function toString():String
{
}
}

class SRTParser
{
/**
* If true, replaces all `{` and `}` in subtitle text with `<` and `>`.
* @default `true`
*/

/**
* Parse SRT content from a raw string
*/
public static function parseFromString(s:String):Array<SubtitleEntry>
{



for (block in blocks)
{


{
}
{
}



{
}


}

}

public static function parseFromFile(name:String, ?library:String, ?dir:String):Array<SubtitleEntry>
{
try
rawSRTData = funkin.Assets.getText(Paths.srt(name, library, dir))
catch (e)

}

/**
* Parse line like: 00:01:23,456 --> 00:01:25,678
*/

public static function parseTimeLine(line:String):
{start:Float, end:Float}
{

for (a in timeArrowPatterns)
{
{
}
}


}

/**
*  Parse a single timecode like 01:02:03,456 or 01:02:03.456
*/
public static function parseTimecode(t:String):Float
{
{
}
}
}

/**
* Utility helpers for using subtitles at runtime
*/
class SubtitleUtils
{
/**
* Finds subtitle entry for the current time.
*/
public static function findActive(list:Array<SubtitleEntry>, time:Float):SubtitleEntry
{
for (s in list)
{
}
}

/**
* Finds subtitle entry id for the current time.
*/
public static function findActiveIndex(list:Array<SubtitleEntry>, time:Float):Int
{
{
else
}
}

public static function isNumeric(s:String):Bool
{
for (i in 0...t.length)
{
}
}

/**
* Sort lines by their id.
*/
public static function sortLines(line1:SubtitleEntry, line2:SubtitleEntry):Int
{
}
}
