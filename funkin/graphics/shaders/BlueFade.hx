package funkin.graphics.shaders;


class BlueFade extends FlxShader
{

function set_fadeVal(val:Float):Float
{
fadeAmt.value = [val];
fadeVal = val;

}

public function fade(startAmt:Float = 0, targetAmt:Float = 1, duration:Float, _options:TweenOptions):Void
{
fadeVal = startAmt;
FlxTween.tween(this, {fadeVal: targetAmt}, duration, _options);
}


uniform float fadeAmt;


void main()
{
vec4 tex = flixel_texture2D(bitmap, openfl_TextureCoordv);

vec4 finalColor = mix(vec4(vec4(0.0, 0.0, tex.b, tex.a) * fadeAmt), vec4(tex * fadeAmt), fadeAmt);

gl_FragColor = finalColor;
}

')
public function new()
{
super();

this.fadeVal = 1;
}
}
