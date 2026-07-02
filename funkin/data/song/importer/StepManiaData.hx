
typedef StepManiaData =
{
{
}

enum StepManiaChartType
{
}

enum StepManiaNoteType
{
}

class StepNote
{

public function new(t:String, beat:Float, column:Int)
{
switch (t)
{
case "2":
case "3":
case "4":
case "M":
case "F":
default:
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
}
}

class StepTimingPoint
{

public function new(bpm:Float, startBeat:Float)
{
}
}

class StepStop
{


public function new(startBeat:Float, duration:Float)
{
}
}
