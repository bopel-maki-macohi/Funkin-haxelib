
class WaveformDataParser
{


public static function interpretFlxSound(sound:Null<flixel.sound.FlxSound>):Null<WaveformData>
{


{

{
}
else
{
}
}
else
{
}

}

public static function interpretAudioBuffer(soundBuffer:lime.media.AudioBuffer):Null<WaveformData>
{





for (pointIndex in 0...outputPointCount)
{

for (i in 0...channels)
{
}

for (sampleIndex in rangeStart...rangeEnd)
{
for (channelIndex in 0...channels)
{

}
}

for (channelIndex in 0...channels)
{
}
}


}

public static function parseWaveformData(path:String):Null<WaveformData>
{
}

public static function parseWaveformDataString(contents:String, ?fileName:String):Null<WaveformData>
{

{
}
}

static function printErrors(errors:Array<json2object.Error>, id:String = ''):Void
{

for (error in errors)
}
}
