


class SpectogramSprite extends FlxTypedSpriteGroup<FlxSprite>
{





public function new(daSound:FlxSound, ?col:FlxColor = FlxColor.WHITE, ?height:Float = 720, ?amnt:Int = 500)
{


}

public function regenLineShit():Void
{
for (i in 0...lengthOfShit)
{
}
}





override function update(elapsed:Float)
{
switch (visType)
{
case UPDATED:

case FREQUENCIES:
default:
}

forEach(spr ->
{


}

/**
* @param start is the start in milliseconds?
*/
public function generateSection(start:Float = 0, seconds:Float = 1):Void
{

{


for (i in 0...group.members.length)
{





}

wavOptimiz = 1; // hard set wavOptimiz to 1 so its a pure thing
}
}

public function checkAndSetBuffer()
{

{
}
}


public function updateFFT()
{
{


{

{
}
}

{

else
remappedShit = Std.int(FlxMath.remapToRange(Conductor.instance.songPosition, 0, vis.snd.length, 0, numSamples));


for (sample in remappedShit...remappedShit + (Std.int((44100 * (1 / 144)))))
{

}


for (i in 0...group.members.length)
{






for (pow in 0...freqShit.length)




}
}
}
}


public function updateVisulizer():Void
{
{


{
else
{
{
}

curTime = Conductor.instance.songPosition;

remappedShit = Std.int(FlxMath.remapToRange(Conductor.instance.songPosition, 0, vis.snd.length, 0, numSamples));
}




for (sample in remappedShit...remappedShit + lengthOfShit)
{





}
}
}
}
}
