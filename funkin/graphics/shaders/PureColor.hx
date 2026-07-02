package funkin.graphics.shaders;


class PureColor extends FlxShader
{

function set_colorSet(bol:Bool):Bool
{
colSet.value = [bol];

}

function set_col(val:FlxColor):FlxColor
{
funnyColor.value = [val.redFloat, val.greenFloat, val.blueFloat, val.alphaFloat];

}


uniform vec4 funnyColor;
uniform bool colSet;

void main()
{
vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);

color = funnyColor * color.a;

gl_FragColor = color;
}
')
public function new(colr:FlxColor)
{
super();

this.col = colr;
this.colorSet = false;
}
}
