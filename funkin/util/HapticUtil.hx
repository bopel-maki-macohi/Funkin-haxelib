

/**
* Utility class for extra vibration functions.
*/
class HapticUtil
{
/**
* Tween that is used in increasingVibrate function for tweening vibration amplitude.
*/

/**
* A default vibration preset.
*/

/**
* Indicates if haptics are available.
*/

/**
* Triggers vibration.
*
* @param period The time for one complete vibration in seconds.
* @param duration The time taken for a complete cycle in seconds.
* @param amplitude The intensity of the vibration (0.0 to 1.0).
* @param sharpness Controls the feel of vibration.
*/
public static function vibrate(period:Float = Constants.DEFAULT_VIBRATION_PERIOD, duration:Float = Constants.DEFAULT_VIBRATION_DURATION,
amplitude:Float = Constants.DEFAULT_VIBRATION_AMPLITUDE, sharpness:Float = Constants.DEFAULT_VIBRATION_SHARPNESS,
?targetHapticsModes:Array<HapticsMode>):Void
{



{


for (i in 0...Math.ceil(duration / durationPeriod))
{
}

}
else
{
}
}

/**
* Triggers vibration using a preset.
*
* @param vibrationPreset Vibration's data.
*/
public static function vibrateByPreset(vibrationPreset:VibrationPreset = null):Void
{


}

/**
* Triggers a queue of small vibrations with increasing amplitude.
* When the amplitudeTween is finished, triggers a single strong vibration.
* @param startAmplitude Start amplitude value.
* @param targetAmplitude Target amplitude value.
* @param tweenDuration Duration of the tween.
*/
public static function increasingVibrate(startAmplitude:Float, targetAmplitude:Float, tweenDuration:Float = 1):Void
{


amplitudeTween = FlxTween.num(startAmplitude, targetAmplitude, tweenDuration, {
onComplete: function(_)
{

}
}, function(currentAmplitude:Float)
{
}

static function get_defaultVibrationPreset():VibrationPreset
{
period: Constants.DEFAULT_VIBRATION_PERIOD,
duration: Constants.DEFAULT_VIBRATION_DURATION,
amplitude: Constants.DEFAULT_VIBRATION_AMPLITUDE,
sharpness: Constants.DEFAULT_VIBRATION_SHARPNESS
}

static function get_hapticsAvailable():Bool
{

}
}

/**
* A typedef containing data needed for vibrate function call.
*/
typedef VibrationPreset =
{
/**
* The time for one complete vibration.
*/

/**
* The time taken for a complete cycle.
*/

/**
* The distance of movement of the wave from its original position.
*/

/**
* Controls the feel of vibration.
*/
}

/**
* An abstract for vibrations preference.
*/
enum abstract HapticsMode(Int) from Int to Int
{
/**
* Haptics are completely disabled.
*/

/**
* Only note haptics are enabled.
*/

/**
* All the haptics are enabled.
*/
}
