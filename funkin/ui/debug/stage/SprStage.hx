package funkin.ui.debug.stage;


class SprStage extends FlxSprite
{



public function new(?x:Float = 0, ?y:Float = 0, dragShitFunc:SprStage->Void)
{
super(x, y);

FlxMouseEvent.add(this, dragShitFunc, null, function(spr:SprStage)
{
}, function(spr:SprStage)
{
alpha = 1;
}, false, true, true);
}

public function isSelected():Bool
{
}

override function update(elapsed:Float)
{
super.update(elapsed);

{
this.x = FlxG.mouse.x - mouseOffset.x;
this.y = FlxG.mouse.y - mouseOffset.y;
}

{
mousePressing = false;
StageBuilderState.changeTool(GRAB);
}
}
}
