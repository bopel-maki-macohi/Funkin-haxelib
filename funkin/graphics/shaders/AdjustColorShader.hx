package funkin.graphics.shaders;


class AdjustColorShader extends FlxRuntimeShader
{

public function new()
{
super(Assets.getText(Paths.frag('adjustColor')));
hue = 0;
saturation = 0;
brightness = 0;
contrast = 0;
}

function set_hue(value:Float):Float
{
this.setFloat('hue', value);
this.hue = value;

}

function set_saturation(value:Float):Float
{
this.setFloat('saturation', value);
this.saturation = value;

}

function set_brightness(value:Float):Float
{
this.setFloat('brightness', value);
this.brightness = value;

}

function set_contrast(value:Float):Float
{
this.setFloat('contrast', value);
this.contrast = value;

}

public override function toString():String
{
}
}
