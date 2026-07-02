package funkin.data.story.level;


class LevelRegistry extends BaseRegistry<Level, LevelData, LevelEntryParams> implements ISingleton implements DefaultRegistryImpl
{
/**
* The current version string for the level data format.
* Handle breaking changes by incrementing this value
* and adding migration to the `migrateLevelData()` function.
*/
public static final LEVEL_DATA_VERSION:thx.semver.Version = "1.0.2";

public static final LEVEL_DATA_VERSION_RULE:thx.semver.VersionRule = ">=1.0.0 <1.1.0";

public function new()
{
super('LEVEL', 'levels', LEVEL_DATA_VERSION_RULE);
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
result.sort(SortUtil.defaultsThenAlphabetically.bind(listBaseGameEntryIds()));
}
}

typedef LevelEntryParams =
{
}
