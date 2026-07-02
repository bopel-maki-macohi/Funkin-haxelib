package funkin.graphics.shaders;


class StrokeShader extends FlxShader
{


function set_width(val):Float
{
size.value = [val, height];

}

function set_height(val):Float
{
size.value = [width, val];
}

function set_col(val:FlxColor):FlxColor
{
color.value = [val.red, val.green, val.blue, val.alpha];

}


uniform vec2 size;
uniform vec4 color;

void main()
{
vec4 gay = flixel_texture2D(bitmap, openfl_TextureCoordv);
float w = size.x / openfl_TextureSize.x;
float h = size.y / openfl_TextureSize.y;

|| flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x - w, openfl_TextureCoordv.y)).a != 0.
|| flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y + h)).a != 0.
|| flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y - h)).a != 0.)
gay = color;
}
gl_FragColor = gay;
}
')
public function new(color:FlxColor = 0xFFFFFFFF, width:Float = 1, height:Float = 1)
{
super();

col = color;
this.width = width;
this.height = height;
}
}
