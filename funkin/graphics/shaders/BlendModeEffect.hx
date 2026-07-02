package funkin.graphics.shaders;


typedef BlendModeShader =
{
}

class BlendModeEffect
{


public function new(shader:BlendModeShader, color:FlxColor):Void
{
shader.uBlendColor.value = [];
this.shader = shader;
this.color = color;
}

function set_color(color:FlxColor):FlxColor
{
shader.uBlendColor.value[0] = color.redFloat;
shader.uBlendColor.value[1] = color.greenFloat;
shader.uBlendColor.value[2] = color.blueFloat;
shader.uBlendColor.value[3] = color.alphaFloat;

}
}
