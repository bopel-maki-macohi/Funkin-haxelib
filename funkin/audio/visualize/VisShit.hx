package funkin.audio.visualize;


using Lambda;

class VisShit
{

public function new(snd:FlxSound)
{
this.snd = snd;
}

public function funnyFFT(samples:Array<Float>, ?skipped:Int = 1):Array<Array<Float>>
{





{

};

{
};


{


freqOutput.push([]);

for (k => s in freqs)
{
{

haxe.Log.trace('${time};${freq};${power}', null);
}
//
}

indexOfArray++;
c += hop;
}


}

public static function getCurAud(aud:Int16Array, index:Int):CurAudioInfo
{


}

public function checkAndSetBuffer()
{
{
{

audioData = cast buf.data; // jank and hacky lol! kinda busted on HTML5 also!!
sampleRate = buf.sampleRate;


setBuffer = true;
numSamples = Std.int(audioData.length / 2);
}
}
}
}

typedef CurAudioInfo =
{
}
