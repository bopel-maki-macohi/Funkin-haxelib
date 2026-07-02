package funkin.ui.options.items;


class CheckboxPreferenceItem extends FlxSprite
{

public function new(x:Float, y:Float, defaultValue:Bool = false, available:Bool = true)
{
super(x, y);

frames = Paths.getSparrowAtlas('checkboxThingie');
animation.addByPrefix('static', 'Check Box unselected', 24, false);
animation.addByPrefix('checked', 'Check Box selecting animation', 24, false);

setGraphicSize(Std.int(width * 0.7));
updateHitbox();


this.currentValue = defaultValue;
}

override function update(elapsed:Float):Void
{
super.update(elapsed);

switch (animation.curAnim.name)
{
case 'static':
offset.set();
case 'checked':
offset.set(17, 70);
}
}

function set_currentValue(value:Bool):Bool
{
{
animation.play('checked', true);
}
else
{
animation.play('static');
}

}
}
