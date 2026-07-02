package funkin.ui;


/**
* AtlasText is an improved version of Alphabet and FlxBitmapText.
* It supports animations on the letters, and is less buggy than Alphabet.
*/
class AtlasText extends FlxTypedSpriteGroup<AtlasChar>
{




inline function get_atlas():FlxAtlasFrames return font.atlas;


inline function get_caseAllowed():Case return font.caseAllowed;


inline function get_maxHeight():Float return font.maxHeight;

public function new(x = 0.0, y = 0.0, text:String = "", fontName:AtlasFont = AtlasFont.DEFAULT)
{
font = fonts[fontName] ?? new AtlasFontData(fontName);

super(x, y);

this.text = text;
}

function set_text(value:String):String
{
value ??= "";


this.text = value;

{
appendTextCased(caseValue.substr(caseText.length));
}

value = caseValue;

group.kill();


appendTextCased(caseValue);
}

/**
* Adds new characters, without needing to redraw the previous characters
* @param str The text to add.
* @throws String if `text` is null.
*/
public function appendText(str:String):Void
{

this.text += str;
}

/**
* Converts all characters to fit the font's `allowedCase`.
* @param str
*/
function restrictCase(str:String):String
{
{
case Both: str;
case Upper: str.toUpperCase();
case Lower: str.toLowerCase();
}
}

/**
* Adds new text on top of the existing text. Helper for other methods; DOESN'T CHANGE `this.text`.
* @param str The text to add, assumed to match the font's `caseAllowed`.
*/
function appendTextCased(str:String):Void
{
else if (charCount > 0)
{
xPos = lastChar.x + lastChar.width - x;
yPos = lastChar.y + lastChar.height - maxHeight - y;
}

for (splitStr in str.split(""))
{
switch (splitStr)
{
case " ":
xPos += 40;
case "\n":
xPos = 0;
yPos += maxHeight;
case char:
else
{
charSprite = group.members[charCount];
charSprite.revive();
charSprite.char = char;
charSprite.alpha = 1; // gets multiplied when added
}
charSprite.x = xPos;
charSprite.y = yPos + maxHeight - charSprite.height;
add(charSprite);

xPos += charSprite.width;
charCount++;
}
}
}

public function getWidth():Int
{
for (char in this.text.split(""))
{
switch (char)
{
case " ":
width += 40;
case "\n":
case char:
sprite.revive();
sprite.char = char;
sprite.alpha = 1;
width += Std.int(sprite.width);
}
}
}

override function toString():String
{
}
}

class AtlasChar extends FlxSprite
{
/**
* Which character in the font we are using
*/

public function new(x = 0.0, y = 0.0, atlas:FlxAtlasFrames, char:String)
{
super(x, y);
frames = atlas;
this.char = char;
}

function set_char(value:String):String
{

animation.addByPrefix('anim', getAnimPrefix(value), 24);

updateHitbox();

}

function getAnimPrefix(char:String):String
{
{
case '&': return '-andpersand-';
case "😠": '-angry faic-'; // TODO: Do multi-flag characters work?
case "'": '-apostraphie-';
case "\\": '-back slash-';
case ",": '-comma-';
case '-': '-dash-';
case '↓': '-down arrow-'; // U+2193
case "”": '-end quote-'; // U+0022
case "!": '-exclamation point-'; // U+0021
case "/": '-forward slash-'; // U+002F
case '>': '-greater than-'; // U+003E
case '♥': '-heart-'; // U+2665
case '♡': '-heart-';
case '←': '-left arrow-'; // U+2190
case '<': '-less than-'; // U+003C
case "*": '-multiply x-';
case '.': '-period-'; // U+002E
case "?": '-question mark-';
case '→': '-right arrow-'; // U+2192
case "“": '-start quote-';
case '↑': '-up arrow-'; // U+2191

default: char;
}
}
}

private class AtlasFontData
{
static public var upperChar = ~/^[A-Z]\d+$/;
static public var lowerChar = ~/^[a-z]\d+$/;


public function new(name:AtlasFont)
{
atlas = Paths.getSparrowAtlas('fonts/${name}');
{
}

atlas.parent.destroyOnNoUse = false;
atlas.parent.persist = true;


for (frame in atlas.frames)
{
maxHeight = Math.max(maxHeight, frame.frame.height);

}

}
}

enum Case
{
Both;
Upper;
Lower;
}

enum abstract AtlasFont(String) from String to String
{
}
