
/**
* Structure of a parsed Osu!Mania .osu file
* Stuctured like a INI file format by CSV for HitObjects and more
*/
typedef OsuManiaData =
{
{
{
{
{
}

class TimingPoint
{

public function new(time:Float, beatLength:Float, meter:Int, sampleSet:Int, sampleIndex:Int, volume:Int, uninherited:Int, effects:Int)
{

this.sv = (uninherited == 0) ? (beatLength / 100) : null; // Just incase someone wants to add Scroll Velocity Support
}
}

class ManiaHitObject
{

public function new(time:Int, column:Int, holdDuration:Int)
{
}
}
