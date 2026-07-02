

/**
* A Sprite Group for displaying in-game subtitles.
*/
class Subtitles extends FlxSpriteGroup
{



public function new(x:Float = 0, y:Float = 0, alignment:SubtitlesAlignment = SubtitlesAlignment.SUBTITLES_BOTTOM)
{




}

override function update(elapsed:Float)
{


for (data in subtitlesData)
{
{

}
}

{
}
else
{
}
}

/**
* A function which loads the subtitles.
* @param filePath A path to the srt file.
* @param sound The sound to assign to the current subtitles.
*/
public function assignSubtitles(filePath:String, sound:FlxSound):Void
{




}

function setText(lines:Array<String>, hide:Bool = false):Void
{

for (i in 0...lines.length)
{

}




}

function updatePosition():Void
{

switch (alignment)
{
case SubtitlesAlignment.SUBTITLES_TOP:
case SubtitlesAlignment.SUBTITLES_BOTTOM:
}
}

function set_alignment(value:SubtitlesAlignment):SubtitlesAlignment
{

}

function set_offsets(value:Array<Float>):Array<Float>
{

}
}

/**
* A slightly modified `FlxText` specifically for subtitles.
*/
class SubtitlesText extends FlxText
{
public function new(x:Float = 0, y:Float = 0, size:Int, font:String)
{

}

/**
* Make it set the `htmlText` instead of `text` for properly working HTML text elements.
*/
override function set_text(Text:String):String
{
{
}
}

override function applyFormats(_:openfl.text.TextFormat, __:Bool = false):Void
{
}
}

/**
* An abstract for subtitles alignment.
*/
enum abstract SubtitlesAlignment(String) from String to String
{
/**
* Subtitles will be aligned at the top.
*/

/**
* Subtitles will be aligned at the bottom.
*/
}
