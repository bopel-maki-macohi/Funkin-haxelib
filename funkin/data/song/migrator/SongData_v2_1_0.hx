package funkin.data.song.migrator;


class SongMetadata_v2_1_0
{

/**
* In metadata `v2.2.0`, `SongPlayData` was refactored.
*/









/**
* Defaults to `Constants.DEFAULT_VARIATION`. Populated later.
*/

public function new(songName:String, artist:String, ?variation:String)
{
this.version = SongRegistry.SONG_METADATA_VERSION;
this.songName = songName;
this.artist = artist;
this.timeFormat = 'ms';
this.divisions = null;
this.timeChanges = [new SongTimeChange(0, 100)];
this.looped = false;
this.playData = new SongPlayData_v2_1_0();
this.playData.songVariations = [];
this.playData.difficulties = [];
this.playData.characters = new SongCharacterData('bf', 'gf', 'dad');
this.playData.stage = 'mainStage';
this.playData.noteSkin = 'funkin';
this.generatedBy = SongRegistry.DEFAULT_GENERATEDBY;
this.variation = (variation == null) ? Constants.DEFAULT_VARIATION : variation;
}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}

class SongPlayData_v2_1_0
{
/**
* In `v2.2.0`, this value was renamed to `noteStyle`.
*/


public function new()
{
}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}
