

/**
* AtlasText is an improved version of Alphabet and FlxBitmapText.
* It supports animations on the letters, and is less buggy than Alphabet.
*/
class AtlasText extends FlxTypedSpriteGroup<AtlasChar>
{









public function new(x = 0.0, y = 0.0, text:String = "", fontName:AtlasFont = AtlasFont.DEFAULT)
{


}

function set_text(value:String):String
{



{
}




}

/**
* Adds new characters, without needing to redraw the previous characters
* @param str The text to add.
* @throws String if `text` is null.
*/
public function appendText(str:String):Void
{

}

/**
* Converts all characters to fit the font's `allowedCase`.
* @param str
*/
function restrictCase(str:String):String
{
{
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
}

for (splitStr in str.split(""))
{
switch (splitStr)
{
case " ":
case "\n":
case char:
else
{
charSprite.alpha = 1; // gets multiplied when added
}

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
case "\n":
case char:
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
}

function set_char(value:String):String
{



}

function getAnimPrefix(char:String):String
{
{
case "😠": '-angry faic-'; // TODO: Do multi-flag characters work?
case '↓': '-down arrow-'; // U+2193
case "”": '-end quote-'; // U+0022
case "!": '-exclamation point-'; // U+0021
case "/": '-forward slash-'; // U+002F
case '>': '-greater than-'; // U+003E
case '♥': '-heart-'; // U+2665
case '←': '-left arrow-'; // U+2190
case '<': '-less than-'; // U+003C
case '.': '-period-'; // U+002E
case '→': '-right arrow-'; // U+2192
case '↑': '-up arrow-'; // U+2191

}
}
}

private class AtlasFontData
{


public function new(name:AtlasFont)
{
{
}



for (frame in atlas.frames)
{

}

}
}

enum Case
{
}

enum abstract AtlasFont(String) from String to String
{
}
