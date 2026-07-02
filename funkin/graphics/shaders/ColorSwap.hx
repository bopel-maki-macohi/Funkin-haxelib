

class ColorSwap
{



public function new():Void
{
}

public function update(elapsed:Float):Void
{
}

function set_colorToReplace(color:FlxColor):FlxColor
{

}

function set_hasOutline(lol:Bool):Bool
{
}

function set_daTime(daTime:Float):Float
{
}

function set_newColor(color:FlxColor):FlxColor
{

}
}

class ColorSwapShader extends FlxShader
{






vec3 normalizeColor(vec3 color)
{
color[0] / 255.0,
color[1] / 255.0,
color[2] / 255.0
}

vec3 rgb2hsv(vec3 c)
{

}

vec3 hsv2rgb(vec3 c)
{
}

void main()
{






{


|| flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x - w, openfl_TextureCoordv.y)).a != 0.
|| flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y + h)).a != 0.
|| flixel_texture2D(bitmap, vec2(openfl_TextureCoordv.x, openfl_TextureCoordv.y - h)).a != 0.)
}


}





/*
else
{
float a = flixel_texture2D(bitmap, vec2(openfl_TextureCoordv + offset, openfl_TextureCoordv.y)).a +
flixel_texture2D(bitmap, vec2(openfl_TextureCoordv, openfl_TextureCoordv.y - offset)).a +
flixel_texture2D(bitmap, vec2(openfl_TextureCoordv - offset, openfl_TextureCoordv.y)).a +
else
} */
}

')
public function new()
{
}
}
