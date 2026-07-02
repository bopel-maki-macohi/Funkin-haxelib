package funkin.data.song.importer; // import is a reserved word dumbass


class FNFLegacyImporter
{
public static function parseLegacyDataRaw(input:String, fileName:String = 'raw'):Null<FNFLegacyData>
{
parser.ignoreUnknownVariables = true; // Set to true to ignore extra variables that might be included in the JSON.
parser.fromJson(input, fileName);

{
for (error in parser.errors)
DataError.printError(error);
}
}

/**
* @param data The raw parsed JSON data to migrate, as a Dynamic.
* @param difficulty
* @return SongMetadata
*/
public static function migrateMetadata(songData:FNFLegacyData, difficulty:String = 'normal'):SongMetadata
{


songMetadata.generatedBy = 'Chart Editor Import (FNF Legacy)';

songMetadata.playData.stage = songData.song?.stageDefault ?? 'mainStage';
songMetadata.songName = songData.song?.song ?? 'Import';
songMetadata.playData.difficulties = [];

{
switch (songData.song.notes)
{
case Left(notes):
songMetadata.playData.difficulties.push(difficulty);
case Right(difficulties):
}
}

songMetadata.playData.songVariations = [];

songMetadata.timeChanges = rebuildTimeChanges(songData);

songMetadata.playData.characters = new SongCharacterData(songData.song?.player1 ?? 'bf', 'gf', songData.song?.player2 ?? 'dad');

}

public static function migrateChartData(songData:FNFLegacyData, difficulty:String = 'normal'):SongChartData
{


{
switch (songData.song.notes)
{
case Left(notes):
songChartData.notes.set(difficulty, migrateNoteSections(notes));
case Right(difficulties):
}
}

songChartData.events = rebuildEventData(songData);

switch (songData.song.speed)
{
case Left(speed):
songChartData.scrollSpeed.set(difficulty, speed);
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
noteSections = notes;
case Right(difficulties):
}


for (section in noteSections)
{

{
lastSectionWasMustHit = section.mustHitSection;


result.push(new SongEventData(firstNote.time, 'FocusCamera', {char: section.mustHitSection ? 0 : 1}));
}
}

}

/**
* Port over time changes from FNF Legacy.
* If a section contains a BPM change, it will be applied at the timestamp of the first note in that section.
*/
static function rebuildTimeChanges(songData:FNFLegacyData):Array<SongTimeChange>
{

result.push(new SongTimeChange(0, songData.song?.bpm ?? Constants.DEFAULT_BPM));

switch (songData.song.notes)
{
case Left(notes):
noteSections = notes;
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
noteData -= STRUMLINE_SIZE;
}
else
{
noteData += STRUMLINE_SIZE;
}
}

result.push(new SongNoteData(note.time, noteData, note.length, note.getKind()));
}
}

}
}
