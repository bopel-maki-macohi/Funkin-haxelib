package funkin.audio.visualize;


class PolygonSpectogram extends MeshRender
{





public function new(?daSound:FlxSound, ?col:FlxColor = FlxColor.WHITE, ?height:Float = 720, ?detail:Float = 1)
{
super(0, 0, col);



this.detail = detail;

}

public function setSound(daSound:FlxSound)
{
vis = new VisShit(daSound);
}

override function update(elapsed:Float)
{
super.update(elapsed);

switch (visType)
{
case UPDATED:
realtimeVis();
default:
}
}


/**
* Generates and draws a section of the audio data to a visual waveform
* @param start start of the song in milliseconds
* @param seconds how long to generate (also in milliseconds)
*/
public function generateSection(start:Float = 0, seconds:Float = 1):Void
{
checkAndSetBuffer();

{
clear();

start = Math.max(start, 0);







prevAudioData = audioData.subarray(startSample, samplesToGen);

for (i in 0...funnyPixels)
{

coolPoint.x = (curAud.balanced * waveAmplitude);
coolPoint.y = (i / funnyPixels * daHeight);

build_quad(prevPoint.x, prevPoint.y, prevPoint.x
+ thickness, prevPoint.y, coolPoint.x, coolPoint.y, coolPoint.x
+ thickness, coolPoint.y
+ thickness);

prevPoint.x = coolPoint.x;
prevPoint.y = coolPoint.y;
}
}
}


function realtimeVis():Void
{
{
{

else
{
}

curTime = vis.snd.time;

}
}
}

public function checkAndSetBuffer()
{
vis.checkAndSetBuffer();

{
audioData = vis.audioData;
sampleRate = vis.sampleRate;
setBuffer = vis.setBuffer;
numSamples = Std.int(audioData.length / 2);
}
}
}

enum VISTYPE
{
STATIC;
UPDATED;
FREQUENCIES;
}
