package funkin.graphics.shaders;


class WaveShader extends FlxShader
{

void main()
{
vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);

gl_FragColor = color;
}

')
public function new()
{
super();
}
}
