package funkin.audio.visualize;


using Lambda;
using flixel.util.FlxSpriteUtil;

class SpectogramSprite extends FlxTypedSpriteGroup<FlxSprite>
{





public function new(daSound:FlxSound, ?col:FlxColor = FlxColor.WHITE, ?height:Float = 720, ?amnt:Int = 500)
{
super();

vis = new VisShit(daSound);
this.col = col;
this.daHeight = height;
lengthOfShit = amnt;

regenLineShit();
}

public function regenLineShit():Void
{
for (i in 0...lengthOfShit)
{
lineShit.active = false;
lineShit.ID = i;
add(lineShit);
}
}





override function update(elapsed:Float)
{
switch (visType)
{
case UPDATED:
updateVisulizer();

case FREQUENCIES:
updateFFT();
default:
}

forEach(spr ->
{
spr.visible = spr.ID % wavOptimiz == 0;
});


super.update(elapsed);
}

/**
* @param start is the start in milliseconds?
*/
public function generateSection(start:Float = 0, seconds:Float = 1):Void
{
checkAndSetBuffer();

{


for (i in 0...group.members.length)
{


group.members[i].x = prevLine.x;
group.members[i].y = prevLine.y;

prevLine.x = (curAud.balanced * swagheight / 2 + swagheight / 2) + x;
prevLine.y = (i / group.members.length * daHeight) + y;


group.members[i].setGraphicSize(Std.int(Math.max(line.length, 1)), Std.int(1));
group.members[i].angle = line.degrees;
}

wavOptimiz = 1; // hard set wavOptimiz to 1 so its a pure thing
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


public function updateFFT()
{
{

checkAndSetBuffer();

{
frameCounter++;

{
frameCounter = 0;
doAnim = true;
}
}

{
doAnim = false;

else
remappedShit = Std.int(FlxMath.remapToRange(Conductor.instance.songPosition, 0, vis.snd.length, 0, numSamples));


for (sample in remappedShit...remappedShit + (Std.int((44100 * (1 / 144)))))
{
i += 2;

fftSamples.push(curAud.balanced);
}


for (i in 0...group.members.length)
{




group.members[i].x = prevLine.x;
group.members[i].y = prevLine.y;


for (pow in 0...freqShit.length)
freqPower += freqShit[pow][remappedFreq];

freqPower /= freqShit.length;

prevLine.x = (freqIDK * swagheight / 2 + swagheight / 2) + x;
prevLine.y = (i / group.members.length * daHeight) + y;


}
}
}
}


public function updateVisulizer():Void
{
{

checkAndSetBuffer();

{
else
{
{
wavOptimiz = 3;
}

curTime = Conductor.instance.songPosition;

remappedShit = Std.int(FlxMath.remapToRange(Conductor.instance.songPosition, 0, vis.snd.length, 0, numSamples));
}

wavOptimiz = 8;



for (sample in remappedShit...remappedShit + lengthOfShit)
{

i += 2;


group.members[Std.int(remappedSample)].x = prevLine.x;
group.members[Std.int(remappedSample)].y = prevLine.y;
prevLine.x = (curAud.balanced * swagheight / 2 + swagheight / 2) + x;
prevLine.y = (Std.int(remappedSample) / lengthOfShit * daHeight) + y;


group.members[Std.int(remappedSample)].setGraphicSize(Std.int(Math.max(line.length, 1)), Std.int(1));
group.members[Std.int(remappedSample)].angle = line.degrees;
}
}
}
}
}
