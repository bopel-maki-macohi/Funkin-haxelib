package funkin.audio.waveform;

class WaveformDataParser
{


public static function interpretFlxSound(sound:Null<flixel.sound.FlxSound>):Null<WaveformData>
{


{
soundBuffer = sound?._sound?.__buffer;

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
minValues[i] = bitsPerSample == 16 ? INT16_MAX : INT8_MAX;
maxValues[i] = bitsPerSample == 16 ? INT16_MIN : INT8_MIN;
}

for (sampleIndex in rangeStart...rangeEnd)
{
for (channelIndex in 0...channels)
{

}
}

for (channelIndex in 0...channels)
{
outputData[baseIndex + channelIndex * 2] = minValues[channelIndex];
outputData[baseIndex + channelIndex * 2 + 1] = maxValues[channelIndex];
}
}


}

public static function parseWaveformData(path:String):Null<WaveformData>
{
}

public static function parseWaveformDataString(contents:String, ?fileName:String):Null<WaveformData>
{
parser.ignoreUnknownVariables = false;
parser.fromJson(contents, fileName);

{
printErrors(parser.errors, fileName);
}
}

static function printErrors(errors:Array<json2object.Error>, id:String = ''):Void
{

for (error in errors)
funkin.data.DataError.printError(error);
}
}
