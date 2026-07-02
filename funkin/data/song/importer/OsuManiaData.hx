package funkin.data.song.importer;

/**
* Structure of a parsed Osu!Mania .osu file
* Stuctured like a INI file format by CSV for HitObjects and more
*/
typedef OsuManiaData =
{
{
};
{
};
{
};
{
};
}

class TimingPoint
{

public function new(time:Float, beatLength:Float, meter:Int, sampleSet:Int, sampleIndex:Int, volume:Int, uninherited:Int, effects:Int)
{
this.time = time;
this.beatLength = beatLength;
this.meter = meter;
this.sampleSet = sampleSet;
this.sampleIndex = sampleIndex;
this.volume = volume;
this.uninherited = uninherited;
this.effects = effects;

this.bpm = (uninherited == 1) ? (Math.round((60000 / beatLength) * 10) / 10) : null;
this.sv = (uninherited == 0) ? (beatLength / 100) : null; // Just incase someone wants to add Scroll Velocity Support
}
}

class ManiaHitObject
{

public function new(time:Int, column:Int, holdDuration:Int)
{
this.time = time;
this.column = column;
this.holdDuration = holdDuration;
}
}
