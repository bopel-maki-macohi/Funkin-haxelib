package funkin.data.song.migrator;


using funkin.data.song.migrator.SongDataMigrator; // Does this even work lol?

/**
* This class contains functions to migrate older data formats to the current one.
*
* Utilizes static extensions with overloaded inline functions to make migration as easy as `.migrate()`.
* @see https://try.haxe.org/#e1c1cf22
*/
class SongDataMigrator
{
public static overload extern inline function migrate(input:SongData_v2_1_0.SongMetadata_v2_1_0):SongMetadata
{
}

public static function migrate_SongMetadata_v2_1_0(input:SongData_v2_1_0.SongMetadata_v2_1_0):SongMetadata
{
result.version = SongRegistry.SONG_METADATA_VERSION;
result.timeFormat = input.timeFormat;
result.divisions = input.divisions;
result.timeChanges = input.timeChanges;
result.looped = input.looped;
result.playData = input.playData.migrate();
result.generatedBy = input.generatedBy;

}

public static overload extern inline function migrate(input:SongData_v2_1_0.SongPlayData_v2_1_0):SongPlayData
{
}

public static function migrate_SongPlayData_v2_1_0(input:SongData_v2_1_0.SongPlayData_v2_1_0):SongPlayData
{
result.songVariations = input.songVariations;
result.difficulties = input.difficulties;
result.stage = input.stage;
result.characters = input.characters;

result.noteStyle = input.noteSkin;

result.ratings = ['default' => 1];
result.album = null;

}

public static overload extern inline function migrate(input:SongData_v2_0_0.SongMetadata_v2_0_0):SongMetadata
{
}

public static function migrate_SongMetadata_v2_0_0(input:SongData_v2_0_0.SongMetadata_v2_0_0):SongMetadata
{
result.version = SongRegistry.SONG_METADATA_VERSION;
result.timeFormat = input.timeFormat;
result.divisions = input.divisions;
result.timeChanges = input.timeChanges;
result.looped = input.looped;
result.playData = input.playData.migrate();
result.generatedBy = input.generatedBy;

}

public static overload extern inline function migrate(input:SongData_v2_0_0.SongPlayData_v2_0_0):SongPlayData
{
}

public static function migrate_SongPlayData_v2_0_0(input:SongData_v2_0_0.SongPlayData_v2_0_0):SongPlayData
{
result.songVariations = input.songVariations;
result.difficulties = input.difficulties;
result.stage = input.stage;

result.ratings = ['default' => 1];
result.album = null;

result.noteStyle = input.noteSkin;


{
result.characters = new SongCharacterData('bf', 'gf', 'dad');
}
else
{
result.characters = new SongCharacterData(firstCharKey, firstCharData.girlfriend, firstCharData.opponent, firstCharData.inst);
}

}
}
