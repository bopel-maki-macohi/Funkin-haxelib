package funkin.graphics.shaders;


class HSVShader extends FlxRuntimeShader
{

public function new(h:Float = 1, s:Float = 1, v:Float = 1)
{
super(Assets.getText(Paths.frag('hsv')));
hue = h;
saturation = s;
value = v;
}

function set_hue(value:Float):Float
{
this.setFloat('_hue', value);
this.hue = value;

}

function set_saturation(value:Float):Float
{
this.setFloat('_sat', value);
this.saturation = value;

}

function set_value(value:Float):Float
{
this.setFloat('_val', value);
this.value = value;

}
}
