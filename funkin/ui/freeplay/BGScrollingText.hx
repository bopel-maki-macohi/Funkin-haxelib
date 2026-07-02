package funkin.ui.freeplay;


class BGScrollingText extends FlxText
{



function get_funnyColor():FlxColor return color;

function set_funnyColor(c:FlxColor):FlxColor
{
}

public function new(x:Float, y:Float, text:String, widthShit:Float = 100, ?bold:Bool = false, ?size:Int = 48)
{
super(x, y, 0, text, size);
_positionCache = FlxPoint.get(x, y);
font = "5by7";
this.bold = bold ?? false;

this.widthShit = widthShit;

regenGraphic();


for (i in 0...needed)
{
_textPositions.push(FlxPoint.get((i * frameWidth) + (i * 20), 0));
}
}

public function updateText(newText:String)
{
this.text = newText;

regenGraphic();


_textPositions.clear();

for (i in 0...needed)
{
_textPositions.push(FlxPoint.get((i * frameWidth) + (i * 20), 0));
}
}

override public function update(elapsed:Float):Void
{
super.update(elapsed);

for (txtPosition in _textPositions)
{
txtPosition.x -= 1 * (speed * (elapsed / (1 / 60)));

{
{
txtPosition.x = _textPositions[_textPositions.length - 1].x + frameWidth + placementOffset;
sortTextShit();
}
}
else // Going right
{
{
txtPosition.x = _textPositions[0].x - frameWidth - placementOffset;
sortTextShit();
}
}
}
}

override public function draw():Void
{
_positionCache.set(x, y);
for (position in _textPositions)
{
setPosition(_positionCache.x + position.x, _positionCache.y + position.y);
super.draw();
}
setPosition(_positionCache.x, _positionCache.y);
}

function sortTextShit():Void
{
_textPositions.sort(function(Obj1:FlxPoint, Obj2:FlxPoint)
{
});
}
}
