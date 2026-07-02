

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

}

public static overload extern inline function migrate(input:SongData_v2_1_0.SongPlayData_v2_1_0):SongPlayData
{
}

public static function migrate_SongPlayData_v2_1_0(input:SongData_v2_1_0.SongPlayData_v2_1_0):SongPlayData
{



}

public static overload extern inline function migrate(input:SongData_v2_0_0.SongMetadata_v2_0_0):SongMetadata
{
}

public static function migrate_SongMetadata_v2_0_0(input:SongData_v2_0_0.SongMetadata_v2_0_0):SongMetadata
{

}

public static overload extern inline function migrate(input:SongData_v2_0_0.SongPlayData_v2_0_0):SongPlayData
{
}

public static function migrate_SongPlayData_v2_0_0(input:SongData_v2_0_0.SongPlayData_v2_0_0):SongPlayData
{




{
}
else
{
}

}
}
