package funkin.data.song.migrator;


class SongMetadata_v2_0_0
{

/**
* In metadata `v2.1.0`, `SongPlayData` was refactored.
*/

/**
* In metadata `v2.1.0`, `variation` was set to `ignore` when writing.
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

class SongPlayData_v2_0_0
{

/**
* In metadata version `v2.1.0`, this was refactored to a single `SongCharacterData` object.
*/

/**
* In metadata version `v2.2.0`, this was renamed to `noteStyle`.
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

class SongPlayableChar_v2_0_0
{



public function new(girlfriend:String = '', opponent:String = '', inst:String = '')
{
this.girlfriend = girlfriend;
this.opponent = opponent;
this.inst = inst;
}

/**
* Produces a string representation suitable for debugging.
*/
public function toString():String
{
}
}
