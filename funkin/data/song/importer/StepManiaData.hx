package funkin.data.song.importer;

typedef StepManiaData =
{
{
};
}

enum StepManiaChartType
{
DanceSingle;
DanceDouble;
Unknown;
}

enum StepManiaNoteType
{
Tap;
Head;
Tail;
Roll;
Mine;
Fake;
}

class StepNote
{

public function new(t:String, beat:Float, column:Int)
{
this.beat = beat;
this.column = column;
switch (t)
{
case "2":
this.type = StepManiaNoteType.Head;
case "3":
this.type = StepManiaNoteType.Tail;
case "4":
this.type = StepManiaNoteType.Roll;
case "M":
this.type = StepManiaNoteType.Mine;
case "F":
this.type = StepManiaNoteType.Fake;
default:
this.type = StepManiaNoteType.Tap;
}
}
}

class StepDifficulty
{


public function parseChartType(chartTypeStr:String):StepManiaChartType
{
switch (chartTypeStr)
{
case "dance-single":
case "dance-double":
default:
}
}

public function new(name:String, charter:String, difficultyRating:Int, type:String)
{
this.name = name;
this.charter = charter;
this.difficultyRating = difficultyRating;
this.type = parseChartType(type);
}
}

class StepTimingPoint
{

public function new(bpm:Float, startBeat:Float)
{
this.bpm = bpm;
this.startBeat = startBeat;
}
}

class StepStop
{


public function new(startBeat:Float, duration:Float)
{
this.startBeat = startBeat;
this.duration = duration;
}
}
