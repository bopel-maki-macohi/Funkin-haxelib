

typedef Light =
{
}

class RuntimeRainShader extends RuntimePostEffectShader
{

{
position:ShaderParameter<Float>,
color:ShaderParameter<Float>,
radius:ShaderParameter<Float>,


function set_time(value:Float):Float
{
}


function set_spriteMode(value:Bool):Bool
{
}


function set_scale(value:Float):Float
{
}


function set_intensity(value:Float):Float
{
}


function set_puddleY(value:Float):Float
{
}


function set_puddleScaleY(value:Float):Float
{
}


function set_blurredScreen(value:BitmapData):BitmapData
{
}


function set_mask(value:BitmapData):BitmapData
{
}


function set_rainColor(color:FlxColor):FlxColor
{
}


function set_lightMap(value:BitmapData):BitmapData
{
}


function set_numLightsSwag(value:Int):Int
{
}

public function new()
{
}

public function update(elapsed:Float):Void
{
}

override function __processGLData(source:String, storageType:String):Void
{
{
lights = [for (i in 0...MAX_LIGHTS)
{
position: addFloatUniform('lights[$i].position', 2),
color: addFloatUniform('lights[$i].color', 3),
radius: addFloatUniform('lights[$i].radius', 1),
}
}

function addFloatUniform(name:String, length:Int):ShaderParameter<Float>
{
}
}
