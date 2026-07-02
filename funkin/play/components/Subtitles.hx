package funkin.play.components;


/**
* A Sprite Group for displaying in-game subtitles.
*/
class Subtitles extends FlxSpriteGroup
{



public function new(x:Float = 0, y:Float = 0, alignment:SubtitlesAlignment = SubtitlesAlignment.SUBTITLES_BOTTOM)
{
super(0, 0);

this.offsets = [x, y];
this.alignment = alignment;

background = new FlxSprite(0, 0);
background.alpha = 0.5;
add(background);

subtitleText = new SubtitlesText(0, 0, 30, 'VCR OSD Mono');
add(subtitleText);

setText([], true);
}

override function update(elapsed:Float)
{
super.update(elapsed);


for (data in subtitlesData)
{
{
currentLines.unshift(data.text);

hasRefreshedText = true;
}
}

{
setText(currentLines);
}
else
{
setText([], true);
}
}

/**
* A function which loads the subtitles.
* @param filePath A path to the srt file.
* @param sound The sound to assign to the current subtitles.
*/
public function assignSubtitles(filePath:String, sound:FlxSound):Void
{
setText([], true);


subtitlesData = SRTParser.parseFromFile(filePath);


assignedSound = sound;
}

function setText(lines:Array<String>, hide:Bool = false):Void
{
visible = !hide;

for (i in 0...lines.length)
{

targetText += lines[i];
}


subtitleText.text = targetText;

background.makeGraphic(Math.ceil(subtitleText.width), Math.ceil(subtitleText.height), FlxColor.BLACK, true);

updatePosition();
}

function updatePosition():Void
{
screenCenter(X);
x += offsets[0];

switch (alignment)
{
case SubtitlesAlignment.SUBTITLES_TOP:
y = 0 + offsets[1];
case SubtitlesAlignment.SUBTITLES_BOTTOM:
y = FlxG.height - this.height - offsets[1];
}
}

function set_alignment(value:SubtitlesAlignment):SubtitlesAlignment
{
alignment = value;
updatePosition();

}

function set_offsets(value:Array<Float>):Array<Float>
{
offsets = value;
updatePosition();

}
}

/**
* A slightly modified `FlxText` specifically for subtitles.
*/
class SubtitlesText extends FlxText
{
public function new(x:Float = 0, y:Float = 0, size:Int, font:String)
{
super(x, y, 0, '', size);

this.font = font;
this.size = size;
this.alignment = FlxTextAlign.CENTER;
}

/**
* Make it set the `htmlText` instead of `text` for properly working HTML text elements.
*/
override function set_text(Text:String):String
{
text = Text;
{
textField.htmlText = Text;
_regen = (textField.htmlText != ot) || _regen;
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
