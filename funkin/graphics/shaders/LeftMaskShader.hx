package funkin.graphics.shaders;


class LeftMaskShader extends FlxShader
{

function set_swagSprX(x:Float):Float
{
sprX.value[0] = x;

}

function set_swagMaskX(x:Float):Float
{
maskX.value[0] = x;

}

function set_frameUV(uv:FlxRect):FlxRect
{

uvFrameX.value[0] = uv.left;
uvFrameY.value[0] = uv.top;

}


uniform float sprX;
uniform float maskX;

uniform float uvFrameX;
uniform float uvFrameY;

void main()
{

float cutOff = maskX - sprX;
float sprPos = cutOff / openfl_TextureSize.x;

vec2 uv = openfl_TextureCoordv.xy;

vec4 color = flixel_texture2D(bitmap, uv);

{
color = vec4(0.0, 0.0, 0.0, 0.0);
}

gl_FragColor = color;
//gl_FragColor = vec4(1.0, openfl_TextureSize.x, 1.0, 1.0);

}
')
public function new()
{
super();

sprX.value = [0];
maskX.value = [0];
uvFrameX.value = [0];
uvFrameY.value = [0];
}
}
