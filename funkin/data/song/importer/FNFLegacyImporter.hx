package funkin.data.song.importer; // import is a reserved word dumbass


class FNFLegacyImporter
{
public static function parseLegacyDataRaw(input:String, fileName:String = 'raw'):Null<FNFLegacyData>
{
parser.ignoreUnknownVariables = true; // Set to true to ignore extra variables that might be included in the JSON.

{
for (error in parser.errors)
}
}

/**
* @param data The raw parsed JSON data to migrate, as a Dynamic.
* @param difficulty
* @return SongMetadata
*/
public static function migrateMetadata(songData:FNFLegacyData, difficulty:String = 'normal'):SongMetadata
{




{
switch (songData.song.notes)
{
case Left(notes):
case Right(difficulties):
}
}




}

public static function migrateChartData(songData:FNFLegacyData, difficulty:String = 'normal'):SongChartData
{


{
switch (songData.song.notes)
{
case Left(notes):
case Right(difficulties):
}
}


switch (songData.song.speed)
{
case Left(speed):
case Right(speeds):
}

}

/**
* FNF Legacy doesn't have song events, but without them the song won't look right,
* so we insert camera events when the character changes.
*/
static function rebuildEventData(songData:FNFLegacyData):Array<SongEventData>
{

switch (songData.song.notes)
{
case Left(notes):
case Right(difficulties):
}


for (section in noteSections)
{

{


}
}

}

/**
* Port over time changes from FNF Legacy.
* If a section contains a BPM change, it will be applied at the timestamp of the first note in that section.
*/
static function rebuildTimeChanges(songData:FNFLegacyData):Array<SongTimeChange>
{


switch (songData.song.notes)
{
case Left(notes):
case Right(difficulties):
}


for (noteSection in noteSections)
{
{
}
}

}


static function migrateNoteSections(input:Array<LegacyNoteSection>):Array<SongNoteData>
{

for (section in input)
{
for (note in section.sectionNotes)
{

{
{
}
else
{
}
}

}
}

}
}
