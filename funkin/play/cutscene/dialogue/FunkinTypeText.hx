package funkin.play.cutscene.dialogue;


/**
* An FlxTypeText that better accounts for text-wrapping,
* by overriding the functions of insertBreakLines() to check the finished state.
* Also fixes a bug where empty strings would make the typing never 'finish'.
*/
class FunkinTypeText extends FlxTypeText
{

public function new(X:Float, Y:Float, Width:Int, Text:String, Size:Int = 8, EmbeddedFont:Bool = true, CheckWrapping:Bool = true)
{
super(X, Y, Width, "", Size, EmbeddedFont);
_finalText = Text;
preWrapping = CheckWrapping;
}

override public function start(?Delay:Float, ForceRestart:Bool = false, AutoErase:Bool = false, ?SkipKeys:Array<FlxKey>, ?Callback:Void->Void):Void
{
{
delay = Delay;
}

_typing = true;
_erasing = false;
paused = false;
_waiting = false;

{
text = "";
_length = 0;
}

autoErase = AutoErase;

{
skipKeys = SkipKeys;
}

{
completeCallback = Callback;
}

{
loadDefaultSound();
}

{
onComplete();
}

{
insertBreakLines();
}
}

override function insertBreakLines()
{

text = prefix + _finalText;


for (i in 0...textField.numLines)
{
{
prefixLength -= curLine.length;
}
else if (prefixLength != null)
{
split += curLine.substr(prefixLength);
prefixLength = null;
}
else
{
split += '\n' + curLine;
}
}

_finalText = split;
text = saveText;
}
}
