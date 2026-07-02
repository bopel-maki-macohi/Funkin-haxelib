package funkin.graphics.shaders;


class TextureSwap extends FlxShader
{

public function loadSwapImage(path:String):Void
{
swappedImage = Assets.getBitmapData(path, false);
}

function set_swappedImage(_bitmapData:BitmapData):BitmapData
{
image.input = _bitmapData;

}

function set_amount(val:Float):Float
{
fadeAmount.value = [val];

}


uniform sampler2D image;
uniform float fadeAmount;

void main()
{
vec4 tex = flixel_texture2D(bitmap, openfl_TextureCoordv);
vec4 tex2 = flixel_texture2D(image, openfl_TextureCoordv);

vec4 finalColor = mix(tex, vec4(tex2.rgb, tex.a), fadeAmount);

gl_FragColor = finalColor;
}
')
public function new()
{
super();

this.amount = 1;
}
}
