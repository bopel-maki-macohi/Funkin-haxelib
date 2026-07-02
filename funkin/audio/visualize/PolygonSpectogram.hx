

class PolygonSpectogram extends MeshRender
{





public function new(?daSound:FlxSound, ?col:FlxColor = FlxColor.WHITE, ?height:Float = 720, ?detail:Float = 1)
{




}

public function setSound(daSound:FlxSound)
{
}

override function update(elapsed:Float)
{

switch (visType)
{
case UPDATED:
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

{









for (i in 0...funnyPixels)
{


build_quad(prevPoint.x, prevPoint.y, prevPoint.x
+ thickness, prevPoint.y, coolPoint.x, coolPoint.y, coolPoint.x
+ thickness, coolPoint.y

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


}
}
}

public function checkAndSetBuffer()
{

{
}
}
}

enum VISTYPE
{
}
