package funkin.graphics.shaders;


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
this.setInt('effectType', getEffectTypeId(v));
}


function set_waveSpeed(v:Float):Float
{
this.setFloat('uSpeed', v);
}


function set_waveFrequency(v:Float):Float
{
this.setFloat('uFrequency', v);
}


function set_waveAmplitude(v:Float):Float
{
this.setFloat('uWaveAmplitude', v);
}


function set_time(v:Float):Float
{
this.setFloat('uTime', v);
}

public function new(speed:Float, freq:Float, amplitude:Float, ?effect:WiggleEffectType = DREAMY):Void
{
super(Assets.getText(Paths.frag('wiggle')));

this.waveSpeed = speed;
this.waveFrequency = freq;
this.waveAmplitude = amplitude;
this.effectType = effect;
}

public function update(elapsed:Float)
{
this.time += elapsed;
}
}
