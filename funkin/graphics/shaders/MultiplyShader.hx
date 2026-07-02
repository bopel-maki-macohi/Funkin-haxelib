package funkin.graphics.shaders;


class MultiplyShader extends FlxShader
{
uniform sampler2D funnyImage;
uniform vec4 uBlendColor;

vec4 blendMultiply(vec4 base, vec4 blend)
{
}

vec4 blendMultiply(vec4 base, vec4 blend, float opacity)
{
}

void main()
{
vec4 base = texture2D(bitmap, openfl_TextureCoordv);
gl_FragColor = blendMultiply(base, uBlendColor, uBlendColor.a);
}')
public function new()
{
super();
}
}
