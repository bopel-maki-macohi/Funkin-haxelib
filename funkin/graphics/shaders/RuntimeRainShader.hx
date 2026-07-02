package funkin.graphics.shaders;


typedef Light =
{
}

class RuntimeRainShader extends RuntimePostEffectShader
{

{
position:ShaderParameter<Float>,
color:ShaderParameter<Float>,
radius:ShaderParameter<Float>,
}>;


function set_time(value:Float):Float
{
this.setFloat('uTime', value);
}


function set_spriteMode(value:Bool):Bool
{
this.setBool('uSpriteMode', value);
}


function set_scale(value:Float):Float
{
this.setFloat('uScale', value);
}


function set_intensity(value:Float):Float
{
this.setFloat('uIntensity', value);
}


function set_puddleY(value:Float):Float
{
this.setFloat('uPuddleY', value);
}


function set_puddleScaleY(value:Float):Float
{
this.setFloat('uPuddleScaleY', value);
}


function set_blurredScreen(value:BitmapData):BitmapData
{
this.setBitmapData('uBlurredScreen', value);
}


function set_mask(value:BitmapData):BitmapData
{
this.setBitmapData('uMask', value);
}


function set_rainColor(color:FlxColor):FlxColor
{
this.setFloatArray("uRainColor", [color.red / 255, color.green / 255, color.blue / 255]);
}


function set_lightMap(value:BitmapData):BitmapData
{
this.setBitmapData('uLightMap', value);
}


function set_numLightsSwag(value:Int):Int
{
this.setInt('numLights', value);
}

public function new()
{
super(Assets.getText(Paths.frag('rain')));
this.rainColor = 0xFF6680cc;
}

public function update(elapsed:Float):Void
{
time += elapsed;
}

override function __processGLData(source:String, storageType:String):Void
{
super.__processGLData(source, storageType);
{
lights = [for (i in 0...MAX_LIGHTS)
{
position: addFloatUniform('lights[$i].position', 2),
color: addFloatUniform('lights[$i].color', 3),
radius: addFloatUniform('lights[$i].radius', 1),
}];
}
}

function addFloatUniform(name:String, length:Int):ShaderParameter<Float>
{
res.name = name;
res.type = [null, FLOAT, FLOAT2, FLOAT3, FLOAT4][length];
res.__arrayLength = 1;
res.__isFloat = true;
res.__isUniform = true;
res.__length = length;
__paramFloat.push(res);
}
}
