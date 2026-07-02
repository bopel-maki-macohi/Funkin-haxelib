

class CapsuleText extends FlxSpriteGroup
{








public function new(x:Float, y:Float, songTitle:String, size:Float)
{


}

static function initText(songTitle:String, size:Float):FlxText
{
}

public function applyStyle(styleData:FreeplayStyle):Void
{
whiteText.textField.filters = [new openfl.filters.GlowFilter(glowColor, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
}


function set_clipWidth(value:Int):Int
{
}

/**
* Checks if the text if it's too long, and clips if it is
* @param wid
*/
function checkClipWidth(?wid:Int):Void
{

{

}
else
{

}
}

function set_text(value:String):String
{
{
}

whiteText.textField.filters = [new openfl.filters.GlowFilter(glowColor, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)

}


public function initMove():Void
{
moveTimer.start(0.6, (timer) ->
{
}

function moveTextRight():Void
{
moveTween = FlxTween.tween(whiteText.offset, {x: distToMove}, 2, {
onUpdate: function(_)
{
},
onComplete: function(_)
{
moveTimer.start(0.3, (timer) ->
{
},
ease: FlxEase.sineInOut
}

function moveTextLeft():Void
{
moveTween = FlxTween.tween(whiteText.offset, {x: 0}, 2, {
onUpdate: function(_)
{
},
onComplete: function(_)
{
moveTimer.start(0.3, (timer) ->
{
},
ease: FlxEase.sineInOut
}

public function resetText():Void
{
}


public function flickerText():Void
{
}

function flickerProgress(timer:FlxTimer):Void
{
{
whiteText.textField.filters = [new openfl.filters.GlowFilter(0xFFFFFF, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
}
else
{
whiteText.textField.filters = [new openfl.filters.GlowFilter(0xDDDDDD, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
}
}

override function update(elapsed:Float):Void
{
}
}
