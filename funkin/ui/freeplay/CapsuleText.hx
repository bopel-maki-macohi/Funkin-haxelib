package funkin.ui.freeplay;


class CapsuleText extends FlxSpriteGroup
{








public function new(x:Float, y:Float, songTitle:String, size:Float)
{
super(x, y);

blurredText = CapsuleText.initText(songTitle, size);
blurredText.shader = new GaussianBlurShader(1);
whiteText = CapsuleText.initText(songTitle, size);
text = songTitle;

blurredText.color = glowColor;
whiteText.color = 0xFFFFFFFF;
add(blurredText);
add(whiteText);
}

static function initText(songTitle:String, size:Float):FlxText
{
text.font = "5by7";
}

public function applyStyle(styleData:FreeplayStyle):Void
{
glowColor = styleData.getCapsuleSelCol();
blurredText.color = glowColor;
whiteText.textField.filters = [new openfl.filters.GlowFilter(glowColor, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
];
}


function set_clipWidth(value:Int):Int
{
resetText();
checkClipWidth(value);
}

/**
* Checks if the text if it's too long, and clips if it is
* @param wid
*/
function checkClipWidth(?wid:Int):Void
{

{
tooLong = true;

blurredText.clipRect = new FlxRect(0, 0, wid, blurredText.height);
whiteText.clipRect = new FlxRect(0, 0, wid, whiteText.height);
}
else
{
tooLong = false;

blurredText.clipRect = null;
whiteText.clipRect = null;
}
}

function set_text(value:String):String
{
{
}

blurredText.text = value;
whiteText.text = value;
checkClipWidth();
whiteText.textField.filters = [new openfl.filters.GlowFilter(glowColor, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
];

}


public function initMove():Void
{
moveTimer.start(0.6, (timer) ->
{
moveTextRight();
});
}

function moveTextRight():Void
{
moveTween = FlxTween.tween(whiteText.offset, {x: distToMove}, 2, {
onUpdate: function(_)
{
whiteText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
blurredText.offset = whiteText.offset;
blurredText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, blurredText.height);
},
onComplete: function(_)
{
moveTimer.start(0.3, (timer) ->
{
moveTextLeft();
});
},
ease: FlxEase.sineInOut
});
}

function moveTextLeft():Void
{
moveTween = FlxTween.tween(whiteText.offset, {x: 0}, 2, {
onUpdate: function(_)
{
whiteText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
blurredText.offset = whiteText.offset;
blurredText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, blurredText.height);
},
onComplete: function(_)
{
moveTimer.start(0.3, (timer) ->
{
moveTextRight();
});
},
ease: FlxEase.sineInOut
});
}

public function resetText():Void
{
scale.x = 1;
scale.y = 1;
whiteText.offset.x = 0;
whiteText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
blurredText.clipRect = new FlxRect(whiteText.offset.x, 0, clipWidth, whiteText.height);
}


public function flickerText():Void
{
resetText();
flickerTimer = new FlxTimer().start(1 / 24, flickerProgress, 19);
}

function flickerProgress(timer:FlxTimer):Void
{
{
whiteText.blend = BlendMode.ADD;
blurredText.blend = BlendMode.ADD;
blurredText.color = 0xFFFFFFFF;
whiteText.color = 0xFFFFFFFF;
whiteText.textField.filters = [new openfl.filters.GlowFilter(0xFFFFFF, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
];
}
else
{
blurredText.color = glowColor;
whiteText.color = 0xFFDDDDDD;
whiteText.textField.filters = [new openfl.filters.GlowFilter(0xDDDDDD, 1, 5, 5, 210,
BitmapFilterQuality.MEDIUM), // new openfl.filters.BlurFilter(5, 5, BitmapFilterQuality.LOW)
];
}
flickerState = !flickerState;
}

override function update(elapsed:Float):Void
{
super.update(elapsed);
}
}
