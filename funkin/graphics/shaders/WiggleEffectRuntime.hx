

enum WiggleEffectType
{
DREAMY; // 0
WAVY; // 1
HEAT_WAVE_HORIZONTAL; // 2
HEAT_WAVE_VERTICAL; // 3
FLAG; // 4
}

/**
* To use:
* 1. Create an instance of the class, specifying speed, frequency, and amplitude.
* 2. Call `sprite.shader = wiggleEffect` on the target sprite.
* 3. Call the update() method on the instance every frame.
*/
class WiggleEffectRuntime extends FlxRuntimeShader
{
public static function getEffectTypeId(v:Null<WiggleEffectType>):Int
{
}


function set_effectType(v:Null<WiggleEffectType>):Null<WiggleEffectType>
{
}


function set_waveSpeed(v:Float):Float
{
}


function set_waveFrequency(v:Float):Float
{
}


function set_waveAmplitude(v:Float):Float
{
}


function set_time(v:Float):Float
{
}

public function new(speed:Float, freq:Float, amplitude:Float, ?effect:WiggleEffectType = DREAMY):Void
{

}

public function update(elapsed:Float)
{
}
}
