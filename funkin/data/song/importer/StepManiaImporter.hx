package funkin.data.song.importer;


enum StepStateEnum
{
Metadata;
TimingPoints;
Stops;
Notes;
}

class StepManiaImporter
{

static function parseMetadataLine(line:String, result:StepManiaData):StepManiaData
{



switch (key)
{
case "TITLE":
result.Metadata.Title = value;
case "ARTIST":
result.Metadata.Artist = value;
case "GENRE":
result.Metadata.Genre = value;
case "CREDIT":
else // .ssc
readDiffMetadata.set("CREDIT", value);
case "BANNER":
result.Metadata.Banner = value;
case "BACKGROUND":
result.Metadata.Background = value;
case "OFFSET":
result.Metadata.Offset = Std.parseFloat(value);
case "SAMPLESTART":
result.Metadata.SampleStart = Std.parseFloat(value);
case "STEPSTYPE":
readDiffMetadata.set("STEPSTYPE", value);
case "DESCRIPTION":
readDiffMetadata.set("DESCRIPTION", value);
case "DIFFICULTY":
readDiffMetadata.set("DIFFICULTY", value);
}

}

static function parseTimingPointLine(line:String):Array<StepTimingPoint>
{


for (i in 0...parts.length)
{



stepTimingPoints.push(tp);
}

}

static function parseStopsLine(line:String):Array<StepStop>
{

for (i in 0...parts.length)
{



stepStopPoints.push(tp);
}

}

static function parseMeasure(lines:Array<String>, measureIndex:Int):Array<StepNote>
{


for (i in 0...lines.length)
{
beat = stepNoteRow / 48.0; // 48 rows per beat

for (j in 0...lines[i].length)
{
{
stepNotes.push(stepNote);
}
}
rowIndex++;
}

}

static function synchronizeStepTimingPoints(stepStopPoints:Array<StepStop>, stepTimingPoints:Array<StepTimingPoint>):Array<StepTimingPoint>
{
for (tpIndex in 0...stepTimingPoints.length)
{
}


{
{
{

{
{
sp.startTimestamp = (prevTp.startTimestamp + (sp.startBeat - prevTp.startBeat) / (prevTp.bpm / 60)) + cts;
cts += sp.duration;
spIndex++;
}
continue;
}

{
{
prevTp = stepTimingPoints[tpIndex - 1];
prevTp.endBeat = tp.startBeat;
prevTp.endTimestamp += (prevTp.endBeat - prevTp.startBeat) / (prevTp.bpm / 60);
tp.startTimestamp = prevTp.endTimestamp;
tp.endTimestamp = tp.startTimestamp;
tpIndex++;
{
tp.endTimestamp = Math.POSITIVE_INFINITY;
tp.endBeat = Math.POSITIVE_INFINITY;
}
}
continue;
}


prevTp.endBeat = tp.startBeat;

{
sp.startTimestamp = prevTp.endTimestamp + (sp.startBeat - prevTp.startBeat) / (prevTp.bpm / 60);
prevTp.endTimestamp += sp.duration;
spIndex++;
}
else
{
prevTp.endTimestamp += (prevTp.endBeat - prevTp.startBeat) / (prevTp.bpm / 60);
tp.startTimestamp = prevTp.endTimestamp;
tp.endTimestamp = tp.startTimestamp;
tpIndex++;
}
}
}
else
{
{
prevTp.endBeat = tp.startBeat;
prevTp.endTimestamp = prevTp.startTimestamp + (prevTp.endBeat - prevTp.startBeat) / (prevTp.bpm / 60);
tp.startTimestamp = prevTp.endTimestamp;
tpIndex++;
{
tp.endTimestamp = Math.POSITIVE_INFINITY;
tp.endBeat = Math.POSITIVE_INFINITY;
}
}
}
}

}

static function pushWorking(workingDiff:StepDifficulty, result:StepManiaData):StepManiaData
{
{
for (metaKey in readDiffMetadata.keys())
{
switch (metaKey)
{
case "STEPSTYPE":
workingDiff.type = workingDiff.parseChartType(metaValue);
case "DIFFICULTY":
workingDiff.name = metaValue;
case "CREDIT":
workingDiff.charter = metaValue;
}
}
result.Difficulties.push(workingDiff);
}
readDiffMetadata.clear();
}

static function parseBPMS(line:String, result:StepManiaData):StepManiaData
{
{
for (tp in tps)
result.TimingPoints.push(tp);
}
}

static function parseStops(line:String, result:StepManiaData):StepManiaData
{
{
for (sp in sps)
result.Stops.push(sp);
}
}

/**
* Parses a StepMania file content into StepManiaData structure.
* @param stepContent The content of the StepMania file as a string.
* @return StepManiaData The parsed StepMania data.
*/
public static function parseStepManiaFile(stepContent:String):StepManiaData
{
readDiffMetadata = new Map<String, String>();



Metadata: {
Title: "",
Artist: "",
Genre: "",
Credit: "",
Banner: "",
Background: "",
Offset: 0,
SampleStart: 0
},
TimingPoints: [],
Stops: [],
Difficulties: []
};


for (line in lines)
{
line = StringTools.trim(line);

switch (state)
{
case StepStateEnum.Metadata:
{
state = StepStateEnum.TimingPoints;
result = parseBPMS(line, result);
}
else if (StringTools.startsWith(line, "#STOPS:"))
{
state = StepStateEnum.Stops;
result = parseStops(line, result);
}
else if (StringTools.startsWith(line, "#NOTES:"))
{
{
result = pushWorking(workingDiff, result);
}

workingDiff = new StepDifficulty("", "", 0, "");
workingDiff.notes = [];

headerLines = 0;
currentMeasure = 0;
measure = [];
state = StepStateEnum.Notes;
}
else if (StringTools.startsWith(line, "#")) result = parseMetadataLine(line.substr(1), result);
case StepStateEnum.TimingPoints:
else
{
result = parseBPMS(line, result);
}
case StepStateEnum.Stops:
else
{
result = parseStops(line, result);
}
case StepStateEnum.Notes:

{
switch (headerLines)
{
case 0:
workingDiff.type = workingDiff.parseChartType(chartTypeStr);
case 1:
workingDiff.charter = StringTools.trim(line).replace(":", "");
case 2:
workingDiff.name = StringTools.trim(line).replace(":", "");
case 3:
workingDiff.difficultyRating = Std.parseInt(StringTools.trim(line).replace(":", ""));
}
headerLines++;
continue;
}

{
for (stepNote in stepNotesInMeasure)
workingDiff.notes.push(stepNote);
measure = [];
currentMeasure++;
}
else
{
measure.push(line);
}
}
}

{
result = pushWorking(workingDiff, result);
}

result.TimingPoints = synchronizeStepTimingPoints(result.Stops, result.TimingPoints);

}

static function getStepStopAtBeat(beat:Float, stepStops:Array<StepStop>):StepStop
{

for (s in stepStops)
{
}

}

static function beatToTime(beat:Float, offset:Float, stepTimingPoints:Array<StepTimingPoint>, stepStops:Array<StepStop>):Float
{
for (tp in stepTimingPoints)
{
{
{
{
b = stepStop.startBeat;
startTime = stepStop.startTimestamp + stepStop.duration;
}
}

time = startTime + nb;
}
}

}

static function convertStepNotes(offset:Float, type:StepManiaChartType, stepNotes:Array<StepNote>, stepTimingPoints:Array<StepTimingPoint>,
stepStops:Array<StepStop>):Array<SongNoteData>
{
{
holdArray = [-1, -1, -1, -1];
}
else if (type == StepManiaChartType.DanceDouble)
{
holdArray = [-1, -1, -1, -1, -1, -1, -1, -1];
}
else
{
}

for (stepNote in stepNotes)
{

{
holdArray[stepNote.column] = time;
continue;
}

else if (stepNote.type == StepManiaNoteType.Fake) snd.kind = "fake";
{
snd.time = holdArray[stepNote.column];
snd.length = length;
holdArray[stepNote.column] = -1;
}

{
else
snd.data = stepNote.column - 4;
}
else
{
}

result.push(snd);
}
}

/**
* Migrates StepManiaData to SongMetadata.
* @param songData The StepManiaData to migrate.
* @return SongMetadata The migrated SongMetadata.
*/
public static function migrateChartMetadata(songData:StepManiaData):SongMetadata
{

metadata.playData.stage = 'mainStage';
metadata.playData.characters = new SongCharacterData('bf', 'gf', 'dad');

metadata.generatedBy = 'Chart Editor Import (StepMania)';

metadata.playData.songVariations = [];

for (diff in songData.Difficulties)
{
{
continue; // skip unknown chart types
}
difficulties.push(diff.name);
metadata.playData.ratings.set(diff.name, diff.difficultyRating);
}

metadata.playData.difficulties = difficulties;

metadata.charter = songData.Metadata.Credit != "" ? songData.Metadata.Credit : null;

metadata.timeChanges = [];
for (tp in songData.TimingPoints)
{
timeChange.beatTime = tp.startBeat;
metadata.timeChanges.push(timeChange);
}

}

/**
* Migrates StepManiaData to SongChartData.
* @param songData The StepManiaData to migrate.
* @return SongChartData The migrated SongChartData.
*/
public static function migrateChartData(songData:StepManiaData):SongChartData
{

for (diff in songData.Difficulties)
{
{
continue; // skip unknown chart types
}
scrollsMap.set(diff.name, Constants.DEFAULT_SCROLLSPEED);
stepNoteMap.set(diff.name, convertStepNotes(songData.Metadata.Offset, diff.type, diff.notes, songData.TimingPoints, songData.Stops));
}

}
}
