

class SaveDataMigrator
{
/**
* Migrate from one 2.x version to another.
*/
public static function migrate(inputData:Dynamic):Save
{

{
}
else
{
{
}
else if (VersionUtil.validateVersion(version, "2.0.x"))
{
}
else
{
+ '\nError migrating save data, expected ${Save.SAVE_DATA_VERSION}.'

}
}
}

static function migrate_v2_0_0(inputData:Dynamic):Save
{


}

/**
* Migrate from 1.x to the latest version.
*/
public static function migrateFromLegacy(inputData:Dynamic):Save
{






}

static function migrateLegacyScores(result:Save, inputSaveData:RawSaveData_v1_0_0):Void
{
{
}

{
}









}

static function migrateLegacyLevelScore(result:Save, inputSaveData:RawSaveData_v1_0_0, levelId:String):Void
{
score: inputSaveData.songScores.get('${levelId}-easy') ?? 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}

score: inputSaveData.songScores.get('${levelId}') ?? 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}

score: inputSaveData.songScores.get('${levelId}-hard') ?? 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}
}

static function migrateLegacySongScore(result:Save, inputSaveData:RawSaveData_v1_0_0, songIds:Array<String>):Void
{
score: 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}

for (songId in songIds)
{
}

score: 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}

for (songId in songIds)
{
}

score: 0,
tallies: {
sick: 0,
good: 0,
bad: 0,
shit: 0,
missed: 0,
combo: 0,
maxCombo: 0,
totalNotesHit: 0,
totalNotes: 0,
}

for (songId in songIds)
{
}
}

static function migrateLegacyControls(result:Save, inputSaveData:RawSaveData_v1_0_0):Void
{
{
}

{
}
}

static function migrateLegacyPlayerControls(result:Save, playerId:Int, controlsData:SavePlayerControlsData_v1_0_0):Void
{
ACCEPT: controlsData?.keys?.ACCEPT ?? null,
BACK: controlsData?.keys?.BACK ?? null,
CUTSCENE_ADVANCE: controlsData?.keys?.CUTSCENE_ADVANCE ?? null,
NOTE_DOWN: controlsData?.keys?.NOTE_DOWN ?? null,
NOTE_LEFT: controlsData?.keys?.NOTE_LEFT ?? null,
NOTE_RIGHT: controlsData?.keys?.NOTE_RIGHT ?? null,
NOTE_UP: controlsData?.keys?.NOTE_UP ?? null,
PAUSE: controlsData?.keys?.PAUSE ?? null,
RESET: controlsData?.keys?.RESET ?? null,
UI_DOWN: controlsData?.keys?.UI_DOWN ?? null,
UI_LEFT: controlsData?.keys?.UI_LEFT ?? null,
UI_RIGHT: controlsData?.keys?.UI_RIGHT ?? null,
UI_UP: controlsData?.keys?.UI_UP ?? null,
VOLUME_DOWN: controlsData?.keys?.VOLUME_DOWN ?? null,
VOLUME_MUTE: controlsData?.keys?.VOLUME_MUTE ?? null,
VOLUME_UP: controlsData?.keys?.VOLUME_UP ?? null,

ACCEPT: controlsData?.pad?.ACCEPT ?? null,
BACK: controlsData?.pad?.BACK ?? null,
CUTSCENE_ADVANCE: controlsData?.pad?.CUTSCENE_ADVANCE ?? null,
NOTE_DOWN: controlsData?.pad?.NOTE_DOWN ?? null,
NOTE_LEFT: controlsData?.pad?.NOTE_LEFT ?? null,
NOTE_RIGHT: controlsData?.pad?.NOTE_RIGHT ?? null,
NOTE_UP: controlsData?.pad?.NOTE_UP ?? null,
PAUSE: controlsData?.pad?.PAUSE ?? null,
RESET: controlsData?.pad?.RESET ?? null,
UI_DOWN: controlsData?.pad?.UI_DOWN ?? null,
UI_LEFT: controlsData?.pad?.UI_LEFT ?? null,
UI_RIGHT: controlsData?.pad?.UI_RIGHT ?? null,
UI_UP: controlsData?.pad?.UI_UP ?? null,
VOLUME_DOWN: controlsData?.pad?.VOLUME_DOWN ?? null,
VOLUME_MUTE: controlsData?.pad?.VOLUME_MUTE ?? null,
VOLUME_UP: controlsData?.pad?.VOLUME_UP ?? null,

}
}
