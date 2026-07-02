

class LevelRegistry extends BaseRegistry<Level, LevelData, LevelEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the level data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateLevelData()` function.
*/


public function new()
{
}

/**
* A list of all the story weeks from the base game, in order.
* @return Array<String>
*/
public function listBaseGameEntryIds():Array<String>
{
}

/**
* A list of all the story weeks in the game, in order.
* Modded levels are in alphabetical order at the end of the list.
* @return Array<String>
*/
public function listSortedLevelIds():Array<String>
{
}
}

typedef LevelEntryParams =
{
}
