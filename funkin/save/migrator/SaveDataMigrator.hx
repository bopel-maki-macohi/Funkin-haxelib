package funkin.save.migrator;


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
version = VersionUtil.repairVersion(version);
{
}
else if (VersionUtil.validateVersion(version, "2.0.x"))
{
}
else
{
+ '\nError migrating save data, expected ${Save.SAVE_DATA_VERSION}.'
+ '\nInvalid data has been moved to save slot ${slot}.';

funkin.util.WindowUtil.showError("Save Data Failure", message);
}
}
}

static function migrate_v2_0_0(inputData:Dynamic):Save
{

saveDataWithDefaults.optionsChartEditor.chartEditorLiveInputStyle = funkin.ui.debug.charting.ChartEditorState.ChartEditorLiveInputStyle.None;
saveDataWithDefaults.optionsChartEditor.theme = funkin.ui.debug.charting.ChartEditorState.ChartEditorTheme.Light;
saveDataWithDefaults.optionsStageEditor.theme = funkin.ui.debug.stageeditor.StageEditorState.StageEditorTheme.Light;

}

/**
* Migrate from 1.x to the latest version.
*/
public static function migrateFromLegacy(inputData:Dynamic):Save
{


result.volume.value = inputSaveData.volume;
result.mute.value = inputSaveData.mute;

result.ngSessionId.value = inputSaveData.sessionId;

migrateLegacyScores(result, inputSaveData);

migrateLegacyControls(result, inputSaveData);

}

static function migrateLegacyScores(result:Save, inputSaveData:RawSaveData_v1_0_0):Void
{
{
inputSaveData.songCompletion = [];
}

{
inputSaveData.songScores = [];
}

migrateLegacyLevelScore(result, inputSaveData, 'week0');
migrateLegacyLevelScore(result, inputSaveData, 'week1');
migrateLegacyLevelScore(result, inputSaveData, 'week2');
migrateLegacyLevelScore(result, inputSaveData, 'week3');
migrateLegacyLevelScore(result, inputSaveData, 'week4');
migrateLegacyLevelScore(result, inputSaveData, 'week5');
migrateLegacyLevelScore(result, inputSaveData, 'week6');
migrateLegacyLevelScore(result, inputSaveData, 'week7');

migrateLegacySongScore(result, inputSaveData, ['tutorial', 'Tutorial']);

migrateLegacySongScore(result, inputSaveData, ['bopeebo', 'Bopeebo']);
migrateLegacySongScore(result, inputSaveData, ['fresh', 'Fresh']);
migrateLegacySongScore(result, inputSaveData, ['dadbattle', 'Dadbattle']);

migrateLegacySongScore(result, inputSaveData, ['monster', 'Monster']);
migrateLegacySongScore(result, inputSaveData, ['south', 'South']);
migrateLegacySongScore(result, inputSaveData, ['spookeez', 'Spookeez']);

migrateLegacySongScore(result, inputSaveData, ['pico', 'Pico']);
migrateLegacySongScore(result, inputSaveData, ['philly-nice', 'Philly', 'philly', 'Philly-Nice']);
migrateLegacySongScore(result, inputSaveData, ['blammed', 'Blammed']);

migrateLegacySongScore(result, inputSaveData, ['satin-panties', 'Satin-Panties']);
migrateLegacySongScore(result, inputSaveData, ['high', 'High']);
migrateLegacySongScore(result, inputSaveData, ['milf', 'Milf', 'MILF']);

migrateLegacySongScore(result, inputSaveData, ['cocoa', 'Cocoa']);
migrateLegacySongScore(result, inputSaveData, ['eggnog', 'Eggnog']);
migrateLegacySongScore(result, inputSaveData, ['winter-horrorland', 'Winter-Horrorland']);

migrateLegacySongScore(result, inputSaveData, ['senpai', 'Senpai']);
migrateLegacySongScore(result, inputSaveData, ['roses', 'Roses']);
migrateLegacySongScore(result, inputSaveData, ['thorns', 'Thorns']);

migrateLegacySongScore(result, inputSaveData, ['ugh', 'Ugh']);
migrateLegacySongScore(result, inputSaveData, ['guns', 'Guns']);
migrateLegacySongScore(result, inputSaveData, ['stress', 'Stress']);
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
};
result.setLevelScore(levelId, 'easy', scoreDataEasy);

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
};
result.setLevelScore(levelId, 'normal', scoreDataNormal);

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
};
result.setLevelScore(levelId, 'hard', scoreDataHard);
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
};

for (songId in songIds)
{
scoreDataEasy.score = Std.int(Math.max(scoreDataEasy.score, inputSaveData.songScores.get('${songId}-easy') ?? 0));
}
result.setSongScore(songIds[0], 'easy', scoreDataEasy);

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
};

for (songId in songIds)
{
scoreDataNormal.score = Std.int(Math.max(scoreDataNormal.score, inputSaveData.songScores.get('${songId}') ?? 0));
}
result.setSongScore(songIds[0], 'normal', scoreDataNormal);

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
};

for (songId in songIds)
{
scoreDataHard.score = Std.int(Math.max(scoreDataHard.score, inputSaveData.songScores.get('${songId}-hard') ?? 0));
}
result.setSongScore(songIds[0], 'hard', scoreDataHard);
}

static function migrateLegacyControls(result:Save, inputSaveData:RawSaveData_v1_0_0):Void
{
{
migrateLegacyPlayerControls(result, 1, p1Data);
}

{
migrateLegacyPlayerControls(result, 2, p2Data);
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
};

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
};

result.setControls(playerId, Keys, outputKeyControls);
result.setControls(playerId, Gamepad(0), outputPadControls);
}
}
